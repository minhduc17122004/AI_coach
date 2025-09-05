import 'package:hive/hive.dart';
import '../dtos/progress_snapshot_dto.dart';

part 'progress_snapshot_hive_adapter.g.dart';

@HiveType(typeId: 4)
class ProgressSnapshotHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String goalId;

  @HiveField(2)
  final String date;

  @HiveField(3)
  final int doneTasks;

  @HiveField(4)
  final int totalTasks;

  @HiveField(5)
  final int streak;

  @HiveField(6)
  final String createdAt;

  @HiveField(7)
  final bool isDeleted;

  ProgressSnapshotHiveModel({
    required this.id,
    required this.goalId,
    required this.date,
    required this.doneTasks,
    required this.totalTasks,
    required this.streak,
    required this.createdAt,
    required this.isDeleted,
  });

  /// Convert from DTO
  factory ProgressSnapshotHiveModel.fromDto(ProgressSnapshotDto dto) =>
      ProgressSnapshotHiveModel(
        id: dto.id,
        goalId: dto.goalId,
        date: dto.date,
        doneTasks: dto.doneTasks,
        totalTasks: dto.totalTasks,
        streak: dto.streak,
        createdAt: dto.createdAt,
        isDeleted: dto.isDeleted,
      );

  /// Convert to DTO
  ProgressSnapshotDto toDto() => ProgressSnapshotDto(
        id: id,
        goalId: goalId,
        date: date,
        doneTasks: doneTasks,
        totalTasks: totalTasks,
        streak: streak,
        createdAt: createdAt,
        isDeleted: isDeleted,
      );
}
