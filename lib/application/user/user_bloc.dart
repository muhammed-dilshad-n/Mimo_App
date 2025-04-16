import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:flutter_application_1/domain/settings/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final IAuthRepository _authRepository;

  UserBloc(this._authRepository) : super(UserState()) {
    on<_GetUser>((event, emit) async {
      emit(state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none()));

      final getTask = await _authRepository.addUserData(
        name: event.name,
        location: event.location,
        bio: event.bio,
      );

      getTask.fold(
        (failure) => emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(left(failure)),
        )),
        (userList) => emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(right(unit)), // Indicate success
          users: userList,
        )),
      );
    });

    on<_LoadedUser>((event, emit) async {
      emit(state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none()));

      final getTask = await _authRepository.getUserdata();

      getTask.fold(
        (failure) => emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(left(failure)),
        )),
        (userList) => emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: none(),
          users: userList,
        )),
      );
    });

    on<_UpdateUser>((event, emit) async {
      emit(state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none()));

      final updateTask = await _authRepository.updateUserData(
        name: event.name,
        location: event.location,
        bio: event.bio,
        imageBytes: event.imageBytes,
      );

      updateTask.fold(
        (failure) => emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(left(failure)),
        )),
        (updatedUser) => emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(right(unit)),
          currentUser: updatedUser, // Update the currentUser
        )),
      );
    });
  }
}
