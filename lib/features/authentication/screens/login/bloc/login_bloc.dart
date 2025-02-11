import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../common/form_inputs/form_inputs.dart';
import '../../../../../data/repositories/authentication/authentication.dart';
import '../../../../../data/repositories/services/services.dart';
import '../../../../../service_locator.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._authenticationRepository) : super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<RememberMeChanged>(_onRememberMeChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<LoadSavedCredentials>(_onLoadSavedCredentials);
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final AuthenticationBlocRepository _authenticationRepository;

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
          password: password,
          isValid: Formz.validate([state.email, password]),
          status: FormzSubmissionStatus.initial),
    );
  }

  void _onRememberMeChanged(RememberMeChanged event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        rememberMe: !state.rememberMe,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        obscureText: !state.obscureText,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void _onLoginSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    if (state.rememberMe) {
      await sl<SharedPreferencesService>().setEmail(state.email.value);
      await sl<SharedPreferencesService>().setPassword(state.password.value);
      await sl<SharedPreferencesService>().setRememberMe(true);
    } else {
      await sl<SharedPreferencesService>().setEmail('');
      await sl<SharedPreferencesService>().setPassword('');
      await sl<SharedPreferencesService>().setRememberMe(false);
    }

    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  Future<void> _onLoadSavedCredentials(
      LoadSavedCredentials event, Emitter<LoginState> emit) async {
    final rememberMe = await sl<SharedPreferencesService>().rememberMe;
    if (rememberMe) {
      final email = await sl<SharedPreferencesService>().email;
      final password = await sl<SharedPreferencesService>().password;

      _emailController.text = email;
      _passwordController.text = password;

      emit(
        state.copyWith(
          email: Email.dirty(email),
          password: Password.dirty(password),
          rememberMe: rememberMe,
          isValid:
              Formz.validate([Email.dirty(email), Password.dirty(password)]),
          status: FormzSubmissionStatus.initial,
        ),
      );
    }
  }

  // Getters para acceder a los controladores desde el widget
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
}
