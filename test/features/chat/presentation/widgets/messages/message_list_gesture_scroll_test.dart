import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_row_layout.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/presentation/swipe_constants.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/gestures/axis_locking_horizontal_drag_recognizer.dart';
import 'package:fluxer_app/shared/gestures/defer_horizontal_drag_while_coasting.dart';
import 'package:fluxer_app/shared/gestures/horizontal_drag_axis_lock.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/pump_fluxer_app.dart';
import 'message_list_test_harness.dart';

class _ParentHorizontalProbe {
  int starts = 0;
  double dx = 0;
}

void main() {
  group('vertical scroll still works', () {
    testWidgets('slow downward drag on a message body moves toward older', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(0, 180));
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 40));
      await disposeMessageList(tester);
    });

    testWidgets('slow upward drag on a message body moves toward newer', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(0, -180));
      expect(
        messageListScrollPosition(tester).pixels,
        greaterThan(before + 40),
      );
      await disposeMessageList(tester);
    });

    testWidgets('short vertical nudge just past slop scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      final TestGesture gesture = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await gesture.moveBy(const Offset(0, 24));
      await gesture.moveBy(const Offset(0, 80));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 20));
      await disposeMessageList(tester);
    });

    testWidgets('coalesced straight vertical jump scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      final TestGesture gesture = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await gesture.moveBy(const Offset(0, 80));
      await gesture.moveBy(const Offset(8, 120));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 20));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('near-vertical coalesced jump with small dx scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      final TestGesture gesture = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await gesture.moveBy(const Offset(12, 80));
      await gesture.moveBy(const Offset(0, 80));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 20));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('sideways start then vertical still scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      final TestGesture gesture = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await gesture.moveBy(const Offset(-8, 6));
      await tester.pump();
      await gesture.moveBy(const Offset(-12, 40));
      await gesture.moveBy(const Offset(0, 120));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 20));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('vertical fling moves the list both ways', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double mid = messageListScrollPosition(tester).pixels;
      await tester.fling(messageListScrollable(), const Offset(0, 280), 1800);
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, lessThan(mid));
      await tester.fling(messageListScrollable(), const Offset(0, -280), 1800);
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, greaterThan(mid - 80));
      await disposeMessageList(tester);
    });

    testWidgets('drag from avatar, markdown, padding, and leading reserve', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final Rect item = tester.getRect(
        messageItemFor(centerVisibleMessageItemId(tester)),
      );
      final List<Offset> starts = <Offset>[
        Offset(item.left + kMessageRowPaddingHorizontal + 20, item.center.dy),
        Offset(item.center.dx, item.center.dy),
        Offset(item.right - 12, item.center.dy),
        Offset(item.left + 8, item.center.dy),
      ];
      for (final Offset start in starts) {
        await _jumpToMid(tester);
        final double before = messageListScrollPosition(tester).pixels;
        await _slowDrag(tester, start, const Offset(0, 140));
        expect(
          messageListScrollPosition(tester).pixels,
          lessThan(before - 20),
          reason: 'start $start',
        );
      }
      await disposeMessageList(tester);
    });

    testWidgets('scrolls when swipe-to-reply is disabled', (
      WidgetTester tester,
    ) async {
      await _pumpList(
        tester,
        wrapList: (Widget list) {
          return ChatSwipeToReplyScope(enabled: false, child: list);
        },
      );
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(0, 180));
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 40));
      await disposeMessageList(tester);
    });

    testWidgets('underfilled list does not hang the arena', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester, count: 3);
      final ScrollPosition position = messageListScrollPosition(tester);
      await tester.drag(messageListScrollable(), const Offset(0, 120));
      await tester.pump();
      await tester.drag(messageListScrollable(), const Offset(0, -120));
      await tester.pump();
      expect(position.pixels, isA<double>());
      await disposeMessageList(tester);
    });
  });

  group('Android batched first-move', () {
    for (final double slop in <double>[8, 18]) {
      for (final Offset first in <Offset>[
        const Offset(12, 40),
        const Offset(-12, 40),
        const Offset(12, -40),
      ]) {
        testWidgets('first move $first at slop $slop scrolls', (
          WidgetTester tester,
        ) async {
          await _pumpList(tester, touchSlop: slop);
          await _jumpToMid(tester);
          final double before = messageListScrollPosition(tester).pixels;
          final TestGesture gesture = await tester.startGesture(
            _messageBodyStart(tester),
          );
          await gesture.moveBy(first);
          await gesture.moveBy(Offset(0, first.dy.isNegative ? -120 : 120));
          await gesture.up();
          await tester.pumpAndSettle();
          if (first.dy > 0) {
            expect(
              messageListScrollPosition(tester).pixels,
              lessThan(before - 20),
            );
          } else {
            expect(
              messageListScrollPosition(tester).pixels,
              greaterThan(before + 20),
            );
          }
          expect(_replying(tester), isNull);
          await disposeMessageList(tester);
        });
      }
    }

    testWidgets('tiny incremental diagonal still scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      final TestGesture gesture = await tester.startGesture(
        _messageBodyStart(tester),
      );
      for (int i = 0; i < 12; i += 1) {
        await gesture.moveBy(const Offset(1, 4));
      }
      await gesture.up();
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 20));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });
  });

  group('diagonal axis lock', () {
    testWidgets('vertical-dominant just past slop yields to scroll', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(10, 40));
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 8));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('leftward-dominant still replies', (WidgetTester tester) async {
      await _pumpList(tester);
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(-160, 8));
      await tester.pumpAndSettle();
      expect(_replying(tester), isNotNull);
      await disposeMessageList(tester);
    });

    testWidgets('noisy first move Offset(36, 10) still scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      final TestGesture gesture = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await gesture.moveBy(const Offset(36, 10));
      await gesture.moveBy(const Offset(0, 120));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 20));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('fast coalesced arc Offset(80, 16) still scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      final TestGesture gesture = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await gesture.moveBy(const Offset(80, 16));
      await gesture.moveBy(const Offset(0, 160));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 20));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('fast diagonal fling still scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      await tester.flingFrom(
        _messageBodyStart(tester),
        const Offset(48, 240),
        2200,
      );
      await tester.pumpAndSettle();
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 40));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('arched diagonal drag still scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      final TestGesture gesture = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await gesture.moveBy(const Offset(-16, 12));
      await gesture.moveBy(const Offset(-8, 40));
      await gesture.moveBy(const Offset(4, 80));
      await gesture.up();
      await tester.pump();
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 40));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('near-equal dx/dy at slop does not freeze later scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      final TestGesture first = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await first.moveBy(const Offset(20, 20));
      await first.up();
      await tester.pumpAndSettle();
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(0, 160));
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 40));
      await disposeMessageList(tester);
    });
  });

  group('competing recognizers', () {
    testWidgets('drag before long-press timeout still scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      final TestGesture gesture = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await tester.pump(const Duration(milliseconds: 100));
      await gesture.moveBy(const Offset(0, 40));
      await gesture.moveBy(const Offset(0, 40));
      await gesture.moveBy(const Offset(0, 80));
      await gesture.up();
      await tester.pumpAndSettle();
      expect(
        (messageListScrollPosition(tester).pixels - before).abs(),
        greaterThan(20),
      );
      await disposeMessageList(tester);
    });

    testWidgets('pointer cancel leaves the next vertical drag working', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      final TestGesture cancelled = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await cancelled.moveBy(const Offset(0, 40));
      await cancelled.cancel();
      await tester.pump();
      final double before = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(0, 160));
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 40));
      await disposeMessageList(tester);
    });

    testWidgets(
      'second pointer down does not kill later single-finger scroll',
      (WidgetTester tester) async {
        await _pumpList(tester);
        await _jumpToMid(tester);
        final Offset start = _messageBodyStart(tester);
        final TestGesture first = await tester.startGesture(start, pointer: 1);
        await first.moveBy(const Offset(0, 40));
        final TestGesture second = await tester.startGesture(
          start + const Offset(24, 0),
          pointer: 2,
        );
        await second.up();
        await first.up();
        await tester.pump();
        final double before = messageListScrollPosition(tester).pixels;
        await _slowDrag(tester, start, const Offset(0, 160));
        expect(messageListScrollPosition(tester).pixels, lessThan(before - 40));
        await disposeMessageList(tester);
      },
    );

    testWidgets('unfocus on pointer-down still starts a user drag', (
      WidgetTester tester,
    ) async {
      final FocusNode focus = FocusNode();
      addTearDown(focus.dispose);
      var sawUserDrag = false;
      await _pumpList(
        tester,
        wrapList: (Widget list) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 48,
                child: TextField(focusNode: focus, autofocus: true),
              ),
              Expanded(
                child: NotificationListener<ScrollStartNotification>(
                  onNotification: (ScrollStartNotification notification) {
                    if (notification.dragDetails != null) {
                      sawUserDrag = true;
                    }
                    return false;
                  },
                  child: Listener(
                    behavior: HitTestBehavior.translucent,
                    onPointerDown: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    child: list,
                  ),
                ),
              ),
            ],
          );
        },
      );
      await tester.pump();
      expect(focus.hasFocus, isTrue);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(0, 160));
      expect(focus.hasFocus, isFalse);
      expect(sawUserDrag, isTrue);
      expect(messageListScrollPosition(tester).pixels, lessThan(before - 40));
      await disposeMessageList(tester);
    });
  });

  group('stacked drawer + swipe + list', () {
    testWidgets(
      'vertical drag scrolls and does not start a parent horizontal',
      (WidgetTester tester) async {
        final _ParentHorizontalProbe probe = _ParentHorizontalProbe();
        await _pumpList(
          tester,
          wrapList: (Widget list) => _wrapParentHorizontal(probe, list),
        );
        await _jumpToMid(tester);
        final double before = messageListScrollPosition(tester).pixels;
        await _slowDrag(
          tester,
          _messageBodyStart(tester),
          const Offset(0, 180),
        );
        expect(messageListScrollPosition(tester).pixels, lessThan(before - 40));
        expect(probe.starts, 0);
        await disposeMessageList(tester);
      },
    );

    testWidgets('leftward drag replies without starting a parent horizontal', (
      WidgetTester tester,
    ) async {
      final _ParentHorizontalProbe probe = _ParentHorizontalProbe();
      await _pumpList(
        tester,
        wrapList: (Widget list) => _wrapParentHorizontal(probe, list),
      );
      final double beforePixels = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(-180, 0));
      await tester.pumpAndSettle();
      expect(_replying(tester), isNotNull);
      expect(probe.starts, 0);
      expect(messageListScrollPosition(tester).pixels, beforePixels);
      await disposeMessageList(tester);
    });

    testWidgets('rightward drag yields to the parent without scrolling', (
      WidgetTester tester,
    ) async {
      final _ParentHorizontalProbe probe = _ParentHorizontalProbe();
      await _pumpList(
        tester,
        wrapList: (Widget list) => _wrapParentHorizontal(probe, list),
      );
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(180, 0));
      await tester.pump();
      expect(probe.starts, 1);
      expect(probe.dx, greaterThan(80));
      expect(messageListScrollPosition(tester).pixels, before);
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('vertical drag still works after a parent horizontal gesture', (
      WidgetTester tester,
    ) async {
      final _ParentHorizontalProbe probe = _ParentHorizontalProbe();
      await _pumpList(
        tester,
        wrapList: (Widget list) => _wrapParentHorizontal(probe, list),
      );
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(180, 0));
      await tester.pump();
      expect(probe.starts, 1);
      await _jumpToMid(tester);
      final double before = messageListScrollPosition(tester).pixels;
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(0, 180));
      expect(
        (messageListScrollPosition(tester).pixels - before).abs(),
        greaterThan(20),
      );
      await disposeMessageList(tester);
    });
  });

  group('catch fling', () {
    testWidgets('second vertical swipe while coasting continues the scroll', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      await tester.fling(messageListScrollable(), const Offset(0, 300), 3000);
      await tester.pump(const Duration(milliseconds: 40));
      final ScrollPosition position = messageListScrollPosition(tester);
      expect(position.isScrollingNotifier.value, isTrue);
      expect(_coastDefer(tester), isTrue);
      final TestGesture boost = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await tester.pump();
      final double held = position.pixels;
      await boost.moveBy(const Offset(-20, 50));
      await boost.moveBy(const Offset(-10, 90));
      await boost.up();
      await tester.pump();
      expect(position.pixels, lessThan(held - 20));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('leftward-dominant boost while coasting still scrolls', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      await tester.fling(messageListScrollable(), const Offset(0, 300), 3000);
      await tester.pump(const Duration(milliseconds: 40));
      expect(_coastDefer(tester), isTrue);
      final ScrollPosition position = messageListScrollPosition(tester);
      final double held = position.pixels;
      final TestGesture boost = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await boost.moveBy(const Offset(-40, 30));
      await boost.moveBy(const Offset(0, 100));
      await boost.up();
      await tester.pump();
      expect(position.pixels, lessThan(held - 20));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('opposite vertical drag while coasting reverses the list', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await _jumpToMid(tester);
      await tester.fling(messageListScrollable(), const Offset(0, 300), 3000);
      await tester.pump(const Duration(milliseconds: 40));
      expect(_coastDefer(tester), isTrue);
      final ScrollPosition position = messageListScrollPosition(tester);
      final double held = position.pixels;
      final TestGesture reverse = await tester.startGesture(
        _messageBodyStart(tester),
      );
      await reverse.moveBy(const Offset(8, -50));
      await reverse.moveBy(const Offset(0, -120));
      await reverse.up();
      await tester.pump();
      expect(position.pixels, greaterThan(held + 20));
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });

    testWidgets('leftward swipe while coasting does not reply', (
      WidgetTester tester,
    ) async {
      await _pumpList(tester);
      await tester.fling(messageListScrollable(), const Offset(0, 300), 3000);
      await tester.pump(const Duration(milliseconds: 40));
      expect(
        messageListScrollPosition(tester).isScrollingNotifier.value,
        isTrue,
      );
      expect(_coastDefer(tester), isTrue);
      await _slowDrag(tester, _messageBodyStart(tester), const Offset(-160, 0));
      await tester.pumpAndSettle();
      expect(_replying(tester), isNull);
      await disposeMessageList(tester);
    });
  });
}

