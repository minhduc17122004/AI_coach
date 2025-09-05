import 'package:json_annotation/json_annotation.dart';
import '../../features/tasks/domain/entities/task.dart';

part 'task_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TaskDto {
  final String id;
  final String goalId;
  final String userId;
  final String title;
  final String description;
  final String date; // ISO8601 date string (yyyy-MM-dd)
  final int estimatedMinutes;
  @JsonKey(name: 'status')
  final String statusString;
  final String? completionNote;
  final String createdAt;
  final String updatedAt;
  final bool isDeleted;

  const TaskDto({
    required this.id,
    required this.goalId,
    required this.userId,
    required this.title,
    required this.description,
    required this.date,
    required this.estimatedMinutes,
    required this.statusString,
    this.completionNote,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDtoToJson(this);

  /// Convert DTO to Domain Entity
  Task toEntity() => Task(
        id: id,
        goalId: goalId,
        userId: userId,
        title: title,
        description: description,
        date: DateTime.parse(date),
        estimatedMinutes: estimatedMinutes,
        status: _parseStatus(statusString),
        completionNote: completionNote,
        createdAt: DateTime.parse(createdAt),
        updatedAt: DateTime.parse(updatedAt),
        isDeleted: isDeleted,
      );

  /// Create DTO from Domain Entity
  factory TaskDto.fromEntity(Task task) => TaskDto(
        id: task.id,
        goalId: task.goalId,
        userId: task.userId,
        title: task.title,
        description: task.description,
        date: task.dateString,
        estimatedMinutes: task.estimatedMinutes,
        statusString: task.status.name,
        completionNote: task.completionNote,
        createdAt: task.createdAt.toIso8601String(),
        updatedAt: task.updatedAt.toIso8601String(),
        isDeleted: task.isDeleted,
      );

  /// Create DTO for Firestore
  Map<String, dynamic> toFirestore() => {
        'id': id,
        'goal_id': goalId,
        'user_id': userId,
        'title': title,
        'description': description,
        'date': date,
        'estimated_minutes': estimatedMinutes,
        'status': statusString,
        'completion_note': completionNote,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'is_deleted': isDeleted,
      };

  /// Create DTO from Firestore document
  factory TaskDto.fromFirestore(Map<String, dynamic> data, String documentId) {
    return TaskDto(
      id: documentId,
      goalId: data['goal_id'] as String,
      userId: data['user_id'] as String,
      title: data['title'] as String,
      description: data['description'] as String,
      date: data['date'] as String,
      estimatedMinutes: data['estimated_minutes'] as int,
      statusString: data['status'] as String,
      completionNote: data['completion_note'] as String?,
      createdAt: data['created_at'] as String,
      updatedAt: data['updated_at'] as String,
      isDeleted: data['is_deleted'] as bool? ?? false,
    );
  }

  /// Parse status string to enum
  TaskStatus _parseStatus(String status) {
    return TaskStatus.values.firstWhere(
      (e) => e.name == status,
      orElse: () => TaskStatus.todo,
    );
  }
}
