class PendingPushNotificationRoute {
  const PendingPushNotificationRoute({
    required this.path,
    this.accountUserId,
    this.threadParent,
  });

  final String path;
  final String? accountUserId;
  final ({String guildId, String parentId})? threadParent;
}

bool pendingPushRouteWaitsForAccount({
  required String? accountUserId,
  required String? currentUserId,
}) {
  return accountUserId != null &&
      accountUserId.isNotEmpty &&
      accountUserId != currentUserId;
}

String? currentAccountPendingNavigationPath({
  required PendingPushNotificationRoute? pending,
  required String? currentUserId,
  bool Function(String guildId)? threadsActive,
}) {
  if (pending == null || pending.path.isEmpty) {
    return null;
  }
  final ({String guildId, String parentId})? threadParent =
      pending.threadParent;
  if (threadParent != null &&
      !(threadsActive?.call(threadParent.guildId) ?? false)) {
    return null;
  }
  if (pendingPushRouteWaitsForAccount(
    accountUserId: pending.accountUserId,
    currentUserId: currentUserId,
  )) {
    return null;
  }
  return pending.path;
}
