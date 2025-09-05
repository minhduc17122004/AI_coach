import 'package:freezed_annotation/freezed_annotation.dart';

part 'coach_message.freezed.dart';

@freezed
class CoachMessage with _$CoachMessage {
  const factory CoachMessage({
    required String id,
    required String userId,
    required MessageRole role,
    required String content,
    required DateTime createdAt,
    MessageMetadata? metadata,
    @Default(false) bool isDeleted,
  }) = _CoachMessage;

  const CoachMessage._();

  /// Check if message is from user
  bool get isFromUser => role == MessageRole.user;

  /// Check if message is from assistant
  bool get isFromAssistant => role == MessageRole.assistant;

  /// Check if message is system message
  bool get isSystemMessage => role == MessageRole.system;

  /// Get formatted timestamp
  String get formattedTime {
    final now = DateTime.now();
    final difference = now.difference(createdAt);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  /// Check if message has action metadata
  bool get hasAction => metadata?.action != null;
}

@freezed
class MessageMetadata with _$MessageMetadata {
  const factory MessageMetadata({
    String? action, // e.g., "refine-plan", "explain-task", "unblock"
    String? taskId,
    String? goalId,
    Map<String, dynamic>? additionalData,
  }) = _MessageMetadata;

  const MessageMetadata._();

  /// Quick action types
  static const String actionRefinePlan = 'refine-plan';
  static const String actionExplainTask = 'explain-task';
  static const String actionUnblock = 'unblock';
  static const String actionGeneratePlan = 'generate-plan';
  static const String actionUpdateGoal = 'update-goal';
}

enum MessageRole {
  user,
  assistant,
  system;

  String get displayName {
    switch (this) {
      case MessageRole.user:
        return 'You';
      case MessageRole.assistant:
        return 'Coach';
      case MessageRole.system:
        return 'System';
    }
  }

  String get avatar {
    switch (this) {
      case MessageRole.user:
        return '👤';
      case MessageRole.assistant:
        return '🤖';
      case MessageRole.system:
        return '⚙️';
    }
  }
}
