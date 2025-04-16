// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String location, String bio) getUser,
    required TResult Function() loadedUser,
    required TResult Function(
            String name, String location, String bio, Uint8List? imageBytes)
        updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String location, String bio)? getUser,
    TResult? Function()? loadedUser,
    TResult? Function(
            String name, String location, String bio, Uint8List? imageBytes)?
        updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String location, String bio)? getUser,
    TResult Function()? loadedUser,
    TResult Function(
            String name, String location, String bio, Uint8List? imageBytes)?
        updateUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_LoadedUser value) loadedUser,
    required TResult Function(_UpdateUser value) updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_LoadedUser value)? loadedUser,
    TResult? Function(_UpdateUser value)? updateUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_LoadedUser value)? loadedUser,
    TResult Function(_UpdateUser value)? updateUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetUserImplCopyWith<$Res> {
  factory _$$GetUserImplCopyWith(
          _$GetUserImpl value, $Res Function(_$GetUserImpl) then) =
      __$$GetUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String location, String bio});
}

/// @nodoc
class __$$GetUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetUserImpl>
    implements _$$GetUserImplCopyWith<$Res> {
  __$$GetUserImplCopyWithImpl(
      _$GetUserImpl _value, $Res Function(_$GetUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? location = null,
    Object? bio = null,
  }) {
    return _then(_$GetUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserImpl implements _GetUser {
  const _$GetUserImpl(
      {required this.name, required this.location, required this.bio});

  @override
  final String name;
  @override
  final String location;
  @override
  final String bio;

  @override
  String toString() {
    return 'UserEvent.getUser(name: $name, location: $location, bio: $bio)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.bio, bio) || other.bio == bio));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, location, bio);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserImplCopyWith<_$GetUserImpl> get copyWith =>
      __$$GetUserImplCopyWithImpl<_$GetUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String location, String bio) getUser,
    required TResult Function() loadedUser,
    required TResult Function(
            String name, String location, String bio, Uint8List? imageBytes)
        updateUser,
  }) {
    return getUser(name, location, bio);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String location, String bio)? getUser,
    TResult? Function()? loadedUser,
    TResult? Function(
            String name, String location, String bio, Uint8List? imageBytes)?
        updateUser,
  }) {
    return getUser?.call(name, location, bio);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String location, String bio)? getUser,
    TResult Function()? loadedUser,
    TResult Function(
            String name, String location, String bio, Uint8List? imageBytes)?
        updateUser,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(name, location, bio);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_LoadedUser value) loadedUser,
    required TResult Function(_UpdateUser value) updateUser,
  }) {
    return getUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_LoadedUser value)? loadedUser,
    TResult? Function(_UpdateUser value)? updateUser,
  }) {
    return getUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_LoadedUser value)? loadedUser,
    TResult Function(_UpdateUser value)? updateUser,
    required TResult orElse(),
  }) {
    if (getUser != null) {
      return getUser(this);
    }
    return orElse();
  }
}

abstract class _GetUser implements UserEvent {
  const factory _GetUser(
      {required final String name,
      required final String location,
      required final String bio}) = _$GetUserImpl;

  String get name;
  String get location;
  String get bio;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetUserImplCopyWith<_$GetUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedUserImplCopyWith<$Res> {
  factory _$$LoadedUserImplCopyWith(
          _$LoadedUserImpl value, $Res Function(_$LoadedUserImpl) then) =
      __$$LoadedUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadedUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$LoadedUserImpl>
    implements _$$LoadedUserImplCopyWith<$Res> {
  __$$LoadedUserImplCopyWithImpl(
      _$LoadedUserImpl _value, $Res Function(_$LoadedUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadedUserImpl implements _LoadedUser {
  const _$LoadedUserImpl();

  @override
  String toString() {
    return 'UserEvent.loadedUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadedUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String location, String bio) getUser,
    required TResult Function() loadedUser,
    required TResult Function(
            String name, String location, String bio, Uint8List? imageBytes)
        updateUser,
  }) {
    return loadedUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String location, String bio)? getUser,
    TResult? Function()? loadedUser,
    TResult? Function(
            String name, String location, String bio, Uint8List? imageBytes)?
        updateUser,
  }) {
    return loadedUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String location, String bio)? getUser,
    TResult Function()? loadedUser,
    TResult Function(
            String name, String location, String bio, Uint8List? imageBytes)?
        updateUser,
    required TResult orElse(),
  }) {
    if (loadedUser != null) {
      return loadedUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_LoadedUser value) loadedUser,
    required TResult Function(_UpdateUser value) updateUser,
  }) {
    return loadedUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_LoadedUser value)? loadedUser,
    TResult? Function(_UpdateUser value)? updateUser,
  }) {
    return loadedUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_LoadedUser value)? loadedUser,
    TResult Function(_UpdateUser value)? updateUser,
    required TResult orElse(),
  }) {
    if (loadedUser != null) {
      return loadedUser(this);
    }
    return orElse();
  }
}

