import 'package:dhgc_mobilio_app/src/features/products/domain/entities/product_entity.dart';

abstract class ProductRemoteDatasource {
  /// Fetches a list of products from the remote data source.
  /// Returns a list of [ProductEntity].
  /// Throws an exception if the fetch fails.
  Future<List<ProductEntity>> getProductsList();

  /// Fetches the details of a specific product by its ID from the remote data source.
  /// Returns a [ProductEntity] if found, otherwise returns null.
  /// Throws an exception if the fetch fails.
  /// [productId] is the ID of the product to fetch.
  Future<ProductEntity?> getProductDetail(int productId);
}
