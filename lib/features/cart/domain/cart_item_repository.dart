import 'package:easy_vet/features/cart/domain/cart_item.dart';

abstract class CartItemRepository {
  Future<List<CartItem>> getCartItems();
}