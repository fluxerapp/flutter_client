import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_state.dart';
import 'package:fluxer_app/features/shell/domain/nagbar_type.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/email_verification_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/gift_inventory_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/guild_membership_cta_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/premium_expired_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/premium_grace_period_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/premium_onboarding_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/push_notification_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/scheduled_maintenance_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/terms_acceptance_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/unclaimed_account_nagbar.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/visionary_mfa_nagbar.dart';
import 'package:fluxer_app/features/shell/providers/visible_nagbars_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class NagbarContainer extends ConsumerWidget {
  const NagbarContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<NagbarState>> visibleAsync = ref.watch(
      visibleNagbarsProvider,
    );
    return visibleAsync.when(
      data: (List<NagbarState> nagbars) {
        if (nagbars.isEmpty) {
          return const SizedBox.shrink();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: nagbars
              .map((NagbarState nagbar) => _buildNagbar(context, nagbar.type))
              .toList(),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }

  Widget _buildNagbar(BuildContext context, NagbarType type) {
    return switch (type) {
      NagbarType.scheduledMaintenance => const ScheduledMaintenanceNagbar(),
      NagbarType.unclaimedAccount => const UnclaimedAccountNagbar(),
      NagbarType.emailVerification => const EmailVerificationNagbar(),
      NagbarType.premiumGracePeriod => const PremiumGracePeriodNagbar(),
      NagbarType.premiumExpired => const PremiumExpiredNagbar(),
      NagbarType.premiumOnboarding => const PremiumOnboardingNagbar(),
      NagbarType.giftInventory => const GiftInventoryNagbar(),
      NagbarType.visionaryMfa => const VisionaryMfaNagbar(),
      NagbarType.termsAcceptance => const TermsAcceptanceNagbar(),
      NagbarType.guildMembershipCta => const GuildMembershipCtaNagbar(),
      NagbarType.pushNotification => const PushNotificationNagbar(),
      _ => const SizedBox.shrink(),
    };
  }
}
