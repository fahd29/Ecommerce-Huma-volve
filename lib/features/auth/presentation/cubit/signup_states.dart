import '../../domain/entities/user_entity.dart';

abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {
  final UserEntity user;

  SignUpSuccess(this.user);
}

class SignUpError extends SignUpStates {
  final String errorMessage;

  SignUpError(this.errorMessage);
}
