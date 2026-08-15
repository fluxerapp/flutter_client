import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_emoji_settings_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_sticker_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_permissions.dart';
import 'package:fluxer_app/features/ui/switch_group/fluxer_switch_group.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

enum GuildCloneAllowedKind { emoji, sticker }

class GuildCloneAllowedToggle extends ConsumerStatefulWidget {
  const GuildCloneAllowedToggle({
    required this.guildId,
    required this.kind,
    super.key,
  });

  final String guildId;
  final GuildCloneAllowedKind kind;

  @override
  ConsumerState<GuildCloneAllowedToggle> createState() =>
      _GuildCloneAllowedToggleState();
}

class _GuildCloneAllowedToggleState
    extends ConsumerState<GuildCloneAllowedToggle> {
  bool _isSaving = false;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final Guild? guild = ref.watch(guildByIdProvider(widget.guildId)).value;
    if (guild == null) {
      return const SizedBox.shrink();
    }
    final bool canManage = canManageGuildCloneSettings(permissions);
    final bool allowed = widget.kind == GuildCloneAllowedKind.emoji
        ? isCloneEmojiAllowed(guild.features)
        : isCloneStickerAllowed(guild.features);
    final String label = widget.kind == GuildCloneAllowedKind.emoji
        ? l10n.guildSettingsCloneEmojiTitle
        : l10n.guildSettingsCloneStickerTitle;
    final String description = widget.kind == GuildCloneAllowedKind.emoji
        ? l10n.guildSettingsCloneEmojiDescription
        : l10n.guildSettingsCloneStickerDescription;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        context.layout.s4,
        context.layout.s4,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FluxerSwitchGroup(
            children: <Widget>[
              FluxerSwitchGroupItem(
                label: label,
                description: description,
                value: allowed,
                enabled: canManage && !_isSaving,
                onChanged: (bool nextAllowed) => unawaited(
                  _handleToggle(
                    guild: guild,
                    nextAllowed: nextAllowed,
                    l10n: l10n,
                  ),
                ),
              ),
            ],
          ),
          if (!canManage) ...<Widget>[
            SizedBox(height: context.layout.s2),
            Text(
              l10n.guildSettingsClonePermissionHint(
                permissionTitle(l10n, Permission.manageGuild),
              ),
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _handleToggle({
    required Guild guild,
    required bool nextAllowed,
    required FluxerLocalizations l10n,
  }) async {
    if (_isSaving) {
      return;
    }
    setState(() => _isSaving = true);
    try {
      if (widget.kind == GuildCloneAllowedKind.emoji) {
        await ref
            .read(guildEmojiSettingsProvider(widget.guildId).notifier)
            .toggleCloneAllowed(
              currentFeatures: guild.features,
              allowed: nextAllowed,
            );
      } else {
        await ref
            .read(guildStickerSettingsProvider(widget.guildId).notifier)
            .toggleCloneAllowed(
              currentFeatures: guild.features,
              allowed: nextAllowed,
            );
      }
    } on Object {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: widget.kind == GuildCloneAllowedKind.emoji
                  ? l10n.guildSettingsCloneEmojiUpdateFailed
                  : l10n.guildSettingsCloneStickerUpdateFailed,
            ),
          );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }
}
