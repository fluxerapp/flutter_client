import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

String resolveGroupDmDisplayName({
  required DmConversation dm,
  FluxerLocalizations? l10n,
  String? currentUserId,
  String? currentUserDisplayName,
}) {
  final String customName = dm.name?.trim() ?? '';
  if (customName.isNotEmpty) {
    return customName;
  }
  final List<GroupMemberInfo> otherMembers = dm.groupMembers
      .where(
        (GroupMemberInfo member) =>
            currentUserId == null || member.id != currentUserId,
      )
      .toList();
  if (otherMembers.isEmpty) {
    final String resolvedName = currentUserDisplayName?.trim() ?? '';
    if (resolvedName.isNotEmpty) {
      return l10n != null
          ? l10n.dmOwnersGroup(resolvedName)
          : "$resolvedName's group";
    }
    return l10n?.dmUnnamedGroup ?? 'Unnamed group';
  }
  if (otherMembers.length == 1) {
    final String? name = _resolveMemberDisplayName(dm, otherMembers.first);
    if (name != null) {
      return name;
    }
    return l10n?.dmUnnamedGroup ?? 'Unnamed group';
  }
  if (otherMembers.length <= 4) {
    final List<GroupMemberInfo> sorted =
        List<GroupMemberInfo>.from(otherMembers)..sort(
          (GroupMemberInfo a, GroupMemberInfo b) =>
              compareSnowflakeIds(b.id, a.id),
        );
    final List<String> names = sorted
        .map((GroupMemberInfo member) => _resolveMemberDisplayName(dm, member))
        .whereType<String>()
        .toList();
    if (names.isNotEmpty) {
      return names.join(', ');
    }
    return l10n?.dmUnnamedGroup ?? 'Unnamed group';
  }
  return l10n?.dmUnnamedGroup ?? 'Unnamed group';
}

String resolveGroupDmInviteDisplayName({
  required ChannelPartialResponse channel,
  FluxerLocalizations? l10n,
}) {
  final String customName = channel.name?.trim() ?? '';
  if (customName.isNotEmpty) {
    return customName;
  }
  final List<String> names =
      channel.recipients
          ?.map((ChannelPartialResponseRecipients r) => r.username.trim())
          .where((String name) => name.isNotEmpty)
          .toList() ??
      const <String>[];
  if (names.isNotEmpty) {
    return names.join(', ');
  }
  return l10n?.dmUnnamedGroup ?? 'Unnamed group';
}

int resolveGroupDmInviteMemberCount({
  required int inviteMemberCount,
  DmConversation? localChannel,
  String? currentUserId,
}) {
  if (localChannel == null) {
    return inviteMemberCount;
  }
  final Set<String> memberIds = localChannel.groupMembers
      .map((GroupMemberInfo member) => member.id)
      .toSet();
  if (currentUserId != null) {
    memberIds.add(currentUserId);
  }
  return memberIds.length;
}

String? _resolveMemberDisplayName(DmConversation dm, GroupMemberInfo member) {
  final String? channelNick = dm.channelNicks[member.id]?.trim();
  if (channelNick != null && channelNick.isNotEmpty) {
    return channelNick;
  }
  final String name = member.name.trim();
  if (name.isNotEmpty) {
    return name;
  }
  return null;
}
