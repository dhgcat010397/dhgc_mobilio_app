import 'package:flutter/material.dart';
import 'package:dhgc_mobilio_app/src/features/products/presentation/widgets/product_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    this.name = "Unknown",
    this.price = "0.00",
    this.imageUrl = "",
    this.onTap,
  });

  final String name, price, imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: ListTile(
        title: Text(name),
        subtitle: Text(price),
        leading: ProductImage(imageUrl: imageUrl),
      ),
    );
  }
}
