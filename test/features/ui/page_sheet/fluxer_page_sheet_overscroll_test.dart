import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/page_sheet/fluxer_page_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

class _Relayout extends LeafRenderObjectWidget {
  const _Relayout(this.tick);

  final int tick;

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderRelayout();

  @override
  void updateRenderObject(BuildContext context, _RenderRelayout renderObject) {
    renderObject.markNeedsLayout();
  }
}

class _RenderRelayout extends RenderBox {
  @override
  void performLayout() {
    size = constraints.constrain(const Size(double.infinity, 20));
  }
}

class _Ticking extends StatefulWidget {
  const _Ticking();

  @override
  State<_Ticking> createState() => _TickingState();
}

class _TickingState extends State<_Ticking> {
  int _tick = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) => setState(() => _tick++),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _Relayout(_tick);
}

void main() {
  testWidgets('bottom overscroll survives a content relayout', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(402 * 3, 874 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    final colorTheme = buildDarkColorTheme();
    late BuildContext ctx;
    ScrollController? sc;
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Scaffold(
            body: Builder(
              builder: (BuildContext c) {
                ctx = c;
                return const SizedBox.expand();
              },
            ),
          ),
        ),
      ),
    );
    unawaited(
      FluxerPageSheet.showScrollable<void>(
        ctx,
        title: 'Profile',
        builder:
            (BuildContext c, ScrollController controller, VoidCallback close) {
              sc = controller;
              return SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: <Widget>[
                    const _Ticking(),
                    for (int i = 0; i < 40; i++)
                      SizedBox(height: 60, child: Text('Row $i')),
                  ],
                ),
              );
            },
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final ScrollPosition p = sc!.position;
    p.jumpTo(p.maxScrollExtent);
    await tester.pump();
    final Offset start = tester.getCenter(find.byType(SingleChildScrollView));
    final TestGesture gesture = await tester.startGesture(start);
    for (int i = 0; i < 12; i++) {
      await gesture.moveBy(const Offset(0, -20));
      await tester.pump(const Duration(milliseconds: 8));
    }
    await gesture.up();
    double previous = p.pixels - p.maxScrollExtent;
    expect(previous, greaterThan(60));
    for (int i = 0; i < 20; i++) {
      await tester.pump(const Duration(milliseconds: 16));
      final double overscroll = p.pixels - p.maxScrollExtent;
      expect(previous - overscroll, lessThan(12));
      previous = overscroll;
    }
    expect(previous, greaterThan(0));
    Navigator.of(ctx).pop();
    await tester.pump(const Duration(seconds: 2));
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));
}
