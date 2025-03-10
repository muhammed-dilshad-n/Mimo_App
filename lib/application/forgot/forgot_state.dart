part of 'forgot_bloc.dart';

@freezed
class ForgotState with _$ForgotState {
  const factory ForgotState({
    required bool isSubmitting,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _ForgotState;

  factory ForgotState.initial() {
    return ForgotState(
      isSubmitting: false,
      authFailureOrSuccessOption: none(),
    );
  }
}
