import 'dart:convert';
import 'dart:io';

import 'package:easy_vet/features/home/data/remote/product_dto.dart';
import 'package:http/http.dart' as http;

class ProductService {
  final String _baseUrl =
      'https://petapi-591531460223.us-central1.run.app/api/products';

  Future<List<ProductDto>> getProducts() async {
    final url = Uri.parse(_baseUrl);

    final response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List jsons = map['results'];
      return jsons.map((e) => ProductDto.fromJson(e)).toList();
    }

    return [];
  }
}
