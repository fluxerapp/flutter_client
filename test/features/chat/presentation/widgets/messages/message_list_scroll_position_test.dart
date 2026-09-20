import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_scroll_position.dart';
import 'package:fluxer_app/material_ui.dart';

class _PointerScrollController extends ScrollController {
  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    return MessageListScrollPosition(
      physics: physics,
      context: context,
      initialPixels: initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      oldPosition: oldPosition,
      debugLabel: debugLabel,
    );
  }
}

class _ScrollCounts {
  int starts = 0;
  int updates = 0;
  int ends = 0;
}

Future<_PointerScrollController> _pumpList(
  WidgetTester tester, {
  _ScrollCounts? counts,
}) async {
  final _ScrollCounts scrollCounts = counts ?? _ScrollCounts();
  final _PointerScrollController controller = _PointerScrollController();
  addTearDown(controller.dispose);
  await tester.pumpWidget(
    MaterialApp(
      home: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification.depth != 0) {
            return false;
          }
          if (notification is ScrollStartNotification) {
            scrollCounts.starts += 1;
          } else if (notification is ScrollUpdateNotification) {
            scrollCounts.updates += 1;
          } else if (notification is ScrollEndNotification) {
            scrollCounts.ends += 1;
          }
          return false;
        },
        child: ListView.builder(
          controller: controller,
          itemCount: 80,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(height: 48, child: Text('Row $index'));
          },
        ),
      ),
    ),
  );
  return controller;
}

Future<void> _sendPointerScroll(
  WidgetTester tester, {
  required Offset location,
  double dy = 40,
}) async {
  await tester.sendEventToBinding(
    PointerScrollEvent(position: location, scrollDelta: Offset(0, dy)),
  );
  await tester.pump();
}

void main() {
  testWidgets('pointer-scroll ticks share one start and end after a pause', (
    WidgetTester tester,
  ) async {
    final _ScrollCounts counts = _ScrollCounts();
    final _PointerScrollController controller = await _pumpList(
      tester,
      counts: counts,
    );

    final Offset location = tester.getCenter(find.byType(Scrollable));
    for (int i = 0; i < 8; i += 1) {
      await _sendPointerScroll(tester, location: location);
    }

    expect(counts.starts, 1);
    expect(counts.updates, greaterThan(0));
    expect(counts.ends, 0);
    expect(controller.position.isScrollingNotifier.value, isTrue);
    expect(controller.offset, greaterThan(0));

    await tester.pumpAndSettle();

    expect(counts.starts, 1);
    expect(counts.ends, 1);
    expect(controller.position.isScrollingNotifier.value, isFalse);
  });

  testWidgets('a later pointer-scroll burst starts a new gesture', (
    WidgetTester tester,
  ) async {
    final _ScrollCounts counts = _ScrollCounts();
    await _pumpList(tester, counts: counts);

    final Offset location = tester.getCenter(find.byType(Scrollable));
    await _sendPointerScroll(tester, location: location);
    await tester.pumpAndSettle();

    expect(counts.starts, 1);
    expect(counts.ends, 1);

    await _sendPointerScroll(tester, location: location);
    await tester.pumpAndSettle();

    expect(counts.starts, 2);
    expect(counts.ends, 2);
  });

  testWidgets('inertia cancel ends the pointer-scroll gesture immediately', (
    WidgetTester tester,
  ) async {
    final _ScrollCounts counts = _ScrollCounts();
    final _PointerScrollController controller = await _pumpList(
      tester,
      counts: counts,
    );

    final Offset location = tester.getCenter(find.byType(Scrollable));
    await _sendPointerScroll(tester, location: location);
    expect(counts.ends, 0);
    expect(controller.position.isScrollingNotifier.value, isTrue);

    controller.position.pointerScroll(0);
    await tester.pump();

    expect(counts.starts, 1);
    expect(counts.ends, 1);
    expect(controller.position.isScrollingNotifier.value, isFalse);
  });

  testWidgets('touch-down during pointer scroll still dispatches scroll end', (
    WidgetTester tester,
  ) async {
    final _ScrollCounts counts = _ScrollCounts();
    final _PointerScrollController controller = await _pumpList(
      tester,
      counts: counts,
    );

    final Offset location = tester.getCenter(find.byType(Scrollable));
    await _sendPointerScroll(tester, location: location);
    expect(counts.ends, 0);
    expect(controller.position.isScrollingNotifier.value, isTrue);

    final TestGesture gesture = await tester.startGesture(location);
    await tester.pump();

    expect(counts.ends, 1);

    await gesture.up();
    await tester.pump();
    expect(controller.position.isScrollingNotifier.value, isFalse);
  });

  testWidgets('pointer-scroll interpolation keeps moving across vsyncs', (
    WidgetTester tester,
  ) async {
    final _ScrollCounts counts = _ScrollCounts();
    final _PointerScrollController controller = await _pumpList(
      tester,
      counts: counts,
    );

    final Offset location = tester.getCenter(find.byType(Scrollable));
    await tester.sendEventToBinding(
      PointerScrollEvent(position: location, scrollDelta: const Offset(0, 240)),
    );
    await tester.pump();
    final double afterFirstFrame = controller.offset;
    expect(afterFirstFrame, greaterThan(0));
    expect(afterFirstFrame, lessThan(240));
    expect(counts.ends, 0);

    await tester.pump(const Duration(milliseconds: 16));
    expect(controller.offset, greaterThan(afterFirstFrame));
    expect(counts.ends, 0);

    await tester.pumpAndSettle();
    expect(controller.offset, moreOrLessEquals(240, epsilon: 1));
    expect(counts.starts, 1);
    expect(counts.ends, 1);
  });

  testWidgets('pointer-scroll ignores child hit testing until the burst ends', (
    WidgetTester tester,
  ) async {
    await _pumpList(tester);

    expect(_scrollableIgnoringPointers(tester), isFalse);

    final Offset location = tester.getCenter(find.byType(Scrollable));
    await _sendPointerScroll(tester, location: location);

    expect(_scrollableIgnoringPointers(tester), isTrue);

    await tester.pumpAndSettle();
    expect(_scrollableIgnoringPointers(tester), isFalse);
  });

  testWidgets('trackpad drag ignores child hit testing', (
    WidgetTester tester,
  ) async {
    final _PointerScrollController controller = await _pumpList(tester);

    final Offset location = tester.getCenter(find.byType(Scrollable));
    final TestGesture pad = await tester.createGesture(
      kind: PointerDeviceKind.trackpad,
    );
    addTearDown(pad.removePointer);
    await pad.panZoomStart(location);
    await tester.pump();
    await pad.panZoomUpdate(location, pan: const Offset(0, -120));
    await tester.pump();

    expect(controller.offset, greaterThan(0));
    expect(_scrollableIgnoringPointers(tester), isTrue);

    await pad.panZoomEnd();
    await tester.pumpAndSettle();
    expect(_scrollableIgnoringPointers(tester), isFalse);
  });
}

bool _scrollableIgnoringPointers(WidgetTester tester) {
  final RenderIgnorePointer ignore = tester.renderObject(
    find
        .descendant(
          of: find.byType(Scrollable),
          matching: find.byType(IgnorePointer),
        )
        .first,
  );
  return ignore.ignoring;
}
