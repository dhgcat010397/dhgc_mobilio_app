import 'package:dhgc_mobilio_app/core/navigation/app_routes.dart';
import 'package:dhgc_mobilio_app/src/features/product/presentation/views/home_page.dart';
import 'package:dhgc_mobilio_app/src/features/product/presentation/views/product_detail_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case AppRoutes.productDetail:
        if (args is int) {
          return MaterialPageRoute(
            builder: (_) => ProductDetailPage(productId: args),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
