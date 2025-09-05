// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoalDto _$GoalDtoFromJson(Map<String, dynamic> json) => GoalDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      categoryString: json['category'] as String,
      targetMetric: json['target_metric'] as String,
      startDate: json['start_date'] as String,
      targetDate: json['target_date'] as String,
      statusString: json['status'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      isDeleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$GoalDtoToJson(GoalDto instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'category': instance.categoryString,
      'target_metric': instance.targetMetric,
      'start_date': instance.startDate,
      'target_date': instance.targetDate,
      'status': instance.statusString,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'is_deleted': instance.isDeleted,
    };
