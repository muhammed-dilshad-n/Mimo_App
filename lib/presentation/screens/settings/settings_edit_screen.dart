import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/user/user_bloc.dart';
import 'package:flutter_application_1/presentation/screens/authentication/widget/text_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SettingsEditScreen extends StatefulWidget {
  static const routePath = "/SettingsEditScreen";

  const SettingsEditScreen({super.key});

  @override
  State<SettingsEditScreen> createState() => _SettingsEditScreenState();
}

class _SettingsEditScreenState extends State<SettingsEditScreen> {
  final formKey = GlobalKey<FormState>();
  Uint8List? images;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize user data from Bloc state
    final currentUser = context.read<UserBloc>().state.currentUser;
    if (currentUser != null) {
      nameController.text = currentUser.name;
      locationController.text = currentUser.location;
      bioController.text = currentUser.bio;
    }
  }

  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final bytes = await image.readAsBytes();
      setState(() => images = bytes);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back, size: 35),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "Edit User",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          log(state.authFailureOrSuccessOption.toString());

          state.authFailureOrSuccessOption?.fold(
            () => null,
            (either) => either.fold(
              (failure) {
                // Show error snackbar
                final errorMessage = failure.maybeMap(
                  generic: (f) => f.message,
                  unexpected: (f) => f.error,
                  orElse: () => 'Something went wrong',
                  userNoteFound: (value) => "Invalid Email",
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              },
              (_) {
                // Show success snackbar and navigate back
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("User updated successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
                context.pop(); // Navigate back after success
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              images != null ? MemoryImage(images!) : null,
                          radius: 45,
                          child: IconButton(
                            onPressed: pickImage,
                            icon: const Icon(Icons.add),
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text("Add your photo",
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFormFieldWidget(
                    validator: (value) =>
                        value!.isEmpty ? "Please enter your name" : null,
                    controller: nameController,
                    hintText: "Enter your name",
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldWidget(
                    validator: (value) =>
                        value!.isEmpty ? "Please enter your location" : null,
                    controller: locationController,
                    hintText: "Enter your location",
                  ),
                  const SizedBox(height: 20),
                  TextFormFieldWidget(
                    validator: (value) =>
                        value!.isEmpty ? "Please enter your bio" : null,
                    controller: bioController,
                    maxLines: 2,
                    hintText: "Enter your Bio",
                  ),
                  const SizedBox(height: 50),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.purpleAccent),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<UserBloc>().add(UserEvent.getUser(
                              name: nameController.text,
                              location: locationController.text,
                              bio: bioController
                                  .text, // Pass image bytes if available
                            ));
                      }
                    },
                    child: const Text("Save",
                        style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
