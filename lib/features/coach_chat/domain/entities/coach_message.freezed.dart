// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoachMessage {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  MessageRole get role => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  MessageMetadata? get metadata => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CoachMessageCopyWith<CoachMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoachMessageCopyWith<$Res> {
  factory $CoachMessageCopyWith(
          CoachMessage value, $Res Function(CoachMessage) then) =
      _$CoachMessageCopyWithImpl<$Res, CoachMessage>;
  @useResult
  $Res call(
      {String id,
      String userId,
      MessageRole role,
      String content,
      DateTime createdAt,
      MessageMetadata? metadata,
      bool isDeleted});

  $MessageMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$CoachMessageCopyWithImpl<$Res, $Val extends CoachMessage>
    implements $CoachMessageCopyWith<$Res> {
  _$CoachMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? role = null,
    Object? content = null,
    Object? createdAt = null,
    Object? metadata = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MessageMetadata?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $MessageMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoachMessageImplCopyWith<$Res>
    implements $CoachMessageCopyWith<$Res> {
  factory _$$CoachMessageImplCopyWith(
          _$CoachMessageImpl value, $Res Function(_$CoachMessageImpl) then) =
      __$$CoachMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      MessageRole role,
      String content,
      DateTime createdAt,
      MessageMetadata? metadata,
      bool isDeleted});

  @override
  $MessageMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$CoachMessageImplCopyWithImpl<$Res>
    extends _$CoachMessageCopyWithImpl<$Res, _$CoachMessageImpl>
    implements _$$CoachMessageImplCopyWith<$Res> {
  __$$CoachMessageImplCopyWithImpl(
      _$CoachMessageImpl _value, $Res Function(_$CoachMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? role = null,
    Object? content = null,
    Object? createdAt = null,
    Object? metadata = freezed,
    Object? isDeleted = null,
  }) {
    return _then(_$CoachMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MessageRole,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as MessageMetadata?,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CoachMessageImpl extends _CoachMessage {
  const _$CoachMessageImpl(
      {required this.id,
      required this.userId,
      required this.role,
      required this.content,
      required this.createdAt,
      this.metadata,
      this.isDeleted = false})
      : super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final MessageRole role;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final MessageMetadata? metadata;
  @override
  @JsonKey()
  final bool isDeleted;

  @override
  String toString() {
    return 'CoachMessage(id: $id, userId: $userId, role: $role, content: $content, createdAt: $createdAt, metadata: $metadata, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoachMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, role, content, createdAt, metadata, isDeleted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoachMessageImplCopyWith<_$CoachMessageImpl> get copyWith =>
      __$$CoachMessageImplCopyWithImpl<_$CoachMessageImpl>(this, _$identity);
}

abstract class _CoachMessage extends CoachMessage {
  const factory _CoachMessage(
      {required final String id,
      required final String userId,
      required final MessageRole role,
      required final String content,
      required final DateTime createdAt,
      final MessageMetadata? metadata,
      final bool isDeleted}) = _$CoachMessageImpl;
  const _CoachMessage._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  MessageRole get role;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  MessageMetadata? get metadata;
  @override
  bool get isDeleted;
  @override
  @JsonKey(ignore: true)
  _$$CoachMessageImplCopyWith<_$CoachMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MessageMetadata {
  String? get action =>
      throw _privateConstructorUsedError; // e.g., "refine-plan", "explain-task", "unblock"
  String? get taskId => throw _privateConstructorUsedError;
  String? get goalId => throw _privateConstructorUsedError;
  Map<String, dynamic>? get additionalData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessageMetadataCopyWith<MessageMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageMetadataCopyWith<$Res> {
  factory $MessageMetadataCopyWith(
          MessageMetadata value, $Res Function(MessageMetadata) then) =
      _$MessageMetadataCopyWithImpl<$Res, MessageMetadata>;
  @useResult
  $Res call(
      {String? action,
      String? taskId,
      String? goalId,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class _$MessageMetadataCopyWithImpl<$Res, $Val extends MessageMetadata>
    implements $MessageMetadataCopyWith<$Res> {
  _$MessageMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? taskId = freezed,
    Object? goalId = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_value.copyWith(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      goalId: freezed == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageMetadataImplCopyWith<$Res>
    implements $MessageMetadataCopyWith<$Res> {
  factory _$$MessageMetadataImplCopyWith(_$MessageMetadataImpl value,
          $Res Function(_$MessageMetadataImpl) then) =
      __$$MessageMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? action,
      String? taskId,
      String? goalId,
      Map<String, dynamic>? additionalData});
}

/// @nodoc
class __$$MessageMetadataImplCopyWithImpl<$Res>
    extends _$MessageMetadataCopyWithImpl<$Res, _$MessageMetadataImpl>
    implements _$$MessageMetadataImplCopyWith<$Res> {
  __$$MessageMetadataImplCopyWithImpl(
      _$MessageMetadataImpl _value, $Res Function(_$MessageMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = freezed,
    Object? taskId = freezed,
    Object? goalId = freezed,
    Object? additionalData = freezed,
  }) {
    return _then(_$MessageMetadataImpl(
      action: freezed == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String?,
      taskId: freezed == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String?,
      goalId: freezed == goalId
          ? _value.goalId
          : goalId // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalData: freezed == additionalData
          ? _value._additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$MessageMetadataImpl extends _MessageMetadata {
  const _$MessageMetadataImpl(
      {this.action,
      this.taskId,
      this.goalId,
      final Map<String, dynamic>? additionalData})
      : _additionalData = additionalData,
        super._();

  @override
  final String? action;
// e.g., "refine-plan", "explain-task", "unblock"
  @override
  final String? taskId;
  @override
  final String? goalId;
  final Map<String, dynamic>? _additionalData;
  @override
  Map<String, dynamic>? get additionalData {
    final value = _additionalData;
    if (value == null) return null;
    if (_additionalData is EqualUnmodifiableMapView) return _additionalData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'MessageMetadata(action: $action, taskId: $taskId, goalId: $goalId, additionalData: $additionalData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageMetadataImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            const DeepCollectionEquality()
                .equals(other._additionalData, _additionalData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action, taskId, goalId,
      const DeepCollectionEquality().hash(_additionalData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageMetadataImplCopyWith<_$MessageMetadataImpl> get copyWith =>
      __$$MessageMetadataImplCopyWithImpl<_$MessageMetadataImpl>(
          this, _$identity);
}

abstract class _MessageMetadata extends MessageMetadata {
  const factory _MessageMetadata(
      {final String? action,
      final String? taskId,
      final String? goalId,
      final Map<String, dynamic>? additionalData}) = _$MessageMetadataImpl;
  const _MessageMetadata._() : super._();

  @override
  String? get action;
  @override // e.g., "refine-plan", "explain-task", "unblock"
  String? get taskId;
  @override
  String? get goalId;
  @override
  Map<String, dynamic>? get additionalData;
  @override
  @JsonKey(ignore: true)
  _$$MessageMetadataImplCopyWith<_$MessageMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
