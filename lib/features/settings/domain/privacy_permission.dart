abstract final class FriendSourceFlag {
  static const int mutualFriends = 1 << 0;
  static const int mutualGuilds = 1 << 1;
  static const int noRelation = 1 << 2;
}

abstract final class IncomingCallFlag {
  static const int friendsOfFriends = 1 << 0;
  static const int guildMembers = 1 << 1;
  static const int everyone = 1 << 2;
  static const int friendsOnly = 1 << 3;
  static const int nobody = 1 << 4;
  static const int silentEveryone = 1 << 5;

  static const int baseMask =
      friendsOfFriends | guildMembers | friendsOnly | everyone | nobody;
}

abstract final class GroupDmAddPermissionFlag {
  static const int friendsOfFriends = 1 << 0;
  static const int guildMembers = 1 << 1;
  static const int everyone = 1 << 2;
  static const int friendsOnly = 1 << 3;
  static const int nobody = 1 << 4;

  static const int baseMask =
      friendsOfFriends | guildMembers | friendsOnly | everyone | nobody;
}

enum PermissionMode { nobody, friendsOnly, custom, everyone }

const int voiceActivitySharingCooldownMs = 24 * 60 * 60 * 1000;

PermissionMode incomingCallModeFromFlags(int flags) {
  if (flags & IncomingCallFlag.nobody != 0) {
    return PermissionMode.nobody;
  }
  if (flags & IncomingCallFlag.everyone != 0) {
    return PermissionMode.everyone;
  }
  if (flags & IncomingCallFlag.friendsOnly != 0) {
    return PermissionMode.friendsOnly;
  }
  return PermissionMode.custom;
}

PermissionMode groupDmAddModeFromFlags(int flags) {
  if (flags & GroupDmAddPermissionFlag.nobody != 0) {
    return PermissionMode.nobody;
  }
  if (flags & GroupDmAddPermissionFlag.everyone != 0) {
    return PermissionMode.everyone;
  }
  if (flags & GroupDmAddPermissionFlag.friendsOnly != 0) {
    return PermissionMode.friendsOnly;
  }
  return PermissionMode.custom;
}

int incomingCallFlagsForMode(PermissionMode mode, int currentFlags) {
  final int silentFlag = currentFlags & IncomingCallFlag.silentEveryone;
  final int flags = switch (mode) {
    PermissionMode.nobody => IncomingCallFlag.nobody,
    PermissionMode.friendsOnly => IncomingCallFlag.friendsOnly,
    PermissionMode.everyone => IncomingCallFlag.everyone,
    PermissionMode.custom =>
      currentFlags &
                  (IncomingCallFlag.friendsOfFriends |
                      IncomingCallFlag.guildMembers) !=
              0
          ? currentFlags &
                (IncomingCallFlag.friendsOfFriends |
                    IncomingCallFlag.guildMembers)
          : IncomingCallFlag.friendsOfFriends,
  };
  return flags | silentFlag;
}

int groupDmAddFlagsForMode(PermissionMode mode, int currentFlags) {
  return switch (mode) {
    PermissionMode.nobody => GroupDmAddPermissionFlag.nobody,
    PermissionMode.friendsOnly => GroupDmAddPermissionFlag.friendsOnly,
    PermissionMode.everyone => GroupDmAddPermissionFlag.everyone,
    PermissionMode.custom =>
      currentFlags &
                  (GroupDmAddPermissionFlag.friendsOfFriends |
                      GroupDmAddPermissionFlag.guildMembers) !=
              0
          ? currentFlags &
                (GroupDmAddPermissionFlag.friendsOfFriends |
                    GroupDmAddPermissionFlag.guildMembers)
          : GroupDmAddPermissionFlag.friendsOfFriends,
  };
}

int toggleIncomingCallFlag({
  required int currentFlags,
  required int flag,
  required bool enabled,
}) {
  var flags =
      currentFlags &
      ~(IncomingCallFlag.nobody |
          IncomingCallFlag.friendsOnly |
          IncomingCallFlag.everyone);
  if (enabled) {
    flags |= flag;
  } else {
    flags &= ~flag;
  }
  return flags == 0 ? IncomingCallFlag.friendsOnly : flags;
}

int toggleGroupDmAddFlag({
  required int currentFlags,
  required int flag,
  required bool enabled,
}) {
  var flags =
      currentFlags &
      ~(GroupDmAddPermissionFlag.nobody |
          GroupDmAddPermissionFlag.friendsOnly |
          GroupDmAddPermissionFlag.everyone);
  if (enabled) {
    flags |= flag;
  } else {
    flags &= ~flag;
  }
  return flags == 0 ? GroupDmAddPermissionFlag.friendsOnly : flags;
}

int? voiceActivityCooldownRemainingMs(String? lastChangeIso) {
  if (lastChangeIso == null) {
    return null;
  }
  final DateTime endsAt = DateTime.parse(
    lastChangeIso,
  ).add(const Duration(milliseconds: voiceActivitySharingCooldownMs));
  final int remaining = endsAt.difference(DateTime.now()).inMilliseconds;
  return remaining > 0 ? remaining : null;
}
