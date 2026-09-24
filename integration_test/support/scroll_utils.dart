import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<List<String>> flingScrollable(
  WidgetTester tester,
  Finder scrollable, {
  int count = 10,
  Offset direction = const Offset(0, -1200),
  double speed = 8000,
  Duration pause = const Duration(milliseconds: 400),
}) async {
  ScrollPosition positionOf() =>
      tester.state<ScrollableState>(scrollable).position;

  String sample(int index) {
    final ScrollPosition position = positionOf();
    return 'i$index px=${position.pixels.toStringAsFixed(1)} '
        'min=${position.minScrollExtent.toStringAsFixed(1)} '
        'max=${position.maxScrollExtent.toStringAsFixed(1)}';
  }

  final List<String> trail = <String>[sample(0)];
  final double before = positionOf().pixels;
  for (var i = 0; i < count; i++) {
    await tester.fling(scrollable, direction, speed);
    await Future<void>.delayed(pause);
    await tester.pump();
    trail.add(sample(i + 1));
  }
  final double after = positionOf().pixels;
  expect(
    (after - before).abs(),
    greaterThan(500),
    reason:
        'fling on $scrollable moved ${after - before} px: the target is not '
        'the scrollable under test, or it cannot scroll in $direction. '
        'Samples: ${trail.join(' | ')}',
  );
  return trail;
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
