import 'package:easy_vet/core/storage/token_storage.dart';
import 'package:easy_vet/features/cart/data/cart_item_dto.dart';
import 'package:easy_vet/features/cart/data/cart_item_request_dto.dart';
import 'package:easy_vet/features/cart/data/cart_service.dart';
import 'package:easy_vet/features/cart/domain/cart_item.dart';
import 'package:easy_vet/features/cart/domain/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService service;
  final TokenStorage tokenStorage;

  const CartRepositoryImpl({
    required this.service,
    required this.tokenStorage,
  });

  @override
  Future<List<CartItem>> getCartItems() async {
    final String? token = await tokenStorage.getToken();

    if (token == null) {
      throw Exception('No token found');
    }

    final List<CartItemDto> dtos = await service.getCartItems(token);

    return dtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<void> addToCart(int productId, int quantity) async {
    final String? token = await tokenStorage.getToken();

    if (token == null) {
      throw Exception('No token found');
    }
    await service.addToCart(
      CartItemRequestDto(productId: productId, quantity: quantity),
      token
    );
  }
}
