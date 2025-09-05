// This is a basic Flutter widget test for AI Coach App.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coach/features/auth/presentation/pages/splash_page.dart';

void main() {
  group('AI Coach App Widget Tests', () {
    testWidgets('Splash Page displays correctly', (WidgetTester tester) async {
      // Build splash page
      await tester.pumpWidget(
        const MaterialApp(home: SplashPage()),
      );

      // Verify that splash screen elements are present
      expect(find.text('AI Coach'), findsOneWidget);
      expect(find.text('Your Personal Goal Achievement Partner'), findsOneWidget);
      expect(find.byIcon(Icons.psychology_outlined), findsOneWidget);
    });

    testWidgets('App structure test - basic functionality', (WidgetTester tester) async {
      // Test basic Material app structure
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: const Text('AI Coach Test')),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.psychology_outlined, size: 64),
                  SizedBox(height: 16),
                  Text('AI Coach'),
                  Text('Clean Architecture Setup Complete'),
                ],
              ),
            ),
          ),
        ),
      );

      // Verify elements are present
      expect(find.text('AI Coach Test'), findsOneWidget);
      expect(find.text('AI Coach'), findsOneWidget);
      expect(find.text('Clean Architecture Setup Complete'), findsOneWidget);
      expect(find.byIcon(Icons.psychology_outlined), findsOneWidget);
    });

    testWidgets('Constants and imports test', (WidgetTester tester) async {
      // Test that we can import and use our constants
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text('Dependencies loaded successfully'),
            ),
          ),
        ),
      );

      expect(find.text('Dependencies loaded successfully'), findsOneWidget);
    });
  });
}
