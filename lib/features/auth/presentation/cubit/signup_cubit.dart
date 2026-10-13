import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/signup_usecase.dart';
import 'signup_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());
    final result = await signUpUseCase(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignUpError(failure.message)),
      (user) => emit(SignUpSuccess(user)),
    );
  }
}
