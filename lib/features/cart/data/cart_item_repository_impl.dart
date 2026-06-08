import 'package:easy_vet/core/storage/token_storage.dart';
import 'package:easy_vet/features/cart/data/cart_item_service.dart';
import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:easy_vet/features/cart/domain/cart_item_repository.dart';

class CartItemRepositoryImpl implements CartItemRepository {
  final CartItemService service;
  final TokenStorage tokenStorage;

  const CartItemRepositoryImpl({
    required this.service,
    required this.tokenStorage,
  });

  @override
  Future<List<CartItem>> getCartItems() {

    return Future.value([]);
  }
}