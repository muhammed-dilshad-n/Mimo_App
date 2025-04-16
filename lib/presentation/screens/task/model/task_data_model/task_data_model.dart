import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_data_model.g.dart';
part 'task_data_model.freezed.dart';

@freezed
class TaskDataModel with _$TaskDataModel {
  const factory TaskDataModel({
    @Default("") String id,
    @Default("") String title,
    @Default(false) bool completed,
  }) = _TaskDataModel;
  factory TaskDataModel.fromJson(Map<String, dynamic> json) =>
      _$TaskDataModelFromJson(json);
}
