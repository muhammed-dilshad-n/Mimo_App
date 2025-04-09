part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.getUser({
    required String name,
    required String location,
    required String bio,
  }) = _GetUser;

  const factory UserEvent.loadedUser() = _LoadedUser;

  const factory UserEvent.updateUser({
    required String name,
    required String location,
    required String bio,
    Uint8List? imageBytes,
  }) = _UpdateUser;
}
