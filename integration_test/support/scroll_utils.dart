import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> flingScrollable(
  WidgetTester tester,
  Finder scrollable, {
  int count = 10,
  Offset direction = const Offset(0, -1200),
  double speed = 8000,
  Duration pause = const Duration(milliseconds: 400),
}) async {
  for (var i = 0; i < count; i++) {
    await tester.fling(scrollable, direction, speed);
    await tester.pump(pause);
  }
}

Finder findPrimaryScrollable() => find.byType(Scrollable).first;

Future<void> pumpUntil(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 30),
  bool found = true,
}) async {
  final DateTime deadline = DateTime.now().add(timeout);
  while (DateTime.now().isBefore(deadline)) {
    await tester.pump(const Duration(milliseconds: 250));
    final bool matches = finder.evaluate().isNotEmpty;
    if (matches == found) {
      return;
    }
  }
  fail('Timed out waiting for $finder (found=$found)');
}

Future<void> tapBottomNav(WidgetTester tester, String label) async {
  await tester.tap(find.bySemanticsLabel(label));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
}
