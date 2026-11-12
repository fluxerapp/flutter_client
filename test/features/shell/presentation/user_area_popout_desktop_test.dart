import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' show User;
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/profile/providers/own_profile_badges_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/user_area_popout.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/input_modality_override.dart';
import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/test_l10n.dart';

const String _kUserId = '1';

class _FakeUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: _kUserId,
    username: 'tester',
    displayName: 'Tester',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
  );
}

class _IdleVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

class _FakeAccountManager extends AccountManager {
  @override
  AccountManagerState build() => const AccountManagerState(
    accounts: <StoredAccount>[],
    isSwitching: false,
  );

  @override
  Future<void> loadAccounts() async {}
}

Widget _app() {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      inputModalityOverride(touch: false),
      instanceRuntimeConfigOverride(),
      userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
      accountManagerProvider.overrideWith(_FakeAccountManager.new),
      voiceSessionProvider.overrideWith(_IdleVoiceSession.new),
      ownProfileBadgesProvider.overrideWithValue(
        const <ProfileBadgeResponse>[],
      ),
      userPresenceProvider(
        _kUserId,
      ).overrideWith((Ref ref) => Stream<User?>.value(null)),
      currentUserCachedProfileProvider.overrideWithValue(
        const CurrentUserCachedProfile(
          id: _kUserId,
          username: 'tester',
          discriminator: '0001',
          globalName: 'Tester',
          avatar: null,
          avatarColor: 0x4641D9,
          bio: 'Building things on the internet.',
          pronouns: 'they/them',
          accentColor: 0x4641D9,
          banner: null,
          publicFlags: 0,
        ),
      ),
    ],
    child: RepaintBoundary(
      key: const ValueKey<String>('root'),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(
          body: Align(
            alignment: const Alignment(-0.95, 0.95),
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? _) =>
                  TextButton(
                    onPressed: () =>
                        unawaited(UserAreaPopout.show(context, ref)),
                    child: const Text('Open'),
                  ),
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> _open(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1000, 800);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(_app());
  await tester.pump();
  await tester.tap(find.text('Open'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('shows the profile card with the web action group', (
    tester,
  ) async {
    await _open(tester);

    expect(find.byType(FluxerDesktopPopoutPanel), findsOneWidget);
    expect(find.text('Tester'), findsOneWidget);
    expect(find.byType(MessageMarkdown), findsOneWidget);
    expect(find.text('Set custom status'), findsOneWidget);
    expect(find.text('Online'), findsOneWidget);
    expect(find.text('Switch accounts'), findsOneWidget);
    expect(find.text('Copy user ID'), findsOneWidget);
    expect(find.text('Copy voice diagnostics'), findsOneWidget);
    expect(find.text('In a call'), findsNothing);
    expect(find.text('Edit profile'), findsOneWidget);
    expect(find.text('Do not disturb'), findsNothing);
    final Rect open = tester.getRect(find.text('Open'));
    expect(
      tester.getBottomLeft(find.byType(FluxerDesktopPopoutPanel)).dy,
      lessThanOrEqualTo(open.top),
    );
  });

  testWidgets('hovering status opens the status flyout, leaving closes it', (
    tester,
  ) async {
    await _open(tester);
    final TestGesture mouse = await tester.createGesture(
      kind: PointerDeviceKind.mouse,
    );
    addTearDown(mouse.removePointer);
    final Offset statusRow = tester.getCenter(find.text('Online'));
    await mouse.addPointer(location: statusRow);
    await tester.pumpAndSettle();

    expect(find.text('Do not disturb'), findsOneWidget);
    final Offset flyoutRow = tester.getCenter(find.text('Do not disturb'));
    expect(flyoutRow.dx, greaterThan(statusRow.dx));

    await mouse.moveTo(const Offset(990, 10));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();
    expect(find.text('Do not disturb'), findsNothing);
  });

  testWidgets('moving from status into its flyout keeps it open', (
    tester,
  ) async {
    await _open(tester);
    final TestGesture mouse = await tester.createGesture(
      kind: PointerDeviceKind.mouse,
    );
    addTearDown(mouse.removePointer);
    await mouse.addPointer(location: tester.getCenter(find.text('Online')));
    await tester.pumpAndSettle();
    await mouse.moveTo(tester.getCenter(find.text('Do not disturb')));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();

    expect(find.text('Do not disturb'), findsOneWidget);
  });
}
