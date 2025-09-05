// App-wide constants
class AppConstants {
  // Goal Categories
  static const String goalCategoryFitness = 'fitness';
  static const String goalCategoryLearning = 'learning';
  static const String goalCategoryFinance = 'finance';
  static const String goalCategoryHealth = 'health';
  static const String goalCategoryCareer = 'career';
  static const String goalCategoryPersonal = 'personal';

  // Goal Status
  static const String goalStatusActive = 'active';
  static const String goalStatusPaused = 'paused';
  static const String goalStatusDone = 'done';

  // Task Status
  static const String taskStatusTodo = 'todo';
  static const String taskStatusDone = 'done';
  static const String taskStatusSkipped = 'skipped';

  // Chat Message Roles
  static const String chatRoleUser = 'user';
  static const String chatRoleAssistant = 'assistant';
  static const String chatRoleSystem = 'system';

  // Date Formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String dateTimeFormat = 'yyyy-MM-ddTHH:mm:ss.SSSZ';

  // Firestore Collections
  static const String usersCollection = 'users';
  static const String goalsCollection = 'goals';
  static const String tasksCollection = 'tasks';
  static const String chatMessagesCollection = 'chat_messages';
  static const String progressSnapshotsCollection = 'progress_snapshots';

  // Hive Boxes
  static const String goalsBox = 'goals';
  static const String tasksBox = 'tasks';
  static const String chatMessagesBox = 'chat_messages';
  static const String progressSnapshotsBox = 'progress_snapshots';
  static const String userBox = 'user';
}
