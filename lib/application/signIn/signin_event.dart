part of 'signin_bloc.dart';

@freezed
class SigninEvent with _$SigninEvent {
  const factory SigninEvent.signin({
    required String email,
    required String password,
  }) = _Signin;
}
