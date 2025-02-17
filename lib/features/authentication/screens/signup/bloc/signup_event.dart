part of 'signup_bloc.dart';

sealed class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends SignupEvent {
  const NameChanged(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class EmailChanged extends SignupEvent {
  const EmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignupEvent {
  const PasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class AgreeTermsChanged extends SignupEvent {
  const AgreeTermsChanged(this.agreeTerms);

  final bool agreeTerms;

  @override
  List<Object> get props => [agreeTerms];
}

class TogglePasswordVisibility extends SignupEvent {
  const TogglePasswordVisibility(this.obscureText);

  final bool obscureText;

  @override
  List<Object> get props => [obscureText];
}

class SignupSubmitted extends SignupEvent {}
