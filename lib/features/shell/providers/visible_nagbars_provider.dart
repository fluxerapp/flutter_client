import 'package:fluxer_app/features/shell/domain/nagbar_conditions.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_state.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_type.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_conditions_provider.dart';
import 'package:fluxer_app/features/shell/utils/nagbar_selection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'visible_nagbars_provider.g.dart';

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
