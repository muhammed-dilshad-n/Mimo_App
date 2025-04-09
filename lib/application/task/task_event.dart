part of 'task_bloc.dart';

@freezed
class TaskEvent with _$TaskEvent {
  const factory TaskEvent.addTask({
    required String emoji,
    required String title,
    required String taskNo,
  }) = _AddTask;
  const factory TaskEvent.updateTask({
    required String docID,
    String? emoji,
    String? title,
    String? taskNo,
  }) = _UpdateTask;
  // const factory TaskEvent.deleteTask(Task task) = _DeleteTask;
  const factory TaskEvent.loaded() = _Loaded;
}
