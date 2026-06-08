import 'package:easy_vet/features/cart/data/cart_item_dto.dart';
import 'package:http/http.dart' as http;

class CartItemService {
  final String baseUrl = 'https://petapi-591531460223.us-central1.run.app/api/cart';

  List<CartItemDto> getCartItems(String token) {
    final Uri uri = Uri.parse(baseUrl);

    http.get(uri, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    }).then((response) {
      if (response.statusCode == 200) {
        
        return [];
      } else {
        throw Exception('Failed to load cart items');
      }
    }).catchError((error) {
      throw Exception('Error fetching cart items: $error');
    });
    
    return [];
  }

}