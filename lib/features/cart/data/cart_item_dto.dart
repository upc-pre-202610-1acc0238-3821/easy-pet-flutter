class CartItemDto {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;
  final int quantity;

  const CartItemDto({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
    required this.quantity,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) {
    return CartItemDto(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      image: json['image'],
      quantity: json['quantity'],
    );
  }


}