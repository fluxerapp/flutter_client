import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';

class _EveryoneModeWellKnown extends WellKnown {
  _EveryoneModeWellKnown(this.response);

  final WellKnownFluxerResponse response;

  @override
  Future<WellKnownFluxerResponse> build() async => response;
}

WellKnownFluxerResponse _buildEveryoneModeWellKnown({
  Map<String, num> overrides = const <String, num>{
    'feature_global_expressions': 1,
  },
}) {
  return WellKnownFluxerResponse(
    apiCodeVersion: 1,
    endpoints: const InstanceEndpointsSchema(
      api: 'https://example.test/api',
      apiClient: 'https://example.test/api/client',
      apiPublic: 'https://example.test/api/public',
      gateway: 'wss://example.test/gateway',
      media: 'https://example.test/media',
      staticCdn: 'https://example.test/static',
      marketing: 'https://example.test',
      admin: 'https://example.test/admin',
      invite: 'https://example.test/invite',
      gift: 'https://example.test/gift',
      webapp: 'https://example.test/webapp',
    ),
    captcha: const InstanceCaptchaSchema(provider: CaptchaProviderSchema.none),
    features: const InstanceFeaturesSchema(
      voiceEnabled: true,
      stripeEnabled: false,
      premiumEnabled: false,
      stripeServiceable: false,
      selfHosted: true,
      presignedAttachmentUploads: false,
      emailsEnabled: false,
      phoneVerificationEnabled: false,
      accountIdentity: AccountIdentityModeSchema.email,
      tagStyle: TagStyleSchema.random,
    ),
    gif: const InstanceGifSchema(
      provider: 'tenor',
      displayName: 'Tenor',
      attributionRequired: false,
    ),
    sso: const InstanceSsoSchema(
      enabled: false,
      enforced: false,
      usernameFromProvider: false,
      displayName: null,
      buttonLabel: null,
      redirectUri: 'https://example.test/sso',
    ),
    registration: const InstanceRegistrationSchema(
      mode: InstanceRegistrationModeSchema.open,
      adminRegistrationUrlsEnabled: false,
    ),
    community: const InstanceCommunitySchema(
      singleCommunity: false,
      singleCommunityGuildId: null,
      directMessagesDisabled: false,
      guildCreateAccess: true,
    ),
    services: const InstanceServicesSchema(
      connectionProviders: <InstanceConnectionProviderSchema>[],
      gifEnabled: true,
      youtubeEnabled: true,
      blueskyEnabled: false,
    ),
    limits: WellKnownFluxerResponseLimits(
      version: 2,
      traitDefinitions: const <String>[],
      defaultsHash: 'test',
      rules: <WellKnownFluxerResponseLimitsRules>[
        WellKnownFluxerResponseLimitsRules(id: 'default', overrides: overrides),
      ],
    ),
    push: const InstancePushSchema(publicVapidKey: null),
    appPublic: const InstanceAppPublicSchema(
      branding: InstanceBrandingSchema(
        productName: 'Fluxer',
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
        collectDateOfBirth: true,
      ),
    ),
    agePolicy: const InstanceAgePolicySchema(geos: []),
  );
}

Future<ProviderContainer> _containerWith(
  WellKnownFluxerResponse response,
) async {
  final ProviderContainer container = ProviderContainer(
    overrides: [
      wellKnownProvider.overrideWith(() => _EveryoneModeWellKnown(response)),
      currentUserLimitContextProvider.overrideWith(
        (Ref ref) => buildUserLimitContext(traits: const <String>[]),
      ),
    ],
  );
  await container.read(wellKnownProvider.future);
  return container;
}

void main() {
  group('maxBioLength', () {
    test('follows an instance that raises the bio limit to 1000', () async {
      final ProviderContainer container = await _containerWith(
        _buildEveryoneModeWellKnown(
          overrides: const <String, num>{'max_bio_length': 1000},
        ),
      );
      addTearDown(container.dispose);

      expect(
        container.read(instanceLimitProvider(LimitKeys.maxBioLength)),
        1000,
      );
    });

    test('stays at 320 when the instance sets no bio limit', () async {
      final ProviderContainer container = await _containerWith(
        _buildEveryoneModeWellKnown(overrides: const <String, num>{}),
      );
      addTearDown(container.dispose);

      expect(
        container.read(instanceLimitProvider(LimitKeys.maxBioLength)),
        320,
      );
    });
  });
  group('instanceFeatureEnabledProvider', () {
    test('returns true when everyone-mode limits enable the feature', () async {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          wellKnownProvider.overrideWith(
            () => _EveryoneModeWellKnown(_buildEveryoneModeWellKnown()),
          ),
          currentUserLimitContextProvider.overrideWith(
            (Ref ref) => buildUserLimitContext(traits: const <String>[]),
          ),
        ],
      );
      addTearDown(container.dispose);
      await container.read(wellKnownProvider.future);

      expect(
        container.read(
          instanceFeatureEnabledProvider(LimitKeys.featureGlobalExpressions),
        ),
        isTrue,
      );
      expect(container.read(shouldShowPremiumCommerceProvider), isFalse);
    });
  });
}
