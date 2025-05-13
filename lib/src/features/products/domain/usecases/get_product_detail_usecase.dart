import 'package:dhgc_mobilio_app/src/features/products/domain/entities/product_entity.dart';
import 'package:dhgc_mobilio_app/src/features/products/domain/repo/product_repo.dart';

class GetProductDetailUseCase {
  final ProductRepo _repo;

  GetProductDetailUseCase(this._repo);

  Future<ProductEntity?> call(int productId) async =>
      await _repo.getProductDetail(productId);
}
