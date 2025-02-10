part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  const PasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RememberMeChanged extends LoginEvent {
  const RememberMeChanged(this.rememberMe);

  final bool rememberMe;

  @override
  List<Object> get props => [rememberMe];
}

class TogglePasswordVisibility extends LoginEvent {
  const TogglePasswordVisibility(this.obscureText);

  final bool obscureText;

  @override
  List<Object> get props => [obscureText];
}

class LoginSubmitted extends LoginEvent {}
