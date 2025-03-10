import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signin_event.dart';
part 'signin_state.dart';
part 'signin_bloc.freezed.dart';

@injectable
class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final IAuthRepository _authRepository;
  SigninBloc(this._authRepository) : super(SigninState.initial()) {
    on<SigninEvent>((event, emit) async {
      await event.map(signin: (e) async {
        emit(
          state.copyWith(isSubmitting: true),
        );
        final failureOrSuccess = await _authRepository.signIn(
          email: e.email,
          password: e.password,
        );
        emit(failureOrSuccess.fold(
          (l) => state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(left(l)),
          ),
          (r) => state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(right(r)),
          ),
        ));
      });
    });
  }
}
