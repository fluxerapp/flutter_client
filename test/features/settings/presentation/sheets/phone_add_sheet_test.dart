import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/phone_add_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class _PhoneAddLauncher extends ConsumerWidget {
  const _PhoneAddLauncher();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => PhoneAddSheet.show(context, ref),
      child: const Text('Verify Phone'),
    );
  }
}

Widget _wrap({required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('phone add sheet shows country selector and send code action', (
    tester,
  ) async {
    await tester.pumpWidget(_wrap(child: const _PhoneAddLauncher()));
    await tester.tap(find.text('Verify Phone'));
    await tester.pumpAndSettle();
    expect(find.text('Send Code'), findsOneWidget);
    expect(find.text('Country'), findsOneWidget);
  });
}
