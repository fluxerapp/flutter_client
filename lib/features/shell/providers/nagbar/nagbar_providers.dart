import 'package:fluxer_app/core/constants/policy_constants.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_conditions.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_dismissals_state.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_state.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_type.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';
import 'package:fluxer_app/features/shell/providers/nagbar/guild_membership_cta_visibility_provider.dart';
import 'package:fluxer_app/features/shell/providers/nagbar/push_notification_permission_status_provider.dart';
import 'package:fluxer_app/features/shell/providers/service_status/scheduled_maintenance_dismissal_provider.dart';
import 'package:fluxer_app/features/shell/providers/service_status/service_status_maintenance_provider.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_app/features/shell/utils/nagbar_selection.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nagbar_providers.g.dart';

@Riverpod(keepAlive: true)
class NagbarDismissals extends _$NagbarDismissals {
  @override
  NagbarDismissalsState build() {
    ref.watch(currentUserIdProvider);
    return const NagbarDismissalsState();
  }

  void applySynced(NagbarDismissalsState value) {
    if (state == value) {
      return;
    }
    state = value;
  }

  Future<void> dismissPushNotification() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(pushNotificationDismissed: true),
    );
  }

  Future<void> dismissPremiumGracePeriod() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(premiumGracePeriodDismissed: true),
    );
  }

  Future<void> dismissPremiumExpired() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(premiumExpiredDismissed: true),
    );
  }

  Future<void> dismissPremiumOnboarding() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(premiumOnboardingDismissed: true),
    );
  }

  Future<void> dismissGiftInventory() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(giftInventoryDismissed: true),
    );
  }

  Future<void> dismissGuildMembershipCta() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(guildMembershipCtaDismissed: true),
    );
  }

  Future<void> dismissVisionaryMfa() async {
    await _setDismissed(
      (NagbarDismissalsState value) =>
          value.copyWith(visionaryMfaDismissed: true),
    );
  }

  Future<void> _setDismissed(
    NagbarDismissalsState Function(NagbarDismissalsState current) update,
  ) async {
    state = update(state);
    ref.markSyncedDirty(SyncedPreferenceField.nagbars);
  }
}

const Duration kPremiumGracePeriod = Duration(days: 3);
const Duration kPremiumExpiredWindow = Duration(days: 30);

@Riverpod(keepAlive: true)
Future<NagbarConditions> nagbarConditions(Ref ref) async {
  ref.watch(scheduledMaintenanceDismissalReadProvider);
  final NagbarDismissalsState dismissals = ref.watch(nagbarDismissalsProvider);
  final UserSettingsViewState settings = ref.watch(
    userSettingsViewModelProvider,
  );
  final UserPrivateResponse? privateUser = ref.watch(
    currentUserPrivateReadProvider,
  );
  final ServiceStatusMaintenance? maintenance = ref.watch(
    serviceStatusMaintenanceReadProvider,
  );
  final bool showPremiumCommerce = ref.watch(shouldShowPremiumCommerceProvider);
  final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
    wellKnownProvider,
  );
  final bool isSelfHosted = wellKnown.maybeWhen(
    data: (WellKnownFluxerResponse response) => response.features.selfHosted,
    orElse: () => false,
  );
  final bool emailsEnabled = wellKnown.maybeWhen(
    data: (WellKnownFluxerResponse response) => response.features.emailsEnabled,
    orElse: () => true,
  );
  bool canShowScheduledMaintenance = false;
  if (maintenance != null) {
    canShowScheduledMaintenance = !await ref
        .read(scheduledMaintenanceDismissalReadProvider.notifier)
        .isDismissed(maintenance);
  }
  final bool userIsUnclaimed = settings.isKnownUnclaimed;
  final bool userNeedsVerification =
      emailsEnabled && settings.needsKnownEmailVerification;
  final bool canShowPremiumGracePeriod = _canShowPremiumGracePeriod(
    settings: settings,
    dismissals: dismissals,
    showPremiumCommerce: showPremiumCommerce,
    isSelfHosted: isSelfHosted,
  );
  final bool canShowPremiumExpired = _canShowPremiumExpired(
    settings: settings,
    dismissals: dismissals,
    showPremiumCommerce: showPremiumCommerce,
    isSelfHosted: isSelfHosted,
  );
  final bool canShowPremiumOnboarding = _canShowPremiumOnboarding(
    privateUser: privateUser,
    settings: settings,
    dismissals: dismissals,
    showPremiumCommerce: showPremiumCommerce,
    isSelfHosted: isSelfHosted,
  );
  final bool canShowGiftInventory = _canShowGiftInventory(
    privateUser: privateUser,
    dismissals: dismissals,
    showPremiumCommerce: showPremiumCommerce,
    isSelfHosted: isSelfHosted,
  );
  final bool canShowVisionaryMfa = _canShowVisionaryMfa(
    settings: settings,
    dismissals: dismissals,
    showPremiumCommerce: showPremiumCommerce,
    isSelfHosted: isSelfHosted,
  );
  final bool canShowGuildMembershipCta =
      !isSelfHosted &&
      !dismissals.guildMembershipCtaDismissed &&
      await ref.watch(guildMembershipCtaVisibleProvider.future);
  final AsyncValue<bool> pushPermission = ref.watch(
    pushNotificationPermissionGrantedProvider,
  );
  final bool canShowPushNotification = pushPermission.maybeWhen(
    data: (bool granted) => !granted && !dismissals.pushNotificationDismissed,
    orElse: () => false,
  );
  return NagbarConditions(
    canShowCorruptedInstallation: false,
    canShowTermsAcceptance: _needsTermsAcceptance(
      privateUser: privateUser,
      isSelfHosted: isSelfHosted,
    ),
    canShowScheduledMaintenance: canShowScheduledMaintenance,
    userIsUnclaimed: userIsUnclaimed,
    userNeedsVerification: userNeedsVerification,
    canShowAccountLimited: settings.accountLimited,
    canShowPremiumExpired: canShowPremiumExpired,
    canShowPremiumGracePeriod: canShowPremiumGracePeriod,
    canShowVoiceSessionRestore: false,
    canShowPremiumOnboarding: canShowPremiumOnboarding,
    canShowGiftInventory: canShowGiftInventory,
    canShowGuildMembershipCta: canShowGuildMembershipCta,
    canShowVisionaryMfa: canShowVisionaryMfa,
    canShowPushNotification: canShowPushNotification,
    canShowLinuxInputAccess: false,
    canShowDesktopDownload: false,
    canShowSoftwareEncoder: false,
    canShowStreamerMode: false,
  );
}

