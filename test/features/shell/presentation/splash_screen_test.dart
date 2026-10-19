import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/service_unavailable.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_ready_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/domain/service_status_incident.dart';
import 'package:fluxer_app/features/shell/presentation/splash_screen.dart';
import 'package:fluxer_app/features/shell/providers/service_status_incident_provider.dart';
import 'package:fluxer_app/features/ui/icons/instance_branding_image.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/fake_well_known.dart';
import '../../../helpers/open_test_database.dart';
import '../../../helpers/pump_fluxer_app.dart';
import '../../../helpers/test_l10n.dart';

class _PendingAppStartup extends AppStartup {
  @override
  Future<void> build() => Completer<void>().future;
}

class _UnavailableAppStartup extends AppStartup {
  @override
  Future<void> build() =>
      Future<void>.error(const ServiceUnavailableException(statusCode: 503));
}

class _GenericFailAppStartup extends AppStartup {
  @override
  Future<void> build() => Future<void>.error(Exception('boot failure'));
}

class _ReadyAppStartup extends AppStartup {
  @override
  Future<void> build() async {}
}

class _ReadyGateway extends GatewayReady {
  @override
  bool build() => true;
}

class _Authenticated extends AuthState {
  @override
  bool build() => true;
}

class _Switching extends AccountManager {
  @override
  AccountManagerState build() {
    return const AccountManagerState(accounts: [], isSwitching: true);
  }

  void finish() {
    state = state.copyWith(isSwitching: false);
  }
}

class _NoopIncidentRead extends ServiceStatusIncidentRead {
  @override
  ServiceStatusIncident? build() => null;

  @override
  Future<void> refresh() async {}
}

class _AccountsPresent extends AccountManager {
  @override
  AccountManagerState build() {
    return const AccountManagerState(
      accounts: <StoredAccount>[
        StoredAccount(
          userId: 'u-selfhost',
          isValid: true,
          username: 'alice',
          displayDomain: 'chat.example.com',
          mediaBaseUrl: 'https://media.chat.example.com',
        ),
      ],
      isSwitching: false,
    );
  }

  @override
  Future<void> loadAccounts() async {}
}

late FluxerDatabase _database;

List<Override> _splashOverrides(List<Override> overrides) {
  return <Override>[
    wellKnownProvider.overrideWith(FakeWellKnown.new),
    ...overrides,
  ];
}

Future<bool> _revealCompleteAfter(
  WidgetTester tester, {
  required bool switching,
}) async {
  await tester.pumpWidget(
    pumpFluxerApp(
      disableAnimations: false,
      overrides: _splashOverrides(<Override>[
        fluxerDatabaseProvider.overrideWithValue(_database),
        appStartupProvider.overrideWith(_ReadyAppStartup.new),
        gatewayReadyProvider.overrideWith(_ReadyGateway.new),
        authStateProvider.overrideWith(_Authenticated.new),
        appearancePreferencesProvider.overrideWithValue(
          const AppearancePreferencesState(),
        ),
        unreadDmChannelsProvider.overrideWithValue(
          const UnreadDmState(loaded: true),
        ),
        if (switching) accountManagerProvider.overrideWith(_Switching.new),
      ]),
      child: const SplashScreen(),
    ),
  );
  await tester.pump();
  final ProviderContainer container = ProviderScope.containerOf(
    tester.element(find.byType(SplashScreen)),
  );
  container.read(guildReadStateReadyProvider.notifier).markReady();
  await tester.pump();
  await tester.pump();
  if (switching) {
    expect(container.read(splashExitAllowedProvider), isFalse);
    expect(find.byType(InstanceBrandMark), findsOneWidget);
    (container.read(accountManagerProvider.notifier) as _Switching).finish();
    await tester.pump();
    await tester.pump();
  }
  expect(container.read(splashExitAllowedProvider), isTrue);
  expect(container.read(splashRevealZoomProvider), !switching);
  for (var i = 0; i < 20; i++) {
    await tester.pump(const Duration(milliseconds: 25));
  }
  final bool completeEarly = container.read(splashRevealCompleteProvider);
  for (var i = 0; i < 40; i++) {
    await tester.pump(const Duration(milliseconds: 25));
  }
  expect(container.read(splashRevealCompleteProvider), isTrue);
  return completeEarly;
}

