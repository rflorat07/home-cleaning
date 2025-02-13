import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../../common/form_inputs/form_inputs.dart';
import '../../../../../data/repositories/authentication/authentication.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(this._authenticationRepository)
      : super(const ForgotPasswordState()) {
    on<EmailChanged>(_onEmailChanged);
    on<SubmitForgotPassword>(_onSubmit);
  }

  final AuthenticationBlocRepository _authenticationRepository;

  void _onEmailChanged(EmailChanged event, Emitter<ForgotPasswordState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([email]),
      status: FormzSubmissionStatus.initial,
    ));
  }

  void _onSubmit(
      SubmitForgotPassword event, Emitter<ForgotPasswordState> emit) async {
    final email = Email.dirty(state.email.value);
    emit(state.copyWith(email: email));

    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authenticationRepository
          .sendPasswordResetEmail(state.email.value.trim());
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
