import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelSearchResultGroupHeader extends ConsumerWidget {
  const ChannelSearchResultGroupHeader({
    required this.channelId,
    required this.showGuildMeta,
    required this.onTap,
    this.isFirst = false,
    super.key,
  });

  final String channelId;
  final bool showGuildMeta;
  final VoidCallback onTap;
  final bool isFirst;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Channel? channel = ref.watch(channelByIdProvider(channelId)).value;
    if (channel == null) {
      return const SizedBox.shrink();
    }

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final DmConversation? dm = channel.guildId.isEmpty
        ? findDmById(
            ref.watch(dmViewModelProvider.select((s) => s.conversations)),
            channelId,
          )
        : null;
    final Guild? guild = _resolveGuild(ref, channel.guildId);
    final bool showGuild = showGuildMeta && guild != null;
    final String channelName = _resolveChannelName(
      l10n: l10n,
      channel: channel,
      dm: dm,
      ref: ref,
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(8, isFirst ? 8 : 16, 8, 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            child: Row(
              children: <Widget>[
                if (!showGuild) _buildChannelIcon(context, channel, dm),
                Expanded(
                  child: showGuild
                      ? _GuildChannelScopeRow(
                          guild: guild,
                          channel: channel,
                          channelName: channelName,
                        )
                      : Text(
                          channelName,
                          style: context.textStyles.bodySmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: context.colors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Guild? _resolveGuild(WidgetRef ref, String guildId) {
    if (guildId.isEmpty) {
      return null;
    }
    for (final Guild guild in ref.watch(guildListViewModelProvider).guilds) {
      if (guild.id == guildId) {
        return guild;
      }
    }
    return null;
  }

  Widget _buildChannelIcon(
    BuildContext context,
    Channel channel,
    DmConversation? dm,
  ) {
    if (dm != null && dm.isGroup) {
      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: groupDmAvatarCluster(dm: dm, size: 20, status: dm.groupStatus),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChannelIcon(
        type: channel.type,
        color: context.colors.textPrimaryMuted,
      ),
    );
  }

  String _resolveChannelName({
    required FluxerLocalizations l10n,
    required Channel channel,
    required DmConversation? dm,
    required WidgetRef ref,
  }) {
    if (dm != null) {
      return dm.displayNameWith(
        null,
        l10n: l10n,
        currentUserId: ref.watch(currentUserIdProvider),
      );
    }
    return channel.name;
  }
}

class _GuildChannelScopeRow extends StatelessWidget {
  const _GuildChannelScopeRow({
    required this.guild,
    required this.channel,
    required this.channelName,
  });

  final Guild guild;
  final Channel channel;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _GuildBadge(guild: guild),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            guild.name,
            style: context.textStyles.timestamp.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: PhosphorIcon(
            PhosphorIconsFill.caretRight,
            size: 12,
            color: context.colors.textPrimaryMuted,
          ),
        ),
        ChannelIcon(
          type: channel.type,
          size: 14,
          color: context.colors.textPrimaryMuted,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            channelName,
            style: context.textStyles.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _GuildBadge extends StatelessWidget {
  const _GuildBadge({required this.guild});

  final Guild guild;

  @override
  Widget build(BuildContext context) {
    return FluxerGuildIconAvatar(
      name: guild.name,
      imageUrl: guild.iconUrl,
      size: 12,
      initialsFontWeight: FontWeight.w700,
    );
  }
}
