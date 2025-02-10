part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationAuthenticated extends AuthenticationState {}

final class AuthenticationUnauthenticated extends AuthenticationState {}

final class AuthenticationIsFirstTime extends AuthenticationState {}

final class AuthenticationVerifyEmail extends AuthenticationState {}
