import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/swipe_to_reply.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';

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
}
