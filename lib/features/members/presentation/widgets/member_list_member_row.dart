import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/group_dm_member_groups.dart';
import 'package:fluxer_app/features/members/domain/member_list_group_names.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_shared_widgets.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MemberListSidebarMemberRow extends ConsumerStatefulWidget {
  const MemberListSidebarMemberRow({
    required this.guildId,
    required this.listMember,
    required this.userId,
    required this.rolesById,
    super.key,
  });

  final String guildId;
  final MemberListMember listMember;
  final String userId;
  final Map<String, db.Role> rolesById;

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
    final String displayName =
        member.nick ?? member.user.globalName ?? member.user.username;
    final String? avatar = member.avatar ?? member.user.avatar;
    final String status =
        ref.watch(userPresenceProvider(widget.userId)).value?.status ??
        listMember.status ??
        'offline';
    final bool isOffline = !isMemberPresenceOnline(status);
    final String? customStatus =
        ref.watch(userPresenceProvider(widget.userId)).value?.customStatus ??
        listMember.customStatus;
    final int? roleColor = resolveMemberHighestRoleColor(
      roleIds: member.roles,
      rolesById: widget.rolesById,
    );
    final bool showUserTag =
        (member.user.bot ?? false) || (member.user.system ?? false);
    final FluxerLayoutTheme layout = context.layout;
    return SizedBox(
      height: kMemberListRowHeight,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => unawaited(
            FluxerUserProfileSheet.show(
              context,
              userId: widget.userId,
              guildId: widget.guildId,
            ),
          ),
          child: Opacity(
            opacity: isOffline ? 0.3 : 1.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: layout.s2,
                  vertical: layout.s1,
                ),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? context.colors.backgroundModifierHover
                      : Colors.transparent,
                  borderRadius: layout.radiusMd,
                ),
                child: Row(
                  children: <Widget>[
                    FluxerAvatar.user(
                      fallbackText: displayName,
                      userId: widget.userId,
                      imageUrl: FluxerMediaUrl.userAvatar(
                        userId: widget.userId,
                        hash: avatar,
                      ),
                      avatarColor: member.user.avatarColor,
                      status: status,
                      size: 32,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
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
                              if (showUserTag) ...<Widget>[
                                SizedBox(width: layout.s1),
                                FluxerUserTag(
                                  isSystem: member.user.system ?? false,
                                ),
                              ],
                            ],
                          ),
                          if (customStatus != null)
                            Text(
                              customStatus,
                              style: TextStyle(
                                color: context.colors.textPrimaryMuted,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
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
      ),
    );
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
    final String displayName =
        member.nick ?? member.user.globalName ?? member.user.username;
    final String? avatar = member.avatar ?? member.user.avatar;
    final String status =
        ref.watch(userPresenceProvider(userId)).value?.status ??
        listMember.status ??
        'offline';
    final String? customStatus =
        ref.watch(userPresenceProvider(userId)).value?.customStatus ??
        listMember.customStatus;
    final int? roleColor = resolveMemberHighestRoleColor(
      roleIds: member.roles,
      rolesById: rolesById,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: <Widget>[
              FluxerAvatar.user(
                fallbackText: displayName,
                userId: userId,
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: userId,
                  hash: avatar,
                ),
                avatarColor: member.user.avatarColor,
                status: status,
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
                    if (customStatus != null &&
                        customStatus.isNotEmpty) ...<Widget>[
                      const SizedBox(height: 2),
                      Text(
                        customStatus,
                        style: context.textStyles.bodySmall.copyWith(
                          color: context.colors.textSecondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
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
