import 'package:dhgc_mobilio_app/src/features/product/domain/entities/product_entity.dart';

abstract class ProductRepo {
  Future<List<ProductEntity>> getProductsList();
  Future<ProductEntity?> getProductDetail(int productId);
}
