// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskDataModel _$TaskDataModelFromJson(Map<String, dynamic> json) {
  return _TaskDataModel.fromJson(json);
}

/// @nodoc
mixin _$TaskDataModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  /// Serializes this TaskDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskDataModelCopyWith<TaskDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDataModelCopyWith<$Res> {
  factory $TaskDataModelCopyWith(
          TaskDataModel value, $Res Function(TaskDataModel) then) =
      _$TaskDataModelCopyWithImpl<$Res, TaskDataModel>;
  @useResult
  $Res call({String id, String title, bool completed});
}

/// @nodoc
class _$TaskDataModelCopyWithImpl<$Res, $Val extends TaskDataModel>
    implements $TaskDataModelCopyWith<$Res> {
  _$TaskDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskDataModelImplCopyWith<$Res>
    implements $TaskDataModelCopyWith<$Res> {
  factory _$$TaskDataModelImplCopyWith(
          _$TaskDataModelImpl value, $Res Function(_$TaskDataModelImpl) then) =
      __$$TaskDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, bool completed});
}

/// @nodoc
class __$$TaskDataModelImplCopyWithImpl<$Res>
    extends _$TaskDataModelCopyWithImpl<$Res, _$TaskDataModelImpl>
    implements _$$TaskDataModelImplCopyWith<$Res> {
  __$$TaskDataModelImplCopyWithImpl(
      _$TaskDataModelImpl _value, $Res Function(_$TaskDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? completed = null,
  }) {
    return _then(_$TaskDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      completed: null == completed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskDataModelImpl implements _TaskDataModel {
  const _$TaskDataModelImpl(
      {this.id = "", this.title = "", this.completed = false});

  factory _$TaskDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskDataModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final bool completed;

  @override
  String toString() {
    return 'TaskDataModel(id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, completed);

  /// Create a copy of TaskDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDataModelImplCopyWith<_$TaskDataModelImpl> get copyWith =>
      __$$TaskDataModelImplCopyWithImpl<_$TaskDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskDataModelImplToJson(
      this,
    );
  }
}

abstract class _TaskDataModel implements TaskDataModel {
  const factory _TaskDataModel(
      {final String id,
      final String title,
      final bool completed}) = _$TaskDataModelImpl;

  factory _TaskDataModel.fromJson(Map<String, dynamic> json) =
      _$TaskDataModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  bool get completed;

  /// Create a copy of TaskDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDataModelImplCopyWith<_$TaskDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
