import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhgc_mobilio_app/src/core/routes/app_routes.dart';
import 'package:dhgc_mobilio_app/src/core/routes/route_generator.dart';

import 'package:dhgc_mobilio_app/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:dhgc_mobilio_app/src/core/utils/dependencies_injection.dart'
    as di;
import 'package:dhgc_mobilio_app/src/features/products/presentation/views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              di.sl<ProductBloc>()..add(ProductEvent.fetchProductsList()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        onGenerateRoute: RouteGenerator.generateRoute,
        onGenerateInitialRoutes:
            (initialRoute) => [
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const HomePage(),
                transitionsBuilder:
                    (_, animation, __, child) =>
                        FadeTransition(opacity: animation, child: child),
              ),
            ],
      ),
    );
  }
}
