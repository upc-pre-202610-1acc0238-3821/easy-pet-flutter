class CartItem {
  final int productId;
  final String title;
  final double price;
  final String image;
  final String category;
  final int quantity;

  const CartItem({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.quantity,
  });
}
