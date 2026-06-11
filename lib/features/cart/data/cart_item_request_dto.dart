class CartItemRequestDto {
  final int productId;
  final int quantity;

  const CartItemRequestDto({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }
}
