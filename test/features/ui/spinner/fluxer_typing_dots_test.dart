import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_typing_dots.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration _kSlice = Duration(milliseconds: 16);
const Duration _kWindow = Duration(seconds: 2);

Widget _host(Widget child) => Directionality(
  textDirection: TextDirection.ltr,
  child: MediaQuery(
    data: const MediaQueryData(size: Size(400, 400)),
    child: Align(alignment: Alignment.topLeft, child: child),
  ),
);

const Widget _dots = FluxerTypingDots(color: Color(0xFFFFFFFF));

Future<int> _countRequestedFrames(WidgetTester tester) async {
  int frames = 0;
  for (Duration t = Duration.zero; t < _kWindow; t += _kSlice) {
    await tester.binding.delayed(_kSlice);
    if (tester.binding.hasScheduledFrame) {
      frames++;
      await tester.pump();
    }
  }
  return frames;
}

Future<void> _settle(WidgetTester tester) async {
  await tester.pump();
  await tester.pump();
}

double _progress(WidgetTester tester) {
  final CustomPaint paint = tester.widget<CustomPaint>(
    find.descendant(
      of: find.byType(FluxerTypingDots),
      matching: find.byType(CustomPaint),
    ),
  );
  return (paint.painter! as FluxerTypingDotsPainter).progress.value;
}

void main() {
  tearDown(() {
    TestWidgetsFlutterBinding.instance.handleAppLifecycleStateChanged(
      AppLifecycleState.resumed,
    );
  });

  testWidgets(
    'visible typing dots request at most 10 frames per second instead of one per vsync (#713)',
    (WidgetTester tester) async {
      await tester.pumpWidget(_host(_dots));
      await _settle(tester);

      final int frames = await _countRequestedFrames(tester);

      expect(frames, inInclusiveRange(18, 20));
    },
  );

  testWidgets(
    'two indicators mounted 50 ms apart share one clock instead of doubling the frame rate',
    (WidgetTester tester) async {
      final ValueNotifier<bool> showSecond = ValueNotifier<bool>(false);
      addTearDown(showSecond.dispose);
      await tester.pumpWidget(
        _host(
          ValueListenableBuilder<bool>(
            valueListenable: showSecond,
            builder: (_, bool second, _) =>
                Column(children: <Widget>[_dots, if (second) _dots]),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 50));
      showSecond.value = true;
      await _settle(tester);

      final int frames = await _countRequestedFrames(tester);

      expect(frames, inInclusiveRange(18, 20));
    },
  );

  testWidgets(
    'backgrounded typing dots stop stepping, so the timer does not keep waking the isolate',
    (WidgetTester tester) async {
      await tester.pumpWidget(_host(_dots));
      await _settle(tester);
      tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
      await _settle(tester);
      final double frozen = _progress(tester);

      expect(await _countRequestedFrames(tester), 0);
      expect(_progress(tester), frozen);
    },
  );

  testWidgets(
    'typing dots under TickerMode(enabled: false) request no frames (covered drawer pane)',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        _host(const TickerMode(enabled: false, child: _dots)),
      );
      await _settle(tester);

      expect(await _countRequestedFrames(tester), 0);
    },
  );

  testWidgets('typing dots resume when TickerMode is re-enabled', (
    WidgetTester tester,
  ) async {
    final ValueNotifier<bool> enabled = ValueNotifier<bool>(false);
    addTearDown(enabled.dispose);
    await tester.pumpWidget(
      _host(
        ValueListenableBuilder<bool>(
          valueListenable: enabled,
          builder: (_, bool on, Widget? child) =>
              TickerMode(enabled: on, child: child!),
          child: _dots,
        ),
      ),
    );
    await _settle(tester);
    enabled.value = true;
    await _settle(tester);

    expect(await _countRequestedFrames(tester), inInclusiveRange(18, 20));
  });

  testWidgets('typing dots scrolled offscreen request no frames', (
    WidgetTester tester,
  ) async {
    final ValueNotifier<double> top = ValueNotifier<double>(0);
    addTearDown(top.dispose);
    await tester.pumpWidget(
      _host(
        ClipRect(
          child: ValueListenableBuilder<double>(
            valueListenable: top,
            builder: (_, double offset, _) => Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Positioned(left: 0, top: offset, child: _dots),
              ],
            ),
          ),
        ),
      ),
    );
    await _settle(tester);
    top.value = 5000;
    await _settle(tester);

    expect(await _countRequestedFrames(tester), 0);
  });

  testWidgets('typing dots with animations disabled request no frames', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: MediaQueryData(size: Size(400, 400), disableAnimations: true),
          child: Align(alignment: Alignment.topLeft, child: _dots),
        ),
      ),
    );
    await _settle(tester);

    expect(await _countRequestedFrames(tester), 0);
  });
}
