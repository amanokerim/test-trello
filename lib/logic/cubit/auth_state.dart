part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthComplete extends AuthState {
  final String token;
  AuthComplete(this.token);
}

class AuthError extends AuthState {
  // final String errorText;
}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}
