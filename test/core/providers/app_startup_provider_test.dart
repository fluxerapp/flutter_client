import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:fake_async/fake_async.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/api/retry_interceptor.dart';
import 'package:fluxer_app/core/api/service_unavailable.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/app/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/app/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/app/shell_cache.dart';
import 'package:fluxer_app/core/providers/app/startup_gateway_fallback_provider.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_app/core/router/app_location_persistence.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/data/auth_token_storage.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/features/quick_switcher/providers/recent_channel_visits_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/known_guild_bans_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/open_test_database.dart';
import '../../helpers/recording_asset_channel.dart';

class _FakeWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() async {
    return const WellKnownFluxerResponse(
      apiCodeVersion: 1,
      endpoints: InstanceEndpointsSchema(
        api: '',
        apiClient: '',
        apiPublic: '',
        gateway: '',
        media: '',
        staticCdn: '',
        marketing: '',
        admin: '',
        invite: '',
        gift: '',
        webapp: '',
      ),
      captcha: InstanceCaptchaSchema(provider: CaptchaProviderSchema.none),
      features: InstanceFeaturesSchema(
        voiceEnabled: false,
        stripeEnabled: false,
        premiumEnabled: false,
        stripeServiceable: false,
        selfHosted: false,
        presignedAttachmentUploads: false,
        emailsEnabled: false,
        phoneVerificationEnabled: false,
        accountIdentity: AccountIdentityModeSchema.email,
        tagStyle: TagStyleSchema.random,
      ),
      gif: InstanceGifSchema(
        provider: '',
        displayName: '',
        attributionRequired: false,
      ),
      sso: InstanceSsoSchema(
        enabled: false,
        enforced: false,
        usernameFromProvider: false,
        displayName: null,
        buttonLabel: null,
        redirectUri: '',
      ),
      registration: InstanceRegistrationSchema(
        mode: InstanceRegistrationModeSchema.open,
        adminRegistrationUrlsEnabled: false,
      ),
      community: InstanceCommunitySchema(
        singleCommunity: false,
        singleCommunityGuildId: null,
        directMessagesDisabled: false,
        guildCreateAccess: true,
      ),
      services: InstanceServicesSchema(
        connectionProviders: <InstanceConnectionProviderSchema>[],
        gifEnabled: false,
        youtubeEnabled: false,
        blueskyEnabled: false,
      ),
      limits: WellKnownFluxerResponseLimits(
        version: 2,
        traitDefinitions: <String>[],
        rules: <WellKnownFluxerResponseLimitsRules>[],
        defaultsHash: '',
      ),
      push: InstancePushSchema(publicVapidKey: null),
      appPublic: InstanceAppPublicSchema(
        branding: InstanceBrandingSchema(
          productName: '',
          iconUrl: null,
          symbolUrl: null,
          logoUrl: null,
          wordmarkUrl: null,
          faviconUrl: null,
          themeColor: null,
          statusPageUrl: null,
          statusPageInstatus: false,
          statusPageIncidentHistoryUrl: null,
          premiumProductName: 'Plutonium',
          premiumInfoUrl: null,
          faviconDarkUrl: null,
          signInBackdropUrl: null,
          premiumPageColor: null,
          premiumShowcaseExpressionsUrl: null,
          premiumShowcaseProfileUrl: null,
          premiumShowcaseStreamUrl: null,
          premiumShowcaseUploadUrl: null,
          customCss: null,
          uploadLimitMessage: null,
          trustedDomains: <String>[],
        ),
        setup: InstanceSetupSchema(configured: true, adminUrl: null),
        legal: InstanceAppPublicSchemaLegal(
          termsUrl: null,
          privacyUrl: null,
          guidelinesUrl: null,
        ),
        registration: InstanceAppPublicSchemaRegistration(
          collectDateOfBirth: false,
        ),
      ),
      agePolicy: InstanceAgePolicySchema(geos: []),
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues(<String, Object>{}));

