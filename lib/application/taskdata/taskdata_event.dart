part of 'taskdata_bloc.dart';

@freezed
class TaskdataEvent with _$TaskdataEvent {
  const factory TaskdataEvent.addTaskData({
    required String id,
    required String title,
    required bool isCompleted,
  }) = _AddTaskData;
  const factory TaskdataEvent.taskDataLoaded() = _TaskDataLoaded;
}
