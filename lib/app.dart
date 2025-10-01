import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaholic/core/themes/index.dart';
import 'package:taskaholic/core/routes/app_routes.dart';
import 'package:taskaholic/core/di/di.dart' as di;
import 'package:taskaholic/features/task/presentation/bloc/task_bloc.dart';
import 'package:taskaholic/features/task/presentation/bloc/task_event.dart';
import 'package:taskaholic/features/home/presentation/pages/home_page.dart';

// Auth feature - Implemented
import 'package:taskaholic/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:taskaholic/features/auth/presentation/bloc/auth_event.dart';
import 'package:taskaholic/features/auth/presentation/bloc/auth_state.dart';
import 'package:taskaholic/features/auth/presentation/pages/login/login_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Task BLoC - Currently implemented
        BlocProvider<TaskBloc>(
          create: (context) => di.sl<TaskBloc>()..add(const LoadTasksEvent()),
        ),
        
        // Auth BLoC - Implemented
        BlocProvider<AuthBloc>(
          create: (context) => di.sl<AuthBloc>()..add(CheckAuthStatusEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Taskaholic',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        
        // Route configuration
        onGenerateRoute: AppRouter.generateRoute,
        
        // Auth flow implementation
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading || state is AuthInitial) {
              return const Scaffold(
                backgroundColor: AppColors.background,
                body: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ),
                ),
              );
            } else if (state is Authenticated) {
              return const HomePage();
            } else {
              // Unauthenticated or AuthError
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
} 