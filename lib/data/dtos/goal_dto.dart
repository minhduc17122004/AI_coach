import 'package:json_annotation/json_annotation.dart';
import '../../features/goals/domain/entities/goal.dart';

part 'goal_dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class GoalDto {
  final String id;
  final String userId;
  final String title;
  @JsonKey(name: 'category')
  final String categoryString;
  final String targetMetric;
  final String startDate; // ISO8601 date string
  final String targetDate; // ISO8601 date string
  @JsonKey(name: 'status')
  final String statusString;
  final String createdAt;
  final String updatedAt;
  final bool isDeleted;

  const GoalDto({
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

  factory GoalDto.fromJson(Map<String, dynamic> json) => _$GoalDtoFromJson(json);
  Map<String, dynamic> toJson() => _$GoalDtoToJson(this);

  /// Convert DTO to Domain Entity
  Goal toEntity() => Goal(
        id: id,
        userId: userId,
        title: title,
        category: _parseCategory(categoryString),
        targetMetric: targetMetric,
        startDate: DateTime.parse(startDate),
        targetDate: DateTime.parse(targetDate),
        status: _parseStatus(statusString),
        createdAt: DateTime.parse(createdAt),
        updatedAt: DateTime.parse(updatedAt),
        isDeleted: isDeleted,
      );

  /// Create DTO from Domain Entity
  factory GoalDto.fromEntity(Goal goal) => GoalDto(
        id: goal.id,
        userId: goal.userId,
        title: goal.title,
        categoryString: goal.category.name,
        targetMetric: goal.targetMetric,
        startDate: goal.startDate.toIso8601String(),
        targetDate: goal.targetDate.toIso8601String(),
        statusString: goal.status.name,
        createdAt: goal.createdAt.toIso8601String(),
        updatedAt: goal.updatedAt.toIso8601String(),
        isDeleted: goal.isDeleted,
      );

  /// Create DTO for Firestore
  Map<String, dynamic> toFirestore() => {
        'id': id,
        'user_id': userId,
        'title': title,
        'category': categoryString,
        'target_metric': targetMetric,
        'start_date': startDate,
        'target_date': targetDate,
        'status': statusString,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'is_deleted': isDeleted,
      };

  /// Create DTO from Firestore document
  factory GoalDto.fromFirestore(Map<String, dynamic> data, String documentId) {
    return GoalDto(
      id: documentId,
      userId: data['user_id'] as String,
      title: data['title'] as String,
      categoryString: data['category'] as String,
      targetMetric: data['target_metric'] as String,
      startDate: data['start_date'] as String,
      targetDate: data['target_date'] as String,
      statusString: data['status'] as String,
      createdAt: data['created_at'] as String,
      updatedAt: data['updated_at'] as String,
      isDeleted: data['is_deleted'] as bool? ?? false,
    );
  }

  /// Parse category string to enum
  GoalCategory _parseCategory(String category) {
    return GoalCategory.values.firstWhere(
      (e) => e.name == category,
      orElse: () => GoalCategory.personal,
    );
  }

  /// Parse status string to enum
  GoalStatus _parseStatus(String status) {
    return GoalStatus.values.firstWhere(
      (e) => e.name == status,
      orElse: () => GoalStatus.active,
    );
  }
}
