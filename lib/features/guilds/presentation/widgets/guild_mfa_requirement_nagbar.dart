import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mfa_requirement_provider.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/nagbar/nagbar_providers.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_button.dart';
import 'package:fluxer_app/features/ui/nagbar/fluxer_nagbar_content.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildMfaRequirementNagbar extends ConsumerWidget {
  const GuildMfaRequirementNagbar({required this.guild, super.key});

  final Guild guild;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool visible = ref.watch(
      guildMfaRequirementNagbarVisibleProvider(guild.id),
    );
    if (!visible) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    void dismiss() => ref
        .read(nagbarDismissalsProvider.notifier)
        .dismissGuildMfaRequirement(guild.id);
    return FluxerNagbar(
      isMobile: isMobile,
      backgroundColor: const Color(0xFFEA580C),
      textColor: Colors.white,
      dismissible: true,
      onDismiss: dismiss,
      child: FluxerNagbarContent(
        isMobile: isMobile,
        message: l10n.nagbarGuildMfaRequirement(guild.name),
        onDismiss: dismiss,
        actions: FluxerNagbarButton(
          isMobile: isMobile,
          label: l10n.nagbarEnableMfa,
          onPressed: () =>
              UserSettingsModal.show(context, openSecuritySection: true),
        ),
      ),
    );
  }
}
