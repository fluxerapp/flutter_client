import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_theme.dart';
import 'package:fluxer_app/features/themes/presentation/theme_accept_sheet.dart';
import 'package:fluxer_app/features/themes/providers/shared_theme_css_provider.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../helpers/test_l10n.dart';

const String _css = ':root { --brand-primary: #ff8800; }';

class _RecordingThemePreference extends ThemePreference {
  final List<String> applied = <String>[];

  @override
  ThemePreferenceState build() => ThemePreferenceState();

  @override
  Future<void> setCustomThemeCss(String css) async {
    applied.add(css);
    state = state.copyWith(customThemeCss: css);
  }
}

Future<ProviderContainer> _pump(
  WidgetTester tester, {
  required Future<String> Function() css,
}) async {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      sharedThemeCssProvider('neon').overrideWith((ref) => css()),
      themePreferenceProvider.overrideWith(_RecordingThemePreference.new),
    ],
  );
  addTearDown(container.dispose);
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: const Scaffold(body: EmbedTheme(themeId: 'neon')),
      ),
    ),
  );
  await tester.pumpAndSettle();
  return container;
}

void main() {
  testWidgets('imports a shared theme from the embed', (tester) async {
    final container = await _pump(tester, css: () async => _css);

    expect(find.text(testL10n.embedThemeHelp), findsOneWidget);
    await tester.tap(find.text(testL10n.embedThemeImport));
    await tester.pumpAndSettle();

    expect(find.byType(ThemeAcceptSheet), findsOneWidget);
    expect(find.text(_css), findsOneWidget);
    await tester.tap(find.text(testL10n.themeImportApply));
    await tester.pumpAndSettle();

    final notifier =
        container.read(themePreferenceProvider.notifier)
            as _RecordingThemePreference;
    expect(notifier.applied, <String>[_css]);
    final FluxerToast toast = container.read(toastProvider).single.toast;
    expect(toast.message, testL10n.themeImportApplied);
    expect(toast.variant, FluxerToastVariant.success);
    expect(find.byType(ThemeAcceptSheet), findsNothing);
    await tester.pump(const Duration(seconds: 5));
  });

  testWidgets('shows the theme as unavailable when it cannot load', (
    tester,
  ) async {
    await _pump(
      tester,
      css: () =>
          Future<String>.error(const SharedThemeUnreadableException('neon')),
    );

    expect(find.text(testL10n.embedThemeUnavailableTitle), findsOneWidget);
    expect(
      find.text(testL10n.embedThemeUnavailableDescription),
      findsOneWidget,
    );
    expect(find.text(testL10n.embedThemeImport), findsNothing);
  });
}
