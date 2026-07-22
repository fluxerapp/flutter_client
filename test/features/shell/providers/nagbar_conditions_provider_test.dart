import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/data/scheduled_maintenance_dismissal_storage.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_conditions.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_dismissals_state.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_type.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_app/features/shell/providers/guild_membership_cta_visibility_provider.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_conditions_provider.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/shell/providers/push_notification_permission_status_provider.dart';
import 'package:fluxer_app/features/shell/providers/scheduled_maintenance_dismissal_provider.dart';
import 'package:fluxer_app/features/shell/providers/service_status_maintenance_provider.dart';
import 'package:fluxer_app/features/shell/providers/visible_nagbars_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  group('nagbarConditionsProvider', () {
    test('flags unclaimed accounts without verified email', () async {
      final ProviderContainer container = _container(
        settings: const UserSettingsViewState(
          userId: '1',
          username: 'guest',
          displayName: 'guest',
          discriminator: '0001',
          avatar: null,
          avatarColor: null,
          memberSince: null,
          status: 'online',
          messageDisplayCompact: false,
          developerMode: false,
          trustedDomains: <String>[],
        ),
      );
      addTearDown(container.dispose);
      await container.read(wellKnownProvider.future);

      final NagbarConditions conditions = await container.read(
        nagbarConditionsProvider.future,
      );

      expect(conditions.userIsUnclaimed, isTrue);
      expect(conditions.userNeedsVerification, isFalse);
    });

    test(
      'flags email verification when email exists but is not verified',
      () async {
        final ProviderContainer container = _container(
          settings: const UserSettingsViewState(
            userId: '1',
            username: 'user',
            displayName: 'user',
            discriminator: '0001',
            avatar: null,
            avatarColor: null,
            memberSince: null,
            status: 'online',
            messageDisplayCompact: false,
            developerMode: false,
            trustedDomains: <String>[],
            email: 'user@example.com',
          ),
        );
        addTearDown(container.dispose);
        await container.read(wellKnownProvider.future);

        final NagbarConditions conditions = await container.read(
          nagbarConditionsProvider.future,
        );

        expect(conditions.userIsUnclaimed, isFalse);
        expect(conditions.userNeedsVerification, isTrue);
      },
    );

    test('hides premium commerce on self-hosted instances', () async {
      final ProviderContainer container = _container(selfHosted: true);
      addTearDown(container.dispose);
      await container.read(wellKnownProvider.future);

      expect(container.read(shouldShowPremiumCommerceProvider), isFalse);
    });

    test('shows scheduled maintenance when not dismissed', () async {
      final ServiceStatusMaintenance maintenance = ServiceStatusMaintenance(
        id: 'maint-1',
        name: 'Maintenance',
        status: ServiceStatusMaintenanceStatus.scheduled,
        start: DateTime.utc(2099, 1, 1, 12),
        durationMinutes: 60,
        url: 'https://status.example',
      );
      final ProviderContainer container = _container(maintenance: maintenance);
      addTearDown(container.dispose);
      await container.read(wellKnownProvider.future);

      final NagbarConditions conditions = await container.read(
        nagbarConditionsProvider.future,
      );

      expect(conditions.canShowScheduledMaintenance, isTrue);
    });
  });

  group('visibleNagbarsProvider', () {
    test('maps unclaimed conditions to the unclaimed nagbar', () async {
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          nagbarConditionsProvider.overrideWith(
            (Ref ref) => _emptyConditions(userIsUnclaimed: true),
          ),
        ],
      );
      addTearDown(container.dispose);

      final List<NagbarType> types = (await container.read(
        visibleNagbarsProvider.future,
      )).map((state) => state.type).toList();

      expect(types, contains(NagbarType.unclaimedAccount));
    });
  });
}

