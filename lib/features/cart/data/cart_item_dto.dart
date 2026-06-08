import 'package:easy_vet/features/cart/domain/cart_item.dart';

class CartItemDto {
  final int productId;
  final String title;
  final double price;
  final String category;
  final String image;
  final int quantity;

  const CartItemDto({
    required this.productId,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.quantity,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) {
    return CartItemDto(
      productId: json['productId'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      image: json['image'],
      quantity: json['quantity'],
    );
  }

  CartItem toDomain() {
    return CartItem(
      productId: productId,
      title: title,
      price: price,
      image: image,
      category: category,
      quantity: quantity,
    );
  }
}
