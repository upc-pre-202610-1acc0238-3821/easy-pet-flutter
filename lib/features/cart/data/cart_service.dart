import 'dart:convert';
import 'dart:io';

import 'package:easy_vet/features/cart/data/cart_item_dto.dart';
import 'package:easy_vet/features/cart/data/cart_item_request_dto.dart';
import 'package:http/http.dart' as http;

class CartService {
  final String baseUrl =
      'https://petapi-591531460223.us-central1.run.app/api/cart';

  Future<List<CartItemDto>> getCartItems(String token) async {
    final Uri uri = Uri.parse(baseUrl);

    final http.Response response = await http.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      final List dtos = json['results'];
      return dtos.map((dto) => CartItemDto.fromJson(dto)).toList();
    }
    throw Exception('Failed to load cart items: ${response.statusCode}');
  }

  Future<void> addToCart(CartItemRequestDto dto, String token) async {
    final Uri uri = Uri.parse(baseUrl);

    final http.Response response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(dto.toJson()),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to add item to cart: ${response.statusCode}');
    }
  }
}
