import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/core/todo_app.dart';
import 'package:flutter_application_1/presentation/screens/authentication/view/forgot_password_screen.dart';
import 'package:flutter_application_1/presentation/screens/authentication/view/login_screen.dart';
import 'package:flutter_application_1/presentation/screens/authentication/view/signup_screen.dart';
import 'package:flutter_application_1/presentation/screens/categories/categories_screen.dart';
import 'package:flutter_application_1/presentation/screens/settings/settings_edit_screen.dart';
import 'package:flutter_application_1/presentation/screens/settings/settings_screen.dart';
import 'package:flutter_application_1/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter_application_1/presentation/screens/task/view/pages/task_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  navigatorKey: TodoApp.navigatorkey,
  initialLocation: SplashScreen.routePath,
  routes: <RouteBase>[
    GoRoute(
      path: SplashScreen.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: LoginScreen.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: SignupScreen.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return SignupScreen();
      },
    ),
    GoRoute(
      path: ForgotPasswordScreen.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return ForgotPasswordScreen();
      },
    ),
    GoRoute(
      path: SettingsScreen.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsScreen();
      },
    ),
    GoRoute(
      path: CategoriesScreen.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return CategoriesScreen();
      },
    ),
    // GoRoute(
    //   path: TaskScreen.routePath,
    //   builder: (BuildContext context, GoRouterState state) {
    //     return TaskScreen();
    //   },
    // ),
    GoRoute(
      path: SettingsEditScreen.routePath,
      builder: (BuildContext context, GoRouterState state) {
        return SettingsEditScreen();
      },
    ),
  ],
);
