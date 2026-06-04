import 'package:easy_vet/features/auth/data/auth_service.dart';
import 'package:easy_vet/features/auth/data/login_request_dto.dart';
import 'package:easy_vet/features/auth/domain/auth_repository.dart';
import 'package:easy_vet/features/auth/domain/user.dart';

class AuthRepositporyImpl implements AuthRepository {
  final AuthService service;
  const AuthRepositporyImpl({required this.service});

  @override
  Future<User?> login({required String email, required String password}) async {
    final LoginRequestDto requestDto = LoginRequestDto(
      email: email,
      password: password,
    );

    final responseDto = await service.login(requestDto);

    return responseDto?.toDomain();
  }
}
