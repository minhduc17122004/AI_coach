import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_snapshot.freezed.dart';

@freezed
class ProgressSnapshot with _$ProgressSnapshot {
  const factory ProgressSnapshot({
    required String id,
    required String goalId,
    required DateTime date,
    required int doneTasks,
    required int totalTasks,
    required int streak,
    required DateTime createdAt,
    @Default(false) bool isDeleted,
  }) = _ProgressSnapshot;

  const ProgressSnapshot._();

  /// Calculate completion percentage (0.0 to 1.0)
  double get completionPercentage {
    if (totalTasks == 0) return 0.0;
    return doneTasks / totalTasks;
  }

  /// Get completion percentage as integer (0 to 100)
  int get completionPercentageInt => (completionPercentage * 100).round();

  /// Check if all tasks are completed
  bool get isFullyCompleted => totalTasks > 0 && doneTasks == totalTasks;

  /// Check if no tasks are completed
  bool get hasNoProgress => doneTasks == 0;

  /// Get remaining tasks count
  int get remainingTasks => totalTasks - doneTasks;

  /// Get date as string in yyyy-MM-dd format
  String get dateString => 
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';

  /// Check if snapshot is for today
  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year && 
           date.month == now.month && 
           date.day == now.day;
  }

  /// Get streak display text
  String get streakText {
    if (streak == 0) return 'No streak';
    if (streak == 1) return '1 day streak';
    return '$streak days streak';
  }

  /// Get progress status
  ProgressStatus get status {
    if (totalTasks == 0) return ProgressStatus.noTasks;
    if (doneTasks == 0) return ProgressStatus.notStarted;
    if (doneTasks == totalTasks) return ProgressStatus.completed;
    if (completionPercentage >= 0.8) return ProgressStatus.almostDone;
    if (completionPercentage >= 0.5) return ProgressStatus.onTrack;
    return ProgressStatus.needsAttention;
  }
}

enum ProgressStatus {
  noTasks,
  notStarted,
  needsAttention,
  onTrack,
  almostDone,
  completed;

  String get displayName {
    switch (this) {
      case ProgressStatus.noTasks:
        return 'No Tasks';
      case ProgressStatus.notStarted:
        return 'Not Started';
      case ProgressStatus.needsAttention:
        return 'Needs Attention';
      case ProgressStatus.onTrack:
        return 'On Track';
      case ProgressStatus.almostDone:
        return 'Almost Done';
      case ProgressStatus.completed:
        return 'Completed';
    }
  }

  String get color {
    switch (this) {
      case ProgressStatus.noTasks:
        return '#9E9E9E'; // Grey
      case ProgressStatus.notStarted:
        return '#F44336'; // Red
      case ProgressStatus.needsAttention:
        return '#FF9800'; // Orange
      case ProgressStatus.onTrack:
        return '#2196F3'; // Blue
      case ProgressStatus.almostDone:
        return '#8BC34A'; // Light Green
      case ProgressStatus.completed:
        return '#4CAF50'; // Green
    }
  }

  String get icon {
    switch (this) {
      case ProgressStatus.noTasks:
        return '📝';
      case ProgressStatus.notStarted:
        return '🔴';
      case ProgressStatus.needsAttention:
        return '⚠️';
      case ProgressStatus.onTrack:
        return '🔵';
      case ProgressStatus.almostDone:
        return '🟡';
      case ProgressStatus.completed:
        return '✅';
    }
  }
}
