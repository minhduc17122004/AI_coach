// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Task {
  String get id => throw _privateConstructorUsedError;
  String get goalId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get date =>
      throw _privateConstructorUsedError; // Date for this task (yyyy-MM-dd)
  int get estimatedMinutes => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;
  String? get completionNote => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String id,
      String goalId,
      String userId,
      String title,
      String description,
      DateTime date,
      int estimatedMinutes,
      TaskStatus status,
      String? completionNote,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDeleted});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? estimatedMinutes = null,
    Object? status = null,
    Object? completionNote = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedMinutes: null == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      completionNote: freezed == completionNote
          ? _value.completionNote
          : completionNote // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskImplCopyWith(
          _$TaskImpl value, $Res Function(_$TaskImpl) then) =
      __$$TaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String goalId,
      String userId,
      String title,
      String description,
      DateTime date,
      int estimatedMinutes,
      TaskStatus status,
      String? completionNote,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDeleted});
}

/// @nodoc
class __$$TaskImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskImpl>
    implements _$$TaskImplCopyWith<$Res> {
  __$$TaskImplCopyWithImpl(_$TaskImpl _value, $Res Function(_$TaskImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? userId = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? estimatedMinutes = null,
    Object? status = null,
    Object? completionNote = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
  }) {
    return _then(_$TaskImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      estimatedMinutes: null == estimatedMinutes
          ? _value.estimatedMinutes
          : estimatedMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      completionNote: freezed == completionNote
          ? _value.completionNote
          : completionNote // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TaskImpl extends _Task {
  const _$TaskImpl(
      {required this.id,
      required this.goalId,
      required this.userId,
      required this.title,
      required this.description,
      required this.date,
      required this.estimatedMinutes,
      required this.status,
      this.completionNote,
      required this.createdAt,
      required this.updatedAt,
      this.isDeleted = false})
      : super._();

  @override
  final String id;
  @override
  final String goalId;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime date;
// Date for this task (yyyy-MM-dd)
  @override
  final int estimatedMinutes;
  @override
  final TaskStatus status;
  @override
  final String? completionNote;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isDeleted;

  @override
  String toString() {
    return 'Task(id: $id, goalId: $goalId, userId: $userId, title: $title, description: $description, date: $date, estimatedMinutes: $estimatedMinutes, status: $status, completionNote: $completionNote, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.estimatedMinutes, estimatedMinutes) ||
                other.estimatedMinutes == estimatedMinutes) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.completionNote, completionNote) ||
                other.completionNote == completionNote) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      goalId,
      userId,
      title,
      description,
      date,
      estimatedMinutes,
      status,
      completionNote,
      createdAt,
      updatedAt,
      isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      __$$TaskImplCopyWithImpl<_$TaskImpl>(this, _$identity);
}

abstract class _Task extends Task {
  const factory _Task(
      {required final String id,
      required final String goalId,
      required final String userId,
      required final String title,
      required final String description,
      required final DateTime date,
      required final int estimatedMinutes,
      required final TaskStatus status,
      final String? completionNote,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDeleted}) = _$TaskImpl;
  const _Task._() : super._();

  @override
  String get id;
  @override
  String get goalId;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get date;
  @override // Date for this task (yyyy-MM-dd)
  int get estimatedMinutes;
  @override
  TaskStatus get status;
  @override
  String? get completionNote;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$TaskImplCopyWith<_$TaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
