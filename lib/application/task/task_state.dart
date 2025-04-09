part of 'task_bloc.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState({
    @Default([]) List<TaskModel> tasks,
    @Default(false) bool isSubmitting,
    @Default(null) AuthFailure? authFailureOrSuccessOption,
  }) = _TaskState;
}
