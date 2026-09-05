part of 'channel_details_sheet.dart';

class _DmMemberGroups extends ConsumerWidget {
  const _DmMemberGroups({required this.dm, required this.currentUserId});

  final DmConversation dm;
  final String? currentUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? userId = currentUserId;
    if (userId == null) {
      return const SizedBox.shrink();
    }
    final db.User? currentUser = ref.watch(userPresenceProvider(userId)).value;
    final Map<String, String?> friendNicknameById = friendNicknamesById(
      ref.watch(friendsListProvider).value ?? const <Friend>[],
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<_DmParticipant> participants = _buildDmParticipants(
      dm: dm,
      currentUserId: userId,
      currentUser: currentUser,
      friendNicknameById: friendNicknameById,
      youLabel: l10n.channelDetailsMemberYou,
    );
    final Map<String, db.User?> presenceById = <String, db.User?>{
      for (final _DmParticipant participant in participants)
        participant.id: participant.id == userId
            ? currentUser
            : ref.watch(userPresenceProvider(participant.id)).value,
    };
    String resolveStatus(String id) => presenceById[id]?.status ?? 'offline';
    final List<GroupDmMemberGroup<_DmParticipant>> groups =
        groupDmMembersByPresence<_DmParticipant>(
          members: participants,
          resolveUserId: (_DmParticipant p) => p.id,
          resolveDisplayName: (_DmParticipant p) => p.name,
          resolveStatus: resolveStatus,
          onlineHeader: l10n.channelDetailsMembersOnline,
          offlineHeader: l10n.channelDetailsMembersOffline,
        );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (final GroupDmMemberGroup<_DmParticipant> group in groups)
          FluxerListSection(
            header: group.displayName,
            children: <Widget>[
              for (final _DmParticipant participant in group.members)
                _SimpleMemberRow(
                  userId: participant.id,
                  name: participant.name,
                  avatarUrl: participant.avatar == null
                      ? null
                      : FluxerMediaUrl.userAvatar(
                          userId: participant.id,
                          hash: participant.avatar,
                        ),
                  avatarColor: participant.avatarColor,
                  status: resolveStatus(participant.id),
                  customStatus: presenceById[participant.id]?.customStatus,
                  isBot: participant.isBot,
                  isSystem: participant.isSystem,
                  isCurrentUser: participant.isCurrentUser,
                  onTap: () => FluxerUserProfileSheet.show(
                    context,
                    userId: participant.id,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

List<_DmParticipant> _buildDmParticipants({
  required DmConversation dm,
  required String currentUserId,
  required db.User? currentUser,
  required Map<String, String?> friendNicknameById,
  required String youLabel,
}) {
  final List<_DmParticipant> participants = <_DmParticipant>[];
  final Set<String> addedIds = <String>{};

  String withFriendNickname(String userId, String fallback) {
    final String? nickname = friendNicknameById[userId]?.trim();
    return nickname != null && nickname.isNotEmpty ? nickname : fallback;
  }

  String withMemberDisplayName(String userId, String fallback) {
    final String? channelNick = dm.channelNicks[userId]?.trim();
    if (channelNick != null && channelNick.isNotEmpty) {
      return channelNick;
    }
    return withFriendNickname(userId, fallback);
  }

  void add(_DmParticipant participant) {
    if (participant.id.isEmpty || !addedIds.add(participant.id)) {
      return;
    }
    participants.add(participant);
  }

  add(
    _DmParticipant(
      id: currentUserId,
      name: currentUser?.globalName ?? currentUser?.username ?? youLabel,
      avatar: currentUser?.avatar,
      avatarColor: currentUser?.avatarColor,
      isBot: currentUser?.bot ?? false,
      isSystem: currentUser?.system ?? false,
      isCurrentUser: true,
    ),
  );

  if (dm.isPersonalNotes) {
    return participants;
  }

  if (dm.isGroup) {
    for (final GroupMemberInfo member in dm.groupMembers) {
      final String name = member.name.trim();
      add(
        _DmParticipant(
          id: member.id,
          name: withMemberDisplayName(
            member.id,
            name.isEmpty ? member.id : member.name,
          ),
          avatar: member.avatar,
        ),
      );
    }
    return participants;
  }

  add(
    _DmParticipant(
      id: dm.recipientId,
      name: withFriendNickname(
        dm.recipientId,
        dm.recipientName.trim().isEmpty ? dm.recipientId : dm.recipientName,
      ),
      avatar: dm.recipientAvatar,
      isBot: dm.isBot,
      isSystem: dm.isSystem,
    ),
  );
  return participants;
}

class _DmParticipant {
  const _DmParticipant({
    required this.id,
    required this.name,
    this.avatar,
    this.avatarColor,
    this.isBot = false,
    this.isSystem = false,
    this.isCurrentUser = false,
  });

  final String id;
  final String name;
  final String? avatar;
  final int? avatarColor;
  final bool isBot;
  final bool isSystem;
  final bool isCurrentUser;
}

class _SimpleMemberRow extends StatelessWidget {
  const _SimpleMemberRow({
    required this.userId,
    required this.name,
    this.avatarUrl,
    this.avatarColor,
    this.status = 'offline',
    this.isBot = false,
    this.isSystem = false,
    this.isCurrentUser = false,
    this.onTap,
    this.customStatus,
  });

  final String userId;
  final String name;
  final String? avatarUrl;
  final int? avatarColor;
  final String status;
  final bool isBot;
  final bool isSystem;
  final bool isCurrentUser;
  final String? customStatus;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FluxerListRow(
      leading: FluxerAvatar.userPresence(
        fallbackText: name,
        userId: userId,
        imageUrl: avatarUrl,
        avatarColor: avatarColor,
        size: 36,
      ),
      title: name,
      subtitle: hasVisibleCustomStatus(customStatus) ? null : customStatus,
      subtitleWidget: hasVisibleCustomStatus(customStatus)
          ? CustomStatusDisplay(stored: customStatus, maxLines: 1)
          : null,
      onTap: onTap,
      titleAdornments: [
        if (isCurrentUser)
          _MemberTag(
            label: FluxerLocalizations.of(context).channelDetailsMemberYou,
          ),
        if (isBot || isSystem) FluxerUserTag(isSystem: isSystem),
      ],
    );
  }
}

class _MemberTag extends StatelessWidget {
  const _MemberTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: context.colors.brandPrimary.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: context.textStyles.smallText.copyWith(
          color: context.colors.brandPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _NewGroupCtaRow extends StatelessWidget {
  const _NewGroupCtaRow({required this.recipientHandle, required this.onTap});

  final String recipientHandle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      child: Material(
        color: colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.brandPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: PhosphorIcon(
                      PhosphorIconsFill.chatCircle,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.createDmNewGroup,
                        style: context.textStyles.username.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.createDmCreateGroupWithRecipient(recipientHandle),
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textTertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                PhosphorIcon(
                  PhosphorIconsBold.caretRight,
                  size: 20,
                  color: colors.textTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
