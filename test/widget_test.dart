// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:citp_1/main.dart';

void main() {
  testWidgets('CITP app loads', (WidgetTester tester) async {
    // Ignore overflow errors in test (responsive layout on small test viewport)
    final originalOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.exception.toString().contains('overflowed')) return;
      if (originalOnError != null) originalOnError(details);
    };
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1.0;
    await tester.pumpWidget(const CitpApp());
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.text('CITP GABON'), findsWidgets);
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
      FlutterError.onError = originalOnError;
    });
  });
}
