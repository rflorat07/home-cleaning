part of 'signup_bloc.dart';

final class SignupState extends Equatable {
  const SignupState({
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
    this.obscureText = true,
    this.agreeTerms = true,
  });

  final Name name;
  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;
  final bool obscureText;
  final bool agreeTerms;

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        status,
        isValid,
        errorMessage,
        obscureText,
        agreeTerms
      ];

  SignupState copyWith({
    Name? name,
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
    bool? obscureText,
    bool? agreeTerms,
  }) {
    return SignupState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      obscureText: obscureText ?? this.obscureText,
      agreeTerms: agreeTerms ?? this.agreeTerms,
    );
  }
}
