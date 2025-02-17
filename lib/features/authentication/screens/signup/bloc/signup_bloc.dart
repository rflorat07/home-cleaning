import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../../../common/form_inputs/form_inputs.dart';
import '../../../../../common/models/models.dart';
import '../../../../../data/repositories/authentication/authentication.dart';
import '../../../../../data/repositories/user/user_bloc.repository.dart';
import '../../../../../service_locator.dart';
import '../../../../../utils/utils.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this._authenticationRepository) : super(const SignupState()) {
    on<NameChanged>(_onNameChanged);
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<AgreeTermsChanged>(_onAgreeTermsChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SignupSubmitted>(_onSignupSubmitted);
  }

  final AuthenticationBlocRepository _authenticationRepository;

  void _onNameChanged(NameChanged event, Emitter<SignupState> emit) {
    final name = Name.dirty(event.name);
    emit(
      state.copyWith(
        name: name,
        isValid: Formz.validate([name, state.email, state.password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignupState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([state.name, email, state.password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignupState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.name, state.email, password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onAgreeTermsChanged(
      AgreeTermsChanged event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        agreeTerms: !state.agreeTerms,
        isValid: Formz.validate([state.name, state.email, state.password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<SignupState> emit) {
    emit(
      state.copyWith(
        obscureText: !state.obscureText,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onSignupSubmitted(
      SignupSubmitted event, Emitter<SignupState> emit) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    if (!state.agreeTerms) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: TTexts.acceptPrivacyPolicyMessage,
        ),
      );
      return;
    }

    try {
      final userCredential =
          await _authenticationRepository.registerWithEmailAndPassword(
        state.email.value,
        state.password.value,
      );

      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: state.name.value,
        email: state.email.value,
        gender: '',
        phoneNumber: '',
        profilePicture: '',
      );

      await sl<UserBlocRepository>().saveUserRecord(newUser);

      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: TTexts.signupFailedMessage,
        ),
      );
    }
  }
}
