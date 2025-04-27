import 'package:dhgc_mobilio_app/src/features/product/domain/repo/product_repo.dart';
import 'package:dhgc_mobilio_app/src/features/product/domain/entities/product_entity.dart';

class GetProductsListUseCase {
  final ProductRepo _repo;

  GetProductsListUseCase(this._repo);

  Future<List<ProductEntity>> call() async => await _repo.getProductsList();
}
