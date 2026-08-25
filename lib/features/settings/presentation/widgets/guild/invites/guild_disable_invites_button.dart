import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_invites_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildDisableInvitesButton extends ConsumerWidget {
  const GuildDisableInvitesButton({
    required this.guildId,
    this.embedded = false,
    super.key,
  });

  final String guildId;
  final bool embedded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(guildId),
    );
    if (!hasPermission(permissions, Permission.manageGuild)) {
      return const SizedBox.shrink();
    }
    final Guild? guild = ref.watch(guildByIdProvider(guildId)).value;
    if (guild == null) {
      return const SizedBox.shrink();
    }
    final bool invitesDisabled = hasGuildFeature(
      guild.features,
      GuildFeatures.invitesDisabled,
    );
    final bool isRaidDetected = hasGuildFeature(
      guild.features,
      GuildFeatures.raidDetected,
    );
    final InstanceConfigSnapshot instance = ref.watch(activeInstanceProvider);
    final String productName = instance.instanceDisplayName ?? 'Fluxer';
    final Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (invitesDisabled)
          FluxerButton.dangerPrimary(
            label: l10n.guildSettingsInvitesEnableInvites,
            size: FluxerButtonSize.small,
            fitContent: true,
            onPressed: () => unawaited(
              _confirmToggle(
                context,
                ref,
                l10n: l10n,
                invitesDisabled: invitesDisabled,
                features: guild.features,
              ),
            ),
          )
        else
          FluxerButton.secondary(
            label: l10n.guildSettingsInvitesPauseInvites,
            size: FluxerButtonSize.small,
            fitContent: true,
            onPressed: () => unawaited(
              _confirmToggle(
                context,
                ref,
                l10n: l10n,
                invitesDisabled: invitesDisabled,
                features: guild.features,
              ),
            ),
          ),
        if (invitesDisabled) ...<Widget>[
          SizedBox(width: context.layout.s2),
          Flexible(
            child: Text(
              isRaidDetected
                  ? l10n.guildSettingsInvitesPausedBecauseRaid(productName)
                  : l10n.guildSettingsInvitesPausedForCommunity,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
          ),
        ],
      ],
    );
    if (embedded) {
      return content;
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        0,
        context.layout.s4,
        context.layout.s4,
      ),
      child: content,
    );
  }

  Future<void> _confirmToggle(
    BuildContext context,
    WidgetRef ref, {
    required FluxerLocalizations l10n,
    required bool invitesDisabled,
    required List<String> features,
  }) async {
    await FluxerConfirmModal.show(
      context,
      title: invitesDisabled
          ? l10n.guildSettingsInvitesEnableForCommunityTitle
          : l10n.guildSettingsInvitesPauseForCommunityTitle,
      description: invitesDisabled
          ? l10n.guildSettingsInvitesEnableConfirmDescription
          : l10n.guildSettingsInvitesPauseConfirmDescription,
      confirmLabel: invitesDisabled
          ? l10n.enable
          : l10n.guildSettingsInvitesPause,
      isDanger: !invitesDisabled,
      onConfirm: () => unawaited(
        ref
            .read(guildInvitesProvider(guildId).notifier)
            .toggleInvitesDisabled(
              currentFeatures: features,
              disableInvites: !invitesDisabled,
            ),
      ),
    );
  }
}
