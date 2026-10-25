import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_consent_sheet.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/test_l10n.dart';

void main() {
  testWidgets(
    'decline button keeps a gap above the navigation bar without a system inset',
    (tester) async {
      const Size screenSize = Size(400, 800);
      tester.view.physicalSize = screenSize;
      tester.view.devicePixelRatio = 1;
      tester.view.padding = FakeViewPadding.zero;
      tester.view.viewPadding = FakeViewPadding.zero;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);
      addTearDown(tester.view.resetPadding);
      addTearDown(tester.view.resetViewPadding);

      final colorTheme = buildDarkColorTheme();
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
                builder: (context) => ElevatedButton(
                  onPressed: () => unawaited(
                    showObservabilityReportingConsentSheet(context),
                  ),
                  child: const Text('Open'),
                ),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final double buttonBottom = tester
          .getRect(
            find
                .ancestor(
                  of: find.text(testL10n.observabilityReportingConsentDecline),
                  matching: find.byType(FluxerButton),
                )
                .first,
          )
          .bottom;
      expect(buttonBottom, lessThanOrEqualTo(screenSize.height - 16));
    },
  );
}
