import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/task/widget/checkbox_widget.dart';

class TaskScreen extends StatefulWidget {
  static const routePath = "/TaskScreen";

  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final notification = [
    CheckboxState(title: "Walking"),
    CheckboxState(title: "Runing"),
    CheckboxState(title: "Jumping"),
    CheckboxState(title: "10 pushup"),
  ];

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
              child: Icon(Icons.arrow_back_sharp)),
        ),
        title: Row(
          children: [
            SizedBox(
              width: 65,
            ),
            Text(
              "Task",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
      ),
      body: Column(
        children: [
          ...notification.map((e) => singleCheckbox(e)),
        ],
      ),
    );
  }

  CheckboxListTile singleCheckbox(CheckboxState checkbox) {
    return CheckboxListTile(
        side: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
        checkColor: Colors.white,
        activeColor: Colors.greenAccent,
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(checkbox.title),
        value: checkbox.value,
        onChanged: (val) => setState(() {
              checkbox.value = val!;
            }));
  }
}
