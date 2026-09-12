class PendingPushNotificationRoute {
  const PendingPushNotificationRoute({required this.path, this.accountUserId});

  final String path;
  final String? accountUserId;
}

String? currentAccountPendingNavigationPath({
  required PendingPushNotificationRoute? pending,
  required String? currentUserId,
}) {
  if (pending == null || pending.path.isEmpty) {
    return null;
  }
  final String? accountUserId = pending.accountUserId;
  if (accountUserId != null &&
      accountUserId.isNotEmpty &&
      accountUserId != currentUserId) {
    return null;
  }
  return pending.path;
}
