import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/swipe_to_reply.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/defer_horizontal_drag_while_coasting.dart';
import 'package:fluxer_app/shared/markdown/native_markdown_parser.dart';
import 'package:fluxer_markdown/src/widgets/fluxer_markdown.dart';

import '../../../../../shared/gestures/wide_markdown_table_test_helpers.dart';

Widget _buildApp(
  Widget child, {
  Map<Type, GestureRecognizerFactory>? parentGestures,
}) {
  final colorTheme = buildDarkColorTheme();
  Widget viewport = SizedBox(
    key: const ValueKey<String>('swipeViewport'),
    width: 400,
    height: 56,
    child: child,
  );
  if (parentGestures != null) {
    viewport = RawGestureDetector(
      behavior: HitTestBehavior.opaque,
      gestures: parentGestures,
      child: viewport,
    );
  }
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: MediaQuery(
      data: const MediaQueryData(size: Size(400, 800)),
      child: Scaffold(body: Center(child: viewport)),
    ),
  );
}

Future<void> _slowDrag(
  WidgetTester tester,
  Offset start,
  Offset totalDelta, {
  int steps = 5,
}) async {
  final TestGesture gesture = await tester.startGesture(start);
  final Offset step = totalDelta / steps.toDouble();
  for (var i = 0; i < steps; i++) {
    await gesture.moveBy(step);
  }
  await gesture.up();
}

