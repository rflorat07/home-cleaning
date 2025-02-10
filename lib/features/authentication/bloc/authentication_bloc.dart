import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/authentication/authentication.dart';
import '../../../data/repositories/services/shared_preferences_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationBlocRepository authenticationRepository,
    required SharedPreferencesService sharedPreferencesService,
  })  : _authenticationRepository = authenticationRepository,
        _sharedPreferencesService = sharedPreferencesService,
        super(AuthenticationInitial()) {
    on<AuthenticationStarted>(_onAuthenticationStarted);
  }

  final AuthenticationBlocRepository _authenticationRepository;
  final SharedPreferencesService _sharedPreferencesService;

  Future<void> _onAuthenticationStarted(
    AuthenticationStarted event,
    Emitter<AuthenticationState> emit,
  ) async {
    final currentUser = _authenticationRepository.currentUser;

    if (currentUser != null) {
      if (currentUser.emailVerified) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationVerifyEmail());
      }
    } else {
      await _sharedPreferencesService.writeIfNullBool('IsFirstTime', true);
      final isFirstTime = await _sharedPreferencesService.isFirstTime;

      if (!isFirstTime) {
        emit(AuthenticationIsFirstTime());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    }
  }
}
