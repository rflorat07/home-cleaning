import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repositories/authentication/authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationBlocRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(AuthenticationInitial()) {
    on<AuthenticationStarted>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthenticationLoggedIn>((event, emit) {
      // TODO: implement event handler
    });

    on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }
  final AuthenticationBlocRepository _authenticationRepository;

  void _onLogoutPressed(
    AuthenticationLogoutPressed event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logout();
  }
}
