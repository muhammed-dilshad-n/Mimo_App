// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingModelImpl _$$SettingModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingModelImpl(
      image: json['image'] as String?,
      name: json['name'] as String,
      location: json['location'] as String,
      bio: json['bio'] as String,
    );

Map<String, dynamic> _$$SettingModelImplToJson(_$SettingModelImpl instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'location': instance.location,
      'bio': instance.bio,
    };
