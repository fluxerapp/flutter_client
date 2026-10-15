import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_sheet_motion.dart';
import 'package:fluxer_app/features/ui/page_sheet/fluxer_page_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

const ValueKey<String> _shellKey = ValueKey<String>('shell-page');
const ValueKey<String> _pageSheetKey = ValueKey<String>('page-sheet-body');
const ValueKey<String> _innerSheetKey = ValueKey<String>('inner-sheet-body');

void main() {
  testWidgets('a sheet over a page sheet recedes only the page sheet', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(402 * 3, 874 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    final colorTheme = buildDarkColorTheme();
    late BuildContext shellContext;
    late BuildContext pageSheetContext;
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
          home: FluxerSheetBackdrop(
            child: Scaffold(
              body: Builder(
                builder: (BuildContext c) {
                  shellContext = c;
                  return const SizedBox.expand(key: _shellKey);
                },
              ),
            ),
          ),
        ),
      ),
    );

    unawaited(
      FluxerPageSheet.showScrollable<void>(
        shellContext,
        title: 'Settings',
        presentation: FluxerPageSheetPresentation.root,
        builder:
            (BuildContext c, ScrollController controller, VoidCallback close) {
              pageSheetContext = c;
              return ListView(
                key: _pageSheetKey,
                controller: controller,
                children: <Widget>[
                  for (int i = 0; i < 20; i++)
                    SizedBox(height: 60, child: Text('Row $i')),
                ],
              );
            },
      ),
    );
    await tester.pumpAndSettle();

    final Rect shellBefore = tester.getRect(find.byKey(_shellKey));
    final Rect pageSheetBefore = tester.getRect(find.byKey(_pageSheetKey));

    unawaited(
      FluxerBottomSheet.showScrollable<void>(
        pageSheetContext,
        title: 'Licence',
        useRootNavigator: true,
        builder: (BuildContext c, ScrollController controller, _) {
          return SingleChildScrollView(
            controller: controller,
            child: const SizedBox(key: _innerSheetKey, height: 2000),
          );
        },
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(_innerSheetKey), findsOneWidget);
    final Rect shellAfter = tester.getRect(find.byKey(_shellKey));
    final Rect pageSheetAfter = tester.getRect(find.byKey(_pageSheetKey));
    expect(shellAfter, rectMoreOrLessEquals(shellBefore));
    expect(pageSheetAfter.width, lessThan(pageSheetBefore.width * 0.95));
    expect(
      pageSheetAfter.center.dx,
      moreOrLessEquals(pageSheetBefore.center.dx),
    );

    Navigator.of(pageSheetContext, rootNavigator: true).pop();
    await tester.pumpAndSettle();
    expect(
      tester.getRect(find.byKey(_pageSheetKey)),
      rectMoreOrLessEquals(pageSheetBefore),
    );
    expect(
      tester.getRect(find.byKey(_shellKey)),
      rectMoreOrLessEquals(shellBefore),
    );
  }, variant: TargetPlatformVariant.only(TargetPlatform.iOS));
}