  test('retry recovers the provider after a failed startup', () async {
    var failStartup = true;
    final container = ProviderContainer(
      retry: (int retryCount, Object error) => null,
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
        wellKnownProvider.overrideWith(_FakeWellKnown.new),
        appRuntimeInfoProvider.overrideWith((Ref ref) {
          if (failStartup) {
            throw Exception('boot failure');
          }
          return AppRuntimeInfo(
            packageName: 'com.fluxer',
            version: '1.0.0',
            buildNumber: '1',
            environment: AppBuildConfig.environment,
            pushProvider: AppBuildConfig.pushProvider,
            buildTimestamp: '',
          );
        }),
      ],
    );
    addTearDown(container.dispose);

    await expectLater(
      container.read(appStartupProvider.future),
      throwsException,
    );
    expect(container.read(appStartupProvider), isA<AsyncError<void>>());

    failStartup = false;
    container.invalidate(appRuntimeInfoProvider);
    await container.read(appStartupProvider.notifier).retry();

    expect(container.read(appStartupProvider), isA<AsyncData<void>>());
  });

  test(
    'failed retry surfaces the new error instead of throwing unhandled',
    () async {
      final container = ProviderContainer(
        retry: (int retryCount, Object error) => null,
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
          wellKnownProvider.overrideWith(_FakeWellKnown.new),
          appRuntimeInfoProvider.overrideWith(
            (Ref ref) => throw Exception('still down'),
          ),
        ],
      );
      addTearDown(container.dispose);

      await expectLater(
        container.read(appStartupProvider.future),
        throwsException,
      );

      await container.read(appStartupProvider.notifier).retry();

      final AsyncValue<void> state = container.read(appStartupProvider);
      expect(state, isA<AsyncError<void>>());
      expect(
        (state as AsyncError<void>).error.toString(),
        contains('still down'),
      );
    },
  );

  test('503 on getCurrentUser is a ServiceUnavailableException', () async {
    final db = openTestDatabase();
    final MapAuthTokenStorage tokens = MapAuthTokenStorage();
    await db.authSessionDao.saveSessionMetadata(userId: 'user-1');
    await tokens.saveToken(userId: 'user-1', token: 'token-1');

    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = const _UsersMeAdapter(statusCode: 503);

    final container = ProviderContainer(
      retry: (int retryCount, Object error) => null,
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        wellKnownProvider.overrideWith(_FakeWellKnown.new),
        appRuntimeInfoProvider.overrideWith((Ref ref) => _testRuntimeInfo),
        authTokenStorageProvider.overrideWithValue(tokens),
        fluxerDioProvider.overrideWithValue(dio),
        authenticatedSessionBindingsProvider.overrideWith((Ref ref) {}),
      ],
    );
    addTearDown(container.dispose);

    await expectLater(
      container.read(appStartupProvider.future),
      throwsA(isA<ServiceUnavailableException>()),
    );
    expect(container.read(appStartupProvider), isA<AsyncError<void>>());
    expect(
      (container.read(appStartupProvider) as AsyncError<void>).error,
      isA<ServiceUnavailableException>(),
    );
    expect(container.read(authStateProvider), isTrue);
    expect(container.read(currentUserIdProvider), 'user-1');
    expect(container.read(fluxerAuthTokenProvider), 'token-1');
  });

  test(
    'startup does not decode the 41 MiB emoji sprite sheet before any emoji is shown',
    () async {
      final RecordingAssetChannel assets = RecordingAssetChannel.install();
      final db = openTestDatabase();
      final MapAuthTokenStorage tokens = MapAuthTokenStorage();
      await db.authSessionDao.saveSessionMetadata(userId: 'user-1');
      await tokens.saveToken(userId: 'user-1', token: 'token-1');
      final container = _startupContainer(
        db: db,
        tokens: tokens,
        apiBaseUrl: 'https://api.fluxer.app/v1',
        statusCode: 503,
      );
      addTearDown(container.dispose);

      await expectLater(
        container.read(appStartupProvider.future),
        throwsA(isA<ServiceUnavailableException>()),
      );

      expect(assets.requestsMatching('assets/emoji-sprites/'), 0);
    },
  );

  test('binds gateway before getCurrentUser returns', () async {
    final db = openTestDatabase();
    final MapAuthTokenStorage tokens = MapAuthTokenStorage();
    await db.authSessionDao.saveSessionMetadata(userId: 'user-1');
    await tokens.saveToken(userId: 'user-1', token: 'token-1');

    final Completer<void> releaseUsersMe = Completer<void>();
    var boundBeforeUsersMe = false;
    var bindCalled = false;

    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
      ..httpClientAdapter = _HoldingUsersMeAdapter(
        statusCode: 503,
        release: releaseUsersMe,
      );

    final container = ProviderContainer(
      retry: (int retryCount, Object error) => null,
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(db),
        wellKnownProvider.overrideWith(_FakeWellKnown.new),
        appRuntimeInfoProvider.overrideWith((Ref ref) => _testRuntimeInfo),
        authTokenStorageProvider.overrideWithValue(tokens),
        fluxerDioProvider.overrideWithValue(dio),
        authenticatedSessionBindingsProvider.overrideWith((Ref ref) {
          bindCalled = true;
          boundBeforeUsersMe = !releaseUsersMe.isCompleted;
        }),
      ],
    );
    addTearDown(container.dispose);

    final Future<void> startup = container.read(appStartupProvider.future);
    for (int i = 0; i < 200 && !bindCalled; i++) {
      await Future<void>.delayed(Duration.zero);
    }
    expect(bindCalled, isTrue);
    expect(boundBeforeUsersMe, isTrue);

    releaseUsersMe.complete();
    await expectLater(startup, throwsA(isA<ServiceUnavailableException>()));
  });

  test(
    're-running startup rebinds the session and clears gateway ready',
    () async {
      final db = openTestDatabase();
      final MapAuthTokenStorage tokens = MapAuthTokenStorage();
      await db.authSessionDao.saveSessionMetadata(userId: 'user-1');
      await tokens.saveToken(userId: 'user-1', token: 'token-1');

      var bindCount = 0;
      final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
        ..httpClientAdapter = const _UsersMeAdapter(statusCode: 503);

      final container = ProviderContainer(
        retry: (int retryCount, Object error) => null,
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(db),
          wellKnownProvider.overrideWith(_FakeWellKnown.new),
          appRuntimeInfoProvider.overrideWith((Ref ref) => _testRuntimeInfo),
          authTokenStorageProvider.overrideWithValue(tokens),
          fluxerDioProvider.overrideWithValue(dio),
          authenticatedSessionBindingsProvider.overrideWith((Ref ref) {
            bindCount++;
          }),
        ],
      );
      addTearDown(container.dispose);

      await expectLater(
        container.read(appStartupProvider.future),
        throwsA(isA<ServiceUnavailableException>()),
      );
      expect(bindCount, 1);

      container.read(gatewayReadyProvider.notifier).setReady();
      expect(container.read(gatewayReadyProvider), isTrue);

      container.invalidate(appStartupProvider);
      await expectLater(
        container.read(appStartupProvider.future),
        throwsA(isA<ServiceUnavailableException>()),
      );
      expect(bindCount, 2);
      expect(container.read(gatewayReadyProvider), isFalse);
    },
  );

  test('switching accounts leaves nothing from the previous account', () async {
    final db = openTestDatabase();
    final MapAuthTokenStorage tokens = MapAuthTokenStorage();
    await db.authSessionDao.saveSessionMetadata(userId: 'user-a');
    await tokens.saveToken(userId: 'user-a', token: 'token-a');
    final container = _startupContainer(
      db: db,
      tokens: tokens,
      apiBaseUrl: 'https://api.fluxer.app/v1',
      statusCode: 503,
    );
    addTearDown(container.dispose);
    await expectLater(
      container.read(appStartupProvider.future),
      throwsA(isA<ServiceUnavailableException>()),
    );
    expect(container.read(currentUserIdProvider), 'user-a');

    await db.guildDao.upsertServer(
      ServersCompanion.insert(id: 'guild-a', name: 'A community'),
    );
    await db.dmChannelDao.upsertDmChannels(<DmChannelsCompanion>[
      DmChannelsCompanion.insert(id: 'dm-a', recipientId: 'friend-a'),
    ]);
    await db.composerDraftDao.upsertDraft(
      channelId: 'dm-a',
      content: 'draft from A',
    );
    await db.favoriteChannelsDao.addChannel(channelId: 'dm-a');
    await db.guildLastChannelDao.setLastChannel('guild-a', 'channel-a');
    await db.guildLastChannelDao.setLastChannel(
      kAppLastLocationKey,
      '/channels/guild-a/channel-a',
    );
    await db.dmFolderSettingsDao.upsertSettings(
      const DmFolderSettingsTableCompanion(
        allowlistedIdsJson: Value('["dm-a"]'),
      ),
    );
    await db.userPreferencesDao.setEmojiSkinTone('user-a', '2');
    container
        .read(recentChannelVisitsProvider.notifier)
        .recordVisit(channelId: 'dm-a');
    container.read(knownGuildBansProvider.notifier).noteBan('guild-a', 'x');
    container
        .read(favoriteGifsProvider.notifier)
        .applySynced(
          entries: const <FavoriteGifEntry>[
            FavoriteGifEntry(
              url: 'https://a.example/gif',
              proxyUrl: 'https://a.example/gif',
              width: 1,
              height: 1,
            ),
          ],
          seenFirstTimePrompt: true,
        );

    await db.authSessionDao.saveSessionMetadata(userId: 'user-b');
    await tokens.saveToken(userId: 'user-b', token: 'token-b');
    await db.customStatement(
      "UPDATE auth_sessions SET last_active = 0 WHERE user_id = 'user-a'",
    );
    container.invalidate(appStartupProvider);
    await expectLater(
      container.read(appStartupProvider.future),
      throwsA(isA<ServiceUnavailableException>()),
    );

    expect(container.read(currentUserIdProvider), 'user-b');
    expect(container.read(fluxerAuthTokenProvider), 'token-b');
    expect(await db.guildDao.getServers(), isEmpty);
    expect(await db.dmChannelDao.getDmChannels(), isEmpty);
    expect(await db.composerDraftDao.getDraft('dm-a'), isNull);
    expect(await db.favoriteChannelsDao.getChannel('dm-a'), isNull);
    expect(await db.guildLastChannelDao.getLastChannel('guild-a'), isNull);
    expect(await db.dmFolderSettingsDao.getSettings(), isNull);
    expect(container.read(identifyInitialGuildIdProvider), isNull);
    expect(container.read(recentChannelVisitsProvider), isEmpty);
    expect(container.read(knownGuildBansProvider), isEmpty);
    expect(container.read(favoriteGifsProvider).entries, isEmpty);
    expect(
      (await db.userPreferencesDao.getPreferences('user-a'))?.emojiSkinTone,
      '2',
    );
  });

  test(
    'a hanging API opens the cached shell after the timeout and READY takes over',
    () {
      fakeAsync((FakeAsync async) {
        final FluxerDatabase db = FluxerDatabase.forTesting(
          NativeDatabase.memory(),
        );
        final MapAuthTokenStorage tokens = MapAuthTokenStorage();
        unawaited(db.authSessionDao.saveSessionMetadata(userId: 'user-1'));
        unawaited(tokens.saveToken(userId: 'user-1', token: 'token-1'));
        unawaited(
          db.userSettingsDao.upsertSettings(
            UserSettingsTableCompanion.insert(userId: 'user-1', data: '{}'),
          ),
        );
        async.flushMicrotasks();
        final Completer<void> releaseUsersMe = Completer<void>();
        final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
          ..httpClientAdapter = _HoldingUsersMeAdapter(
            statusCode: 503,
            release: releaseUsersMe,
          );
        final container = ProviderContainer(
          retry: (int retryCount, Object error) => null,
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            wellKnownProvider.overrideWith(_FakeWellKnown.new),
            appRuntimeInfoProvider.overrideWith((Ref ref) => _testRuntimeInfo),
            authTokenStorageProvider.overrideWithValue(tokens),
            fluxerDioProvider.overrideWithValue(dio),
            authenticatedSessionBindingsProvider.overrideWith((Ref ref) {}),
            gatewayConnectivityCheckProvider.overrideWithValue(
              () async => true,
            ),
          ],
        );
        container.read(appUiForegroundProvider.notifier).setResumed(true);
        container.listen(appStartupProvider, (_, _) {});

        async.elapse(const Duration(seconds: 1));
        expect(container.read(appStartupProvider), isA<AsyncLoading<void>>());
        expect(
          container.read(startupGatewayFallbackProvider),
          StartupGatewayFallback.none,
        );

        async.elapse(kStartupGatewayFallbackDelay);
        expect(
          container.read(startupGatewayFallbackProvider),
          StartupGatewayFallback.cachedShell,
        );
        expect(container.read(appStartupProvider), isA<AsyncData<void>>());
        expect(container.read(authStateProvider), isTrue);
        expect(container.read(currentUserIdProvider), 'user-1');

        container.read(gatewayReadyProvider.notifier).setReady();
        expect(
          container.read(startupGatewayFallbackProvider),
          StartupGatewayFallback.none,
        );
        expect(container.read(appStartupProvider), isA<AsyncData<void>>());

        releaseUsersMe.complete();
        async.elapse(const Duration(seconds: 1));
        container.dispose();
        unawaited(db.close());
        async.elapse(const Duration(seconds: 1));
      });
    },
  );

  test(
    'a 502 with cached data opens the cached shell before the gateway timer',
    () {
      fakeAsync((FakeAsync async) {
        final FluxerDatabase db = FluxerDatabase.forTesting(
          NativeDatabase.memory(),
        );
        final MapAuthTokenStorage tokens = MapAuthTokenStorage();
        unawaited(db.authSessionDao.saveSessionMetadata(userId: 'user-1'));
        unawaited(tokens.saveToken(userId: 'user-1', token: 'token-1'));
        unawaited(
          db.userSettingsDao.upsertSettings(
            UserSettingsTableCompanion.insert(userId: 'user-1', data: '{}'),
          ),
        );
        async.flushMicrotasks();
        final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
          ..httpClientAdapter = const _UsersMeAdapter(statusCode: 502);
        dio.interceptors.add(RetryInterceptor(dio: dio));
        final container = ProviderContainer(
          retry: (int retryCount, Object error) => null,
          overrides: [
            fluxerDatabaseProvider.overrideWithValue(db),
            wellKnownProvider.overrideWith(_FakeWellKnown.new),
            appRuntimeInfoProvider.overrideWith((Ref ref) => _testRuntimeInfo),
            authTokenStorageProvider.overrideWithValue(tokens),
            fluxerDioProvider.overrideWithValue(dio),
            authenticatedSessionBindingsProvider.overrideWith((Ref ref) {}),
            gatewayConnectivityCheckProvider.overrideWithValue(
              () async => true,
            ),
          ],
        );
        container.read(appUiForegroundProvider.notifier).setResumed(true);
        container.listen(appStartupProvider, (_, _) {});

        async.elapse(const Duration(milliseconds: 200));
        expect(container.read(appStartupProvider), isA<AsyncData<void>>());
        expect(
          container.read(startupGatewayFallbackProvider),
          StartupGatewayFallback.cachedShell,
        );
        expect(container.read(authStateProvider), isTrue);

        container.read(gatewayReadyProvider.notifier).setReady();
        expect(
          container.read(startupGatewayFallbackProvider),
          StartupGatewayFallback.none,
        );

        async.elapse(kStartupGatewayFallbackDelay);
        expect(
          container.read(startupGatewayFallbackProvider),
          StartupGatewayFallback.none,
        );
        container.dispose();
        unawaited(db.close());
        async.elapse(const Duration(seconds: 1));
      });
    },
  );

  test('401 against another host does not expire the session', () async {
    final db = openTestDatabase();
    final MapAuthTokenStorage tokens = MapAuthTokenStorage();
    await _saveSession(db, tokens, apiBaseUrl: 'https://self.example/api');
    final container = _startupContainer(
      db: db,
      tokens: tokens,
      apiBaseUrl: 'https://other.example/api',
      statusCode: 401,
    );
    addTearDown(container.dispose);

    await container.read(appStartupProvider.future);

    final session = await db.authSessionDao.getSession('user-1');
    expect(session!.isValid, isTrue);
  });

  test('401 on the stored host expires the session', () async {
    final db = openTestDatabase();
    final MapAuthTokenStorage tokens = MapAuthTokenStorage();
    await _saveSession(db, tokens, apiBaseUrl: 'https://self.example/api');
    final container = _startupContainer(
      db: db,
      tokens: tokens,
      apiBaseUrl: 'https://self.example/api',
      statusCode: 401,
    );
    addTearDown(container.dispose);

    await container.read(appStartupProvider.future);

    final session = await db.authSessionDao.getSession('user-1');
    expect(session!.isValid, isFalse);
  });

  group('cache-first launch', () {
    test('opens the shell without waiting for /users/@me or READY', () async {
      _mockLaunchPreferences();
      final db = openTestDatabase();
      final MapAuthTokenStorage tokens = MapAuthTokenStorage();
      await _saveSession(db, tokens, apiBaseUrl: 'https://self.example/api');
      await _seedTrustedCache(db);
      final Completer<void> releaseUsersMe = Completer<void>();
      final container = _startupContainer(
        db: db,
        tokens: tokens,
        apiBaseUrl: 'https://self.example/api',
        adapter: _HoldingUsersMeAdapter(release: releaseUsersMe),
      );
      addTearDown(() {
        if (!releaseUsersMe.isCompleted) {
          releaseUsersMe.complete();
        }
        container.dispose();
      });

      container.listen(appStartupProvider, (_, _) {});
      await container.read(appStartupProvider.future);
      await pumpEventQueue();

      expect(
        container.read(startupGatewayFallbackProvider),
        StartupGatewayFallback.cacheFirst,
      );
      expect(container.read(shellDataReadyProvider), isTrue);
      expect(container.read(authStateProvider), isTrue);
      expect(container.read(currentUserIdProvider), 'user-1');

      container.read(gatewayReadyProvider.notifier).setReady();
      expect(
        container.read(startupGatewayFallbackProvider),
        StartupGatewayFallback.none,
      );
      expect(container.read(shellDataReadyProvider), isTrue);
    });

    for (final (String name, int generation, Duration liveAgo)
        in <(String, int, Duration)>[
          (
            'the cache generation is stale',
            kShellCacheGeneration - 1,
            const Duration(hours: 1),
          ),
          (
            'the cache was last live over 7 days ago',
            kShellCacheGeneration,
            kShellCacheMaxAge + const Duration(hours: 1),
          ),
        ]) {
      test('waits for /users/@me when $name', () async {
        _mockLaunchPreferences(generation: generation, liveAgo: liveAgo);
        final db = openTestDatabase();
        final MapAuthTokenStorage tokens = MapAuthTokenStorage();
        await _saveSession(db, tokens, apiBaseUrl: 'https://self.example/api');
        await _seedTrustedCache(db);
        final Completer<void> releaseUsersMe = Completer<void>();
        final container = _startupContainer(
          db: db,
          tokens: tokens,
          apiBaseUrl: 'https://self.example/api',
          adapter: _HoldingUsersMeAdapter(release: releaseUsersMe),
        );
        addTearDown(() {
          if (!releaseUsersMe.isCompleted) {
            releaseUsersMe.complete();
          }
          container.dispose();
        });
        container.listen(appStartupProvider, (_, _) {});

        await pumpEventQueue();

        expect(container.read(appStartupProvider), isA<AsyncLoading<void>>());
        expect(container.read(shellDataReadyProvider), isFalse);
      });
    }

    test(
      'waits for /users/@me when the cache belongs to another user',
      () async {
        _mockLaunchPreferences();
        final db = openTestDatabase();
        final MapAuthTokenStorage tokens = MapAuthTokenStorage();
        await _saveSession(db, tokens, apiBaseUrl: 'https://self.example/api');
        await db.userSettingsDao.upsertSettings(
          UserSettingsTableCompanion.insert(userId: 'user-2', data: '{}'),
        );
        final Completer<void> releaseUsersMe = Completer<void>();
        final container = _startupContainer(
          db: db,
          tokens: tokens,
          apiBaseUrl: 'https://self.example/api',
          adapter: _HoldingUsersMeAdapter(release: releaseUsersMe),
        );
        addTearDown(() {
          if (!releaseUsersMe.isCompleted) {
            releaseUsersMe.complete();
          }
          container.dispose();
        });
        container.listen(appStartupProvider, (_, _) {});

        await pumpEventQueue();

        expect(container.read(appStartupProvider), isA<AsyncLoading<void>>());
      },
    );

    test('a failed background check retries once when READY arrives', () async {
      _mockLaunchPreferences();
      final db = openTestDatabase();
      final MapAuthTokenStorage tokens = MapAuthTokenStorage();
      await _saveSession(db, tokens, apiBaseUrl: 'https://self.example/api');
      await _seedTrustedCache(db);
      final _CountingUsersMeAdapter adapter = _CountingUsersMeAdapter();
      final container = _startupContainer(
        db: db,
        tokens: tokens,
        apiBaseUrl: 'https://self.example/api',
        adapter: adapter,
      );
      addTearDown(container.dispose);
      container.listen(appStartupProvider, (_, _) {});

      await container.read(appStartupProvider.future);
      await pumpEventQueue();
      expect(adapter.usersMeRequests, 1);
      expect(container.read(authStateProvider), isTrue);

      container.read(gatewayReadyProvider.notifier).setReady();
      await pumpEventQueue();
      expect(adapter.usersMeRequests, 2);

      container.read(gatewayReadyProvider.notifier)
        ..reset()
        ..setReady();
      await pumpEventQueue();
      expect(adapter.usersMeRequests, 2);
      expect(container.read(authStateProvider), isTrue);
    });

    test(
      'a background check that fails after READY still retries once',
      () async {
        _mockLaunchPreferences();
        final db = openTestDatabase();
        final MapAuthTokenStorage tokens = MapAuthTokenStorage();
        await _saveSession(db, tokens, apiBaseUrl: 'https://self.example/api');
        await _seedTrustedCache(db);
        final Completer<void> release = Completer<void>();
        final _CountingUsersMeAdapter adapter = _CountingUsersMeAdapter(
          release: release,
        );
        final container = _startupContainer(
          db: db,
          tokens: tokens,
          apiBaseUrl: 'https://self.example/api',
          adapter: adapter,
        );
        addTearDown(() {
          if (!release.isCompleted) {
            release.complete();
          }
          container.dispose();
        });
        container.listen(appStartupProvider, (_, _) {});

        await container.read(appStartupProvider.future);
        await pumpEventQueue();
        expect(adapter.usersMeRequests, 1);

        container.read(gatewayReadyProvider.notifier).setReady();
        await pumpEventQueue();
        release.complete();
        await pumpEventQueue();

        expect(adapter.usersMeRequests, 2);
      },
    );

    test('a background 401 on the stored host signs out', () async {
      _mockLaunchPreferences();
      final db = openTestDatabase();
      final MapAuthTokenStorage tokens = MapAuthTokenStorage();
      await _saveSession(db, tokens, apiBaseUrl: 'https://self.example/api');
      await _seedTrustedCache(db);
      final container = _startupContainer(
        db: db,
        tokens: tokens,
        apiBaseUrl: 'https://self.example/api',
        statusCode: 401,
      );
      addTearDown(container.dispose);

      await container.read(appStartupProvider.future);
      await pumpEventQueue();

      final session = await db.authSessionDao.getSession('user-1');
      expect(session!.isValid, isFalse);
      expect(container.read(authStateProvider), isFalse);
    });

    test('a background 401 from another host keeps the session', () async {
      _mockLaunchPreferences();
      final db = openTestDatabase();
      final MapAuthTokenStorage tokens = MapAuthTokenStorage();
      await _saveSession(db, tokens, apiBaseUrl: 'https://self.example/api');
      await _seedTrustedCache(db);
      final container = _startupContainer(
        db: db,
        tokens: tokens,
        apiBaseUrl: 'https://other.example/api',
        statusCode: 401,
      );
      addTearDown(container.dispose);

      await container.read(appStartupProvider.future);
      await pumpEventQueue();

      final session = await db.authSessionDao.getSession('user-1');
      expect(session!.isValid, isTrue);
      expect(container.read(authStateProvider), isTrue);
    });
  });
}

