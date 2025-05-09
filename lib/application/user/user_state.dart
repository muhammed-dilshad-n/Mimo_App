part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isSubmitting,
    UserModel? currentUser,
    Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption,
  }) = _UserState;
}
