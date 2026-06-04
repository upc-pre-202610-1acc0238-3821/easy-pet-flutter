import 'package:easy_vet/features/auth/domain/user.dart';

abstract class AuthRepository {
  Future<User?> login({required String email, required String password});
}
