import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_header.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_secrets_section.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

Widget _app(Widget child) {
  final colorTheme = buildLightColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(16), child: child),
      ),
    ),
  );
}

void main() {
  testWidgets('copy ID sits inset inside the field without a seam', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _app(
        ApplicationHeader(
          name: 'Bot',
          applicationId: '1472966805036568643',
          onBack: () {},
          onCopyId: () {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final Rect field = tester.getRect(find.byType(InputDecorator));
    final Rect button = tester.getRect(
      find.ancestor(
        of: find.text(testL10n.applicationsCopyId),
        matching: find.byType(AnimatedContainer),
      ),
    );
    expect(field.contains(button.center), isTrue);
    expect(field.right - button.right, greaterThanOrEqualTo(4));
    expect(button.top - field.top, greaterThan(0));
    expect(field.bottom - button.bottom, greaterThan(0));
    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is SizedBox &&
            widget.width == 1 &&
            widget.child is ColoredBox,
      ),
      findsNothing,
    );
  });

  testWidgets('regenerate sits below the secret field like web', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      _app(
        ApplicationSecretsSection(
          clientSecret: null,
          botToken: null,
          hasBot: true,
          isRotatingClient: false,
          isRotatingBot: false,
          onRegenerateClientSecret: () {},
          onRegenerateBotToken: () {},
        ),
      ),
    );
    await tester.pumpAndSettle();

    final List<Rect> fields = tester
        .widgetList(find.byType(InputDecorator))
        .map((Widget widget) => tester.getRect(find.byWidget(widget)))
        .toList();
    final List<Rect> buttons = tester
        .widgetList(
          find.ancestor(
            of: find.text(testL10n.applicationsRegenerate),
            matching: find.byType(FluxerButton),
          ),
        )
        .map((Widget widget) => tester.getRect(find.byWidget(widget)))
        .toList();
    expect(fields, hasLength(2));
    expect(buttons, hasLength(2));
    for (int i = 0; i < 2; i++) {
      expect(buttons[i].top, greaterThanOrEqualTo(fields[i].bottom));
      expect(buttons[i].left, fields[i].left);
    }
  });
}
