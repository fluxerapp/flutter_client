const int kUserFlagFriendlyBot = 1 << 4;
const int kUserFlagFriendlyBotManualApproval = 1 << 5;
const int kUserFlagSpammer = 1 << 6;

bool isFriendlyBot(int userFlags) {
  return (userFlags & kUserFlagFriendlyBot) != 0;
}

bool isFriendlyBotManualApproval(int userFlags) {
  return (userFlags & kUserFlagFriendlyBotManualApproval) != 0;
}

int applyFriendlyBotFlags({
  required int flags,
  required bool friendlyBot,
  required bool manualApproval,
}) {
  var next = flags;
  if (friendlyBot) {
    next |= kUserFlagFriendlyBot;
  } else {
    next &= ~kUserFlagFriendlyBot;
  }
  if (manualApproval && friendlyBot) {
    next |= kUserFlagFriendlyBotManualApproval;
  } else {
    next &= ~kUserFlagFriendlyBotManualApproval;
  }
  return next;
}

bool isServerSpammer(int userFlags) {
  return (userFlags & kUserFlagSpammer) != 0;
}
