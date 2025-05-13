part of "product_bloc.dart";

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;
  const factory ProductState.loading() = _Loading;
  const factory ProductState.loaded({
    @Default([]) List<ProductEntity> productsList,
    @Default(null) ProductEntity? productDetail,
  }) = _Loaded;
  const factory ProductState.error({
    required int errorCode,
    required String errorMessage,
  }) = _Error;
}
