abstract class AppRoutes {
  static const String home = '/home';
  static const String productDetail = '/product/detail';

  // Helper method to pass params
  static String getProductDetailPath(int id) => '/product/$id';
}
