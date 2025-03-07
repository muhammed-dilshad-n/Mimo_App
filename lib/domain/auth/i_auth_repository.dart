import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, Unit>> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, User>> getUser();
}
