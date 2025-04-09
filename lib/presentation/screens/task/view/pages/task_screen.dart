import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/task/model/task_data_model/task_data_model.dart';

class TaskScreen extends StatefulWidget {
  static const routePath = "/TaskScreen";

  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController taskController = TextEditingController();
  bool value = false;
  final List<TaskDataModel> notification = []; // Ensure proper initialization
  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          leading: Padding(
            padding: const EdgeInsets.all(6),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_sharp),
            ),
          ),
          title: Row(
            children: [
              SizedBox(width: 65),
              Text(
                "Task",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: notification.map((e) => singleCheckbox(e)).toList(),
            ),
            Align(
              alignment:
                  Alignment.bottomRight, // Align to the bottom-right corner
              child: Padding(
                padding: const EdgeInsets.all(
                    16.0), // Add padding for better visibility
                child: FloatingActionButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Form(
                          key: formKey,
                          child: AlertDialog(
                            title: Text("Add Task"),
                            content: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Task";
                                }
                                return null;
                              },
                              controller: taskController,
                              decoration:
                                  InputDecoration(hintText: "Enter Task"),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (!formKey.currentState!.validate()) {
                                    return;
                                  }
                                  setState(() {
                                    notification.add(TaskDataModel(
                                      id: DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                      title: taskController.text,
                                      completed: false,
                                    ));
                                  });
                                  Navigator.pop(context);
                                  taskController.clear();
                                },
                                child: Text("Add",
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ],
        ));
  }

  CheckboxListTile singleCheckbox(TaskDataModel checkbox) {
    return CheckboxListTile(
      side: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
      checkColor: Colors.white,
      activeColor: Colors.greenAccent,
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(checkbox.title),
      value: checkbox.completed,
      secondary: IconButton(
          onPressed: () {
            setState(() {
              notification.remove(checkbox);
            });
          },
          icon: Icon(Icons.delete)),
      onChanged: (val) {
        setState(() {
          final index = notification.indexOf(checkbox);
          notification[index] = checkbox.copyWith(completed: val!);
        });
      },
    );
  }
}
