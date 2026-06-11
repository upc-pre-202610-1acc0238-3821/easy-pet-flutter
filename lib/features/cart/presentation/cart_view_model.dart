import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:easy_vet/features/cart/domain/cart_repository.dart';
import 'package:easy_vet/features/cart/presentation/cart_state.dart';
import 'package:flutter/material.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository repository;
  CartState cartState = CartState();

  CartViewModel({required this.repository}) {
    getCartItems();
  }

  Future<void> getCartItems() async {
    cartState = cartState.copyWith(isLoading: true);
    notifyListeners();

    try {
      List<CartItem> items = await repository.getCartItems();
      cartState = cartState.copyWith(items: items, isLoading: false);
    } catch (e) {
      cartState = cartState.copyWith(errorMessage: '$e', isLoading: false);
    }
    notifyListeners();
  }

  Future<void> addToCart(int productId, int quantity) async {
    try {
      await repository.addToCart(productId, quantity);
      getCartItems();
    } catch (e) {
      cartState = cartState.copyWith(errorMessage: '$e');
      notifyListeners();
    }
  }
}
