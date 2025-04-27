part of "product_bloc.dart";

@freezed
abstract class ProductEvent with _$ProductEvent {
  const factory ProductEvent.fetchProductsList() = _FetchProductsList;
  const factory ProductEvent.getProductDetail(int productId) = _GetProductDetail;
  const factory ProductEvent.filterProductByName(String query) = _FilterProductByName;
}
