import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/member_list_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';

const _kPanelWidth = 264.0;

class ChannelMembers extends ConsumerWidget {
  const ChannelMembers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberState = ref.watch(memberListViewModelProvider);
    final groups = memberState.roleGroups;

    if (groups.isEmpty) {
      return const _ChannelMembersPanel(child: SizedBox.shrink());
    }

    return _ChannelMembersPanel(
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: 10,
          left: context.layout.s2,
          right: context.layout.s2,
          bottom: context.layout.s4,
        ),
        itemCount: groups.length,
        itemBuilder: (context, index) {
          final group = groups[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGroupHeader(context, group),
              ...group.members.map((m) => _MemberListItem(member: m)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildGroupHeader(BuildContext context, RoleGroup group) {
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s2, layout.s3, layout.s2, layout.s1),
      child: Text(
        group.displayName,
        style: context.textStyles.categoryName.copyWith(
          color: group.role != null
              ? Color(group.role!.color)
              : context.colors.textPrimaryMuted,
        ),
      ),
    );
  }
}

class _ChannelMembersPanel extends StatelessWidget {
  final Widget child;

  const _ChannelMembersPanel({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _kPanelWidth,
      decoration: BoxDecoration(
        color: context.colors.memberListBackground,
        border: Border(left: BorderSide(color: context.colors.borderColor)),
      ),
      child: child,
    );
  }
}

class _MemberListItem extends StatefulWidget {
  final Member member;

  const _MemberListItem({required this.member});

  @override
  State<_MemberListItem> createState() => _MemberListItemState();
}

class _MemberListItemState extends State<_MemberListItem> {
  var _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final member = widget.member;
    final layout = context.layout;
    final isOffline = member.status == 'offline';

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
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
                children: [
                  FluxerAvatar.user(
                    fallbackText: member.displayName,
                    userId: member.id,
                    imageUrl: member.avatarUrl,
                    avatarColor: member.avatarColor,
                    roleColor: member.roleColor,
                    status: member.status,
                    size: 32,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                member.displayName,
                                style: context.textStyles.label.copyWith(
                                  color: member.roleColor != null
                                      ? Color(member.roleColor!)
                                      : context.colors.textChat,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (member.isBot) ...[
                              SizedBox(width: layout.s1),
                              const FluxerBotBadge(),
                            ],
                          ],
                        ),
                        if (member.customStatus != null)
                          Text(
                            member.customStatus!,
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
    );
  }
}
