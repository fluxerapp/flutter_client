class InvitePeopleRecipient {
  const InvitePeopleRecipient({
    required this.id,
    required this.displayName,
    this.secondaryText,
    this.avatarUrl,
    this.channelId,
  });

  final String id;
  final String displayName;
  final String? secondaryText;
  final String? avatarUrl;
  final String? channelId;
}
