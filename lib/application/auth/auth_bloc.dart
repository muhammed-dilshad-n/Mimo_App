import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _auth;
  AuthBloc(this._auth) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        userAuthenticated: (_) async => emit(const AuthState.authenticated()),
        authCheckRequested: (_) async {
          await Future.delayed(const Duration(seconds: 1));
          final userOption = await _auth.getUser();
          emit(userOption.fold(
            (l) {
              return const AuthState.unAuthenticated();
            },
            (r) {
              return const AuthState.authenticated();
            },
          ));
        },
        userLoggedOut: (_) async {
          final logOutOption = await _auth.signOut();
          emit(logOutOption.fold(
            (l) {
              return const AuthState.authenticated();
            },
            (r) {
              return const AuthState.unAuthenticated();
            },
          ));
        },
      );
    });
  }
}
