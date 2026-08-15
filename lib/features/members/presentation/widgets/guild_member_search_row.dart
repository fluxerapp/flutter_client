import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/guild_members_search_models.dart';
import 'package:fluxer_app/features/members/presentation/menus/guild_member_context_menu.dart';
import 'package:fluxer_app/features/members/utils/guild_members_formatting.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildMemberSearchRow extends ConsumerWidget {
  const GuildMemberSearchRow({
    required this.guildId,
    required this.member,
    required this.onTap,
    this.compact = false,
    this.isOwner = false,
    super.key,
  });

  final String guildId;
  final GuildMemberDisplayData member;
  final VoidCallback onTap;
  final bool compact;
  final bool isOwner;

  Future<void> _showMenu(BuildContext context, WidgetRef ref, Offset position) {
    return GuildMemberContextMenu.show(
      context,
      ref,
      position: position,
      guildId: guildId,
      member: member.toGuildMemberResponse(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String displayName = resolveDisplayName(
      guildNickname: member.nickname,
      globalName: member.globalName,
      username: member.username,
    );
    final String? avatarUrl = member.avatarUrlFor(guildId);
    final int? avatarColor = member.avatarColor;
    final String joinMethod = formatGuildMemberJoinMethodPillLabel(
      l10n,
      member,
    );
    final String joinedLabel = formatGuildMemberTimestampRelative(
      context,
      member.joinedAt,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        onLongPress: isTouchPrimaryInput(ref)
            ? () => unawaited(
                _showMenu(context, ref, contextMenuPositionAtCenter(context)),
              )
            : null,
        hoverColor: context.colors.backgroundModifierHover,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 12 : 8,
            vertical: compact ? 10 : 8,
          ),
          child: Row(
            children: <Widget>[
              FluxerAvatar.userPresence(
                fallbackText: displayName,
                userId: member.userId,
                imageUrl: avatarUrl,
                avatarColor: avatarColor,
                size: compact ? 40 : 32,
              ),
              SizedBox(width: context.layout.s3),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            displayName,
                            style: context.textStyles.bodyMedium.copyWith(
                              color: context.colors.textPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isOwner) ...<Widget>[
                          const SizedBox(width: 4),
                          PhosphorIcon(
                            PhosphorIconsFill.crown,
                            size: 14,
                            color: context.colors.statusWarning,
                          ),
                        ],
                      ],
                    ),
                    if (compact)
                      Text(
                        '@${member.username}',
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textPrimaryMuted,
                        ),
                        overflow: TextOverflow.ellipsis,
                      )
                    else
                      Text(
                        member.tag,
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textPrimaryMuted,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (compact)
                      Text(
                        '$joinedLabel · $joinMethod',
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textSecondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              if (!compact)
                IconButton(
                  visualDensity: VisualDensity.compact,
                  tooltip: l10n.chatMessageMore,
                  icon: PhosphorIcon(
                    PhosphorIconsBold.dotsThree,
                    size: 18,
                    color: context.colors.textSecondary,
                  ),
                  onPressed: () => unawaited(
                    _showMenu(
                      context,
                      ref,
                      contextMenuPositionAtCenter(context),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
