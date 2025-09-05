import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:coach/features/auth/presentation/pages/login_page.dart';
import 'package:coach/features/auth/presentation/pages/splash_page.dart';

// GoRouter configuration
final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Home Page - Coming Soon'),
        ),
      ),
    ),
    // Goals routes
    GoRoute(
      path: '/goals',
      name: 'goals',
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Goals Page - Coming Soon'),
        ),
      ),
    ),
    // Plan routes
    GoRoute(
      path: '/plan',
      name: 'plan',
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Plan Page - Coming Soon'),
        ),
      ),
    ),
    // Coach Chat routes
    GoRoute(
      path: '/chat',
      name: 'chat',
      builder: (context, state) => const Scaffold(
        body: Center(
          child: Text('Coach Chat Page - Coming Soon'),
        ),
      ),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          Text(
            'Page not found: ${state.uri}',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/splash'),
            child: const Text('Go to Home'),
          ),
        ],
      ),
    ),
  ),
);
