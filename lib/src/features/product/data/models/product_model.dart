import 'package:equatable/equatable.dart';
import 'package:dhgc_mobilio_app/src/features/product/domain/entities/product_entity.dart';

class ProductsListModel extends Equatable {
  final List<ProductModel> products;
  final int total;

  const ProductsListModel({required this.products, required this.total});

  @override
  List<Object?> get props => [products];

  factory ProductsListModel.fromJson(Map<String, dynamic> json) {
    return ProductsListModel(
      products:
          (json['list_products'] as List<dynamic>)
              .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'list_products': products.map((e) => e.toJson()).toList(),
      'total': total,
    };
  }
}

class ProductModel extends Equatable {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, price, imageUrl];

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price']?.toDouble() ?? 0.0,
      imageUrl: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'price': price, 'image': imageUrl};
  }
}

extension NullableProductModelMapper on ProductModel? {
  ProductEntity? toEntity() {
    if (this == null) return null;
    return ProductEntity(
      id: this!.id,
      name: this!.name,
      price: this!.price,
      imageUrl: this!.imageUrl,
    );
  }
}
