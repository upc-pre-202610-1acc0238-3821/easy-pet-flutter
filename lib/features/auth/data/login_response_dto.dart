import 'package:easy_vet/features/auth/domain/user.dart';

class LoginResponseDto {
  final String token;
  final String firstName;
  final String lastName;
  final String email;

  const LoginResponseDto({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      token: json['token'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }

  User toDomain() {
    return User(lastName: lastName, firstName: firstName, email: email);
  }
}
