part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.errorMessage,
    this.isValid = false,
    this.email = const Email.pure(),
    this.status = FormzSubmissionStatus.initial,
  });
  final Email email;
  final bool isValid;
  final String? errorMessage;
  final FormzSubmissionStatus status;

  ForgotPasswordState copyWith({
    Email? email,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return ForgotPasswordState(
        email: email ?? this.email,
        status: status ?? this.status,
        isValid: isValid ?? this.isValid,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [email, status, isValid, errorMessage];
}
