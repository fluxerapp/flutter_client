import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/members/domain/group_dm_member_groups.dart';
import 'package:fluxer_app/features/members/domain/member_list_group_names.dart';
import 'package:fluxer_app/features/members/presentation/menus/guild_member_context_menu.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_shared_widgets.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

String _memberDisplayName(
  WidgetRef ref,
  GuildMemberResponse member,
  String userId,
) => resolveDisplayName(
  guildNickname: member.nick,
  friendNickname: ref.watch(friendNicknameProvider(userId)).value,
  globalName: member.user.globalName,
  username: member.user.username,
);

class MemberListSidebarMemberRow extends ConsumerStatefulWidget {
  const MemberListSidebarMemberRow({
    required this.guildId,
    required this.channelId,
    required this.listMember,
    required this.userId,
    required this.rolesById,
    this.dimmed = false,
    this.isOwner = false,
    super.key,
  });

  final String guildId;
  final String channelId;
  final MemberListMember listMember;
  final String userId;
  final Map<String, db.Role> rolesById;
  final bool dimmed;
  final bool isOwner;

  @override
  ConsumerState<MemberListSidebarMemberRow> createState() =>
      _MemberListSidebarMemberRowState();
}

class _MemberListSidebarMemberRowState
    extends ConsumerState<MemberListSidebarMemberRow> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final MemberListMember listMember = widget.listMember;
    final GuildMemberResponse member = listMember.member;
    final String displayName = _memberDisplayName(ref, member, widget.userId);
    final String? avatarUrl = resolveGuildMemberResponseAvatarUrl(
      guildId: widget.guildId,
      member: member,
    );
    final db.User? presenceUser = ref
        .watch(userPresenceProvider(widget.userId))
        .value;
    final String status =
        presenceUser?.status ?? listMember.status ?? 'offline';
    final String? customStatus =
        presenceUser?.customStatus ?? listMember.customStatus;
    final int? roleColor = resolveMemberHighestRoleColor(
      roleIds: member.roles,
      rolesById: widget.rolesById,
      guildId: widget.guildId,
    );
    final bool showUserTag =
        (member.user.bot ?? false) || (member.user.system ?? false);
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final bool isCurrentUser =
        currentUserId != null && currentUserId == widget.userId;
    final bool isTyping = ref.watch(
      memberListUserIsTypingProvider(widget.channelId, widget.userId),
    );
    final FluxerLayoutTheme layout = context.layout;
    final Widget row = SizedBox(
      height: kMemberListRowHeight,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: FluxerGestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => unawaited(
            FluxerUserProfileSheet.show(
              context,
              userId: widget.userId,
              guildId: widget.guildId,
            ),
          ),
          onSecondaryTapUp: (TapUpDetails details) => unawaited(
            GuildMemberContextMenu.show(
              context,
              ref,
              position: details.globalPosition,
              guildId: widget.guildId,
              member: member,
            ),
          ),
          onLongPress: isTouchPrimaryInput(ref)
              ? () => unawaited(
                  GuildMemberContextMenu.show(
                    context,
                    ref,
                    position: contextMenuPositionAtCenter(context),
                    guildId: widget.guildId,
                    member: member,
                  ),
                )
              : null,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 1),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: layout.s2),
              decoration: BoxDecoration(
                color: _isHovered
                    ? context.colors.backgroundModifierHover
                    : Colors.transparent,
                borderRadius: layout.radiusMd,
              ),
              child: Row(
                children: <Widget>[
                  FluxerAvatar.userPresence(
                    fallbackText: displayName,
                    userId: widget.userId,
                    imageUrl: avatarUrl,
                    avatarColor: member.user.avatarColor,
                    showStatus:
                        isCurrentUser ||
                        isTyping ||
                        isMemberPresenceOnline(status),
                    isTyping: isTyping,
                    size: 32,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                displayName,
                                style: context.textStyles.label.copyWith(
                                  color: roleColor != null
                                      ? Color(roleColor)
                                      : context.colors.textChat,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (widget.isOwner) ...<Widget>[
                              SizedBox(width: layout.s1),
                              const PhosphorIcon(
                                PhosphorIconsFill.crown,
                                size: 12,
                                color: Color(0xFFFAA61A),
                              ),
                            ],
                            if (showUserTag) ...<Widget>[
                              SizedBox(width: layout.s1),
                              FluxerUserTag(
                                isSystem: member.user.system ?? false,
                              ),
                            ],
                          ],
                        ),
                        if (hasVisibleCustomStatus(customStatus))
                          CustomStatusDisplay(
                            stored: customStatus,
                            maxLines: 1,
                            emojiSize: 14,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    if (!widget.dimmed) {
      return row;
    }
    return Opacity(opacity: 0.45, child: row);
  }
}

class MemberListDetailsMemberRow extends ConsumerWidget {
  const MemberListDetailsMemberRow({
    required this.guildId,
    required this.listMember,
    required this.userId,
    required this.rolesById,
    required this.dimmed,
    this.isOwner = false,
    super.key,
  });

  final String guildId;
  final MemberListMember listMember;
  final String userId;
  final Map<String, db.Role> rolesById;
  final bool dimmed;
  final bool isOwner;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GuildMemberResponse member = listMember.member;
    final String displayName = _memberDisplayName(ref, member, userId);
    final String? avatarUrl = resolveGuildMemberResponseAvatarUrl(
      guildId: guildId,
      member: member,
    );
    final db.User? presenceUser = ref.watch(userPresenceProvider(userId)).value;
    final String? customStatus =
        presenceUser?.customStatus ?? listMember.customStatus;
    final int? roleColor = resolveMemberHighestRoleColor(
      roleIds: member.roles,
      rolesById: rolesById,
      guildId: guildId,
    );
    final bool showUserTag =
        (member.user.bot ?? false) || (member.user.system ?? false);
    final Widget row = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => unawaited(
          FluxerUserProfileSheet.show(
            context,
            userId: userId,
            guildId: guildId,
          ),
        ),
        onLongPress: isTouchPrimaryInput(ref)
            ? () => unawaited(
                GuildMemberContextMenu.show(
                  context,
                  ref,
                  position: contextMenuPositionAtCenter(context),
                  guildId: guildId,
                  member: member,
                ),
              )
            : null,
        onSecondaryTap: () => unawaited(
          GuildMemberContextMenu.show(
            context,
            ref,
            position: contextMenuPositionAtPointer(context),
            guildId: guildId,
            member: member,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: <Widget>[
              FluxerAvatar.userPresence(
                fallbackText: displayName,
                userId: userId,
                imageUrl: avatarUrl,
                avatarColor: member.user.avatarColor,
                size: 32,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            displayName,
                            style: context.textStyles.username.copyWith(
                              color: roleColor != null
                                  ? Color(roleColor)
                                  : context.colors.textPrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isOwner) ...<Widget>[
                          const SizedBox(width: 6),
                          const PhosphorIcon(
                            PhosphorIconsFill.crown,
                            size: 14,
                            color: Color(0xFFFAA61A),
                          ),
                        ],
                        if (showUserTag) ...<Widget>[
                          const SizedBox(width: 6),
                          FluxerUserTag(isSystem: member.user.system ?? false),
                        ],
                      ],
                    ),
                    if (hasVisibleCustomStatus(customStatus)) ...<Widget>[
                      const SizedBox(height: 2),
                      CustomStatusDisplay(stored: customStatus, maxLines: 1),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    if (!dimmed) {
      return row;
    }
    return Opacity(opacity: 0.45, child: row);
  }
}
