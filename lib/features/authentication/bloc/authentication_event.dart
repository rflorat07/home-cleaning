part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

final class AuthenticationStarted extends AuthenticationEvent {
  const AuthenticationStarted();
}

final class AuthenticationLoggedIn extends AuthenticationEvent {
  final String email;
  final String password;

  const AuthenticationLoggedIn({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

final class AuthenticationLogoutPressed extends AuthenticationEvent {
  const AuthenticationLogoutPressed();
}
