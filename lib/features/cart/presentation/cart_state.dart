import 'package:easy_vet/features/cart/domain/cart_item.dart';

class CartState {
  final List<CartItem> items;
  final bool isLoading;
  final String? errorMessage;

  const CartState({this.items = const [], this.isLoading = false, this.errorMessage});

  CartState copyWith({List<CartItem>? items, bool? isLoading, String? errorMessage}) {
    return CartState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}