@Riverpod(keepAlive: true)
Future<List<NagbarState>> visibleNagbars(Ref ref) async {
  final NagbarConditions conditions = await ref.watch(
    nagbarConditionsProvider.future,
  );
  final List<NagbarState> nagbars = <NagbarState>[
    NagbarState(
      type: NagbarType.corruptedInstallation,
      priority: -10,
      visible: conditions.canShowCorruptedInstallation,
      dismissible: false,
    ),
    NagbarState(
      type: NagbarType.termsAcceptance,
      priority: -5,
      visible: conditions.canShowTermsAcceptance,
      dismissible: false,
    ),
    NagbarState(
      type: NagbarType.scheduledMaintenance,
      priority: -1,
      visible: conditions.canShowScheduledMaintenance,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.unclaimedAccount,
      priority: -4,
      visible: conditions.userIsUnclaimed,
      dismissible: false,
    ),
    NagbarState(
      type: NagbarType.emailVerification,
      priority: -3,
      visible: conditions.userNeedsVerification,
      dismissible: false,
    ),
    NagbarState(
      type: NagbarType.accountLimited,
      priority: -3.75,
      visible: conditions.canShowAccountLimited,
      dismissible: false,
    ),
    NagbarState(
      type: NagbarType.premiumExpired,
      priority: 0,
      visible: conditions.canShowPremiumExpired,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.premiumGracePeriod,
      priority: 1,
      visible: conditions.canShowPremiumGracePeriod,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.voiceSessionRestore,
      priority: -3.5,
      visible: conditions.canShowVoiceSessionRestore,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.premiumOnboarding,
      priority: 4,
      visible: conditions.canShowPremiumOnboarding,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.giftInventory,
      priority: 5,
      visible: conditions.canShowGiftInventory,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.guildMembershipCta,
      priority: 6,
      visible: conditions.canShowGuildMembershipCta,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.visionaryMfa,
      priority: 7,
      visible: conditions.canShowVisionaryMfa,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.pushNotification,
      priority: 8,
      visible: conditions.canShowPushNotification,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.linuxInputAccess,
      priority: 8.5,
      visible: conditions.canShowLinuxInputAccess,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.desktopDownload,
      priority: 9,
      visible: conditions.canShowDesktopDownload,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.softwareEncoder,
      priority: -2,
      visible: conditions.canShowSoftwareEncoder,
      dismissible: true,
    ),
    NagbarState(
      type: NagbarType.streamerMode,
      priority: -2.5,
      visible: conditions.canShowStreamerMode,
      dismissible: true,
    ),
  ];
  return selectVisibleNagbars(nagbars);
}

