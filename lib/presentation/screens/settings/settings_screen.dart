import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/auth/auth_bloc.dart';
import 'package:flutter_application_1/application/user/user_bloc.dart';
import 'package:flutter_application_1/presentation/screens/settings/settings_edit_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  static const routePath = "/SettingsScreen";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<UserBloc>().add(UserEvent.loadedUser());
    String username;
    String location;
    String bio;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, size: 35),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Settings",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.isSubmitting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.currentUser != null) {
            username = state.currentUser!.name;
            location = state.currentUser!.location;
            bio = state.currentUser!.bio;
          } else {
            username = "Max";
            location = "New York";
            bio = "I am a new user";
          }

          return Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/porfile.png"),
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        location,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsEditScreen()));
                      },
                      icon: Icon(Icons.edit, size: 30, color: Colors.white)),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    bio,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.notifications)),
                        Text("Notification"),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.settings)),
                        Text("General"),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.account_circle)),
                        Text("Account"),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                        Text("About"),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        IconButton(
                          onPressed: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.userLoggedOut());
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<AuthBloc>()
                                .add(const AuthEvent.userLoggedOut());
                          },
                          child: Text(
                            "Signout",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
