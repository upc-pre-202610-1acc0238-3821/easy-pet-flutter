import 'package:easy_vet/features/home/domain/product.dart';

class ProductDto {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final double rating;
  final int stock;

  ProductDto({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
    required this.stock,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) {
    return ProductDto(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      image: json['image'],
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
      stock: json['stock'],
    );
  }

  Product toDomain() {
    return Product(
      id: id,
      name: title,
      price: price,
      image: image,
      description: description,
    );
  }
}
