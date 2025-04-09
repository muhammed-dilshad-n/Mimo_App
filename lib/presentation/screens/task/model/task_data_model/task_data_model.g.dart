// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskDataModelImpl _$$TaskDataModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskDataModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$TaskDataModelImplToJson(_$TaskDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
