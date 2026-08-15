import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/system_permissions/system_permission_kind.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/system_permissions/system_permission_settings_prompt.dart';
import 'package:material_ui/material_ui.dart';

import '../../../helpers/test_l10n.dart';

Widget _buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      locale: kTestLocale,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  group('SystemPermissionSettingsPrompt', () {
    testWidgets('shows microphone copy and actions', (tester) async {
      await tester.pumpWidget(
        _buildTestApp(
          Builder(
            builder: (BuildContext context) {
              return ElevatedButton(
                onPressed: () {
                  unawaited(
                    SystemPermissionSettingsPrompt.show(
                      context,
                      kind: SystemPermissionKind.microphone,
                    ),
                  );
                },
                child: const Text('Open'),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final FluxerLocalizations l10n = FluxerLocalizations.of(
        tester.element(find.byType(ElevatedButton)),
      );
      expect(find.text(l10n.systemPermissionSettingsTitle), findsOneWidget);
      expect(find.text(l10n.systemPermissionMicrophoneMessage), findsOneWidget);
      expect(
        find.widgetWithText(
          FluxerButton,
          l10n.systemPermissionSettingsOpenSettings,
        ),
        findsOneWidget,
      );
      expect(find.widgetWithText(FluxerButton, l10n.cancel), findsOneWidget);
    });
  });
}
