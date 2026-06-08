import 'package:easy_vet/core/storage/token_storage.dart';
import 'package:easy_vet/features/auth/data/auth_service.dart';
import 'package:easy_vet/features/auth/data/login_request_dto.dart';
import 'package:easy_vet/features/auth/domain/auth_repository.dart';
import 'package:easy_vet/features/auth/domain/user.dart';

class AuthRepositporyImpl implements AuthRepository {
  final AuthService service;
  final TokenStorage tokenStorage;

  const AuthRepositporyImpl({
    required this.service,
    required this.tokenStorage,
  });

  @override
  Future<User> login({required String email, required String password}) async {
    final LoginRequestDto requestDto = LoginRequestDto(
      email: email,
      password: password,
    );

    final responseDto = await service.login(requestDto);

    await tokenStorage.saveToken(responseDto.token);

    return responseDto.toDomain();
  }
}
