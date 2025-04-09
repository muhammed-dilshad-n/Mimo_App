import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/application/task/task_bloc.dart';
import 'package:flutter_application_1/presentation/screens/settings/settings_screen.dart';
import 'package:flutter_application_1/presentation/screens/task/view/pages/task_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CategoriesScreen extends HookWidget {
  static const routePath = "/CategoriesScreen";

  const CategoriesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final taskBloc = context.read<TaskBloc>().add(TaskEvent.loaded());
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emojiController = useTextEditingController();
    final titleController = useTextEditingController();
    final taskController = useTextEditingController();
    final isTaped = useState(true);

    void onTaped() {
      isTaped.value = !isTaped.value;
      emojiController.clear();
      titleController.clear();
      taskController.clear();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: Padding(
          padding: const EdgeInsets.all(6),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/porfile.png"),
            ),
          ),
        ),
        title: Row(
          children: [
            SizedBox(width: 65),
            Text(
              "Categories",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
      ),
      body: BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state.authFailureOrSuccessOption != null) {
            final errorMessage = state.authFailureOrSuccessOption!.maybeMap(
              generic: (f) => f.message,
              unexpected: (f) => f.error,
              orElse: () => 'Something went wrong',
              userNoteFound: (value) => "Invalid Email",
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF373F4A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    width: double.infinity,
                    height: 100,
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        CircleAvatar(
                          radius: 22,
                          backgroundImage:
                              AssetImage("assets/images/profile(2).png"),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '"The memory is a shield and life helper."',
                              style: TextStyle(
                                  fontFamily: "AlexBrush",
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Muhammed Dilshad N",
                              style: TextStyle(
                                  color: Color(0xff666A6D), fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      log(state.tasks.toString());
                      if (state.isSubmitting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: state.tasks.length,
                            itemBuilder: (context, index) {
                              final task = state.tasks[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TaskScreen(),
                                    ),
                                  );
                                },
                                child: Card(
                                  color: Color(0xFF373F4A),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          task.emoji,
                                          style: TextStyle(fontSize: 40),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          task.title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          '0 Tasks',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[400]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
            if (!isTaped.value)
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.1, sigmaY: 2.1),
                child: Center(
                  child: Container(
                    width: 300,
                    height: 330,
                    decoration: BoxDecoration(
                      color: const Color(0xFF373F4A),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 25, top: 5),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: emojiController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter the emoji";
                                }
                                if (value.length > 2) {
                                  return "Enter only one emoji";
                                }
                                return null;
                              },
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Title emoji ',
                                hintStyle: TextStyle(
                                    fontSize: 25,
                                    color: const Color.fromARGB(
                                        250, 118, 124, 131)),
                              ),
                            ),
                            TextFormField(
                              controller: titleController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter the title";
                                }
                                return null;
                              },
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Title',
                                hintStyle: TextStyle(
                                    fontSize: 25,
                                    color: const Color.fromARGB(
                                        250, 118, 124, 131)),
                              ),
                            ),
                            // TextFormField(
                            //   controller: taskController,
                            //   keyboardType: TextInputType.number,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "Enter how many tasks you want";
                            //     }
                            //     if (int.tryParse(value) == null) {
                            //       return "Enter only number";
                            //     }
                            //     return null;
                            //   },
                            //   style:
                            //       TextStyle(fontSize: 25, color: Colors.white),
                            //   decoration: InputDecoration(
                            //     border: InputBorder.none,
                            //     hintText: 'Task',
                            //     hintStyle: TextStyle(
                            //         fontSize: 25,
                            //         color: const Color.fromARGB(
                            //             250, 118, 124, 131)),
                            //   ),
                            // ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      context.read<TaskBloc>().add(
                                            TaskEvent.addTask(
                                              emoji: emojiController.text,
                                              title: titleController.text,
                                              taskNo: taskController.text,
                                            ),
                                          );
                                      onTaped();
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 139, 171, 216),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    width: 50,
                                    height: 30,
                                    child: Text("save"),
                                  ),
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    SizedBox(height: 53),
                                    IconButton(
                                      onPressed: () {
                                        onTaped();
                                      },
                                      icon: Icon(Icons.close_rounded),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onTaped,
        child: Icon(Icons.add),
      ),
    );
  }
}
