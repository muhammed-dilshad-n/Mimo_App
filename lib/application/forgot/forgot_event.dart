part of 'forgot_bloc.dart';

@freezed
class ForgotEvent with _$ForgotEvent {
  const factory ForgotEvent.forgotPassword({required String email}) =
      _ForgotPassword;
}