Future<void> _pumpList(
  WidgetTester tester, {
  double touchSlop = 18,
  int count = 60,
  Widget Function(Widget list)? wrapList,
  List<Override> extraOverrides = const <Override>[],
}) async {
  tester.view.physicalSize = const Size(420, 640);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  final InstrumentedChatViewModel chatViewModel = InstrumentedChatViewModel(
    detachedState(seedMessages(count), hasMoreNewer: false),
  );
  Widget list = Builder(
    builder: (BuildContext context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          gestureSettings: DeviceGestureSettings(touchSlop: touchSlop),
        ),
        child: const MessageList(expectedChannelId: messageListChannelId),
      );
    },
  );
  if (wrapList != null) {
    list = wrapList(list);
  }
  await tester.pumpWidget(
    messageListApp(
      database: openTestDatabase(),
      chatViewModel: chatViewModel,
      body: list,
      overrides: extraOverrides,
    ),
  );
  await pumpFluxerFrames(tester);
  for (int i = 0; i < 4; i += 1) {
    await tester.pump();
  }
  expect(find.byType(MessageItem), findsWidgets);
}

Widget _wrapParentHorizontal(_ParentHorizontalProbe probe, Widget list) {
  return RawGestureDetector(
    gestures: <Type, GestureRecognizerFactory>{
      AxisLockingHorizontalDragRecognizer:
          GestureRecognizerFactoryWithHandlers<
            AxisLockingHorizontalDragRecognizer
          >(
            () => AxisLockingHorizontalDragRecognizer(
              shouldDefer: (_) => false,
              shouldReject: (HorizontalDragAxisLockDecision decision) =>
                  decision == HorizontalDragAxisLockDecision.yieldToVertical,
            ),
            (AxisLockingHorizontalDragRecognizer recognizer) {
              recognizer
                ..onStart = (_) {
                  probe.starts++;
                }
                ..onUpdate = (DragUpdateDetails details) {
                  probe.dx += details.delta.dx;
                };
            },
          ),
    },
    child: list,
  );
}

