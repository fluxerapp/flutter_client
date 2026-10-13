class PendingPushNotificationRoute {
  const PendingPushNotificationRoute({required this.path, this.accountUserId});

  final String path;
  final String? accountUserId;
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
}) {
  if (pending == null || pending.path.isEmpty) {
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
