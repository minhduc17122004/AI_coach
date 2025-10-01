import 'dart:developer' as developer;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:taskaholic/features/task/domain/entities/task_entity.dart';

/// Interface for notification service
abstract class NotificationService {
  /// Schedule a notification for a task
  Future<void> scheduleTaskNotification({
    required String taskId,
    required String title,
    required String body,
    required DateTime scheduledDate,
  });

  /// Cancel a notification by task ID
  Future<void> cancelTaskNotification(String taskId);

  /// Cancel all notifications
  Future<void> cancelAllNotifications();

  /// Check if notifications are enabled
  Future<bool> areNotificationsEnabled();

  /// Request notification permissions
  Future<bool> requestPermissions();
}

/// Implementation of notification service
class NotificationServiceImpl implements NotificationService {
  static const String _logName = 'NotificationService';
  
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final Map<String, DateTime> _scheduledNotifications = {};

  /// Chuyển đổi task ID thành notification ID hợp lệ (32-bit integer)
  int _getNotificationId(String taskId) {
    // Tạo hash code từ task ID và đảm bảo nó nằm trong phạm vi 32-bit integer
    int hash = taskId.hashCode;
    // Đảm bảo giá trị dương và trong phạm vi 32-bit
    return hash.abs() % 2147483647; // 2^31 - 1
  }
  
  /// Initialize Firebase Messaging
  Future<void> initialize() async {
    try {
      // Request permission for iOS
      final settings = await _messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      developer.log(
        'User granted permission: ${settings.authorizationStatus}',
        name: _logName,
      );

      // Get FCM token
      final token = await _messaging.getToken();
      developer.log('FCM Token: $token', name: _logName);

      // Handle foreground messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        developer.log(
          'Got a message whilst in the foreground!',
          name: _logName,
        );
        
        if (message.notification != null) {
          developer.log(
            'Message also contained a notification: ${message.notification}',
            name: _logName,
          );
        }
      });

      // Handle background messages
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    } catch (e) {
      developer.log('Error initializing Firebase Messaging: $e', name: _logName, error: e);
    }
  }

  @override
  Future<void> scheduleTaskNotification({
    required String taskId,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    try {
      // Chỉ lên lịch thông báo nếu thời gian trong tương lai
      if (!scheduledDate.isAfter(DateTime.now())) {
        developer.log(
          'Không lên lịch thông báo cho thời gian đã qua: $scheduledDate',
          name: _logName,
        );
        return;
      }

      final notificationId = _getNotificationId(taskId);
      
      developer.log(
        'Lên lịch thông báo ID: $notificationId cho task: $taskId vào lúc $scheduledDate',
        name: _logName,
      );

      // Store scheduled notification
      _scheduledNotifications[taskId] = scheduledDate;
      
      // Subscribe to topic for task notifications
      await _messaging.subscribeToTopic('tasks');
      
      developer.log('Đã lên lịch thông báo thành công', name: _logName);
    } catch (e) {
      developer.log(
        'Lỗi khi lên lịch thông báo cho task $taskId: $e',
        name: _logName,
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<void> cancelTaskNotification(String taskId) async {
    try {
      final notificationId = _getNotificationId(taskId);
      
      developer.log(
        'Hủy thông báo ID: $notificationId cho task: $taskId',
        name: _logName,
      );

      // Remove from scheduled notifications
      _scheduledNotifications.remove(taskId);
      
      developer.log('Đã hủy thông báo thành công', name: _logName);
    } catch (e) {
      developer.log(
        'Lỗi khi hủy thông báo cho task $taskId: $e',
        name: _logName,
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<void> cancelAllNotifications() async {
    try {
      developer.log('Hủy tất cả thông báo', name: _logName);

      // Clear all scheduled notifications
      _scheduledNotifications.clear();
      
      // Unsubscribe from topic
      await _messaging.unsubscribeFromTopic('tasks');
      
      developer.log('Đã hủy tất cả thông báo thành công', name: _logName);
    } catch (e) {
      developer.log('Lỗi khi hủy tất cả thông báo: $e', name: _logName, error: e);
      rethrow;
    }
  }

  @override
  Future<bool> areNotificationsEnabled() async {
    try {
      final settings = await _messaging.getNotificationSettings();
      
      developer.log(
        'Notification settings: ${settings.authorizationStatus}',
        name: _logName,
      );
      
      return settings.authorizationStatus == AuthorizationStatus.authorized ||
             settings.authorizationStatus == AuthorizationStatus.provisional;
    } catch (e) {
      developer.log('Lỗi khi kiểm tra quyền thông báo: $e', name: _logName, error: e);
      return false;
    }
  }

  @override
  Future<bool> requestPermissions() async {
    try {
      developer.log('Yêu cầu quyền thông báo...', name: _logName);

      final settings = await _messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      
      developer.log(
        'Permission result: ${settings.authorizationStatus}',
        name: _logName,
      );
      
      return settings.authorizationStatus == AuthorizationStatus.authorized ||
             settings.authorizationStatus == AuthorizationStatus.provisional;
    } catch (e) {
      developer.log('Lỗi khi yêu cầu quyền thông báo: $e', name: _logName, error: e);
      return false;
    }
  }
}

/// Background message handler
/// Must be a top-level function
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  developer.log(
    'Handling a background message: ${message.messageId}',
    name: 'BackgroundHandler',
  );
}

/// Extension methods for TaskEntity notification helpers
extension TaskNotificationExtension on TaskEntity {
  /// Check if task can have notifications
  bool get canHaveNotification {
    return date != null && 
           time != null && 
           hasTime && 
           !isCompleted;
  }

  /// Get notification DateTime for the task
  DateTime? get notificationDateTime {
    if (!canHaveNotification) return null;
    
    return DateTime(
      date!.year,
      date!.month,
      date!.day,
      time!.hour,
      time!.minute,
    );
  }

  /// Get notification title
  String get notificationTitle => 'Nhắc nhở: $title';

  /// Get notification body
  String get notificationBody {
    final dateStr = getFormattedDate();
    final timeStr = getFormattedTime();
    return 'Đến hạn: $dateStr lúc $timeStr';
  }
}
