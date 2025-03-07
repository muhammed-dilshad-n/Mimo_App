import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthFailure.weakPassword() = _WeakPassword;
  const factory AuthFailure.generic(String message) = _Generic;
  const factory AuthFailure.unexpected(String error) = _Unexpected;
  const factory AuthFailure.unAuthenticated() = _UnAuthenticated;
}
