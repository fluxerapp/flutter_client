import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_scroll_metrics.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_viewport.dart';
import 'package:fluxer_app/features/chat/providers/core/message_pagination_coordinator.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/defer_horizontal_drag_while_coasting.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/pump_fluxer_app.dart';
import 'message_list_test_harness.dart';

class _CountingCoordinator extends MessagePaginationCoordinator {
  _CountingCoordinator(super.ref);

  int demandEvents = 0;

  @override
  void onDemandChanged(DemandChanged event) {
    demandEvents += 1;
    super.onDemandChanged(event);
  }
}

void main() {
  group('isPixelOnlyScrollMetricsChange', () {
    test('first attach is not pixel-only', () {
      expect(
        isPixelOnlyScrollMetricsChange(
          viewportDimension: 640,
          minScrollExtent: 0,
          maxScrollExtent: 4000,
          lastViewportDimension: null,
          lastMinScrollExtent: null,
          lastMaxScrollExtent: null,
        ),
        isFalse,
      );
      expect(
        isPixelOnlyScrollMetricsChange(
          viewportDimension: 640,
          minScrollExtent: 0,
          maxScrollExtent: 4000,
          lastViewportDimension: 640,
          lastMinScrollExtent: 0,
          lastMaxScrollExtent: null,
        ),
        isFalse,
      );
    });

    test('unchanged viewport and extent is pixel-only', () {
      expect(
        isPixelOnlyScrollMetricsChange(
          viewportDimension: 640,
          minScrollExtent: 0,
          maxScrollExtent: 4000,
          lastViewportDimension: 640,
          lastMinScrollExtent: 0,
          lastMaxScrollExtent: 4000,
        ),
        isTrue,
      );
    });

    test('viewport resize is not pixel-only', () {
      expect(
        isPixelOnlyScrollMetricsChange(
          viewportDimension: 400,
          minScrollExtent: 0,
          maxScrollExtent: 4000,
          lastViewportDimension: 640,
          lastMinScrollExtent: 0,
          lastMaxScrollExtent: 4000,
        ),
        isFalse,
      );
    });

    test('content extent jump is not pixel-only', () {
      expect(
        isPixelOnlyScrollMetricsChange(
          viewportDimension: 640,
          minScrollExtent: 0,
          maxScrollExtent: 5200,
          lastViewportDimension: 640,
          lastMinScrollExtent: 0,
          lastMaxScrollExtent: 4000,
        ),
        isFalse,
      );
    });

    test('min-extent jump is not pixel-only', () {
      expect(
        isPixelOnlyScrollMetricsChange(
          viewportDimension: 640,
          minScrollExtent: -800,
          maxScrollExtent: 4000,
          lastViewportDimension: 640,
          lastMinScrollExtent: 0,
          lastMaxScrollExtent: 4000,
        ),
        isFalse,
      );
    });

    test('sub-epsilon noise stays pixel-only', () {
      expect(
        isPixelOnlyScrollMetricsChange(
          viewportDimension: 640.4,
          minScrollExtent: 0.2,
          maxScrollExtent: 4000.4,
          lastViewportDimension: 640,
          lastMinScrollExtent: 0,
          lastMaxScrollExtent: 4000,
        ),
        isTrue,
      );
    });
  });

  group('message list scroll metrics', () {
    testWidgets('fling does not remount the viewport or bump anchorEpoch', (
      WidgetTester tester,
    ) async {
      await pumpBottomList(tester, hasMoreNewer: false, count: 80);
      _jumpToLoadedMid(tester);
      await tester.pump();
      final int epoch = messageListAnchorEpoch(tester);
      final Element viewport = tester.element(find.byType(MessageListViewport));
      await tester.fling(messageListScrollable(), const Offset(0, 280), 1800);
      for (int i = 0; i < 12; i += 1) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      expect(messageListAnchorEpoch(tester), epoch);
      expect(tester.element(find.byType(MessageListViewport)), same(viewport));
      expect(viewport.dirty, isFalse);
      await disposeMessageList(tester);
    });

    testWidgets('coasting flag flip does not dirty MessageListViewport', (
      WidgetTester tester,
    ) async {
      await pumpBottomList(tester, hasMoreNewer: false, count: 80);
      _jumpToLoadedMid(tester);
      await tester.pump();
      await tester.fling(messageListScrollable(), const Offset(0, 300), 3000);
      await tester.pump(const Duration(milliseconds: 40));
      expect(
        tester
            .widget<DeferHorizontalDragWhileCoasting>(
              find.byType(DeferHorizontalDragWhileCoasting),
            )
            .defer,
        isTrue,
      );
      final Element viewport = tester.element(find.byType(MessageListViewport));
      await tester.pump(const Duration(milliseconds: 16));
      expect(tester.element(find.byType(MessageListViewport)), same(viewport));
      expect(viewport.dirty, isFalse);
      await disposeMessageList(tester);
    });

    testWidgets('fling demand events stay near one publish per edge per frame', (
      WidgetTester tester,
    ) async {
      late _CountingCoordinator counting;
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      final InstrumentedChatViewModel chatViewModel = InstrumentedChatViewModel(
        detachedState(seedMessages(80), hasMoreNewer: true),
      );
      await tester.pumpWidget(
        messageListApp(
          database: openTestDatabase(),
          chatViewModel: chatViewModel,
          overrides: <Override>[
            messagePaginationCoordinatorProvider.overrideWith((Ref ref) {
              counting = _CountingCoordinator(ref);
              ref.onDispose(counting.dispose);
              return counting;
            }),
          ],
        ),
      );
      await pumpFluxerFrames(tester);
      for (int i = 0; i < 4; i += 1) {
        await tester.pump();
      }
      _jumpToLoadedMid(tester);
      await tester.pump();
      await tester.fling(messageListScrollable(), const Offset(0, 280), 1800);
      await tester.pump(const Duration(milliseconds: 16));
      final int before = counting.demandEvents;
      const int frames = 12;
      for (int i = 0; i < frames; i += 1) {
        await tester.pump(const Duration(milliseconds: 16));
      }
      final int added = counting.demandEvents - before;
      expect(
        added,
        lessThan(frames * 3),
        reason:
            'pixel-only metrics must not duplicate demand publishes each frame',
      );
      await disposeMessageList(tester);
    });

    testWidgets('viewport shrink still republishes after a real size change', (
      WidgetTester tester,
    ) async {
      await pumpBottomList(tester, hasMoreNewer: false, count: 40);
      final double before = tester.view.physicalSize.height;
      tester.view.physicalSize = Size(tester.view.physicalSize.width, 360);
      addTearDown(() {
        tester.view.physicalSize = Size(tester.view.physicalSize.width, before);
      });
      await tester.pump();
      await tester.pump();
      expect(find.byType(MessageListViewport), findsOneWidget);
      await disposeMessageList(tester);
    });
  });
}

void _jumpToLoadedMid(WidgetTester tester) {
  final double older = messageListOldestRowOffset(tester);
  final double newer = messageListNewestRowOffset(tester);
  messageListScrollPosition(tester).jumpTo((older + newer) / 2);
}
