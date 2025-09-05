import 'package:hive/hive.dart';
import '../dtos/goal_dto.dart';

part 'goal_hive_adapter.g.dart';

@HiveType(typeId: 1)
class GoalHiveModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final String title;

  @HiveField(3)
  final String categoryString;

  @HiveField(4)
  final String targetMetric;

  @HiveField(5)
  final String startDate;

  @HiveField(6)
  final String targetDate;

  @HiveField(7)
  final String statusString;

  @HiveField(8)
  final String createdAt;

  @HiveField(9)
  final String updatedAt;

  @HiveField(10)
  final bool isDeleted;

  GoalHiveModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.categoryString,
    required this.targetMetric,
    required this.startDate,
    required this.targetDate,
    required this.statusString,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
  });

  /// Convert from DTO
  factory GoalHiveModel.fromDto(GoalDto dto) => GoalHiveModel(
        id: dto.id,
        userId: dto.userId,
        title: dto.title,
        categoryString: dto.categoryString,
        targetMetric: dto.targetMetric,
        startDate: dto.startDate,
        targetDate: dto.targetDate,
        statusString: dto.statusString,
        createdAt: dto.createdAt,
        updatedAt: dto.updatedAt,
        isDeleted: dto.isDeleted,
      );

  /// Convert to DTO
  GoalDto toDto() => GoalDto(
        id: id,
        userId: userId,
        title: title,
        categoryString: categoryString,
        targetMetric: targetMetric,
        startDate: startDate,
        targetDate: targetDate,
        statusString: statusString,
        createdAt: createdAt,
        updatedAt: updatedAt,
        isDeleted: isDeleted,
      );
}
