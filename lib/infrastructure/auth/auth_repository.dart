import 'dart:developer';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/core/injection/injection.dart';
import 'package:flutter_application_1/domain/auth/failures/auth_failure.dart';
import 'package:flutter_application_1/domain/auth/i_auth_repository.dart';
import 'package:flutter_application_1/domain/settings/model/user_model.dart';
import 'package:flutter_application_1/presentation/screens/task/model/task_data_model/task_data_model.dart';
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
  String docid = "";
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
  Future<Either<AuthFailure, UserModel>> addUserData({
    required String name,
    required String location,
    required String bio,
  }) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch.toString();
      _firestore
          .collection('users')
          .doc(
            _auth.currentUser!.uid,
          )
          .set({'id': id, 'name': name, 'location': location, 'bio': bio});
      final data = await getuserDatas();
      return right(data);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, UserModel>> getUserdata() async {
    try {
      final data = await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .get()
          .then((value) {});
      return right(data);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

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
    // required String docId,
    String? emoji,
    String? title,
  }) async {
    try {
      await _firestore
          .collection('task')
          .doc(
            _auth.currentUser!.uid,
          )
          .update({
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
    final List<TaskModel> data = await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('category')
        .orderBy('id', descending: true)
        .get()
        .then((val) {
      return val.docs.map((doc) {
        log(doc.data().toString());
        return TaskModel.fromJson(doc.data());
      }).toList();
    });
    return data;
  }

  Future<UserModel> getuserDatas() async {
    final UserModel data = await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get()
        .then((value) {
      return UserModel.fromJson(value.data()!);
    });
    return data;
  }

  @override
  Future<Either<AuthFailure, List<TaskModel>>> addTask({
    required String title,
    required String emoji,
  }) async {
    try {
      // Create category document reference
      final categoryRef = _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('category')
          .doc(); // Let Firestore auto-generate ID
      docid = categoryRef.id;
      // Set category data
      await categoryRef.set({
        'id': categoryRef.id, // Store document ID
        'emoji': emoji,
        'title': title,
      });

      final data = await getTaskData();
      return right(data);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, List<TaskDataModel>>> addTaskdata({
    required String id, // This should be the category document ID
    required String title,
    required bool isCompleted,
  }) async {
    try {
      // Reference the specific category document
      final categoryDocRef = _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('category')
          .doc(docid);

      // Add to taskdata subcollection
      await categoryDocRef
          .collection("taskdata")
          .doc(id) // Auto-generate subdocument ID
          .set({
        'title': title,
        'completed': isCompleted,
        'createdAt': FieldValue.serverTimestamp(),
      });

      final data = await getTaskdatas();
      return right(data);
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

  Future<List<TaskDataModel>> getTaskdatas() async {
    final List<TaskDataModel> data = await _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('category')
        .doc()
        .collection('task')
        .doc()
        .collection("taskdata")
        .orderBy('id', descending: true)
        .get()
        .then((val) {
      return val.docs.map((doc) {
        log(doc.data().toString());
        return TaskDataModel.fromJson(doc.data());
      }).toList();
    });
    return data;
  }

  @override
  Future<Either<AuthFailure, UserModel>> updateUserData(
      {String? name, String? location, String? bio}) async {
    try {
      await _firestore
          .collection('users')
          .doc(
            _auth.currentUser!.uid,
          )
          .update({
        if (name != null) 'name': name,
        if (location != null) 'location': location,
        if (bio != null) 'bio': bio,
      });
      return getuserDatas().then((value) => right(value));
    } catch (e) {
      return left(AuthFailure.unexpected(e.toString()));
    }
  }

//   @override
//   Future<Either<AuthFailure, List<TaskDataModel>>> addTaskdata(
//       {required TaskDataModel taskDataModel}) async {
//     try {
//       await _firestore
//           .collection('task')
//           .doc(
//             taskDataModel.id,
//           )
//           .collection("taskdata")
//           .doc(taskDataModel.id)
//           .set({
//         'title': taskDataModel.title,
//         'completed': taskDataModel.completed,
//       });
//       return right([]);
//     } catch (e) {
//       return left(AuthFailure.unexpected(e.toString()));
//     }
//   }

//   @override
//   Future<Either<AuthFailure, List<TaskDataModel>>> getTaskdatas() async {
//     try {
//       final data = await _firestore
//           .collection('task')
//           .doc(
//             _auth.currentUser!.uid,
//           )
//           .collection("taskdata")
//           .get()
//           .then((val) {
//         return val.docs.map((doc) {
//           log(doc.data().toString());
//           return TaskDataModel.fromJson(doc.data());
//         }).toList();
//       });
//       return right(data);
//     } catch (e) {
//       log(e.toString());
//       return left(AuthFailure.unexpected(e.toString()));
//     }
//   }
// }
}