Future<void> _seedTrustedCache(FluxerDatabase db) async {
  await db.userSettingsDao.upsertSettings(
    UserSettingsTableCompanion.insert(userId: 'user-1', data: '{}'),
  );
  await db.userDao.upsertUser(
    UsersCompanion.insert(id: 'user-1', username: 'me'),
  );
}

void _mockLaunchPreferences({
  int generation = kShellCacheGeneration,
  Duration liveAgo = const Duration(hours: 1),
}) {
  SharedPreferences.setMockInitialValues(<String, Object>{
    'shell_cache_generation': generation,
    'shell_cache_live_at': DateTime.now()
        .subtract(liveAgo)
        .millisecondsSinceEpoch,
  });
}

Future<void> _saveSession(
  FluxerDatabase db,
  MapAuthTokenStorage tokens, {
  required String apiBaseUrl,
}) async {
  await db.authSessionDao.saveSessionMetadata(
    userId: 'user-1',
    instanceSnapshotJson: InstanceConfigSnapshot(
      apiBaseUrl: apiBaseUrl,
      gatewayUrl: 'wss://self.example/gateway',
      displayDomain: 'self.example',
    ).toJson(),
  );
  await tokens.saveToken(userId: 'user-1', token: 'token-1');
}

ProviderContainer _startupContainer({
  required FluxerDatabase db,
  required MapAuthTokenStorage tokens,
  required String apiBaseUrl,
  int? statusCode,
  HttpClientAdapter? adapter,
}) {
  final Dio dio = Dio(BaseOptions(baseUrl: apiBaseUrl))
    ..httpClientAdapter = adapter ?? _UsersMeAdapter(statusCode: statusCode);
  return ProviderContainer(
    retry: (int retryCount, Object error) => null,
    overrides: [
      fluxerDatabaseProvider.overrideWithValue(db),
      wellKnownProvider.overrideWith(_FakeWellKnown.new),
      appRuntimeInfoProvider.overrideWith((Ref ref) => _testRuntimeInfo),
      authTokenStorageProvider.overrideWithValue(tokens),
      fluxerDioProvider.overrideWithValue(dio),
      authenticatedSessionBindingsProvider.overrideWith((Ref ref) {}),
    ],
  );
}

