import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_dart/export.dart';

class _PendingWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() {
    return Completer<WellKnownFluxerResponse>().future;
  }
}

class _StaticWellKnown extends WellKnown {
  _StaticWellKnown(this.response);

  final WellKnownFluxerResponse response;

  @override
  Future<WellKnownFluxerResponse> build() async => response;
}

WellKnownFluxerResponse _wellKnownWithMessageLength(int length) {
  return WellKnownFluxerResponse(
    apiCodeVersion: 1,
    endpoints: const WellKnownFluxerResponseEndpoints(
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
    captcha: const WellKnownFluxerResponseCaptcha(
      provider: 'none',
      hcaptchaSiteKey: null,
      turnstileSiteKey: null,
    ),
    features: const WellKnownFluxerResponseFeatures(
      voiceEnabled: true,
      stripeEnabled: false,
      selfHosted: true,
      presignedAttachmentUploads: false,
      emailsEnabled: false,
    ),
    gif: const WellKnownFluxerResponseGif(
      provider: 'tenor',
      displayName: 'Tenor',
      attributionRequired: false,
    ),
    sso: const WellKnownFluxerResponseSso(
      enabled: false,
      enforced: false,
      displayName: null,
      redirectUri: 'https://example.test/sso',
    ),
    registration: const WellKnownFluxerResponseRegistration(
      mode: WellKnownFluxerResponseRegistrationModeMode.open,
      adminRegistrationUrlsEnabled: false,
    ),
    community: const WellKnownFluxerResponseCommunity(
      singleCommunity: false,
      singleCommunityGuildId: null,
      directMessagesDisabled: false,
    ),
    services: const WellKnownFluxerResponseServices(
      gifEnabled: true,
      youtubeEnabled: true,
      blueskyEnabled: false,
    ),
    limits: WellKnownFluxerResponseLimits(
      version: WellKnownFluxerResponseLimitsVersionVersion.value2,
      traitDefinitions: const <String>[],
      defaultsHash: 'test',
      rules: <WellKnownFluxerResponseLimitsRules>[
        WellKnownFluxerResponseLimitsRules(
          id: 'default',
          overrides: <String, num>{LimitKeys.maxMessageLength: length},
        ),
      ],
    ),
    push: const WellKnownFluxerResponsePush(publicVapidKey: null),
    appPublic: const WellKnownFluxerResponseAppPublic(
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
  group('message length limits providers', () {
    test(
      'maxMessageLength uses non-premium fallback when well-known loading',
      () {
        final ProviderContainer container = ProviderContainer(
          overrides: [
            wellKnownProvider.overrideWith(_PendingWellKnown.new),
            currentUserLimitContextProvider.overrideWith(
              (Ref ref) => buildUserLimitContext(traits: const <String>[]),
            ),
            isEffectivelyPremiumProvider.overrideWith((Ref ref) => false),
          ],
        );
        addTearDown(container.dispose);

        expect(
          container.read(maxMessageLengthProvider),
          kMaxMessageLengthNonPremium,
        );
      },
    );

    test('maxMessageLength uses premium fallback for premium users', () {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          wellKnownProvider.overrideWith(_PendingWellKnown.new),
          currentUserLimitContextProvider.overrideWith(
            (Ref ref) =>
                buildUserLimitContext(traits: const <String>['premium']),
          ),
          isEffectivelyPremiumProvider.overrideWith((Ref ref) => true),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(maxMessageLengthProvider),
        kMaxMessageLengthPremium,
      );
    });

    test('premiumMaxMessageLength uses premium fallback when loading', () {
      final ProviderContainer container = ProviderContainer(
        overrides: [wellKnownProvider.overrideWith(_PendingWellKnown.new)],
      );
      addTearDown(container.dispose);

      expect(
        container.read(premiumMaxMessageLengthProvider),
        kMaxMessageLengthPremium,
      );
    });

    test('maxMessageLength uses well-known instance limits', () async {
      final WellKnownFluxerResponse wellKnown = _wellKnownWithMessageLength(
        9999,
      );
      final ProviderContainer container = ProviderContainer(
        overrides: [
          wellKnownProvider.overrideWith(() => _StaticWellKnown(wellKnown)),
          currentUserLimitContextProvider.overrideWith(
            (Ref ref) => buildUserLimitContext(traits: const <String>[]),
          ),
          isEffectivelyPremiumProvider.overrideWith((Ref ref) => false),
        ],
      );
      addTearDown(container.dispose);
      await container.read(wellKnownProvider.future);

      expect(container.read(maxMessageLengthProvider), 9999);
      expect(container.read(premiumMaxMessageLengthProvider), 9999);
    });

    test(
      'maxMessageLength uses cached well-known while discovery is loading',
      () {
        final WellKnownFluxerResponse wellKnown = _wellKnownWithMessageLength(
          9999,
        );
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
            currentUserLimitContextProvider.overrideWith(
              (Ref ref) => buildUserLimitContext(traits: const <String>[]),
            ),
            isEffectivelyPremiumProvider.overrideWith((Ref ref) => false),
          ],
        );
        addTearDown(container.dispose);

        expect(container.read(wellKnownProvider).isLoading, isTrue);
        expect(container.read(maxMessageLengthProvider), 9999);
      },
    );
  });
}
