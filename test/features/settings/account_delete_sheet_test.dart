import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/account_closure_notice_alert.dart';
import 'package:fluxer_app/features/auth/providers/account_closure_notice_provider.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/account_delete_sheet.dart';
import 'package:fluxer_app/features/settings/providers/commerce/premium_settings_state_provider.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:go_router/go_router.dart';

class _FakeGuildRepository implements GuildRepository {
  _FakeGuildRepository({required this.ownedGuilds});

  final List<Guild> ownedGuilds;

  @override
  Future<List<Guild>> getOwnedGuilds(String userId) async => ownedGuilds;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _NoPremiumState extends PremiumSettingsState {
  @override
  Future<PremiumStateResponse?> build() async => null;
}

class _SudoThenNoContentAdapter implements HttpClientAdapter {
  final List<RequestOptions> requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    if (requests.length == 1) {
      return ResponseBody.fromString(
        jsonEncode(<String, Object?>{
          'code': 'SUDO_MODE_REQUIRED',
          'message': 'Sudo mode required.',
          'has_mfa': false,
        }),
        403,
        headers: <String, List<String>>{
          Headers.contentTypeHeader: <String>[Headers.jsonContentType],
        },
      );
    }
    return ResponseBody.fromString('', 204);
  }

  @override
  void close({bool force = false}) {}
}

class _IdleGatewayConnection extends GatewayConnection {
  _IdleGatewayConnection() : super(token: 'test', dio: Dio());

  int disconnects = 0;

  @override
  Future<void> disconnect() async {
    disconnects++;
  }
}

class _RecordingAccountManager extends AccountManager {
  final List<String> signedOut = <String>[];
  final List<bool> keptInstance = <bool>[];

  @override
  Future<void> signOut(String userId, {bool keepInstance = false}) async {
    signedOut.add(userId);
    keptInstance.add(keepInstance);
  }
}

class _DeleteAccountLauncher extends ConsumerWidget {
  const _DeleteAccountLauncher();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AccountClosureNotice? notice = ref.watch(
      pendingAccountClosureNoticeProvider,
    );
    return Column(
      children: [
        if (notice != null) AccountClosureNoticeAlert(notice: notice),
        ElevatedButton(
          onPressed: () => AccountDeleteSheet.show(context, ref),
          child: const Text('Delete account'),
        ),
      ],
    );
  }
}

Widget _wrap({required ProviderContainer container, required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: Scaffold(body: child),
    ),
  );
}

Widget _wrapWithRouter({
  required ProviderContainer container,
  required GoRouter router,
}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp.router(
      routerConfig: router,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
    ),
  );
}

