import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'signup_event.dart';
part 'signup_state.dart';
part 'signup_bloc.freezed.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final IAuthRepository _authRepository;
  SignupBloc(this._authRepository) : super(SignupState.initial()) {
    on<SignupEvent>((event, emit) async {
      await event.map(
        signup: (e) async {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));

          final signupOption = await _authRepository.signUp(
            name: e.name,
            email: e.email,
            password: e.password,
          );

          emit(signupOption.fold(
            (l) => state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(left(l)),
            ),
            (r) => state.copyWith(
              isSubmitting: false,
              authFailureOrSuccessOption: some(right(r)),
            ),
          ));
        },
      );
    });
  }
}
