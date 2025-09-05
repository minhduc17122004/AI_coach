// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProgressSnapshot {
  String get id => throw _privateConstructorUsedError;
  String get goalId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get doneTasks => throw _privateConstructorUsedError;
  int get totalTasks => throw _privateConstructorUsedError;
  int get streak => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgressSnapshotCopyWith<ProgressSnapshot> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressSnapshotCopyWith<$Res> {
  factory $ProgressSnapshotCopyWith(
          ProgressSnapshot value, $Res Function(ProgressSnapshot) then) =
      _$ProgressSnapshotCopyWithImpl<$Res, ProgressSnapshot>;
  @useResult
  $Res call(
      {String id,
      String goalId,
      DateTime date,
      int doneTasks,
      int totalTasks,
      int streak,
      DateTime createdAt,
      bool isDeleted});
}

/// @nodoc
class _$ProgressSnapshotCopyWithImpl<$Res, $Val extends ProgressSnapshot>
    implements $ProgressSnapshotCopyWith<$Res> {
  _$ProgressSnapshotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? date = null,
    Object? doneTasks = null,
    Object? totalTasks = null,
    Object? streak = null,
    Object? createdAt = null,
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
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      doneTasks: null == doneTasks
          ? _value.doneTasks
          : doneTasks // ignore: cast_nullable_to_non_nullable
              as int,
      totalTasks: null == totalTasks
          ? _value.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressSnapshotImplCopyWith<$Res>
    implements $ProgressSnapshotCopyWith<$Res> {
  factory _$$ProgressSnapshotImplCopyWith(_$ProgressSnapshotImpl value,
          $Res Function(_$ProgressSnapshotImpl) then) =
      __$$ProgressSnapshotImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String goalId,
      DateTime date,
      int doneTasks,
      int totalTasks,
      int streak,
      DateTime createdAt,
      bool isDeleted});
}

/// @nodoc
class __$$ProgressSnapshotImplCopyWithImpl<$Res>
    extends _$ProgressSnapshotCopyWithImpl<$Res, _$ProgressSnapshotImpl>
    implements _$$ProgressSnapshotImplCopyWith<$Res> {
  __$$ProgressSnapshotImplCopyWithImpl(_$ProgressSnapshotImpl _value,
      $Res Function(_$ProgressSnapshotImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? goalId = null,
    Object? date = null,
    Object? doneTasks = null,
    Object? totalTasks = null,
    Object? streak = null,
    Object? createdAt = null,
    Object? isDeleted = null,
  }) {
    return _then(_$ProgressSnapshotImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      goalId: null == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      doneTasks: null == doneTasks
          ? _value.doneTasks
          : doneTasks // ignore: cast_nullable_to_non_nullable
              as int,
      totalTasks: null == totalTasks
          ? _value.totalTasks
          : totalTasks // ignore: cast_nullable_to_non_nullable
              as int,
      streak: null == streak
          ? _value.streak
          : streak // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProgressSnapshotImpl extends _ProgressSnapshot {
  const _$ProgressSnapshotImpl(
      {required this.id,
      required this.goalId,
      required this.date,
      required this.doneTasks,
      required this.totalTasks,
      required this.streak,
      required this.createdAt,
      this.isDeleted = false})
      : super._();

  @override
  final String id;
  @override
  final String goalId;
  @override
  final DateTime date;
  @override
  final int doneTasks;
  @override
  final int totalTasks;
  @override
  final int streak;
  @override
  final DateTime createdAt;
  @override
  @JsonKey()
  final bool isDeleted;

  @override
  String toString() {
    return 'ProgressSnapshot(id: $id, goalId: $goalId, date: $date, doneTasks: $doneTasks, totalTasks: $totalTasks, streak: $streak, createdAt: $createdAt, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressSnapshotImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.doneTasks, doneTasks) ||
                other.doneTasks == doneTasks) &&
            (identical(other.totalTasks, totalTasks) ||
                other.totalTasks == totalTasks) &&
            (identical(other.streak, streak) || other.streak == streak) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, goalId, date, doneTasks,
      totalTasks, streak, createdAt, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressSnapshotImplCopyWith<_$ProgressSnapshotImpl> get copyWith =>
      __$$ProgressSnapshotImplCopyWithImpl<_$ProgressSnapshotImpl>(
          this, _$identity);
}

abstract class _ProgressSnapshot extends ProgressSnapshot {
  const factory _ProgressSnapshot(
      {required final String id,
      required final String goalId,
      required final DateTime date,
      required final int doneTasks,
      required final int totalTasks,
      required final int streak,
      required final DateTime createdAt,
      final bool isDeleted}) = _$ProgressSnapshotImpl;
  const _ProgressSnapshot._() : super._();

  @override
  String get id;
  @override
  String get goalId;
  @override
  DateTime get date;
  @override
  int get doneTasks;
  @override
  int get totalTasks;
  @override
  int get streak;
  @override
  DateTime get createdAt;
  @override
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$ProgressSnapshotImplCopyWith<_$ProgressSnapshotImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
