import 'package:flutter/material.dart';
import 'package:taskaholic/features/home/presentation/pages/home_page.dart';
import 'package:taskaholic/features/task/presentation/pages/task_form_page.dart';
import 'package:taskaholic/features/task/domain/entities/task_entity.dart';
import 'package:taskaholic/features/auth/presentation/pages/login/login_page.dart';
import 'package:taskaholic/features/home/presentation/pages/completed_page.dart';

/// App route names
class AppRoutes {
  static const String login = '/login';
  static const String home = '/';
  static const String completed = '/completed';
  static const String taskForm = '/task-form';
  static const String taskEdit = '/task-edit';
  // TODO: Add more routes as features are implemented  
  // static const String settings = '/settings';
  // static const String categories = '/categories';
}

/// App route configuration
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
        
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );
        
      case AppRoutes.taskForm:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => TaskFormPage(
            initialCategory: args?['initialCategory'] as String?,
          ),
          settings: settings,
        );
        
      case AppRoutes.taskEdit:
        final task = settings.arguments as TaskEntity;
        return MaterialPageRoute(
          builder: (_) => TaskFormPage(
            taskToEdit: task,
          ),
          settings: settings,
        );
        
      case AppRoutes.completed:
        return MaterialPageRoute(
          builder: (_) => const CompletedPage(),
          settings: settings,
        );
        
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: const Text('Page Not Found')),
            body: const Center(
              child: Text(
                'Route not found',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          settings: settings,
        );
    }
  }
  
  /// Get initial route based on authentication status
  /// Note: This is not used anymore since we use BlocBuilder in app.dart
  /// Keeping for reference if route-based navigation is preferred later
  static String getInitialRoute() {
    // Authentication check is now handled by AuthBloc in app.dart
    return AppRoutes.home;
  }
}
