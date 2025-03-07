import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/signup/signup_bloc.dart';
import 'package:flutter_application_1/core/injection/injection.dart';
import 'package:flutter_application_1/presentation/router/app_router.dart';
import 'package:flutter_application_1/presentation/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<SignupBloc>()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        themeMode: ThemeMode.system,
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
