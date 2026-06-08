import 'dart:convert';
import 'dart:io';

import 'package:easy_vet/features/auth/data/login_request_dto.dart';
import 'package:easy_vet/features/auth/data/login_response_dto.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl =
      'https://petapi-591531460223.us-central1.run.app/api/users/login';

  Future<LoginResponseDto> login(LoginRequestDto requestDto) async {
    final Uri uri = Uri.parse(_baseUrl);
    final http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestDto.toJson()),
    );

    if (response.statusCode == HttpStatus.ok) {
      final json = jsonDecode(response.body);
      return LoginResponseDto.fromJson(json);
    }
    throw Exception('Failed to login');
  }
}