bool _needsTermsAcceptance({
  required UserPrivateResponse? privateUser,
  required bool isSelfHosted,
}) {
  if (privateUser == null || isSelfHosted) {
    return false;
  }
  if (kTermsOfServiceLastUpdated == null && kPrivacyPolicyLastUpdated == null) {
    return false;
  }
  final DateTime? termsAgreedAt = _parseDate(privateUser.termsAgreedAt);
  final DateTime? privacyAgreedAt = _parseDate(privateUser.privacyAgreedAt);
  final bool termsOutdated =
      kTermsOfServiceLastUpdated != null &&
      (termsAgreedAt == null ||
          termsAgreedAt.toUtc().toIso8601String().compareTo(
                kTermsOfServiceLastUpdated!,
              ) <
              0);
  final bool privacyOutdated =
      kPrivacyPolicyLastUpdated != null &&
      (privacyAgreedAt == null ||
          privacyAgreedAt.toUtc().toIso8601String().compareTo(
                kPrivacyPolicyLastUpdated!,
              ) <
              0);
  return termsOutdated || privacyOutdated;
}

DateTime? _parseDate(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return DateTime.tryParse(value);
}

bool _canShowPremiumGracePeriod({
  required UserSettingsViewState settings,
  required NagbarDismissalsState dismissals,
  required bool showPremiumCommerce,
  required bool isSelfHosted,
}) {
  if (!showPremiumCommerce ||
      isSelfHosted ||
      dismissals.premiumGracePeriodDismissed) {
    return false;
  }
  final String? premiumUntil = settings.premiumUntil;
  if (premiumUntil == null ||
      settings.hasLifetimePremium ||
      settings.premiumWillCancel) {
    return false;
  }
  final DateTime? expiryDate = DateTime.tryParse(premiumUntil);
  if (expiryDate == null) {
    return false;
  }
  final DateTime now = DateTime.now().toUtc();
  final DateTime graceEndDate = expiryDate.add(kPremiumGracePeriod);
  return now.isAfter(expiryDate) && !now.isAfter(graceEndDate);
}

bool _canShowPremiumExpired({
  required UserSettingsViewState settings,
  required NagbarDismissalsState dismissals,
  required bool showPremiumCommerce,
  required bool isSelfHosted,
}) {
  if (!showPremiumCommerce ||
      isSelfHosted ||
      dismissals.premiumExpiredDismissed) {
    return false;
  }
  final String? premiumUntil = settings.premiumUntil;
  if (premiumUntil == null ||
      settings.hasLifetimePremium ||
      settings.premiumWillCancel) {
    return false;
  }
  final DateTime? expiryDate = DateTime.tryParse(premiumUntil);
  if (expiryDate == null) {
    return false;
  }
  final DateTime now = DateTime.now().toUtc();
  final DateTime graceEndDate = expiryDate.add(kPremiumGracePeriod);
  final DateTime expiredStateEndDate = expiryDate.add(kPremiumExpiredWindow);
  return now.isAfter(graceEndDate) && !now.isAfter(expiredStateEndDate);
}

bool _canShowPremiumOnboarding({
  required UserPrivateResponse? privateUser,
  required UserSettingsViewState settings,
  required NagbarDismissalsState dismissals,
  required bool showPremiumCommerce,
  required bool isSelfHosted,
}) {
  if (!showPremiumCommerce ||
      isSelfHosted ||
      dismissals.premiumOnboardingDismissed) {
    return false;
  }
  if (!settings.isPremium) {
    return false;
  }
  if (privateUser?.hasDismissedPremiumOnboarding ?? false) {
    return false;
  }
  return true;
}

bool _canShowGiftInventory({
  required UserPrivateResponse? privateUser,
  required NagbarDismissalsState dismissals,
  required bool showPremiumCommerce,
  required bool isSelfHosted,
}) {
  if (!showPremiumCommerce ||
      isSelfHosted ||
      dismissals.giftInventoryDismissed) {
    return false;
  }
  return privateUser?.hasUnreadGiftInventory ?? false;
}

bool _canShowVisionaryMfa({
  required UserSettingsViewState settings,
  required NagbarDismissalsState dismissals,
  required bool showPremiumCommerce,
  required bool isSelfHosted,
}) {
  if (!showPremiumCommerce ||
      isSelfHosted ||
      dismissals.visionaryMfaDismissed) {
    return false;
  }
  return settings.hasLifetimePremium && !settings.mfaEnabled;
}
