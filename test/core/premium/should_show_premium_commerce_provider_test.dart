import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';

class _PendingWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() =>
      Completer<WellKnownFluxerResponse>().future;
}

WellKnownFluxerResponse _selfHostedWellKnown() {
  return const WellKnownFluxerResponse(
    apiCodeVersion: 1,
    endpoints: WellKnownFluxerResponseEndpoints(
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
    captcha: WellKnownFluxerResponseCaptcha(
      provider: 'none',
      hcaptchaSiteKey: null,
      turnstileSiteKey: null,
    ),
    features: WellKnownFluxerResponseFeatures(
      voiceEnabled: true,
      stripeEnabled: false,
      selfHosted: true,
      presignedAttachmentUploads: false,
      emailsEnabled: false,
    ),
    gif: WellKnownFluxerResponseGif(
      provider: 'tenor',
      displayName: 'Tenor',
      attributionRequired: false,
    ),
    sso: WellKnownFluxerResponseSso(
      enabled: false,
      enforced: false,
      displayName: null,
      redirectUri: 'https://example.test/sso',
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
      gifEnabled: true,
      youtubeEnabled: true,
      blueskyEnabled: false,
    ),
    limits: WellKnownFluxerResponseLimits(
      version: WellKnownFluxerResponseLimitsVersionVersion.value2,
      traitDefinitions: <String>[],
      defaultsHash: 'test',
      rules: <WellKnownFluxerResponseLimitsRules>[
        WellKnownFluxerResponseLimitsRules(
          id: 'default',
          overrides: <String, num>{},
        ),
      ],
    ),
    push: WellKnownFluxerResponsePush(publicVapidKey: null),
    appPublic: WellKnownFluxerResponseAppPublic(
      branding: WellKnownFluxerResponseAppPublicBranding(
        productName: 'Acme',
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
  });
}
