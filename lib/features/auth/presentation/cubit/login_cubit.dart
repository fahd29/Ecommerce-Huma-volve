import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await loginUseCase(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (tokens) => emit(LoginSuccess(tokens)),
    );
  }
}