final AppRuntimeInfo _testRuntimeInfo = AppRuntimeInfo(
  packageName: 'com.fluxer',
  version: '1.0.0',
  buildNumber: '1',
  environment: AppBuildConfig.environment,
  pushProvider: AppBuildConfig.pushProvider,
  buildTimestamp: '',
);

class _UsersMeAdapter implements HttpClientAdapter {
  const _UsersMeAdapter({this.statusCode});

  final int? statusCode;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    return ResponseBody.fromString(
      'unavailable',
      statusCode ?? 503,
      statusMessage: 'Service Unavailable',
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['text/html'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _CountingUsersMeAdapter implements HttpClientAdapter {
  _CountingUsersMeAdapter({this.release});

  final Completer<void>? release;
  int usersMeRequests = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.path.endsWith('/users/@me')) {
      usersMeRequests++;
    }
    await release?.future;
    return ResponseBody.fromString(
      'error',
      500,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['text/plain'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

class _HoldingUsersMeAdapter implements HttpClientAdapter {
  _HoldingUsersMeAdapter({required this.release, this.statusCode});

  final Completer<void> release;
  final int? statusCode;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    await release.future;
    return ResponseBody.fromString(
      'unavailable',
      statusCode ?? 503,
      statusMessage: 'Service Unavailable',
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['text/html'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
