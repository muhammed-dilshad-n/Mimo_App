import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/core/injection/injection.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  late FirebaseAuth _auth;

  AuthRepository() {
    _auth = getIt<FirebaseAuth>();
  }

  @override
  Future<Either<AuthFailure, Unit>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user?.updateDisplayName(name);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(AuthFailure.weakPassword());
      } else if (e.code == 'email-already-in-use') {
        return left(AuthFailure.emailAlreadyInUse());
      }
      return left(AuthFailure.generic(e.message ?? 'Unknown error'));
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, User>> getUser() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return left(AuthFailure.unAuthenticated());
      } else {
        return right(user);
      }
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }
}