void main() {
  testWidgets(
    'horizontal drag starting in leading edge reserve does not reply',
    (tester) async {
      var replyCount = 0;
      await tester.pumpWidget(
        _buildApp(
          SwipeToReply(
            onReply: () => replyCount++,
            child: const ColoredBox(color: Color(0xFF112233)),
          ),
        ),
      );
      final BuildContext ctx = tester.element(
        find.byKey(const ValueKey<String>('swipeViewport')),
      );
      final double reserve = leadingEdgeHorizontalSwipeReserveWidth(ctx);
      expect(reserve, greaterThan(0));
      final RenderBox viewport =
          tester.renderObject(
                find.byKey(const ValueKey<String>('swipeViewport')),
              )
              as RenderBox;
      final Offset startLocal = Offset(reserve / 2, viewport.size.height / 2);
      final TestGesture gesture = await tester.startGesture(
        viewport.localToGlobal(startLocal),
      );
      await gesture.moveBy(const Offset(-120, 0));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(replyCount, 0);
    },
  );

  testWidgets('horizontal drag past reserve past threshold invokes onReply', (
    tester,
  ) async {
    var replyCount = 0;
    await tester.pumpWidget(
      _buildApp(
        SwipeToReply(
          onReply: () => replyCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
      ),
    );
    final BuildContext ctx = tester.element(
      find.byKey(const ValueKey<String>('swipeViewport')),
    );
    final double reserve = leadingEdgeHorizontalSwipeReserveWidth(ctx);
    final RenderBox viewport =
        tester.renderObject(find.byKey(const ValueKey<String>('swipeViewport')))
            as RenderBox;
    final Offset startLocal = Offset(reserve + 40, viewport.size.height / 2);
    final TestGesture gesture = await tester.startGesture(
      viewport.localToGlobal(startLocal),
    );
    await gesture.moveBy(const Offset(-150, 0));
    await gesture.up();
    await tester.pumpAndSettle();
    expect(replyCount, 1);
  });

  testWidgets('rightward drag yields to parent horizontal recognizer', (
    tester,
  ) async {
    var replyCount = 0;
    var parentStartCount = 0;
    var parentDeltaX = 0.0;
    await tester.pumpWidget(
      _buildApp(
        SwipeToReply(
          onReply: () => replyCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
        parentGestures: <Type, GestureRecognizerFactory>{
          HorizontalDragGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<
                HorizontalDragGestureRecognizer
              >(HorizontalDragGestureRecognizer.new, (recognizer) {
                recognizer
                  ..onStart = (_) {
                    parentStartCount++;
                  }
                  ..onUpdate = (details) {
                    parentDeltaX += details.delta.dx;
                  };
              }),
        },
      ),
    );
    final BuildContext ctx = tester.element(
      find.byKey(const ValueKey<String>('swipeViewport')),
    );
    final double reserve = leadingEdgeHorizontalSwipeReserveWidth(ctx);
    final RenderBox viewport =
        tester.renderObject(find.byKey(const ValueKey<String>('swipeViewport')))
            as RenderBox;
    final Offset startLocal = Offset(reserve + 40, viewport.size.height / 2);
    await _slowDrag(
      tester,
      viewport.localToGlobal(startLocal),
      const Offset(150, 0),
    );
    await tester.pumpAndSettle();
    expect(replyCount, 0);
    expect(parentStartCount, 1);
    expect(parentDeltaX, greaterThan(80));
  });

  testWidgets('leftward drag still wins over parent horizontal recognizer', (
    tester,
  ) async {
    var replyCount = 0;
    var parentStartCount = 0;
    await tester.pumpWidget(
      _buildApp(
        SwipeToReply(
          onReply: () => replyCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
        parentGestures: <Type, GestureRecognizerFactory>{
          HorizontalDragGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<
                HorizontalDragGestureRecognizer
              >(HorizontalDragGestureRecognizer.new, (recognizer) {
                recognizer.onStart = (_) {
                  parentStartCount++;
                };
              }),
        },
      ),
    );
    final BuildContext ctx = tester.element(
      find.byKey(const ValueKey<String>('swipeViewport')),
    );
    final double reserve = leadingEdgeHorizontalSwipeReserveWidth(ctx);
    final RenderBox viewport =
        tester.renderObject(find.byKey(const ValueKey<String>('swipeViewport')))
            as RenderBox;
    final Offset startLocal = Offset(reserve + 40, viewport.size.height / 2);
    await _slowDrag(
      tester,
      viewport.localToGlobal(startLocal),
      const Offset(-150, 0),
    );
    await tester.pumpAndSettle();
    expect(replyCount, 1);
    expect(parentStartCount, 0);
  });

  testWidgets('holding the swipe past the threshold escalates to edit', (
    tester,
  ) async {
    var replyCount = 0;
    var editCount = 0;
    await tester.pumpWidget(
      _buildApp(
        SwipeToReply(
          onReply: () => replyCount++,
          onEdit: () => editCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
      ),
    );
    final BuildContext ctx = tester.element(
      find.byKey(const ValueKey<String>('swipeViewport')),
    );
    final double reserve = leadingEdgeHorizontalSwipeReserveWidth(ctx);
    final RenderBox viewport =
        tester.renderObject(find.byKey(const ValueKey<String>('swipeViewport')))
            as RenderBox;
    final Offset startLocal = Offset(reserve + 40, viewport.size.height / 2);
    final TestGesture gesture = await tester.startGesture(
      viewport.localToGlobal(startLocal),
    );
    await gesture.moveBy(const Offset(-150, 0));
    // First pump sets the hold ticker baseline; the second crosses the delay.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
    await gesture.up();
    await tester.pumpAndSettle();
    expect(editCount, 1);
    expect(replyCount, 0);
  });

  testWidgets('a quick swipe still replies when edit is available', (
    tester,
  ) async {
    var replyCount = 0;
    var editCount = 0;
    await tester.pumpWidget(
      _buildApp(
        SwipeToReply(
          onReply: () => replyCount++,
          onEdit: () => editCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
      ),
    );
    final BuildContext ctx = tester.element(
      find.byKey(const ValueKey<String>('swipeViewport')),
    );
    final double reserve = leadingEdgeHorizontalSwipeReserveWidth(ctx);
    final RenderBox viewport =
        tester.renderObject(find.byKey(const ValueKey<String>('swipeViewport')))
            as RenderBox;
    final Offset startLocal = Offset(reserve + 40, viewport.size.height / 2);
    final TestGesture gesture = await tester.startGesture(
      viewport.localToGlobal(startLocal),
    );
    await gesture.moveBy(const Offset(-150, 0));
    await gesture.up();
    await tester.pumpAndSettle();
    expect(replyCount, 1);
    expect(editCount, 0);
  });

  testWidgets('drawer peek scope disables reply without rebuilding the child', (
    tester,
  ) async {
    var replyCount = 0;
    await tester.pumpWidget(
      _buildApp(
        ChatSwipeToReplyScope(
          enabled: false,
          child: SwipeToReply(
            onReply: () => replyCount++,
            child: const ColoredBox(color: Color(0xFF112233)),
          ),
        ),
      ),
    );
    final BuildContext ctx = tester.element(
      find.byKey(const ValueKey<String>('swipeViewport')),
    );
    final double reserve = leadingEdgeHorizontalSwipeReserveWidth(ctx);
    final RenderBox viewport =
        tester.renderObject(find.byKey(const ValueKey<String>('swipeViewport')))
            as RenderBox;
    final Offset startLocal = Offset(reserve + 40, viewport.size.height / 2);
    final TestGesture gesture = await tester.startGesture(
      viewport.localToGlobal(startLocal),
    );
    await gesture.moveBy(const Offset(-150, 0));
    await gesture.up();
    await tester.pumpAndSettle();
    expect(replyCount, 0);
  });

  testWidgets('wraps the child in a RepaintBoundary so the slide composites', (
    tester,
  ) async {
    const childKey = ValueKey<String>('swipeChild');
    await tester.pumpWidget(
      _buildApp(
        SwipeToReply(
          onReply: () {},
          child: const ColoredBox(key: childKey, color: Color(0xFF112233)),
        ),
      ),
    );
    expect(
      find.ancestor(
        of: find.byKey(childKey),
        matching: find.descendant(
          of: find.byType(SwipeToReply),
          matching: find.byType(RepaintBoundary),
        ),
      ),
      findsOneWidget,
    );
  });

  testWidgets('leftward drag on wide table scrolls instead of replying', (
    tester,
  ) async {
    var replyCount = 0;
    await tester.pumpWidget(
      _buildApp(
        SizedBox(
          width: 400,
          height: 120,
          child: SwipeToReply(
            onReply: () => replyCount++,
            child: buildWideMarkdownTable(),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final ScrollableState scrollable = tableScrollableState(tester);
    expect(scrollable.position.maxScrollExtent, greaterThan(0));
    final double before = scrollable.position.pixels;
    await _slowDrag(tester, tableDragStart(tester), const Offset(-120, 0));
    await tester.pumpAndSettle();
    expect(scrollable.position.pixels, greaterThan(before));
    expect(replyCount, 0);
  });

  testWidgets(
    'rightward drag on wide table scrolls instead of opening drawer',
    (tester) async {
      var replyCount = 0;
      var parentStartCount = 0;
      await tester.pumpWidget(
        _buildApp(
          SizedBox(
            width: 400,
            height: 120,
            child: SwipeToReply(
              onReply: () => replyCount++,
              child: buildWideMarkdownTable(),
            ),
          ),
          parentGestures: <Type, GestureRecognizerFactory>{
            HorizontalDragGestureRecognizer:
                GestureRecognizerFactoryWithHandlers<
                  HorizontalDragGestureRecognizer
                >(HorizontalDragGestureRecognizer.new, (recognizer) {
                  recognizer.onStart = (_) {
                    parentStartCount++;
                  };
                }),
          },
        ),
      );
      await tester.pumpAndSettle();
      final ScrollableState scrollable = tableScrollableState(tester);
      scrollable.position.jumpTo(scrollable.position.maxScrollExtent / 2);
      await tester.pump();
      final double before = scrollable.position.pixels;
      await _slowDrag(tester, tableDragStart(tester), const Offset(120, 0));
      await tester.pumpAndSettle();
      expect(scrollable.position.pixels, lessThan(before));
      expect(replyCount, 0);
      expect(parentStartCount, 0);
    },
  );

  testWidgets('leftward drag on narrow table still replies', (tester) async {
    var replyCount = 0;
    await tester.pumpWidget(
      _buildApp(
        SizedBox(
          width: 400,
          height: 120,
          child: SwipeToReply(
            onReply: () => replyCount++,
            child: const FluxerMarkdown(
              astParser: parseNativeFluxerMarkdownAst,
              data: kNarrowMarkdownTable,
              config: kWideTableMarkdownConfig,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final ScrollableState scrollable = tableScrollableState(tester);
    expect(scrollable.position.maxScrollExtent, 0);
    final BuildContext ctx = tester.element(find.byType(SwipeToReply));
    final double reserve = leadingEdgeHorizontalSwipeReserveWidth(ctx);
    final RenderBox box = tester.renderObject<RenderBox>(find.byType(Table));
    final Offset start = box.localToGlobal(
      Offset(reserve + 20, box.size.height / 2),
    );
    await _slowDrag(tester, start, const Offset(-150, 0));
    await tester.pumpAndSettle();
    expect(replyCount, 1);
  });

  testWidgets('vertical drag over swipe yields to parent scroll', (
    tester,
  ) async {
    var replyCount = 0;
    var editCount = 0;
    await tester.pumpWidget(
      _buildVerticalScrollApp(
        SwipeToReply(
          onReply: () => replyCount++,
          onEdit: () => editCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final ScrollPosition position = _parentVerticalPosition(tester);
    position.jumpTo(300);
    await tester.pump();
    final double before = position.pixels;
    final Offset start = _swipeBodyStart(tester);
    await _slowDrag(tester, start, const Offset(0, 180));
    await tester.pumpAndSettle();
    expect(position.pixels, lessThan(before - 40));
    expect(replyCount, 0);
    expect(editCount, 0);
  });

  testWidgets('batched first move Offset(12, 40) scrolls instead of reply', (
    tester,
  ) async {
    var replyCount = 0;
    await tester.pumpWidget(
      _buildVerticalScrollApp(
        SwipeToReply(
          onReply: () => replyCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
        touchSlop: 8,
      ),
    );
    await tester.pumpAndSettle();
    final ScrollPosition position = _parentVerticalPosition(tester);
    position.jumpTo(300);
    await tester.pump();
    final double before = position.pixels;
    final TestGesture gesture = await tester.startGesture(
      _swipeBodyStart(tester),
    );
    await gesture.moveBy(const Offset(12, 40));
    await gesture.moveBy(const Offset(0, 120));
    await gesture.up();
    await tester.pumpAndSettle();
    expect(position.pixels, lessThan(before - 40));
    expect(replyCount, 0);
  });

  testWidgets('arched diagonal drag over swipe scrolls instead of reply', (
    tester,
  ) async {
    var replyCount = 0;
    await tester.pumpWidget(
      _buildVerticalScrollApp(
        SwipeToReply(
          onReply: () => replyCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
        touchSlop: 8,
      ),
    );
    await tester.pumpAndSettle();
    final ScrollPosition position = _parentVerticalPosition(tester);
    position.jumpTo(300);
    await tester.pump();
    final double before = position.pixels;
    final TestGesture gesture = await tester.startGesture(
      _swipeBodyStart(tester),
    );
    await gesture.moveBy(const Offset(-20, 16));
    await gesture.moveBy(const Offset(-6, 80));
    await gesture.up();
    await tester.pumpAndSettle();
    expect(position.pixels, lessThan(before - 40));
    expect(replyCount, 0);
  });

  testWidgets('committed leftward swipe keeps tracking after a vertical arc', (
    tester,
  ) async {
    var replyCount = 0;
    await tester.pumpWidget(
      _buildApp(
        SwipeToReply(
          onReply: () => replyCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
      ),
    );
    final Offset start = _swipeBodyStart(tester);
    final TestGesture gesture = await tester.startGesture(start);
    await gesture.moveBy(const Offset(-40, 0));
    await tester.pump();
    await gesture.moveBy(const Offset(-80, 200));
    await gesture.up();
    await tester.pumpAndSettle();
    expect(replyCount, 1);
  });

  testWidgets('coasting defer drops swipe so it does not reply', (
    tester,
  ) async {
    var replyCount = 0;
    await tester.pumpWidget(
      _buildApp(
        DeferHorizontalDragWhileCoasting(
          defer: true,
          child: SwipeToReply(
            onReply: () => replyCount++,
            child: const ColoredBox(color: Color(0xFF112233)),
          ),
        ),
      ),
    );
    await _slowDrag(tester, _swipeBodyStart(tester), const Offset(-160, 0));
    await tester.pumpAndSettle();
    expect(replyCount, 0);
  });

  testWidgets('leftward reply then later vertical drag still scrolls', (
    tester,
  ) async {
    var replyCount = 0;
    await tester.pumpWidget(
      _buildVerticalScrollApp(
        SwipeToReply(
          onReply: () => replyCount++,
          child: const ColoredBox(color: Color(0xFF112233)),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final Offset start = _swipeBodyStart(tester);
    await _slowDrag(tester, start, const Offset(-160, 0));
    await tester.pumpAndSettle();
    expect(replyCount, 1);

    final ScrollPosition position = _parentVerticalPosition(tester);
    position.jumpTo(300);
    await tester.pump();
    final double before = position.pixels;
    await _slowDrag(tester, start, const Offset(0, 180));
    await tester.pumpAndSettle();
    expect(position.pixels, lessThan(before - 40));
    expect(replyCount, 1);
  });
}

Widget _buildVerticalScrollApp(Widget child, {double touchSlop = 18}) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: MediaQuery(
      data: MediaQueryData(
        size: const Size(400, 800),
        gestureSettings: DeviceGestureSettings(touchSlop: touchSlop),
      ),
      child: Scaffold(
        body: ListView(
          children: <Widget>[
            const SizedBox(height: 400),
            SizedBox(
              key: const ValueKey<String>('swipeViewport'),
              height: 80,
              child: child,
            ),
            const SizedBox(height: 1200),
          ],
        ),
      ),
    ),
  );
}

ScrollPosition _parentVerticalPosition(WidgetTester tester) {
  return tester.state<ScrollableState>(find.byType(Scrollable)).position;
}

Offset _swipeBodyStart(WidgetTester tester) {
  final BuildContext ctx = tester.element(
    find.byKey(const ValueKey<String>('swipeViewport')),
  );
  final double reserve = leadingEdgeHorizontalSwipeReserveWidth(ctx);
  final RenderBox viewport =
      tester.renderObject(find.byKey(const ValueKey<String>('swipeViewport')))
          as RenderBox;
  return viewport.localToGlobal(Offset(reserve + 40, viewport.size.height / 2));
}
