import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/providers/app_runtime_info_provider.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

class _FakeWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() async {
    return const WellKnownFluxerResponse(
      apiCodeVersion: 1,
      endpoints: WellKnownFluxerResponseEndpoints(
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
      captcha: WellKnownFluxerResponseCaptcha(
        provider: 'none',
        hcaptchaSiteKey: null,
        turnstileSiteKey: null,
      ),
      features: WellKnownFluxerResponseFeatures(
        voiceEnabled: false,
        stripeEnabled: false,
        selfHosted: false,
        presignedAttachmentUploads: false,
        emailsEnabled: false,
      ),
      gif: WellKnownFluxerResponseGif(
        provider: '',
        displayName: '',
        attributionRequired: false,
      ),
      sso: WellKnownFluxerResponseSso(
        enabled: false,
        enforced: false,
        displayName: null,
        redirectUri: '',
      ),
      registration: WellKnownFluxerResponseRegistration(
        mode: WellKnownFluxerResponseRegistrationModeMode.open,
        adminRegistrationUrlsEnabled: false,
      ),
      community: WellKnownFluxerResponseCommunity(
        singleCommunity: false,
        singleCommunityGuildId: null,
        directMessagesDisabled: false,
      ),
      services: WellKnownFluxerResponseServices(
        gifEnabled: false,
        youtubeEnabled: false,
        blueskyEnabled: false,
      ),
      limits: WellKnownFluxerResponseLimits(
        version: WellKnownFluxerResponseLimitsVersionVersion.value2,
        traitDefinitions: <String>[],
        rules: <WellKnownFluxerResponseLimitsRules>[],
        defaultsHash: '',
      ),
      push: WellKnownFluxerResponsePush(publicVapidKey: null),
      appPublic: WellKnownFluxerResponseAppPublic(
        branding: WellKnownFluxerResponseAppPublicBranding(
          productName: '',
          iconUrl: null,
          symbolUrl: null,
          logoUrl: null,
          wordmarkUrl: null,
          faviconUrl: null,
          themeColor: null,
        ),
        setup: WellKnownFluxerResponseAppPublicSetup(
          configured: true,
          adminUrl: null,
        ),
        legal: WellKnownFluxerResponseAppPublicLegal(
          termsUrl: null,
          privacyUrl: null,
        ),
        registration: WellKnownFluxerResponseAppPublicRegistration(
          collectDateOfBirth: false,
        ),
      ),
    );
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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
            appName: 'Fluxer',
            packageName: 'app.fluxer.test',
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
}
