bool isMemberPresenceOnline(String status) {
  return status != 'offline' && status != 'invisible';
}

class GroupDmMemberGroup<T> {
  final String displayName;
  final List<T> members;

  const GroupDmMemberGroup({required this.displayName, required this.members});
}

List<GroupDmMemberGroup<T>> groupDmMembersByPresence<T>({
  required List<T> members,
  required String Function(T member) resolveUserId,
  required String Function(T member) resolveDisplayName,
  required String Function(String userId) resolveStatus,
  required String onlineHeader,
  required String offlineHeader,
}) {
  final List<T> onlineMembers = <T>[];
  final List<T> offlineMembers = <T>[];
  for (final T member in members) {
    final String status = resolveStatus(resolveUserId(member));
    if (isMemberPresenceOnline(status)) {
      onlineMembers.add(member);
    } else {
      offlineMembers.add(member);
    }
  }
  int compareMembers(T a, T b) => resolveDisplayName(
    a,
  ).toLowerCase().compareTo(resolveDisplayName(b).toLowerCase());
  onlineMembers.sort(compareMembers);
  offlineMembers.sort(compareMembers);
  final List<GroupDmMemberGroup<T>> groups = <GroupDmMemberGroup<T>>[];
  if (onlineMembers.isNotEmpty) {
    groups.add(
      GroupDmMemberGroup<T>(
        displayName: '$onlineHeader — ${onlineMembers.length}',
        members: onlineMembers,
      ),
    );
  }
  if (offlineMembers.isNotEmpty) {
    groups.add(
      GroupDmMemberGroup<T>(
        displayName: '$offlineHeader — ${offlineMembers.length}',
        members: offlineMembers,
      ),
    );
  }
  return groups;
}

String? groupDmAggregateStatus({
  required List<String> participantIds,
  required String Function(String userId) resolveStatus,
}) {
  for (final String userId in participantIds) {
    final String status = resolveStatus(userId);
    if (isMemberPresenceOnline(status)) {
      return status;
    }
  }
  return null;
}
