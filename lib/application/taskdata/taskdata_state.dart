part of 'taskdata_bloc.dart';

@freezed
class TaskDataState with _$TaskDataState {
  const factory TaskDataState({
    @Default(false) bool isSubmitting,
    @Default([]) List<TaskDataModel> taskData,
    @Default(null) AuthFailure? authFailureOrSuccessOption,
  }) = _TaskDataState;
}
