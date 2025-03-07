import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/injection/injection.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/presentation/core/todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(TodoApp());
}
