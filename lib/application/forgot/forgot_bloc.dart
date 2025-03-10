import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';
part 'forgot_bloc.freezed.dart';

@injectable
class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  final IAuthRepository _authRepository;
  ForgotBloc(this._authRepository) : super(ForgotState.initial()) {
    on<ForgotEvent>((event, emit) async {
      await event.map(forgotPassword: (e) async {
        emit(
          state.copyWith(isSubmitting: true),
        );
        final password = await _authRepository.forgotPassword(
          email: e.email,
        );
        emit(password.fold(
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
