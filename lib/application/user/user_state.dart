part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(false) bool isSubmitting,
    @Default([]) List<UserModel> users,
    UserModel? currentUser,
    Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption,
  }) = _UserState;

  factory UserState.initial() => const UserState(
        isSubmitting: false,
        users: [],
        authFailureOrSuccessOption: None(),
      );
}