NagbarConditions _emptyConditions({
  bool userIsUnclaimed = false,
  bool userNeedsVerification = false,
  bool canShowScheduledMaintenance = false,
  bool canShowPremiumGracePeriod = false,
  bool canShowPremiumExpired = false,
  bool canShowPremiumOnboarding = false,
}) {
  return NagbarConditions(
    canShowCorruptedInstallation: false,
    canShowTermsAcceptance: false,
    canShowScheduledMaintenance: canShowScheduledMaintenance,
    userIsUnclaimed: userIsUnclaimed,
    userNeedsVerification: userNeedsVerification,
    canShowPremiumExpired: canShowPremiumExpired,
    canShowPremiumGracePeriod: canShowPremiumGracePeriod,
    canShowVoiceSessionRestore: false,
    canShowPremiumOnboarding: canShowPremiumOnboarding,
    canShowGiftInventory: false,
    canShowGuildMembershipCta: false,
    canShowVisionaryMfa: false,
    canShowPushNotification: false,
    canShowLinuxInputAccess: false,
    canShowDesktopDownload: false,
    canShowSoftwareEncoder: false,
    canShowStreamerMode: false,
  );
}

ProviderContainer _container({
  UserSettingsViewState? settings,
  bool selfHosted = false,
  ServiceStatusMaintenance? maintenance,
}) {
  final MapScheduledMaintenanceDismissalStorage dismissalStorage =
      MapScheduledMaintenanceDismissalStorage();
  return ProviderContainer(
    overrides: <Override>[
      fluxerClientProvider.overrideWithValue(_UnavailableFluxerClient()),
      userSettingsViewModelProvider.overrideWith(
        () => _FixedUserSettings(settings ?? _defaultSettings()),
      ),
      nagbarDismissalsProvider.overrideWith(
        () => _FixedNagbarDismissals(const NagbarDismissalsState()),
      ),
      currentUserPrivateReadProvider.overrideWith(
        () => _FixedCurrentUserPrivate(null),
      ),
      serviceStatusMaintenanceReadProvider.overrideWith(
        () => _FixedMaintenance(maintenance),
      ),
      wellKnownProvider.overrideWith(
        () =>
            _FixedWellKnown(response: _buildWellKnown(selfHosted: selfHosted)),
      ),
      scheduledMaintenanceDismissalStorageProvider.overrideWithValue(
        dismissalStorage,
      ),
      guildMembershipCtaVisibleProvider.overrideWith((Ref ref) => false),
      pushNotificationPermissionGrantedProvider.overrideWith((Ref ref) => true),
    ],
  );
}

UserSettingsViewState _defaultSettings() {
  return const UserSettingsViewState(
    userId: '1',
    username: 'user',
    displayName: 'user',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
    email: 'user@example.com',
    verified: true,
  );
}

WellKnownFluxerResponse _buildWellKnown({required bool selfHosted}) {
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
    features: WellKnownFluxerResponseFeatures(
      voiceEnabled: true,
      stripeEnabled: false,
      selfHosted: selfHosted,
      presignedAttachmentUploads: false,
      emailsEnabled: true,
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
    limits: const WellKnownFluxerResponseLimits(
      version: WellKnownFluxerResponseLimitsVersionVersion.value2,
      traitDefinitions: <String>[],
      defaultsHash: 'test',
      rules: <WellKnownFluxerResponseLimitsRules>[],
    ),
    push: const WellKnownFluxerResponsePush(publicVapidKey: null),
    appPublic: const WellKnownFluxerResponseAppPublic(
      branding: WellKnownFluxerResponseAppPublicBranding(
        productName: 'Fluxer',
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

class _UnavailableFluxerClient implements FluxerClient {
  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('network disabled in test');
}

class _FixedUserSettings extends UserSettingsViewModel {
  _FixedUserSettings(this._state);

  final UserSettingsViewState _state;

  @override
  UserSettingsViewState build() => _state;
}

class _FixedNagbarDismissals extends NagbarDismissals {
  _FixedNagbarDismissals(this._state);

  final NagbarDismissalsState _state;

  @override
  NagbarDismissalsState build() => _state;
}

class _FixedCurrentUserPrivate extends CurrentUserPrivateRead {
  _FixedCurrentUserPrivate(this._user);

  final UserPrivateResponse? _user;

  @override
  UserPrivateResponse? build() => _user;
}

class _FixedMaintenance extends ServiceStatusMaintenanceRead {
  _FixedMaintenance(this._maintenance);

  final ServiceStatusMaintenance? _maintenance;

  @override
  ServiceStatusMaintenance? build() => _maintenance;
}

class _FixedWellKnown extends WellKnown {
  _FixedWellKnown({required this.response});

  final WellKnownFluxerResponse response;

  @override
  Future<WellKnownFluxerResponse> build() async => response;
}
