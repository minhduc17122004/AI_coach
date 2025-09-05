// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_snapshot_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressSnapshotDto _$ProgressSnapshotDtoFromJson(Map<String, dynamic> json) =>
    ProgressSnapshotDto(
      id: json['id'] as String,
      goalId: json['goal_id'] as String,
      date: json['date'] as String,
      doneTasks: (json['done_tasks'] as num).toInt(),
      totalTasks: (json['total_tasks'] as num).toInt(),
      streak: (json['streak'] as num).toInt(),
      createdAt: json['created_at'] as String,
      isDeleted: json['is_deleted'] as bool,
    );

Map<String, dynamic> _$ProgressSnapshotDtoToJson(
        ProgressSnapshotDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'goal_id': instance.goalId,
      'date': instance.date,
      'done_tasks': instance.doneTasks,
      'total_tasks': instance.totalTasks,
      'streak': instance.streak,
      'created_at': instance.createdAt,
      'is_deleted': instance.isDeleted,
    };
