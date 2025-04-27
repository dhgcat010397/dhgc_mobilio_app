import 'package:dhgc_mobilio_app/src/features/product/data/datasources/remote/product_remote_datasource.dart';
import 'package:dhgc_mobilio_app/src/features/product/domain/entities/product_entity.dart';
import 'package:dhgc_mobilio_app/src/features/product/domain/repo/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDatasource remoteDatasource;

  ProductRepoImpl(this.remoteDatasource);

  @override
  Future<List<ProductEntity>> getProductsList() async =>
      await remoteDatasource.getProductsList();

  @override
  Future<ProductEntity?> getProductDetail(int productId) async =>
      await remoteDatasource.getProductDetail(productId);
}
