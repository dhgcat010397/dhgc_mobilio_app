import 'package:dhgc_mobilio_app/src/features/products/data/datasources/remote/product_remote_datasource.dart';
import 'package:dhgc_mobilio_app/src/features/products/data/datasources/remote/product_remote_datasource_impl.dart';
import 'package:dhgc_mobilio_app/src/features/products/data/repo/product_repo_impl.dart';
import 'package:dhgc_mobilio_app/src/features/products/domain/repo/product_repo.dart';
import 'package:dhgc_mobilio_app/src/features/products/domain/usecases/get_product_detail_usecase.dart';
import 'package:dhgc_mobilio_app/src/features/products/domain/usecases/get_products_list_usecase.dart';
import 'package:dhgc_mobilio_app/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:dhgc_mobilio_app/src/core/utils/dependencies_injection.dart';

Future<void> productInjectionContainer() async {
  // Register the ProductRemoteDatasource
  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(),
  );

  // Register the ProductRepo
  sl.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(sl()));

  // Register the use cases
  sl.registerLazySingleton<GetProductsListUseCase>(
    () => GetProductsListUseCase(sl()),
  );
  sl.registerLazySingleton<GetProductDetailUseCase>(
    () => GetProductDetailUseCase(sl()),
  );

  // Register the ProductBloc
  sl.registerFactory<ProductBloc>(
    () => ProductBloc(
      getProductsListUseCase: sl(),
      getProductDetailUseCase: sl(),
    ),
  );
}
