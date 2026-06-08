import 'dart:convert';
import 'dart:io';

import 'package:easy_vet/features/cart/data/cart_item_dto.dart';
import 'package:http/http.dart' as http;

class CartItemService {
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
}
