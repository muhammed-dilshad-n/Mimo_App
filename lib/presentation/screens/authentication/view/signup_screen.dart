import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/auth_bloc.dart';
import 'package:flutter_application_1/application/signup/signup_bloc.dart';
import 'package:flutter_application_1/presentation/screens/authentication/view/login_screen.dart';
import 'package:flutter_application_1/presentation/screens/authentication/widget/button_widget.dart';
import 'package:flutter_application_1/presentation/screens/authentication/widget/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignupScreen extends HookWidget {
  static const routePath = "/LogoutScreen";

  const SignupScreen({super.key});

  String? validateConformPassword(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Enter a password";
    }

    if (password != confirmPassword) {
      return "Password is not matched";
    }

    return null;
  }

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Enter a email.";
    }

    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email";
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Enter a password";
    }

    if (password.length < 8) {
      return "At least 8 characters";
    }

    return null;
  }

  String? validateUserName(String? username) {
    if (username == null || username.isEmpty) {
      return "Enter a name";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final userNamecontroller = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>());
    onButtonClicked() {
      if (formKey.currentState!.validate()) {
        context.read<SignupBloc>().add(SignupEvent.signup(
              email: emailController.text,
              password: passwordController.text,
              name: userNamecontroller.text,
            ));
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocListener<SignupBloc, SignupState>(
        listenWhen: (previous, current) =>
            previous.authFailureOrSuccessOption !=
            current.authFailureOrSuccessOption,
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(() => null, (either) {
            either.fold(
              (l) {
                final errorMessage = l.maybeMap(
                  weakPassword: (_) => 'The password provided is too weak',
                  emailAlreadyInUse: (_) => 'Email already in use',
                  generic: (f) => f.message,
                  unexpected: (f) => f.error,
                  orElse: () => 'Something went wrong',
                );

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  backgroundColor: Colors.red,
                ));
                return;
              },
              (r) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(
                    child: Text(
                      'Login Successfull',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  backgroundColor: Colors.green,
                ));
                context
                    .read<AuthBloc>()
                    .add(const AuthEvent.authCheckRequested());
                return;
              },
            );
          });
        },
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 180),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, size: 35),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Create An Account",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    spacing: 20,
                    children: [
                      TextFormFieldWidget(
                          controller: userNamecontroller,
                          hintText: "Full Name",
                          validator: validateUserName),
                      TextFormFieldWidget(
                          controller: emailController,
                          hintText: "Email",
                          validator: validateEmail),
                      TextFormFieldWidget(
                        controller: passwordController,
                        hintText: "Password",
                        validator: validatePassword,
                      ),
                      TextFormFieldWidget(
                        hintText: "Confirm Password",
                        validator: (val) => validateConformPassword(
                            passwordController.text, val),
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          return ButtonWidget(
                            onTap: onButtonClicked,
                            isLoading: state.isSubmitting,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  spacing: 5,
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Already have an Account?",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
