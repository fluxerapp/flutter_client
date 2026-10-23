import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/scroller/fluxer_smooth_scrollbar.dart';
import 'package:fluxer_app/features/ui/scroller/fluxer_smooth_scrollbar_metrics.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Widget _buildApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}

double _thumbExtentForPosition(
  ScrollPosition position, {
  double? smoothedMinScrollExtent,
  double? smoothedMaxScrollExtent,
  double topInset = 0,
  double bottomInset = 0,
}) {
  final double smoothMin = smoothedMinScrollExtent ?? position.minScrollExtent;
  final double smoothMax = smoothedMaxScrollExtent ?? position.maxScrollExtent;
  final FixedScrollMetrics? metrics = fluxerSmoothScrollbarPaintMetrics(
    source: position,
    smoothedMinScrollExtent: smoothMin,
    smoothedMaxScrollExtent: smoothMax,
    pinTrailingEdge: false,
  );
  if (metrics == null) {
    return 0;
  }
  final double trackLength = fluxerSmoothScrollbarTrackLength(
    viewportDimension: position.viewportDimension,
    topInset: topInset,
    bottomInset: bottomInset,
  );
  return fluxerSmoothScrollbarThumbExtent(
    trackLength: trackLength,
    viewportDimension: position.viewportDimension,
    scrollableExtent: metrics.maxScrollExtent - metrics.minScrollExtent,
  );
}

Offset _thumbDragPoint(
  ScrollPosition position, {
  required double viewportWidth,
  double topInset = 0,
  double bottomInset = 0,
  bool pinTrailingEdge = false,
  double smoothedMinScrollExtent = 0,
  double? smoothedMaxScrollExtent,
}) {
  final double smoothMax = smoothedMaxScrollExtent ?? position.maxScrollExtent;
  final double fraction = fluxerSmoothScrollbarScrollFraction(
    pixels: position.pixels,
    minExtent: position.minScrollExtent,
    maxExtent: position.maxScrollExtent,
    pinTrailingEdge: pinTrailingEdge,
  );
  final double trackLength = fluxerSmoothScrollbarTrackLength(
    viewportDimension: position.viewportDimension,
    topInset: topInset,
    bottomInset: bottomInset,
  );
  final double thumbExtent = _thumbExtentForPosition(
    position,
    smoothedMinScrollExtent: smoothedMinScrollExtent,
    smoothedMaxScrollExtent: smoothMax,
    topInset: topInset,
    bottomInset: bottomInset,
  );
  final double thumbTop = fluxerSmoothScrollbarThumbOffset(
    fraction: fraction,
    topInset: topInset,
    trackLength: trackLength,
    thumbExtent: thumbExtent,
  );
  return Offset(viewportWidth - 4, thumbTop + thumbExtent / 2);
}

Future<void> _revealScrollbar(WidgetTester tester) async {
  await tester.drag(find.byType(Scrollable), const Offset(0, -40));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 250));
}

