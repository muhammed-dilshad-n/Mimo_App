import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/application/taskdata/taskdata_bloc.dart';
import 'package:flutter_application_1/presentation/screens/task/model/task_data_model/task_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    BlocProvider.of<TaskDataBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TaskDataBloc todoBloc = BlocProvider.of<TaskDataBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore'),
      ),
      body: BlocBuilder<TaskDataBloc, TaskDataState>(
        builder: (context, state) {
          if (state.isSubmitting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!state.isSubmitting) {
            final todos = state.taskData;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {
                      final updatedTodo = todo.copyWith(completed: value!);
                      // todoBloc.add(UpdateTodo(updatedTodo));
                    },
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // todoBloc.add(DeleteTodo(todo.id));
                    },
                  ),
                );
              },
            );
          } else if (!state.isSubmitting) {
            todoBloc.add(const TaskdataEvent.taskDataLoaded()); // Reload todos
            return Container(); // Or display a success message
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTodoDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    final titleController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Todo'),
          content: TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: 'Todo title'),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                context.read<TaskDataBloc>().add(
                      TaskdataEvent.addTaskData(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: titleController.text,
                        isCompleted: false,
                      ),
                    );

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