abstract class _LoadedUser implements UserEvent {
  const factory _LoadedUser() = _$LoadedUserImpl;
}

/// @nodoc
abstract class _$$UpdateUserImplCopyWith<$Res> {
  factory _$$UpdateUserImplCopyWith(
          _$UpdateUserImpl value, $Res Function(_$UpdateUserImpl) then) =
      __$$UpdateUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, String location, String bio, Uint8List? imageBytes});
}

/// @nodoc
class __$$UpdateUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UpdateUserImpl>
    implements _$$UpdateUserImplCopyWith<$Res> {
  __$$UpdateUserImplCopyWithImpl(
      _$UpdateUserImpl _value, $Res Function(_$UpdateUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? location = null,
    Object? bio = null,
    Object? imageBytes = freezed,
  }) {
    return _then(_$UpdateUserImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      imageBytes: freezed == imageBytes
          ? _value.imageBytes
          : imageBytes // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$UpdateUserImpl implements _UpdateUser {
  const _$UpdateUserImpl(
      {required this.name,
      required this.location,
      required this.bio,
      this.imageBytes});

  @override
  final String name;
  @override
  final String location;
  @override
  final String bio;
  @override
  final Uint8List? imageBytes;

  @override
  String toString() {
    return 'UserEvent.updateUser(name: $name, location: $location, bio: $bio, imageBytes: $imageBytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            const DeepCollectionEquality()
                .equals(other.imageBytes, imageBytes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, location, bio,
      const DeepCollectionEquality().hash(imageBytes));

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      __$$UpdateUserImplCopyWithImpl<_$UpdateUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String name, String location, String bio) getUser,
    required TResult Function() loadedUser,
    required TResult Function(
            String name, String location, String bio, Uint8List? imageBytes)
        updateUser,
  }) {
    return updateUser(name, location, bio, imageBytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String name, String location, String bio)? getUser,
    TResult? Function()? loadedUser,
    TResult? Function(
            String name, String location, String bio, Uint8List? imageBytes)?
        updateUser,
  }) {
    return updateUser?.call(name, location, bio, imageBytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String name, String location, String bio)? getUser,
    TResult Function()? loadedUser,
    TResult Function(
            String name, String location, String bio, Uint8List? imageBytes)?
        updateUser,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(name, location, bio, imageBytes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUser value) getUser,
    required TResult Function(_LoadedUser value) loadedUser,
    required TResult Function(_UpdateUser value) updateUser,
  }) {
    return updateUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUser value)? getUser,
    TResult? Function(_LoadedUser value)? loadedUser,
    TResult? Function(_UpdateUser value)? updateUser,
  }) {
    return updateUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUser value)? getUser,
    TResult Function(_LoadedUser value)? loadedUser,
    TResult Function(_UpdateUser value)? updateUser,
    required TResult orElse(),
  }) {
    if (updateUser != null) {
      return updateUser(this);
    }
    return orElse();
  }
}

abstract class _UpdateUser implements UserEvent {
  const factory _UpdateUser(
      {required final String name,
      required final String location,
      required final String bio,
      final Uint8List? imageBytes}) = _$UpdateUserImpl;

  String get name;
  String get location;
  String get bio;
  Uint8List? get imageBytes;

  /// Create a copy of UserEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateUserImplCopyWith<_$UpdateUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserState {
  bool get isSubmitting => throw _privateConstructorUsedError;
  UserModel? get currentUser => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>>? get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call(
      {bool isSubmitting,
      UserModel? currentUser,
      Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption});

  $UserModelCopyWith<$Res>? get currentUser;
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? currentUser = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      authFailureOrSuccessOption: freezed == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>?,
    ) as $Val);
  }

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get currentUser {
    if (_value.currentUser == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.currentUser!, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSubmitting,
      UserModel? currentUser,
      Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption});

  @override
  $UserModelCopyWith<$Res>? get currentUser;
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSubmitting = null,
    Object? currentUser = freezed,
    Object? authFailureOrSuccessOption = freezed,
  }) {
    return _then(_$UserStateImpl(
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUser: freezed == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      authFailureOrSuccessOption: freezed == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>?,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.isSubmitting = false,
      this.currentUser,
      this.authFailureOrSuccessOption});

  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final UserModel? currentUser;
  @override
  final Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption;

  @override
  String toString() {
    return 'UserState(isSubmitting: $isSubmitting, currentUser: $currentUser, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isSubmitting, currentUser, authFailureOrSuccessOption);

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {final bool isSubmitting,
      final UserModel? currentUser,
      final Option<Either<AuthFailure, Unit>>?
          authFailureOrSuccessOption}) = _$UserStateImpl;

  @override
  bool get isSubmitting;
  @override
  UserModel? get currentUser;
  @override
  Option<Either<AuthFailure, Unit>>? get authFailureOrSuccessOption;

  /// Create a copy of UserState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