void main() {
  testWidgets('shows ownership warning when user owns communities', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        currentUserIdProvider.overrideWithValue('user-1'),
        guildRepositoryProvider.overrideWithValue(
          _FakeGuildRepository(
            ownedGuilds: const [
              Guild(id: 'guild-1', name: 'Owned Community', ownerId: 'user-1'),
            ],
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    tester.view
      ..physicalSize = const Size(390, 844)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => const Scaffold(body: _DeleteAccountLauncher()),
        ),
        GoRoute(
          path: '/settings/guild/:guildId',
          builder: (_, GoRouterState state) => Scaffold(
            body: Text('Settings for ${state.pathParameters['guildId']}'),
          ),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      _wrapWithRouter(container: container, router: router),
    );

    await tester.tap(find.text('Delete account'));
    await tester.pumpAndSettle();

    expect(find.text('Cannot delete account'), findsOneWidget);

    await tester.tap(find.text('Owned Community'));
    await tester.pumpAndSettle();

    expect(
      router.routerDelegate.currentConfiguration.last.matchedLocation,
      RoutePaths.guildSettingsPath('guild-1'),
    );
    expect(find.text('Settings for guild-1'), findsOneWidget);
    expect(find.text('Cannot delete account'), findsNothing);
  });

  testWidgets('shows delete confirmation when user owns no communities', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        currentUserIdProvider.overrideWithValue('user-1'),
        guildRepositoryProvider.overrideWithValue(
          _FakeGuildRepository(ownedGuilds: const []),
        ),
        premiumSettingsStateProvider.overrideWith(_NoPremiumState.new),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      _wrap(container: container, child: const _DeleteAccountLauncher()),
    );

    await tester.tap(find.text('Delete account'));
    await tester.pumpAndSettle();

    final FluxerLocalizations l10n = FluxerLocalizations.of(
      tester.element(find.byType(AccountDeleteSheet)),
    );
    expect(find.text(l10n.dangerZoneDeleteIntro), findsOneWidget);
    expect(find.text(l10n.dangerZoneDeleteNow), findsOneWidget);
    expect(find.text('Cannot delete account'), findsNothing);
  });

  testWidgets('treats a 204 from an older server as a dateless deletion', (
    tester,
  ) async {
    final _SudoThenNoContentAdapter adapter = _SudoThenNoContentAdapter();
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://selfhost.example/api/v1'))
      ..httpClientAdapter = adapter;
    dio.interceptors.add(
      SudoInterceptor(
        dio: dio,
        showSudoSheet: (SudoChallenge challenge) async => <String, dynamic>{
          'password': 'pw',
        },
      ),
    );
    final _IdleGatewayConnection gateway = _IdleGatewayConnection();
    final _RecordingAccountManager accounts = _RecordingAccountManager();
    final ProviderContainer container = ProviderContainer(
      overrides: [
        currentUserIdProvider.overrideWithValue('user-1'),
        guildRepositoryProvider.overrideWithValue(
          _FakeGuildRepository(ownedGuilds: const []),
        ),
        premiumSettingsStateProvider.overrideWith(_NoPremiumState.new),
        fluxerDioProvider.overrideWithValue(dio),
        instanceRuntimeConfigProvider.overrideWithValue(
          InstanceRuntimeConfig.defaults,
        ),
        gatewayConnectionProvider.overrideWithValue(gateway),
        accountManagerProvider.overrideWith(() => accounts),
      ],
    );
    addTearDown(container.dispose);

    tester.view
      ..physicalSize = const Size(390, 844)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      _wrap(container: container, child: const _DeleteAccountLauncher()),
    );

    await tester.tap(find.text('Delete account'));
    await tester.pumpAndSettle();

    final FluxerLocalizations l10n = FluxerLocalizations.of(
      tester.element(find.byType(AccountDeleteSheet)),
    );
    await tester.tap(find.text(l10n.dangerZoneDeleteNow));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.dangerZoneDeleteNow).last);
    await tester.pumpAndSettle();

    expect(adapter.requests, hasLength(2));
    expect(adapter.requests.last.path, '/users/@me/delete');
    expect(adapter.requests.last.data, <String, dynamic>{
      'immediate': true,
      'delete_messages': false,
      'password': 'pw',
    });
    expect(find.byType(AccountDeleteSheet), findsNothing);
    expect(find.text(l10n.genericError), findsNothing);
    expect(
      find.text(l10n.accountDeletionScheduledNoticeNoDate),
      findsOneWidget,
    );
    expect(find.text(l10n.accountDeletionImmediateNotice), findsNothing);
    expect(gateway.disconnects, 1);
    expect(accounts.signedOut, <String>['user-1']);
    expect(accounts.keptInstance, <bool>[true]);
    expect(container.read(accountClosureInFlightProvider), isFalse);
  });

  testWidgets('closing the identity check leaves no error on the sheet', (
    tester,
  ) async {
    final _SudoThenNoContentAdapter adapter = _SudoThenNoContentAdapter();
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://selfhost.example/api/v1'))
      ..httpClientAdapter = adapter;
    dio.interceptors.add(
      SudoInterceptor(
        dio: dio,
        showSudoSheet: (SudoChallenge challenge) async => null,
      ),
    );
    final _RecordingAccountManager accounts = _RecordingAccountManager();
    final ProviderContainer container = ProviderContainer(
      overrides: [
        currentUserIdProvider.overrideWithValue('user-1'),
        guildRepositoryProvider.overrideWithValue(
          _FakeGuildRepository(ownedGuilds: const []),
        ),
        premiumSettingsStateProvider.overrideWith(_NoPremiumState.new),
        fluxerDioProvider.overrideWithValue(dio),
        accountManagerProvider.overrideWith(() => accounts),
      ],
    );
    addTearDown(container.dispose);

    tester.view
      ..physicalSize = const Size(390, 844)
      ..devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      _wrap(container: container, child: const _DeleteAccountLauncher()),
    );

    await tester.tap(find.text('Delete account'));
    await tester.pumpAndSettle();

    final FluxerLocalizations l10n = FluxerLocalizations.of(
      tester.element(find.byType(AccountDeleteSheet)),
    );
    await tester.tap(find.text(l10n.dangerZoneDeleteLater));
    await tester.pumpAndSettle();

    expect(find.byType(AccountDeleteSheet), findsOneWidget);
    expect(find.text('Sudo mode required.'), findsNothing);
    expect(accounts.signedOut, isEmpty);
    expect(container.read(accountClosureInFlightProvider), isFalse);
  });
}