void main() {
  testWidgets('thumb is shorter for a longer list', (tester) async {
    Future<double> thumbHeight(int itemCount) async {
      final ScrollController controller = ScrollController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        _buildApp(
          SizedBox(
            height: 300,
            child: FluxerSmoothScrollbar(
              controller: controller,
              child: ListView.builder(
                controller: controller,
                itemCount: itemCount,
                itemBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 48);
                },
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      return _thumbExtentForPosition(controller.position);
    }

    final double shortList = await thumbHeight(8);
    final double longList = await thumbHeight(80);
    expect(longList, lessThan(shortList));
  });

  testWidgets('keeps thumb height stable while scrolling variable rows', (
    tester,
  ) async {
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _buildApp(
        SizedBox(
          height: 300,
          child: FluxerSmoothScrollbar(
            controller: controller,
            child: ListView.builder(
              controller: controller,
              itemCount: 40,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: index.isEven ? 24 : 96,
                  child: Text('row $index'),
                );
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final ScrollPosition position = controller.position;
    final double initialMax = position.maxScrollExtent;
    final double initialThumbExtent = _thumbExtentForPosition(
      position,
      smoothedMinScrollExtent: position.minScrollExtent,
      smoothedMaxScrollExtent: initialMax,
    );

    await tester.drag(find.byType(Scrollable), const Offset(0, -200));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    final double smoothedThumbExtent = _thumbExtentForPosition(
      controller.position,
      smoothedMinScrollExtent: controller.position.minScrollExtent,
      smoothedMaxScrollExtent: fluxerSmoothScrollbarLerpExtent(
        current: initialMax,
        target: controller.position.maxScrollExtent,
        snap: false,
      ),
    );

    expect((smoothedThumbExtent - initialThumbExtent).abs(), lessThan(8));
  });

  testWidgets('small scroll off a trailing anchor stays near the bottom', (
    tester,
  ) async {
    final ScrollController controller = ScrollController();
    final GlobalKey centerKey = GlobalKey();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _buildApp(
        SizedBox(
          height: 300,
          width: 240,
          child: FluxerSmoothScrollbar(
            controller: controller,
            child: CustomScrollView(
              controller: controller,
              center: centerKey,
              anchor: 1,
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) =>
                        SizedBox(height: 80, child: Text('old $index')),
                    childCount: 30,
                  ),
                ),
                SliverToBoxAdapter(
                  key: centerKey,
                  child: const SizedBox.shrink(),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    final ScrollPosition position = controller.position;
    position.jumpTo(position.maxScrollExtent - 80);
    await tester.pump();

    final Offset thumbPoint = _thumbDragPoint(position, viewportWidth: 240);
    expect(thumbPoint.dy, greaterThan(150));
  });

  testWidgets('programmatic scroll does not block pumpAndSettle', (
    tester,
  ) async {
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _buildApp(
        SizedBox(
          height: 300,
          child: FluxerSmoothScrollbar(
            controller: controller,
            pinTrailingEdge: true,
            child: ListView.builder(
              controller: controller,
              itemCount: 80,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(height: 48, child: Text('row $index'));
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    for (var i = 0; i < 8; i++) {
      controller.jumpTo(controller.position.maxScrollExtent - i * 12);
      await tester.pump();
    }
    await tester.pumpAndSettle();
  });

  testWidgets('dragging thumb tracks pointer movement', (tester) async {
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      _buildApp(
        SizedBox(
          height: 300,
          width: 200,
          child: FluxerSmoothScrollbar(
            controller: controller,
            child: ListView.builder(
              controller: controller,
              itemCount: 80,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(height: 48, child: Text('row $index'));
              },
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    await _revealScrollbar(tester);

    final ScrollPosition position = controller.position;
    final double offsetBefore = controller.offset;
    final double range = position.maxScrollExtent - position.minScrollExtent;
    final double trackLength = fluxerSmoothScrollbarTrackLength(
      viewportDimension: position.viewportDimension,
      topInset: 0,
      bottomInset: 0,
    );
    final double thumbExtent = _thumbExtentForPosition(position);
    final double thumbTravel = math.max(1, trackLength - thumbExtent);
    const double dragDelta = 40;

    final Offset start = _thumbDragPoint(position, viewportWidth: 200);
    final TestGesture gesture = await tester.startGesture(start);
    await gesture.moveBy(const Offset(0, dragDelta));
    await tester.pump();

    expect(
      controller.offset,
      closeTo(offsetBefore + dragDelta / thumbTravel * range, 24),
    );
    await gesture.up();
  });

  testWidgets('scrolling does not rebuild the child', (tester) async {
    final ScrollController controller = ScrollController();
    addTearDown(controller.dispose);
    var builds = 0;

    await tester.pumpWidget(
      _buildApp(
        SizedBox(
          height: 300,
          child: FluxerSmoothScrollbar(
            controller: controller,
            child: Builder(
              builder: (BuildContext context) {
                builds++;
                return ListView.builder(
                  controller: controller,
                  itemCount: 40,
                  itemBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 48);
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    final int buildsAfterLayout = builds;

    controller.jumpTo(120);
    await tester.pump();

    expect(builds, buildsAfterLayout);
  });
}
