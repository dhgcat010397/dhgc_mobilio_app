import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:dhgc_mobilio_app/src/features/products/data/models/product_model.dart';
import 'package:dhgc_mobilio_app/src/features/products/data/datasources/remote/product_remote_datasource.dart';
import 'package:dhgc_mobilio_app/src/features/products/domain/entities/product_entity.dart';

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  ProductRemoteDatasourceImpl();

  @override
  Future<List<ProductEntity>> getProductsList() async {
    try {
      String jsonString = await rootBundle.loadString('assets/data.json');
      final jsonData = jsonDecode(jsonString);
      final productsListModel = ProductsListModel.fromJson(jsonData);
      final products = productsListModel.products;

      return products
          .map((model) => model.toEntity())
          .whereType<ProductEntity>()
          .toList();
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }

  @override
  Future<ProductEntity?> getProductDetail(int productId) async {
    try {
      final response = await getProductsList();
      if (response.isNotEmpty) {
        return response.firstWhere(
          (product) => product.id == productId,
          orElse: () => throw Exception('Product with ID $productId not found'),
        ); // Return the first product for demonstration
      } else {
        throw Exception('No products found');
      }
    } catch (e) {
      throw Exception('Failed to load product details: $e');
    }
  }
}
