import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dhgc_mobilio_app/src/features/products/domain/entities/product_entity.dart';
import 'package:dhgc_mobilio_app/src/features/products/domain/usecases/get_product_detail_usecase.dart';
import 'package:dhgc_mobilio_app/src/features/products/domain/usecases/get_products_list_usecase.dart';

part "product_state.dart";
part "product_event.dart";

part 'product_bloc.freezed.dart'; // run: flutter pub run build_runner build --delete-conflicting-outputs

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsListUseCase getProductsListUseCase;
  final GetProductDetailUseCase getProductDetailUseCase;
  List<ProductEntity> _productsList = [], _productsListFiltered = [];

  ProductBloc({
    required this.getProductsListUseCase,
    required this.getProductDetailUseCase,
  }) : super(const _Initial()) {
    on<ProductEvent>(
      (event, emit) => event.map(
        fetchProductsList: (event) => _onFetchProductsList(emit),
        getProductDetail: (event) => _onGetProductDetail(event.productId, emit),
        filterProductByName:
            (event) => _onFilterProductByName(event.query, emit),
      ),
    );
  }

  Future<void> _onFetchProductsList(Emitter<ProductState> emit) async {
    emit(const _Loading());

    try {
      _productsList = await getProductsListUseCase.call();
      emit(_Loaded(productsList: _productsList));
    } catch (e) {
      emit(_Error(errorCode: e.hashCode, errorMessage: e.toString()));
    }
  }

  Future<void> _onGetProductDetail(
    int productId,
    Emitter<ProductState> emit,
  ) async {
    emit(const _Loading());

    try {
      final product = await getProductDetailUseCase.call(productId);
      if (product == null) {
        emit(const _Error(errorCode: 404, errorMessage: "Product not found"));
      } else {
        emit(
          _Loaded(
            productsList:
                _productsListFiltered.isEmpty
                    ? _productsList
                    : _productsListFiltered,
            productDetail: product,
          ),
        );
      }
    } catch (e) {
      emit(_Error(errorCode: e.hashCode, errorMessage: e.toString()));
    }
  }

  Future<void> _onFilterProductByName(
    String query,
    Emitter<ProductState> emit,
  ) async {
    emit(const _Loading());

    try {
      if (query.isEmpty) {
        _productsListFiltered = [];
        emit(_Loaded(productsList: _productsList));
      } else {
        final cleanedQuery = query.trim().replaceAll(RegExp(r'\s+'), ' ');
        final products = _productsList;
        _productsListFiltered =
            products
                .where(
                  (p) =>
                      p.name.toLowerCase().contains(cleanedQuery.toLowerCase()),
                )
                .toList();
        emit(_Loaded(productsList: _productsListFiltered));
      }
    } catch (e) {
      emit(_Error(errorCode: e.hashCode, errorMessage: e.toString()));
    }
  }
}