void main() {
  setUp(() {
    _database = openTestDatabase();
  });

  testWidgets('unmounting before the reveal releases the gateway gate', (
    tester,
  ) async {
    final List<Override> overrides = _splashOverrides(<Override>[
      fluxerDatabaseProvider.overrideWithValue(_database),
      appStartupProvider.overrideWith(_PendingAppStartup.new),
    ]);
    await tester.pumpWidget(
      pumpFluxerApp(overrides: overrides, child: const SplashScreen()),
    );
    await tester.pump();

    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(SplashScreen)),
    );
    expect(container.read(splashRevealCompleteProvider), isFalse);

    await tester.pumpWidget(
      pumpFluxerApp(overrides: overrides, child: const SizedBox.shrink()),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(container.read(splashRevealCompleteProvider), isTrue);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('cold launch reveal plays the logo zoom', (tester) async {
    expect(await _revealCompleteAfter(tester, switching: false), isFalse);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('account switch reveal skips the logo zoom', (tester) async {
    expect(await _revealCompleteAfter(tester, switching: true), isTrue);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('503 startup shows outage copy and status links', (tester) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        retry: (int retryCount, Object error) => null,
        overrides: _splashOverrides(<Override>[
          fluxerDatabaseProvider.overrideWithValue(_database),
          appStartupProvider.overrideWith(_UnavailableAppStartup.new),
          serviceStatusIncidentReadProvider.overrideWith(_NoopIncidentRead.new),
        ]),
        child: const SplashScreen(),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text(testL10n.splashConnectionLost), findsOneWidget);
    expect(find.text(testL10n.reconnectingBody), findsOneWidget);
    expect(find.text(testL10n.splashStatusPageLink), findsOneWidget);
    expect(find.text(testL10n.retry), findsOneWidget);
    expect(find.textContaining('Failed to start'), findsNothing);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('503 outage shows switch accounts when other accounts exist', (
    tester,
  ) async {
    await tester.pumpWidget(
      pumpFluxerApp(
        retry: (int retryCount, Object error) => null,
        overrides: _splashOverrides(<Override>[
          fluxerDatabaseProvider.overrideWithValue(_database),
          appStartupProvider.overrideWith(_UnavailableAppStartup.new),
          serviceStatusIncidentReadProvider.overrideWith(_NoopIncidentRead.new),
          accountManagerProvider.overrideWith(_AccountsPresent.new),
        ]),
        child: const SplashScreen(),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text(testL10n.profileTabMenuSwitchAccounts), findsOneWidget);
    expect(find.text('fluxer.com'), findsOneWidget);
    await releaseTestWidgetTree(tester);
  });

  testWidgets(
    'generic startup failure shows switch accounts without requiring auth',
    (tester) async {
      await tester.pumpWidget(
        pumpFluxerApp(
          retry: (int retryCount, Object error) => null,
          overrides: _splashOverrides(<Override>[
            fluxerDatabaseProvider.overrideWithValue(_database),
            appStartupProvider.overrideWith(_GenericFailAppStartup.new),
            serviceStatusIncidentReadProvider.overrideWith(
              _NoopIncidentRead.new,
            ),
            accountManagerProvider.overrideWith(_AccountsPresent.new),
          ]),
          child: const SplashScreen(),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.textContaining('Failed to start'), findsOneWidget);
      expect(find.text(testL10n.profileTabMenuSwitchAccounts), findsOneWidget);
      await releaseTestWidgetTree(tester);
    },
  );

  testWidgets(
    'generic startup failure still uses the failed-to-start message',
    (tester) async {
      await tester.pumpWidget(
        pumpFluxerApp(
          retry: (int retryCount, Object error) => null,
          overrides: _splashOverrides(<Override>[
            fluxerDatabaseProvider.overrideWithValue(_database),
            appStartupProvider.overrideWith(_GenericFailAppStartup.new),
            serviceStatusIncidentReadProvider.overrideWith(
              _NoopIncidentRead.new,
            ),
          ]),
          child: const SplashScreen(),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.textContaining('Failed to start'), findsOneWidget);
      expect(find.text('Connection lost'), findsNothing);
      await releaseTestWidgetTree(tester);
    },
  );

  testWidgets('exposes a live status region and hides decorative branding', (
    tester,
  ) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: _splashOverrides(<Override>[
          fluxerDatabaseProvider.overrideWithValue(_database),
          appStartupProvider.overrideWith(_PendingAppStartup.new),
        ]),
        child: const SplashScreen(),
      ),
    );
    await tester.pump();

    expect(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is Semantics && (widget.properties.liveRegion ?? false),
      ),
      findsOneWidget,
    );
    expect(
      find.ancestor(
        of: find.byType(InstanceBrandMark),
        matching: find.byType(ExcludeSemantics),
      ),
      findsWidgets,
    );
    expect(
      find.ancestor(
        of: find.byType(CustomPaint),
        matching: find.byType(ExcludeSemantics),
      ),
      findsWidgets,
    );
    await releaseTestWidgetTree(tester);
    handle.dispose();
  });
}
