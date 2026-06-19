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
  useExternalStickers(1 << 37),
  moderateMembers(1 << 40),
  createExpressions(1 << 43),
  pinMessages(1 << 51),
  bypassSlowmode(1 << 52),
  updateRtcRegion(1 << 53),
  viewChannelMembers(1 << 54);

  final int value;
  const Permission(this.value);
}

const allPermissions = 0x7FFFFFFFFFFFFF;

bool hasPermission(int permissions, Permission permission) =>
    (permissions & permission.value) != 0;
