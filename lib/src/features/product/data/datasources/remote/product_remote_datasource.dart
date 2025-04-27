import 'package:dhgc_mobilio_app/src/features/product/domain/entities/product_entity.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductEntity>> getProductsList();
  Future<ProductEntity?> getProductDetail(int productId);
}
