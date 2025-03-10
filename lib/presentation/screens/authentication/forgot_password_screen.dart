import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/forgot/forgot_bloc.dart';
import 'package:flutter_application_1/presentation/screens/authentication/login_screen.dart';
import 'package:flutter_application_1/presentation/screens/authentication/widget/button_widget.dart';
import 'package:flutter_application_1/presentation/screens/authentication/widget/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends HookWidget {
  static const routePath = "/ForgotPasswordScreen";

  ForgotPasswordScreen({super.key});

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

  TextEditingController emailcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    onButtonClicked() {
      if (formKey.currentState!.validate()) {
        context.read<ForgotBloc>().add(ForgotEvent.forgotPassword(
              email: emailcontroler.text,
            ));
      }
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocListener<ForgotBloc, ForgotState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(() => null, (either) {
            either.fold(
              (l) {
                final errorMessage = l.maybeMap(
                  generic: (f) => f.message,
                  unexpected: (f) => f.error,
                  orElse: () => 'Something went wrong',
                  userNoteFound: (value) => "Invalid Email",
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
                context.pop();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Center(
                    child: Text(
                      'Link has been send to ${emailcontroler.text}',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  backgroundColor: Colors.green,
                ));

                return;
              },
            );
          });
        },
        child: Form(
          key: formKey,
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
                    "Forgot Password",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  spacing: 10,
                  children: [
                    TextFormFieldWidget(
                      controller: emailcontroler,
                      hintText: "Email",
                      validator: validateEmail,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Enter the email you used to Create your account and we will email you a link to reset your password.",
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    BlocBuilder<ForgotBloc, ForgotState>(
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
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "Dont have an Account?",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
