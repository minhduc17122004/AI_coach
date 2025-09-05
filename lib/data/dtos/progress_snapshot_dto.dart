import 'package:json_annotation/json_annotation.dart';
import '../../features/plan/domain/entities/progress_snapshot.dart';

part 'progress_snapshot_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ProgressSnapshotDto {
  final String id;
  final String goalId;
  final String date; // ISO8601 date string (yyyy-MM-dd)
  final int doneTasks;
  final int totalTasks;
  final int streak;
  final String createdAt;
  final bool isDeleted;

  const ProgressSnapshotDto({
    required this.id,
    required this.goalId,
    required this.date,
    required this.doneTasks,
    required this.totalTasks,
    required this.streak,
    required this.createdAt,
    required this.isDeleted,
  });

  factory ProgressSnapshotDto.fromJson(Map<String, dynamic> json) =>
      _$ProgressSnapshotDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProgressSnapshotDtoToJson(this);

  /// Convert DTO to Domain Entity
  ProgressSnapshot toEntity() => ProgressSnapshot(
        id: id,
        goalId: goalId,
        date: DateTime.parse(date),
        doneTasks: doneTasks,
        totalTasks: totalTasks,
        streak: streak,
        createdAt: DateTime.parse(createdAt),
        isDeleted: isDeleted,
      );

  /// Create DTO from Domain Entity
  factory ProgressSnapshotDto.fromEntity(ProgressSnapshot snapshot) =>
      ProgressSnapshotDto(
        id: snapshot.id,
        goalId: snapshot.goalId,
        date: snapshot.dateString,
        doneTasks: snapshot.doneTasks,
        totalTasks: snapshot.totalTasks,
        streak: snapshot.streak,
        createdAt: snapshot.createdAt.toIso8601String(),
        isDeleted: snapshot.isDeleted,
      );

  /// Create DTO for Firestore
  Map<String, dynamic> toFirestore() => {
        'id': id,
        'goal_id': goalId,
        'date': date,
        'done_tasks': doneTasks,
        'total_tasks': totalTasks,
        'streak': streak,
        'created_at': createdAt,
        'is_deleted': isDeleted,
      };

  /// Create DTO from Firestore document
  factory ProgressSnapshotDto.fromFirestore(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return ProgressSnapshotDto(
      id: documentId,
      goalId: data['goal_id'] as String,
      date: data['date'] as String,
      doneTasks: data['done_tasks'] as int,
      totalTasks: data['total_tasks'] as int,
      streak: data['streak'] as int,
      createdAt: data['created_at'] as String,
      isDeleted: data['is_deleted'] as bool? ?? false,
    );
  }

  /// Calculate completion percentage (0.0 to 1.0)
  double get completionPercentage {
    if (totalTasks == 0) return 0.0;
    return doneTasks / totalTasks;
  }

  /// Get completion percentage as integer (0 to 100)
  int get completionPercentageInt => (completionPercentage * 100).round();

  /// Check if all tasks are completed
  bool get isFullyCompleted => totalTasks > 0 && doneTasks == totalTasks;
}
