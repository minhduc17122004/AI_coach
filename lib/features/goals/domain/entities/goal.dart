import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';

@freezed
class Goal with _$Goal {
  const factory Goal({
    required String id,
    required String userId,
    required String title,
    required GoalCategory category,
    required String targetMetric,
    required DateTime startDate,
    required DateTime targetDate,
    required GoalStatus status,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
  }) = _Goal;

  const Goal._();

  /// Calculate days remaining until target date
  int get daysRemaining {
    final now = DateTime.now();
    final difference = targetDate.difference(now).inDays;
    return difference < 0 ? 0 : difference;
  }

  /// Calculate total duration in days
  int get totalDays => targetDate.difference(startDate).inDays;

  /// Calculate progress percentage (0.0 to 1.0)
  double get progressPercentage {
    final now = DateTime.now();
    if (now.isBefore(startDate)) return 0.0;
    if (now.isAfter(targetDate)) return 1.0;
    
    final elapsed = now.difference(startDate).inDays;
    return elapsed / totalDays;
  }

  /// Check if goal is currently active
  bool get isActive => status == GoalStatus.active && !isDeleted;

  /// Check if goal is overdue
  bool get isOverdue => DateTime.now().isAfter(targetDate) && status == GoalStatus.active;
}

enum GoalCategory {
  fitness,
  learning,
  finance,
  health,
  career,
  personal;

  String get displayName {
    switch (this) {
      case GoalCategory.fitness:
        return 'Fitness';
      case GoalCategory.learning:
        return 'Learning';
      case GoalCategory.finance:
        return 'Finance';
      case GoalCategory.health:
        return 'Health';
      case GoalCategory.career:
        return 'Career';
      case GoalCategory.personal:
        return 'Personal';
    }
  }

  String get icon {
    switch (this) {
      case GoalCategory.fitness:
        return '💪';
      case GoalCategory.learning:
        return '📚';
      case GoalCategory.finance:
        return '💰';
      case GoalCategory.health:
        return '🏥';
      case GoalCategory.career:
        return '💼';
      case GoalCategory.personal:
        return '🌟';
    }
  }
}

enum GoalStatus {
  active,
  paused,
  done;

  String get displayName {
    switch (this) {
      case GoalStatus.active:
        return 'Active';
      case GoalStatus.paused:
        return 'Paused';
      case GoalStatus.done:
        return 'Completed';
    }
  }
}
