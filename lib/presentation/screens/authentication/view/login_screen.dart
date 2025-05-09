import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/auth_bloc.dart';
import 'package:flutter_application_1/application/signIn/signin_bloc.dart';
import 'package:flutter_application_1/presentation/screens/authentication/view/forgot_password_screen.dart';
import 'package:flutter_application_1/presentation/screens/authentication/view/signup_screen.dart';
import 'package:flutter_application_1/presentation/screens/authentication/widget/button_widget.dart';
import 'package:flutter_application_1/presentation/screens/authentication/widget/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  static const routePath = "/LoginScreen";

  LoginScreen({super.key});

  String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Enter Email.";
    }

    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(email)) {
      return "Enter Valid Email";
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Enter password";
    }

    if (password.length < 8) {
      return "At least 8 characters";
    }

    return null;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    onButtonClicked() {
      if (formKey.currentState!.validate()) {
        context.read<SigninBloc>().add(SigninEvent.signin(
              email: emailController.text,
              password: passwordController.text,
            ));
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocListener<SigninBloc, SigninState>(
        listenWhen: (previous, current) =>
            previous.authFailureOrSuccessOption !=
            current.authFailureOrSuccessOption,
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(() => null, (either) {
            either.fold(
              (l) {
                final errorMessage = l.maybeMap(
                  generic: (f) => f.message,
                  unexpected: (f) => f.error,
                  orElse: () => 'Something went wrong',
                  userNoteFound: (value) => "Invalid Email or password",
                );

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
                      'login successfull',
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Image.asset("assets/images/mimo_images.png"),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormFieldWidget(
                    controller: emailController,
                    validator: validateEmail,
                    hintText: "Email",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormFieldWidget(
                    controller: passwordController,
                    validator: validatePassword,
                    hintText: "Password",
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPasswordScreen()));
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<SigninBloc, SigninState>(
                  builder: (context, state) {
                    return ButtonWidget(
                      onTap: onButtonClicked,
                      isLoading: state.isSubmitting,
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  spacing: 5,
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "Dont have an Account?",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen()));
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
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
