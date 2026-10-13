import '../../domain/entities/auth_tokens_entity.dart';

abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {
  final AuthTokensEntity tokens;

  LoginSuccess(this.tokens);
}

class LoginError extends LoginStates {
  final String errorMessage;

  LoginError(this.errorMessage);
}
