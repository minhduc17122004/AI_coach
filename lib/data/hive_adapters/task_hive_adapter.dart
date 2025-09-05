import 'package:hive/hive.dart';
import '../dtos/task_dto.dart';

part 'task_hive_adapter.g.dart';

@HiveType(typeId: 2)
class TaskHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String goalId;

  @HiveField(2)
  final String userId;

  @HiveField(3)
  final String title;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String date;

  @HiveField(6)
  final int estimatedMinutes;

  @HiveField(7)
  final String statusString;

  @HiveField(8)
  final String? completionNote;

  @HiveField(9)
  final String createdAt;

  @HiveField(10)
  final String updatedAt;

  @HiveField(11)
  final bool isDeleted;

  TaskHiveModel({
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

  /// Convert from DTO
  factory TaskHiveModel.fromDto(TaskDto dto) => TaskHiveModel(
        id: dto.id,
        goalId: dto.goalId,
        userId: dto.userId,
        title: dto.title,
        description: dto.description,
        date: dto.date,
        estimatedMinutes: dto.estimatedMinutes,
        statusString: dto.statusString,
        completionNote: dto.completionNote,
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt,
        isDeleted: dto.isDeleted,
      );

  /// Convert to DTO
  TaskDto toDto() => TaskDto(
        id: id,
        goalId: goalId,
        userId: userId,
        title: title,
        description: description,
        date: date,
        estimatedMinutes: estimatedMinutes,
        statusString: statusString,
        completionNote: completionNote,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isDeleted: isDeleted,
      );
}
