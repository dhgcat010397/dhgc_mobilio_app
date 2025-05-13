import 'package:equatable/equatable.dart';
import 'package:dhgc_mobilio_app/src/core/helpers/price_converter.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final double price;
  final String imageUrl;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, price, imageUrl];

  String get formattedPrice => toVND(price);
}
