// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDto _$TaskDtoFromJson(Map<String, dynamic> json) => TaskDto(
      id: json['id'] as String,
      goalId: json['goal_id'] as String,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      estimatedMinutes: (json['estimated_minutes'] as num).toInt(),
      statusString: json['status'] as String,
      completionNote: json['completion_note'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      isDeleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$TaskDtoToJson(TaskDto instance) => <String, dynamic>{
      'id': instance.id,
      'goal_id': instance.goalId,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'estimated_minutes': instance.estimatedMinutes,
      'status': instance.statusString,
      'completion_note': instance.completionNote,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
    };
