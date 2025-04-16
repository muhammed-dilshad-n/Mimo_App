import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:flutter_application_1/domain/settings/model/user_model.dart';
import 'package:flutter_application_1/presentation/screens/task/model/taskmodel/task_model.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, Unit>> signUp({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, Unit>> signIn({
    required String email,
    required String password,
  });
  Future<Either<AuthFailure, Unit>> forgotPassword({
    required String email,
  });
  Future<Either<AuthFailure, User>> getUser();

  Future<Either<AuthFailure, Unit>> signOut();
  Future<Either<AuthFailure, UserModel>> getUserdata();
  Future<Either<AuthFailure, UserModel>> addUserData({
    required String name,
    required String location,
    required String bio,
  });
  Future<Either<AuthFailure, List<TaskModel>>> addTask({
    required String emoji,
    required String title,
  });
  Future<Either<AuthFailure, List<TaskModel>>> getTask();
  Future<Either<AuthFailure, List<TaskModel>>> updateTask({
    String? emoji,
    String? title,
  });
}
