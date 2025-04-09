import 'dart:developer';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/core/injection/injection.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:flutter_application_1/domain/settings/model/user_model.dart';
import 'package:flutter_application_1/presentation/screens/task/model/taskmodel/task_model.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@LazySingleton(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  late FirebaseAuth _auth;
  late FirebaseFirestore _firestore;

  AuthRepository() {
    _auth = getIt<FirebaseAuth>();
    _firestore = getIt<FirebaseFirestore>();
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

  @override
  Future<Either<AuthFailure, Unit>> signOut() async {
    try {
      _auth.signOut();
      return right(unit);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return left(AuthFailure.userNoteFound());
      }
      return left(AuthFailure.generic(e.message ?? 'Unknown error'));
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> forgotPassword(
      {required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(AuthFailure.userNoteFound());
      }
      return left(AuthFailure.generic(e.message ?? 'Unknown error'));
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, List<UserModel>>> addUserData({
    required String name,
    required String location,
    required String bio,
  }) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      _firestore
          .collection('user')
          .doc(id)
          .set({'id': id, 'name': name, 'location': location, 'bio': bio});
      final data = await getuserData();
      return right(data);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  // @override
  // Future<Either<AuthFailure, Unit>> editUser({
  //   required UserModel user,
  // }) async {
  //   try {
  //     _firestore
  //         .collection('user')
  //         .doc(_auth.currentUser!.uid)
  //         .set(user.toJson());
  //     return right(unit);
  //   } catch (e) {
  //     return left(AuthFailure.unexpected(e.toString()));
  //   }
  // }

  @override
  Future<Either<AuthFailure, List<UserModel>>> getUserdata() async {
    try {
      _firestore
          .collection('user')
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) {});
      final data = await getuserData();
      return right(data);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, List<TaskModel>>> addTask({
    required String title,
    required String emoji,
  }) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      _firestore.collection('task').doc(id).set({
        'docId': id,
        'id': _auth.currentUser!.uid,
        'emoji': emoji,
        'title': title,
      });
      final data = await getTaskData();
      return right(data);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  // @override
  // Future<Either<AuthFailure, Unit>> deleteTask(
  //     {required TaskModel task}) async {
  //   try {
  //     _firestore.collection('user').doc(task.id).delete();
  //     return right(unit);
  //   } catch (e) {
  //     return left(AuthFailure.unexpected(e.toString()));
  //   }
  // }

  @override
  Future<Either<AuthFailure, List<TaskModel>>> getTask() async {
    try {
      final data = await getTaskData();
      return right(data);
    } catch (e) {
      log(e.toString());
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, List<TaskModel>>> updateTask({
    required String docId,
    String? emoji,
    String? title,
  }) async {
    try {
      await _firestore.collection('task').doc(docId).update({
        if (emoji != null) 'emoji': emoji,
        if (title != null) 'title': title,
      });
      final data = await getTaskData();
      return right(data);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  Future<List<TaskModel>> getTaskData() async {
    final List<TaskModel> data =
        await _firestore.collection('task').get().then((val) {
      return val.docs.map((doc) {
        log(doc.data().toString());
        return TaskModel.fromJson(doc.data());
      }).toList();
    });
    return data;
  }

  Future<List<UserModel>> getuserData() async {
    final List<UserModel> data =
        await _firestore.collection('user').get().then((val) {
      return val.docs.map((doc) {
        log(doc.data().toString());
        return UserModel.fromJson(doc.data());
      }).toList();
    });
    return data;
  }

  @override
  Future<Either<AuthFailure, UserModel>> updateUserData({
    required String name,
    required String location,
    required String bio,
    Uint8List? imageBytes,
  }) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return left(const AuthFailure.unexpected(
            "user not found")); // Or a more appropriate error
      }

      final userId = user.uid;

      // 2. Update Firestore Document
      await _firestore.collection('user').doc(userId).update({
        'name': name,
        'location': location,
        'bio': bio, // Only update if a new image was uploaded
      });

      // 3. Retrieve Updated User Data (and create UserModel)
      final updatedDoc = await _firestore.collection('user').doc(userId).get();
      final updatedData = updatedDoc.data();

      if (updatedData == null) {
        return left(const AuthFailure.unexpected(
            "something went wrong ")); // Or a more appropriate error
      }

      final updatedUserModel = UserModel(
        name: updatedData['name'] as String,
        location: updatedData['location'] as String,
        bio: updatedData['bio'] as String,
        image: updatedData['imageUrl'] as String?, // Can be null
      );

      return right(updatedUserModel);
    } catch (e) {
      print(e);
      return left(const AuthFailure.generic(
          "something went wrong")); // Or a more specific error based on 'e'
    }
  }
}
