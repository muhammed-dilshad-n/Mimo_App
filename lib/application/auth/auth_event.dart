part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.userAuthenticated() = _UserAuthenticated;
  const factory AuthEvent.authCheckRequested() = _AuthCheckRequested;
}
