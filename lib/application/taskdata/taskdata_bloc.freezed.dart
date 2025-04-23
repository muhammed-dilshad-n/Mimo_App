// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taskdata_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskdataEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String title, bool isCompleted)
        addTaskData,
    required TResult Function() taskDataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String title, bool isCompleted)? addTaskData,
    TResult? Function()? taskDataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, bool isCompleted)? addTaskData,
    TResult Function()? taskDataLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTaskData value) addTaskData,
    required TResult Function(_TaskDataLoaded value) taskDataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddTaskData value)? addTaskData,
    TResult? Function(_TaskDataLoaded value)? taskDataLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTaskData value)? addTaskData,
    TResult Function(_TaskDataLoaded value)? taskDataLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskdataEventCopyWith<$Res> {
  factory $TaskdataEventCopyWith(
          TaskdataEvent value, $Res Function(TaskdataEvent) then) =
      _$TaskdataEventCopyWithImpl<$Res, TaskdataEvent>;
}

/// @nodoc
class _$TaskdataEventCopyWithImpl<$Res, $Val extends TaskdataEvent>
    implements $TaskdataEventCopyWith<$Res> {
  _$TaskdataEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskdataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddTaskDataImplCopyWith<$Res> {
  factory _$$AddTaskDataImplCopyWith(
          _$AddTaskDataImpl value, $Res Function(_$AddTaskDataImpl) then) =
      __$$AddTaskDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String title, bool isCompleted});
}

/// @nodoc
class __$$AddTaskDataImplCopyWithImpl<$Res>
    extends _$TaskdataEventCopyWithImpl<$Res, _$AddTaskDataImpl>
    implements _$$AddTaskDataImplCopyWith<$Res> {
  __$$AddTaskDataImplCopyWithImpl(
      _$AddTaskDataImpl _value, $Res Function(_$AddTaskDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? isCompleted = null,
  }) {
    return _then(_$AddTaskDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddTaskDataImpl implements _AddTaskData {
  const _$AddTaskDataImpl(
      {required this.id, required this.title, required this.isCompleted});

  @override
  final String id;
  @override
  final String title;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'TaskdataEvent.addTaskData(id: $id, title: $title, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTaskDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, isCompleted);

  /// Create a copy of TaskdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTaskDataImplCopyWith<_$AddTaskDataImpl> get copyWith =>
      __$$AddTaskDataImplCopyWithImpl<_$AddTaskDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String title, bool isCompleted)
        addTaskData,
    required TResult Function() taskDataLoaded,
  }) {
    return addTaskData(id, title, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String title, bool isCompleted)? addTaskData,
    TResult? Function()? taskDataLoaded,
  }) {
    return addTaskData?.call(id, title, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, bool isCompleted)? addTaskData,
    TResult Function()? taskDataLoaded,
    required TResult orElse(),
  }) {
    if (addTaskData != null) {
      return addTaskData(id, title, isCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTaskData value) addTaskData,
    required TResult Function(_TaskDataLoaded value) taskDataLoaded,
  }) {
    return addTaskData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddTaskData value)? addTaskData,
    TResult? Function(_TaskDataLoaded value)? taskDataLoaded,
  }) {
    return addTaskData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTaskData value)? addTaskData,
    TResult Function(_TaskDataLoaded value)? taskDataLoaded,
    required TResult orElse(),
  }) {
    if (addTaskData != null) {
      return addTaskData(this);
    }
    return orElse();
  }
}

abstract class _AddTaskData implements TaskdataEvent {
  const factory _AddTaskData(
      {required final String id,
      required final String title,
      required final bool isCompleted}) = _$AddTaskDataImpl;

  String get id;
  String get title;
  bool get isCompleted;

  /// Create a copy of TaskdataEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTaskDataImplCopyWith<_$AddTaskDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskDataLoadedImplCopyWith<$Res> {
  factory _$$TaskDataLoadedImplCopyWith(_$TaskDataLoadedImpl value,
          $Res Function(_$TaskDataLoadedImpl) then) =
      __$$TaskDataLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskDataLoadedImplCopyWithImpl<$Res>
    extends _$TaskdataEventCopyWithImpl<$Res, _$TaskDataLoadedImpl>
    implements _$$TaskDataLoadedImplCopyWith<$Res> {
  __$$TaskDataLoadedImplCopyWithImpl(
      _$TaskDataLoadedImpl _value, $Res Function(_$TaskDataLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskdataEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TaskDataLoadedImpl implements _TaskDataLoaded {
  const _$TaskDataLoadedImpl();

  @override
  String toString() {
    return 'TaskdataEvent.taskDataLoaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskDataLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String title, bool isCompleted)
        addTaskData,
    required TResult Function() taskDataLoaded,
  }) {
    return taskDataLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String title, bool isCompleted)? addTaskData,
    TResult? Function()? taskDataLoaded,
  }) {
    return taskDataLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, bool isCompleted)? addTaskData,
    TResult Function()? taskDataLoaded,
    required TResult orElse(),
  }) {
    if (taskDataLoaded != null) {
      return taskDataLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTaskData value) addTaskData,
    required TResult Function(_TaskDataLoaded value) taskDataLoaded,
  }) {
    return taskDataLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddTaskData value)? addTaskData,
    TResult? Function(_TaskDataLoaded value)? taskDataLoaded,
  }) {
    return taskDataLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTaskData value)? addTaskData,
    TResult Function(_TaskDataLoaded value)? taskDataLoaded,
    required TResult orElse(),
  }) {
    if (taskDataLoaded != null) {
      return taskDataLoaded(this);
    }
    return orElse();
  }
}

