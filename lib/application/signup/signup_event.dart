part of 'signup_bloc.dart';

@freezed
class SignupEvent with _$SignupEvent {
  const factory SignupEvent.signup({
    required String email,
    required String password,
    required String name,
  }) = _Signup;
}
