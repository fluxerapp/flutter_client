import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/system_permissions/media_permission_blocked_modal.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

import '../../../helpers/fake_mac_permissions.dart';
import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/test_l10n.dart';

void main() {
  Future<void> open(WidgetTester tester) async {
    final colorTheme = buildDarkColorTheme();
    late BuildContext context;
    await tester.pumpWidget(
      ProviderScope(
        overrides: [instanceRuntimeConfigOverride()],
        child: MaterialApp(
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          locale: kTestLocale,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Builder(
            builder: (BuildContext value) {
              context = value;
              return const SizedBox();
            },
          ),
        ),
      ),
    );
    unawaited(
      showMediaPermissionBlockedModal(
        context,
        kind: MediaPermissionBlockedKind.microphone,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Microphone permission required'), findsOneWidget);
  }

  testWidgets('offers settings on Windows', (tester) async {
    await open(tester);
    expect(find.text('Open settings'), findsOneWidget);
  }, variant: TargetPlatformVariant.only(TargetPlatform.windows));

  testWidgets('only acknowledges on Linux', (tester) async {
    await open(tester);
    expect(find.text('Open settings'), findsNothing);
    expect(find.text('Okay'), findsOneWidget);
  }, variant: TargetPlatformVariant.only(TargetPlatform.linux));

  test('stays quiet when macOS already granted the permission', () async {
    installFakeMacPermissions(<MacPermissionKind, MacPermissionStatus>{
      MacPermissionKind.camera: MacPermissionStatus.granted,
    });
    addTearDown(resetMacPermissions);
    expect(
      await handleMediaPermissionBlocked(MediaPermissionBlockedKind.camera),
      isFalse,
    );
  });
}
