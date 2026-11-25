import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/input/providers/global_shortcuts_provider.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_modal.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permission_prompt.dart';
import 'package:fluxer_app/features/ui/mac_permissions/mac_permissions_settings_list.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

import '../../../helpers/fake_mac_permissions.dart';
import '../../../helpers/input_modality_override.dart';
import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/test_l10n.dart';

class _StubShortcuts extends GlobalShortcuts {
  _StubShortcuts(this._initial);

  final GlobalShortcutsState _initial;

  @override
  GlobalShortcutsState build() => _initial;
}

Widget _app(
  Widget child, {
  GlobalShortcutsState shortcuts = const GlobalShortcutsState(),
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      inputModalityOverride(touch: false),
      instanceRuntimeConfigOverride(),
      globalShortcutsProvider.overrideWith(() => _StubShortcuts(shortcuts)),
    ],
    child: MaterialApp(
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      locale: kTestLocale,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: Center(child: SizedBox(width: 440, child: child)),
      ),
    ),
  );
}

void main() {
  late FakeMacPermissions fake;

  setUp(() => fake = installFakeMacPermissions());
  tearDown(resetMacPermissions);

  testWidgets('allows, shows the allowed state, then reports it', (
    tester,
  ) async {
    int allowed = 0;
    await tester.pumpWidget(
      _app(
        MacPermissionPrompt(
          kind: MacPermissionKind.microphone,
          onAllowed: () => allowed++,
          onNotNow: () {},
        ),
      ),
    );
    await tester.pump();
    final double height = tester
        .getSize(find.byType(MacPermissionPrompt))
        .height;
    await tester.tap(find.text('Allow'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(fake.requested, <MacPermissionKind>[MacPermissionKind.microphone]);
    expect(find.text('Allowed'), findsOneWidget);
    expect(find.text('Not now'), findsNothing);
    expect(tester.getSize(find.byType(MacPermissionPrompt)).height, height);
    expect(allowed, 0);
    await tester.pump(kMacPermissionAllowedBeat);
    expect(allowed, 1);
    expect(tester.takeException(), isNull);
  });

  testWidgets('denied screen opens settings and advises choosing Later', (
    tester,
  ) async {
    fake.statuses[MacPermissionKind.screen] = MacPermissionStatus.denied;
    await tester.pumpWidget(
      _app(
        MacPermissionPrompt(
          kind: MacPermissionKind.screen,
          onAllowed: () {},
          onNotNow: () {},
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(find.text('Relaunch to apply'), findsNothing);
    await tester.tap(find.text('Open System Settings'));
    await tester.pump();
    expect(fake.opened, <MacPrivacyPane>[MacPrivacyPane.screen]);
    expect(macPermissions.state.anyQuitPromptAdvice, isTrue);
    await macPermissions.refreshAfterReturn();
    await tester.pump();
    expect(find.text('Relaunch to apply'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('modal opens once and Enter runs the action', (tester) async {
    late BuildContext context;
    await tester.pumpWidget(
      _app(
        Builder(
          builder: (BuildContext value) {
            context = value;
            return const SizedBox();
          },
        ),
      ),
    );
    final Future<void> first = showMacPermissionModal(
      MacPermissionKind.camera,
      context: context,
    );
    expect(
      showMacPermissionModal(MacPermissionKind.screen, context: context),
      same(first),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(MacPermissionPrompt), findsOneWidget);
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(fake.requested, <MacPermissionKind>[MacPermissionKind.camera]);
    await tester.pump(kMacPermissionAllowedBeat);
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(MacPermissionPrompt), findsNothing);
  });

  testWidgets('the modal can open again after its tree goes away', (
    tester,
  ) async {
    late BuildContext context;
    for (int i = 0; i < 2; i++) {
      await tester.pumpWidget(
        _app(
          Builder(
            key: UniqueKey(),
            builder: (BuildContext value) {
              context = value;
              return const SizedBox();
            },
          ),
        ),
      );
      unawaited(
        showMacPermissionModal(MacPermissionKind.camera, context: context),
      );
      await tester.pump();
      expect(find.byType(MacPermissionPrompt), findsOneWidget);
      await tester.pumpWidget(const SizedBox());
    }
  });

  testWidgets('an allowed modal closes without popping a newer route', (
    tester,
  ) async {
    late BuildContext context;
    await tester.pumpWidget(
      _app(
        Builder(
          builder: (BuildContext value) {
            context = value;
            return const SizedBox();
          },
        ),
      ),
    );
    unawaited(
      showMacPermissionModal(MacPermissionKind.camera, context: context),
    );
    await tester.pump();
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => const Text('newer'),
    );
    await tester.pump(const Duration(milliseconds: 400));
    await macPermissions.request(MacPermissionKind.camera);
    await tester.pump(kMacPermissionAllowedBeat);
    await tester.pump(const Duration(milliseconds: 400));
    expect(find.byType(MacPermissionPrompt), findsNothing);
    expect(find.text('newer'), findsOneWidget);
  });

  testWidgets('settings list shows every kind and its action', (tester) async {
    fake.statuses[MacPermissionKind.microphone] = MacPermissionStatus.granted;
    fake.statuses[MacPermissionKind.camera] = MacPermissionStatus.denied;
    await tester.pumpWidget(_app(const MacPermissionsSettingsList()));
    await tester.pump();
    await tester.pump();
    for (final String name in <String>[
      'Microphone',
      'Camera',
      'Screen Recording',
      'Input Monitoring',
    ]) {
      expect(find.text(name), findsOneWidget);
    }
    expect(find.text('Allowed'), findsOneWidget);
    expect(find.text('Open System Settings'), findsOneWidget);
    expect(find.text('Allow'), findsNWidgets(2));
    expect(tester.takeException(), isNull);
  });

  testWidgets('a granted but dead input hook offers a relaunch', (
    tester,
  ) async {
    fake.statuses[MacPermissionKind.inputMonitoring] =
        MacPermissionStatus.granted;
    await tester.pumpWidget(
      _app(
        const MacPermissionsSettingsList(),
        shortcuts: const GlobalShortcutsState(startFailed: true),
      ),
    );
    await tester.pump();
    await tester.pump();
    expect(find.text('Relaunch to apply'), findsOneWidget);
  });
}
