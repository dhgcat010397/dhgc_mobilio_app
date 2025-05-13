import 'package:get_it/get_it.dart';
import 'package:dhgc_mobilio_app/src/features/products/product_injection_container.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await productInjectionContainer();
}