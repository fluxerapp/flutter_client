import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/fullscreen_flow/fluxer_fullscreen_flow.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

Future<BuildContext> _pumpHost(WidgetTester tester) async {
  tester.view.physicalSize = const Size(402 * 3, 874 * 3);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
  final colorTheme = buildDarkColorTheme();
  late BuildContext ctx;
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
  return ctx;
}

Widget _rows() => ListView(
  children: <Widget>[
    for (int i = 0; i < 40; i++) SizedBox(height: 60, child: Text('Row $i')),
  ],
);

Future<ValueGetter<bool>> _show(
  WidgetTester tester,
  WidgetBuilder builder,
) async {
  final BuildContext ctx = await _pumpHost(tester);
  bool closed = false;
  unawaited(
    FluxerFullscreenFlow.show<void>(
      ctx,
      builder: builder,
    ).whenComplete(() => closed = true),
  );
  await tester.pumpAndSettle();
  return () => closed;
}

class _TwoStepFlow extends StatefulWidget {
  const _TwoStepFlow();

  @override
  State<_TwoStepFlow> createState() => _TwoStepFlowState();
}

class _TwoStepFlowState extends State<_TwoStepFlow> {
  bool _second = false;

  @override
  Widget build(BuildContext context) {
    return FluxerFlowNavigator(
      onDidRemovePage: (Page<Object?> page) {
        if (page.key == const ValueKey<String>('second')) {
          setState(() => _second = false);
        }
      },
      pages: <Page<void>>[
        fluxerFlowPage(
          key: const ValueKey<String>('first'),
          child: FluxerFlowStep(
            title: 'First',
            isFirst: true,
            onLeading: () => Navigator.of(context).pop(),
            action: TextButton(
              onPressed: () => setState(() => _second = true),
              child: const Text('Next'),
            ),
            child: const SizedBox(height: 40),
          ),
        ),
        if (_second)
          fluxerFlowPage(
            key: const ValueKey<String>('second'),
            child: FluxerFlowStep(
              title: 'Second',
              isFirst: false,
              onLeading: () => setState(() => _second = false),
              child: const SizedBox(height: 40),
            ),
          ),
      ],
    );
  }
}

void main() {
  group('iOS', () {
    testWidgets('swiping down on content at the top dismisses the flow', (
      WidgetTester tester,
    ) async {
      final ValueGetter<bool> closed = await _show(
        tester,
        (_) => FluxerPushPage(title: 'Flow', body: _rows()),
      );
      expect(find.text('Row 3'), findsOneWidget);

      await tester.drag(find.text('Row 3'), const Offset(0, 600));
      await tester.pumpAndSettle();

      expect(closed(), isTrue);
      expect(find.text('Flow'), findsNothing);
    }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

    testWidgets('swiping down on the header dismisses the flow', (
      WidgetTester tester,
    ) async {
      await _show(tester, (_) => FluxerPushPage(title: 'Flow', body: _rows()));

      await tester.drag(find.text('Flow'), const Offset(0, 600));
      await tester.pumpAndSettle();

      expect(find.text('Flow'), findsNothing);
    }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

    testWidgets('a short swipe down settles back open', (
      WidgetTester tester,
    ) async {
      await _show(tester, (_) => FluxerPushPage(title: 'Flow', body: _rows()));

      await tester.timedDrag(
        find.text('Row 3'),
        const Offset(0, 120),
        const Duration(milliseconds: 800),
      );
      await tester.pumpAndSettle();

      expect(find.text('Flow'), findsOneWidget);
      expect(tester.getTopLeft(find.text('Flow')).dy, lessThan(120));
    }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

    testWidgets('a scrolled list scrolls back before dismissing', (
      WidgetTester tester,
    ) async {
      await _show(tester, (_) => FluxerPushPage(title: 'Flow', body: _rows()));
      await tester.drag(find.text('Row 6'), const Offset(0, -900));
      await tester.pumpAndSettle();
      expect(find.text('Row 0'), findsNothing);

      await tester.timedDrag(
        find.text('Row 20'),
        const Offset(0, 300),
        const Duration(milliseconds: 800),
      );
      await tester.pumpAndSettle();

      expect(find.text('Flow'), findsOneWidget);
    }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));

    testWidgets('swiping down on a later step dismisses the whole flow', (
      WidgetTester tester,
    ) async {
      await _show(tester, (_) => const _TwoStepFlow());
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();
      expect(find.text('Second'), findsOneWidget);

      await tester.drag(find.text('Second'), const Offset(0, 600));
      await tester.pumpAndSettle();

      expect(find.text('Second'), findsNothing);
      expect(find.text('First'), findsNothing);
    }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));
  });

  group('Android', () {
    testWidgets('system back steps back, then closes the flow', (
      WidgetTester tester,
    ) async {
      await _show(tester, (_) => const _TwoStepFlow());
      await tester.tap(find.text('Next'));
      await tester.pumpAndSettle();

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('Second'), findsNothing);
      expect(find.text('First'), findsOneWidget);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();
      expect(find.text('First'), findsNothing);
    }, variant: TargetPlatformVariant.only(TargetPlatform.android));

    testWidgets('swiping down does not dismiss', (WidgetTester tester) async {
      await _show(tester, (_) => FluxerPushPage(title: 'Flow', body: _rows()));

      await tester.drag(find.text('Flow'), const Offset(0, 600));
      await tester.pumpAndSettle();

      expect(find.text('Flow'), findsOneWidget);
    }, variant: TargetPlatformVariant.only(TargetPlatform.android));
  });
}
