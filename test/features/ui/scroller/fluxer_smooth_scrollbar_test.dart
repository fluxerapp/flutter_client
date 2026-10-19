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
      final Container thumb = tester.widget<Container>(
        find.byKey(const Key('fluxer_smooth_scrollbar_thumb')),
      );
      return thumb.constraints!.maxHeight;
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

    final Finder thumb = find.byKey(const Key('fluxer_smooth_scrollbar_thumb'));
    expect(thumb, findsOneWidget);

    final double initialThumbExtent = tester
        .widget<Container>(thumb)
        .constraints!
        .maxHeight;

    await tester.drag(find.byType(Scrollable), const Offset(0, -200));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    final double scrolledThumbExtent = tester
        .widget<Container>(thumb)
        .constraints!
        .maxHeight;
    expect((scrolledThumbExtent - initialThumbExtent).abs(), lessThan(8));

    final ScrollPosition position = controller.position;
    expect(
      initialThumbExtent,
      closeTo(
        fluxerSmoothScrollbarThumbExtent(
          trackLength: 300,
          viewportDimension: position.viewportDimension,
          scrollableExtent: position.maxScrollExtent - position.minScrollExtent,
        ),
        8,
      ),
    );
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

    final Container thumb = tester.widget<Container>(
      find.byKey(const Key('fluxer_smooth_scrollbar_thumb')),
    );
    final EdgeInsets margin = thumb.margin! as EdgeInsets;
    expect(margin.top, greaterThan(150));
  });

  testWidgets('dragging thumb changes scroll offset', (tester) async {
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
    await tester.pump();
    await tester.pump();

    await tester.drag(find.byType(Scrollable), const Offset(0, -40));
    await tester.pump();
    await tester.pump();
    final double offsetAfterScroll = controller.offset;

    final Offset thumbCenter = tester.getCenter(
      find.byKey(const Key('fluxer_smooth_scrollbar_thumb')),
    );
    final TestGesture gesture = await tester.startGesture(thumbCenter);
    await gesture.moveBy(const Offset(0, 80));
    await tester.pump();

    expect(controller.offset, greaterThan(offsetAfterScroll));
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
