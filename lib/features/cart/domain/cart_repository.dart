import 'package:easy_vet/features/cart/domain/cart_item.dart';

abstract class CartRepository {
  Future<List<CartItem>> getCartItems();
  Future<void> addToCart(int productId, int quantity);
  Future<void> removeFromCart(int productId);
}
