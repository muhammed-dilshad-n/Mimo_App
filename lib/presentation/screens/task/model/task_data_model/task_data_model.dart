import 'package:freezed_annotation/freezed_annotation.dart';
part 'task_data_model.freezed.dart';
part 'task_data_model.g.dart';

@freezed
class TaskDataModel with _$TaskDataModel {
  const factory TaskDataModel({
    @Default("") required String id,
    @Default("") required String title,
    @Default(false) required bool completed,
  }) = _TaskDataModel;
  factory TaskDataModel.fromJson(Map<String, dynamic> json) =>
      _$TaskDataModelFromJson(json);
}
