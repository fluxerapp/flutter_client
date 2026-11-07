enum Permission {
  createInstantInvite(1 << 0),
  kickMembers(1 << 1),
  banMembers(1 << 2),
  administrator(1 << 3),
  manageChannels(1 << 4),
  manageGuild(1 << 5),
  addReactions(1 << 6),
  viewAuditLog(1 << 7),
  prioritySpeaker(1 << 8),
  stream(1 << 9),
  viewChannel(1 << 10),
  sendMessages(1 << 11),
  sendTtsMessages(1 << 12),
  manageMessages(1 << 13),
  embedLinks(1 << 14),
  attachFiles(1 << 15),
  readMessageHistory(1 << 16),
  mentionEveryone(1 << 17),
  useExternalEmojis(1 << 18),
  connect(1 << 20),
  speak(1 << 21),
  muteMembers(1 << 22),
  deafenMembers(1 << 23),
  moveMembers(1 << 24),
  useVad(1 << 25),
  changeNickname(1 << 26),
  manageNicknames(1 << 27),
  manageRoles(1 << 28),
  manageWebhooks(1 << 29),
  manageExpressions(1 << 30),
  manageThreads(1 << 34),
  createPublicThreads(1 << 35),
  createPrivateThreads(1 << 36),
  useExternalStickers(1 << 37),
  sendMessagesInThreads(1 << 38),
  moderateMembers(1 << 40),
  createExpressions(1 << 43),
  pinMessages(1 << 51),
  bypassSlowmode(1 << 52),
  updateRtcRegion(1 << 53),
  viewChannelMembers(1 << 54);

  final int value;
  const Permission(this.value);
}

const int allPermissions = (1 << 55) - 1;

final int defaultPermissions =
    Permission.createInstantInvite.value |
    Permission.addReactions.value |
    Permission.stream.value |
    Permission.viewChannel.value |
    Permission.sendMessages.value |
    Permission.embedLinks.value |
    Permission.attachFiles.value |
    Permission.readMessageHistory.value |
    Permission.useExternalEmojis.value |
    Permission.connect.value |
    Permission.speak.value |
    Permission.useVad.value |
    Permission.changeNickname.value |
    Permission.useExternalStickers.value |
    Permission.viewChannelMembers.value;

int everyoneRolePermissionsFromString(String? raw) {
  if (raw == null || raw.isEmpty) {
    return defaultPermissions;
  }
  return int.tryParse(raw) ?? defaultPermissions;
}

bool hasPermission(int permissions, Permission permission) =>
    (permissions & permission.value) != 0;

bool bypassesSlowmode(int permissions) =>
    hasPermission(permissions, Permission.bypassSlowmode);

final int elevatedPermissions =
    Permission.kickMembers.value |
    Permission.banMembers.value |
    Permission.administrator.value |
    Permission.manageChannels.value |
    Permission.manageGuild.value |
    Permission.manageRoles.value |
    Permission.manageMessages.value |
    Permission.manageWebhooks.value |
    Permission.manageExpressions.value |
    Permission.moderateMembers.value |
    Permission.manageThreads.value;

const int guildMfaLevelElevated = 1;

bool isGuildMfaRestricted({
  required int guildMfaLevel,
  required bool isGuildOwner,
  required bool userLacksMfa,
}) => guildMfaLevel == guildMfaLevelElevated && !isGuildOwner && userLacksMfa;

int applyGuildMfaRestriction(int permissions, {required bool restricted}) =>
    restricted ? permissions & ~elevatedPermissions : permissions;
