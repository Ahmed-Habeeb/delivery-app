
part of 'login_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginResponseEntity response;

  AuthSuccess({required this.response});
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}

