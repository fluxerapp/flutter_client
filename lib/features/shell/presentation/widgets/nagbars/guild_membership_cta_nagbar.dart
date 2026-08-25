import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/services/join_community_service.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/nagbars/nagbar_widget.dart';
import 'package:fluxer_app/features/shell/providers/guild_membership_cta_visibility_provider.dart';
import 'package:fluxer_app/features/shell/providers/nagbar_dismissals_provider.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const String kProductCommunityName = 'Fluxer HQ';

class GuildMembershipCtaNagbar extends ConsumerStatefulWidget
    implements NagbarWidget {
  const GuildMembershipCtaNagbar({super.key});

  @override
  ConsumerState<GuildMembershipCtaNagbar> createState() =>
      _GuildMembershipCtaNagbarState();
}

class _GuildMembershipCtaNagbarState
    extends ConsumerState<GuildMembershipCtaNagbar> {
  bool _isSubmitting = false;

  Future<void> _joinCommunity() async {
    if (_isSubmitting) {
      return;
    }
    setState(() => _isSubmitting = true);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    try {
      await joinCommunityViaInvite(
        ref: ref,
        rawInput: kFluxerHqInviteCode,
        l10n: l10n,
      );
      await ref
          .read(nagbarDismissalsProvider.notifier)
          .dismissGuildMembershipCta();
      ref.invalidate(guildMembershipCtaVisibleProvider);
    } on JoinCommunityException catch (error) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: error.message,
              variant: FluxerToastVariant.danger,
            ),
          );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: Theme.of(context).colorScheme.primary,
      textColor: Colors.white,
      dismissible: true,
      onDismiss: () => ref
          .read(nagbarDismissalsProvider.notifier)
          .dismissGuildMembershipCta(),
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.nagbarGuildMembershipCta(kProductCommunityName),
        onDismiss: () => ref
            .read(nagbarDismissalsProvider.notifier)
            .dismissGuildMembershipCta(),
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.nagbarJoinCommunity(kProductCommunityName),
          isLoading: _isSubmitting,
          onPressed: _isSubmitting ? null : _joinCommunity,
        ),
      ),
    );
  }
}
