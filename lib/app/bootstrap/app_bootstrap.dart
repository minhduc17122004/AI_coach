import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../di/injection.dart';
import '../../data/hive_adapters/hive_adapters.dart';

/// Bootstrap the app with necessary initializations
class AppBootstrap {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    
    // Setup system UI
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    
    // Initialize Hive
    await _initHive();
    
    // Setup Dependency Injection
    await configureDependencies();
    
    if (kDebugMode) {
      print('✅ App Bootstrap completed successfully');
    }
  }
  
  static Future<void> _initHive() async {
    await Hive.initFlutter();
    
    // Register all Hive adapters
    registerHiveAdapters();
    
    if (kDebugMode) {
      print('✅ Hive initialized with adapters');
    }
  }
}
