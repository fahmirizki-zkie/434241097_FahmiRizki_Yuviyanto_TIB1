// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:untitled1/app.dart';

void main() {
  testWidgets('Splash transitions to login in 2 seconds', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ETicketingApp());

    expect(find.text('SECURED BY TICKETFLOW CLOUD'), findsOneWidget);
    expect(find.byIcon(Icons.confirmation_num_rounded), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
  });
}
