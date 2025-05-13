import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhgc_mobilio_app/src/features/products/presentation/bloc/product_bloc.dart';
import 'package:dhgc_mobilio_app/src/features/products/presentation/widgets/product_image.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.productId});

  final int productId;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(
      context,
    ).add(ProductEvent.getProductDetail(widget.productId));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: BlocBuilder<ProductBloc, ProductState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Initial State')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (_, data) {
              final product = data;

              if (product == null) {
                return const Center(child: Text('Product not found'));
              } else {
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display the product image using the ProductImage widget
                      // The imageUrl is passed from the product object
                      ProductImage(imageUrl: product.imageUrl),
                      const SizedBox(height: 24),

                      // Display the product name in a larger font size and bold
                      Text(
                        product.name,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),

                      // Display the product price in a larger font size and red color
                      Text(
                        product.formattedPrice,
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                );
              }
            },
            error:
                (errorCode, errorMessage) =>
                    Center(child: Text('Error: $errorMessage')),
          );
        },
      ),
    );
  }
}
