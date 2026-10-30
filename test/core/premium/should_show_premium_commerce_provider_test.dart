import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';

class _PendingWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() =>
      Completer<WellKnownFluxerResponse>().future;
}

WellKnownFluxerResponse _selfHostedWellKnown({bool premiumEnabled = false}) {
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
    features: InstanceFeaturesSchema(
      voiceEnabled: true,
      stripeEnabled: false,
      premiumEnabled: premiumEnabled,
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
      gifEnabled: true,
      youtubeEnabled: true,
      blueskyEnabled: false,
    ),
    limits: const WellKnownFluxerResponseLimits(
      version: 2,
      traitDefinitions: <String>[],
      defaultsHash: 'test',
      rules: <WellKnownFluxerResponseLimitsRules>[
        WellKnownFluxerResponseLimitsRules(
          id: 'default',
          overrides: <String, num>{},
        ),
      ],
    ),
    push: const InstancePushSchema(publicVapidKey: null),
    appPublic: const InstanceAppPublicSchema(
      branding: InstanceBrandingSchema(
        productName: 'Acme',
        iconUrl: null,
        symbolUrl: null,
        logoUrl: null,
        wordmarkUrl: null,
        faviconUrl: null,
        themeColor: null,
        statusPageUrl: null,
        statusPageIncidentHistoryUrl: null,
        premiumProductName: 'Plutonium',
        premiumInfoUrl: null,
        faviconDarkUrl: null,
        signInBackdropUrl: null,
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
  );
}

void main() {
  group('shouldShowPremiumCommerce', () {
    test('is false when cached well-known is self-hosted during loading', () {
      final WellKnownFluxerResponse wellKnown = _selfHostedWellKnown();
      final ProviderContainer container = ProviderContainer(
        overrides: [
          wellKnownProvider.overrideWith(_PendingWellKnown.new),
          activeInstanceProvider.overrideWithValue(
            InstanceConfigSnapshot(
              apiBaseUrl: 'https://example.test/api',
              gatewayUrl: '',
              displayDomain: 'example.test',
              wellKnown: wellKnown,
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      expect(container.read(wellKnownProvider).isLoading, isTrue);
      expect(container.read(shouldShowPremiumCommerceProvider), isFalse);
    });

    test('stays false when a self-hosted instance enables premium', () {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          wellKnownProvider.overrideWith(_PendingWellKnown.new),
          activeInstanceProvider.overrideWithValue(
            InstanceConfigSnapshot(
              apiBaseUrl: 'https://example.test/api',
              gatewayUrl: '',
              displayDomain: 'example.test',
              wellKnown: _selfHostedWellKnown(premiumEnabled: true),
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(instanceRuntimeConfigProvider).showsPremiumFeatures,
        isTrue,
      );
      expect(container.read(shouldShowPremiumCommerceProvider), isFalse);
    });
  });
}
