import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';

class _EveryoneModeWellKnown extends WellKnown {
  _EveryoneModeWellKnown(this.response);

  final WellKnownFluxerResponse response;

  @override
  Future<WellKnownFluxerResponse> build() async => response;
}

WellKnownFluxerResponse _buildEveryoneModeWellKnown() {
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
    limits: const WellKnownFluxerResponseLimits(
      version: WellKnownFluxerResponseLimitsVersionVersion.value2,
      traitDefinitions: <String>[],
      defaultsHash: 'test',
      rules: <LimitRuleResponse>[
        LimitRuleResponse(
          id: 'default',
          overrides: <String, num>{'feature_global_expressions': 1},
        ),
      ],
    ),
    push: const WellKnownFluxerResponsePush(publicVapidKey: null),
    appPublic: const <String, Object?>{},
  );
}

void main() {
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
