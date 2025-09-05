// Export all Hive adapters
export 'user_hive_adapter.dart';
export 'goal_hive_adapter.dart';
export 'task_hive_adapter.dart';
export 'coach_message_hive_adapter.dart';
export 'progress_snapshot_hive_adapter.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'user_hive_adapter.dart';
import 'goal_hive_adapter.dart';
import 'task_hive_adapter.dart';
import 'coach_message_hive_adapter.dart';
import 'progress_snapshot_hive_adapter.dart';

/// Register all Hive type adapters
void registerHiveAdapters() {
  // Register adapters if not already registered
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(UserHiveModelAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(GoalHiveModelAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(TaskHiveModelAdapter());
  }
  if (!Hive.isAdapterRegistered(3)) {
    Hive.registerAdapter(CoachMessageHiveModelAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(ProgressSnapshotHiveModelAdapter());
  }
}

/// Hive type IDs reference
/// 
/// TypeId 0: UserHiveModel
/// TypeId 1: GoalHiveModel  
/// TypeId 2: TaskHiveModel
/// TypeId 3: CoachMessageHiveModel
/// TypeId 4: ProgressSnapshotHiveModel
/// 
/// Note: Never reuse type IDs. If you need to remove a model,
/// leave the ID unused and use the next available ID for new models.