abstract class _TaskDataLoaded implements TaskdataEvent {
  const factory _TaskDataLoaded() = _$TaskDataLoadedImpl;
}

/// @nodoc
mixin _$TaskDataState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  List<TaskDataModel> get taskData => throw _privateConstructorUsedError;
  AuthFailure? get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of TaskDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskDataStateCopyWith<TaskDataState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDataStateCopyWith<$Res> {
  factory $TaskDataStateCopyWith(
          TaskDataState value, $Res Function(TaskDataState) then) =
      _$TaskDataStateCopyWithImpl<$Res, TaskDataState>;
  @useResult
  $Res call(
      {bool isSubmitting,
      List<TaskDataModel> taskData,
      AuthFailure? authFailureOrSuccessOption});

  $AuthFailureCopyWith<$Res>? get authFailureOrSuccessOption;
}

/// @nodoc
class _$TaskDataStateCopyWithImpl<$Res, $Val extends TaskDataState>
    implements $TaskDataStateCopyWith<$Res> {
  _$TaskDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? taskData = null,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      taskData: null == taskData
          ? _value.taskData
          : taskData // ignore: cast_nullable_to_non_nullable
              as List<TaskDataModel>,
      authFailureOrSuccessOption: freezed == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
    ) as $Val);
  }

  /// Create a copy of TaskDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthFailureCopyWith<$Res>? get authFailureOrSuccessOption {
    if (_value.authFailureOrSuccessOption == null) {
      return null;
    }

    return $AuthFailureCopyWith<$Res>(_value.authFailureOrSuccessOption!,
        (value) {
      return _then(_value.copyWith(authFailureOrSuccessOption: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskDataStateImplCopyWith<$Res>
    implements $TaskDataStateCopyWith<$Res> {
  factory _$$TaskDataStateImplCopyWith(
          _$TaskDataStateImpl value, $Res Function(_$TaskDataStateImpl) then) =
      __$$TaskDataStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting,
      List<TaskDataModel> taskData,
      AuthFailure? authFailureOrSuccessOption});

  @override
  $AuthFailureCopyWith<$Res>? get authFailureOrSuccessOption;
}

/// @nodoc
class __$$TaskDataStateImplCopyWithImpl<$Res>
    extends _$TaskDataStateCopyWithImpl<$Res, _$TaskDataStateImpl>
    implements _$$TaskDataStateImplCopyWith<$Res> {
  __$$TaskDataStateImplCopyWithImpl(
      _$TaskDataStateImpl _value, $Res Function(_$TaskDataStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? taskData = null,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$TaskDataStateImpl(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      taskData: null == taskData
          ? _value._taskData
          : taskData // ignore: cast_nullable_to_non_nullable
              as List<TaskDataModel>,
      authFailureOrSuccessOption: freezed == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as AuthFailure?,
    ));
  }
}

/// @nodoc

class _$TaskDataStateImpl implements _TaskDataState {
  const _$TaskDataStateImpl(
      {this.isSubmitting = false,
      final List<TaskDataModel> taskData = const [],
      this.authFailureOrSuccessOption = null})
      : _taskData = taskData;

  @override
  @JsonKey()
  final bool isSubmitting;
  final List<TaskDataModel> _taskData;
  @override
  @JsonKey()
  List<TaskDataModel> get taskData {
    if (_taskData is EqualUnmodifiableListView) return _taskData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskData);
  }

  @override
  @JsonKey()
  final AuthFailure? authFailureOrSuccessOption;

  @override
  String toString() {
    return 'TaskDataState(isSubmitting: $isSubmitting, taskData: $taskData, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDataStateImpl &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            const DeepCollectionEquality().equals(other._taskData, _taskData) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSubmitting,
      const DeepCollectionEquality().hash(_taskData),
      authFailureOrSuccessOption);

  /// Create a copy of TaskDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDataStateImplCopyWith<_$TaskDataStateImpl> get copyWith =>
      __$$TaskDataStateImplCopyWithImpl<_$TaskDataStateImpl>(this, _$identity);
}

abstract class _TaskDataState implements TaskDataState {
  const factory _TaskDataState(
      {final bool isSubmitting,
      final List<TaskDataModel> taskData,
      final AuthFailure? authFailureOrSuccessOption}) = _$TaskDataStateImpl;

  @override
  bool get isSubmitting;
  @override
  List<TaskDataModel> get taskData;
  @override
  AuthFailure? get authFailureOrSuccessOption;

  /// Create a copy of TaskDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskDataStateImplCopyWith<_$TaskDataStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
