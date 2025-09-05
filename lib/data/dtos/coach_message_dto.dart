import 'package:json_annotation/json_annotation.dart';
import '../../features/coach_chat/domain/entities/coach_message.dart';

part 'coach_message_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CoachMessageDto {
  final String id;
  final String userId;
  @JsonKey(name: 'role')
  final String roleString;
  final String content;
  final String createdAt;
  final Map<String, dynamic>? metadata;
  final bool isDeleted;

  const CoachMessageDto({
    required this.id,
    required this.userId,
    required this.roleString,
    required this.content,
    required this.createdAt,
    this.metadata,
    required this.isDeleted,
  });

  factory CoachMessageDto.fromJson(Map<String, dynamic> json) => 
      _$CoachMessageDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CoachMessageDtoToJson(this);

  /// Convert DTO to Domain Entity
  CoachMessage toEntity() => CoachMessage(
        id: id,
        userId: userId,
        role: _parseRole(roleString),
        content: content,
        createdAt: DateTime.parse(createdAt),
        metadata: metadata != null ? _parseMetadata(metadata!) : null,
        isDeleted: isDeleted,
      );

  /// Create DTO from Domain Entity
  factory CoachMessageDto.fromEntity(CoachMessage message) => CoachMessageDto(
        id: message.id,
        userId: message.userId,
        roleString: message.role.name,
        content: message.content,
        createdAt: message.createdAt.toIso8601String(),
        metadata: message.metadata?.toJson(),
        isDeleted: message.isDeleted,
      );

  /// Create DTO for Firestore
  Map<String, dynamic> toFirestore() => {
        'id': id,
        'user_id': userId,
        'role': roleString,
        'content': content,
        'created_at': createdAt,
        'metadata': metadata,
        'is_deleted': isDeleted,
      };

  /// Create DTO from Firestore document
  factory CoachMessageDto.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return CoachMessageDto(
      id: documentId,
      userId: data['user_id'] as String,
      roleString: data['role'] as String,
      content: data['content'] as String,
      createdAt: data['created_at'] as String,
      metadata: data['metadata'] as Map<String, dynamic>?,
      isDeleted: data['is_deleted'] as bool? ?? false,
    );
  }

  /// Parse role string to enum
  MessageRole _parseRole(String role) {
    return MessageRole.values.firstWhere(
      (e) => e.name == role,
      orElse: () => MessageRole.user,
    );
  }

  /// Parse metadata map to MessageMetadata
  MessageMetadata? _parseMetadata(Map<String, dynamic> metadataMap) {
    return MessageMetadata(
      action: metadataMap['action'] as String?,
      taskId: metadataMap['task_id'] as String?,
      goalId: metadataMap['goal_id'] as String?,
      additionalData: metadataMap['additional_data'] as Map<String, dynamic>?,
    );
  }
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MessageMetadataDto {
  final String? action;
  final String? taskId;
  final String? goalId;
  final Map<String, dynamic>? additionalData;

  const MessageMetadataDto({
    this.action,
    this.taskId,
    this.goalId,
    this.additionalData,
  });

  factory MessageMetadataDto.fromJson(Map<String, dynamic> json) =>
      _$MessageMetadataDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MessageMetadataDtoToJson(this);

  /// Convert DTO to Domain Entity
  MessageMetadata toEntity() => MessageMetadata(
        action: action,
        taskId: taskId,
        goalId: goalId,
        additionalData: additionalData,
      );

  /// Create DTO from Domain Entity
  factory MessageMetadataDto.fromEntity(MessageMetadata metadata) =>
      MessageMetadataDto(
        action: metadata.action,
        taskId: metadata.taskId,
        goalId: metadata.goalId,
        additionalData: metadata.additionalData,
      );
}

extension MessageMetadataExtension on MessageMetadata {
  Map<String, dynamic> toJson() => MessageMetadataDto.fromEntity(this).toJson();
}
