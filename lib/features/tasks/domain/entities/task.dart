import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String goalId,
    required String userId,
    required String title,
    required String description,
    required DateTime date, // Date for this task (yyyy-MM-dd)
    required int estimatedMinutes,
    required TaskStatus status,
    String? completionNote,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool isDeleted,
  }) = _Task;

  const Task._();

  /// Get date as string in yyyy-MM-dd format
  String get dateString => 
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';

  /// Check if task is for today
  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year && 
           date.month == now.month && 
           date.day == now.day;
  }

  /// Check if task is overdue
  bool get isOverdue {
    final now = DateTime.now();
    return date.isBefore(DateTime(now.year, now.month, now.day)) && 
           status == TaskStatus.todo;
  }

  /// Check if task is completed
  bool get isCompleted => status == TaskStatus.done;

  /// Check if task is pending (todo)
  bool get isPending => status == TaskStatus.todo;

  /// Check if task is skipped
  bool get isSkipped => status == TaskStatus.skipped;

  /// Get estimated duration as formatted string
  String get estimatedDurationText {
    if (estimatedMinutes < 60) {
      return '${estimatedMinutes}m';
    }
    final hours = estimatedMinutes ~/ 60;
    final minutes = estimatedMinutes % 60;
    if (minutes == 0) {
      return '${hours}h';
    }
    return '${hours}h ${minutes}m';
  }

  /// Check if task is actionable (not deleted and not skipped)
  bool get isActionable => !isDeleted && status != TaskStatus.skipped;
}

enum TaskStatus {
  todo,
  done,
  skipped;

  String get displayName {
    switch (this) {
      case TaskStatus.todo:
        return 'To Do';
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.skipped:
        return 'Skipped';
    }
  }

  String get icon {
    switch (this) {
      case TaskStatus.todo:
        return '⏳';
      case TaskStatus.done:
        return '✅';
      case TaskStatus.skipped:
        return '⏭️';
    }
  }
}
