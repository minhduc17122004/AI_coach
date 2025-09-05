// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachMessageDto _$CoachMessageDtoFromJson(Map<String, dynamic> json) =>
    CoachMessageDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      roleString: json['role'] as String,
      content: json['content'] as String,
      createdAt: json['created_at'] as String,
      metadata: json['metadata'] as Map<String, dynamic>?,
      isDeleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$CoachMessageDtoToJson(CoachMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'role': instance.roleString,
      'content': instance.content,
      'created_at': instance.createdAt,
      'metadata': instance.metadata,
      'is_deleted': instance.isDeleted,
    };

MessageMetadataDto _$MessageMetadataDtoFromJson(Map<String, dynamic> json) =>
    MessageMetadataDto(
      action: json['action'] as String?,
      taskId: json['task_id'] as String?,
      goalId: json['goal_id'] as String?,
      additionalData: json['additional_data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$MessageMetadataDtoToJson(MessageMetadataDto instance) =>
    <String, dynamic>{
      'action': instance.action,
      'task_id': instance.taskId,
      'goal_id': instance.goalId,
      'additional_data': instance.additionalData,
    };
