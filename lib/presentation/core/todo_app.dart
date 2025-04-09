import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/auth_bloc.dart';
import 'package:flutter_application_1/application/user/user_bloc.dart';
import 'package:flutter_application_1/application/forgot/forgot_bloc.dart';
import 'package:flutter_application_1/application/signIn/signin_bloc.dart';
import 'package:flutter_application_1/application/signup/signup_bloc.dart';
import 'package:flutter_application_1/application/task/task_bloc.dart';
import 'package:flutter_application_1/core/injection/injection.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/screens/authentication/login_screen.dart';
import 'package:flutter_application_1/presentation/screens/categories/categories_screen.dart';
import 'package:flutter_application_1/presentation/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  static final navigatorkey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SignupBloc>()),
        BlocProvider(
            create: (context) => getIt<AuthBloc>()
              ..add(
                AuthEvent.authCheckRequested(),
              )),
        BlocProvider(create: (context) => getIt<SigninBloc>()),
        BlocProvider(create: (context) => getIt<ForgotBloc>()),
        BlocProvider(create: (context) => getIt<TaskBloc>()),
        BlocProvider(create: (context) => getIt<UserBloc>()),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.map(
            initial: (_) => null,
            authenticated: (_) {
              navigatorkey.currentContext!
                  .pushReplacement(CategoriesScreen.routePath);
            },
            unAuthenticated: (_) {
              navigatorkey.currentContext!
                  .pushReplacement(LoginScreen.routePath);
            },
          );
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          themeMode: ThemeMode.system,
          theme: AppTheme.darkTheme,
          darkTheme: AppTheme.darkTheme,
        ),
      ),
    );
  }
}