Future<void> _jumpToMid(WidgetTester tester) async {
  final double older = messageListOldestRowOffset(tester);
  final double newer = messageListNewestRowOffset(tester);
  messageListScrollPosition(tester).jumpTo((older + newer) / 2);
  await tester.pump();
}

Future<void> _slowDrag(WidgetTester tester, Offset start, Offset total) async {
  final TestGesture gesture = await tester.startGesture(start);
  const int steps = 8;
  final Offset step = total / steps.toDouble();
  for (int i = 0; i < steps; i += 1) {
    await gesture.moveBy(step);
  }
  await gesture.up();
  await tester.pump();
}

Offset _messageBodyStart(WidgetTester tester) {
  final BuildContext context = tester.element(find.byType(MessageList));
  final double reserve = leadingEdgeHorizontalSwipeReserveWidth(context);
  final Rect item = tester.getRect(
    messageItemFor(centerVisibleMessageItemId(tester)),
  );
  return Offset(item.left + reserve + 40, item.center.dy);
}

String? _replying(WidgetTester tester) {
  final InstrumentedChatViewModel model =
      ProviderScope.containerOf(
            tester.element(find.byType(MessageList)),
          ).read(chatViewModelProvider.notifier)
          as InstrumentedChatViewModel;
  return model.testState.replyingTo?.id;
}

bool _coastDefer(WidgetTester tester) {
  return tester
      .widget<DeferHorizontalDragWhileCoasting>(
        find.byType(DeferHorizontalDragWhileCoasting),
      )
      .defer;
}
