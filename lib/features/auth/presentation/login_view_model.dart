import 'package:easy_vet/features/auth/domain/auth_repository.dart';
import 'package:easy_vet/features/auth/domain/user.dart';
import 'package:easy_vet/features/auth/presentation/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginState> {
  final AuthRepository repository;

  LoginViewModel({required this.repository}) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final User user = await repository.login(
        email: email,
        password: password,
      );
      emit(LoginSuccess(user: user));
    } catch (e) {
      emit(LoginFailure(error: '$e'));
    }
  }
}
