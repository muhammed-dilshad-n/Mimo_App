part of 'signup_bloc.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState({
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _SignupState;

  factory SignupState.initial() {
    return SignupState(
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    );
  }
}
