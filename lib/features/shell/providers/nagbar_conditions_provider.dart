import 'package:fluxer_app/core/constants/policy_constants.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_conditions.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_dismissals_state.dart';
import 'package:fluxer_app/features/shell/domain/service_status_maintenance.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_app/features/shell/providers/guild_membership_cta_visibility_provider.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/shell/providers/push_notification_permission_status_provider.dart';
import 'package:fluxer_app/features/shell/providers/scheduled_maintenance_dismissal_provider.dart';
import 'package:fluxer_app/features/shell/providers/service_status_maintenance_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nagbar_conditions_provider.g.dart';

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
  final bool userIsUnclaimed = !settings.hasVerifiedEmail;
  final bool userNeedsVerification =
      emailsEnabled && settings.hasVerifiedEmail && !settings.verified;
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
