part of 'taskdata_bloc.dart';

@freezed
class TaskdataEvent with _$TaskdataEvent {
  const factory TaskdataEvent.addTaskData({
    required TaskDataModel taskDataModel,
  }) = _AddTaskData;
  const factory TaskdataEvent.taskDataLoaded() = _TaskDataLoaded;
}
