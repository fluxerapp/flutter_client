import 'dart:convert';

/// Guild verification levels
abstract final class GuildVerificationLevel {
  static const int none = 0;
  static const int low = 1;
  static const int medium = 2;
  static const int high = 3;
  static const int veryHigh = 4;
}

const Duration kGuildVerificationAccountMinAge = Duration(minutes: 5);
const Duration kGuildVerificationMembershipMinAge = Duration(minutes: 10);

int effectiveGuildVerificationLevel(
  int verificationLevel,
  // ignore: avoid_positional_boolean_parameters, small public helper keeps existing positional call sites compact.
  bool isDiscoverable,
) {
  if (!isDiscoverable) {
    return verificationLevel;
  }
  if (verificationLevel < GuildVerificationLevel.low) {
    return GuildVerificationLevel.low;
  }
  return verificationLevel;
}

enum GuildComposerBlockReason {
  unclaimedAccount,
  unverifiedEmail,
  accountTooNew,
  notMemberLongEnough,
  noPhoneNumber,
  guildSendDisabled,
  timedOut,
}

class GuildComposerAccess {
  final bool canAccess;
  final GuildComposerBlockReason? reason;
  final Duration? timeRemaining;

  const GuildComposerAccess({
    required this.canAccess,
    this.reason,
    this.timeRemaining,
  });

  static const GuildComposerAccess allowed = GuildComposerAccess(
    canAccess: true,
  );
}

class GuildVerificationInput {
  final String? currentUserId;
  final String? guildOwnerId;
  final bool isSendDisabled;
  final int verificationLevel;
  final bool isDiscoverable;
  final DateTime? communicationDisabledUntil;
  final String? memberRoleIdsJson;
  final DateTime? memberJoinedAt;
  final bool hasVerifiedEmail;
  final bool isEmailVerified;
  final DateTime accountCreatedAt;
  final bool hasVerifiedPhone;
  final DateTime now;

  const GuildVerificationInput({
    required this.currentUserId,
    required this.guildOwnerId,
    required this.isSendDisabled,
    required this.verificationLevel,
    required this.isDiscoverable,
    required this.communicationDisabledUntil,
    required this.memberRoleIdsJson,
    required this.memberJoinedAt,
    required this.hasVerifiedEmail,
    required this.isEmailVerified,
    required this.accountCreatedAt,
    required this.hasVerifiedPhone,
    required this.now,
  });
}

bool memberHasAssignedRoles(String? roleIdsJson) {
  if (roleIdsJson == null || roleIdsJson.isEmpty) {
    return false;
  }
  try {
    final Object? decoded = jsonDecode(roleIdsJson);
    if (decoded is List && decoded.isNotEmpty) {
      return true;
    }
  } on Object {
    // Fall through.
  }
  return false;
}

GuildComposerAccess evaluateGuildComposerAccess(GuildVerificationInput input) {
  if (input.currentUserId == null || input.currentUserId!.isEmpty) {
    return const GuildComposerAccess(
      canAccess: false,
      reason: GuildComposerBlockReason.unclaimedAccount,
    );
  }
  final DateTime? timeoutUntil = input.communicationDisabledUntil;
  if (timeoutUntil != null) {
    final Duration remaining = timeoutUntil.difference(input.now);
    if (remaining > Duration.zero) {
      return GuildComposerAccess(
        canAccess: false,
        reason: GuildComposerBlockReason.timedOut,
        timeRemaining: remaining,
      );
    }
  }
  if (input.isSendDisabled) {
    return const GuildComposerAccess(
      canAccess: false,
      reason: GuildComposerBlockReason.guildSendDisabled,
    );
  }
  if (input.guildOwnerId != null && input.guildOwnerId == input.currentUserId) {
    return GuildComposerAccess.allowed;
  }
  final int effectiveLevel = effectiveGuildVerificationLevel(
    input.verificationLevel,
    input.isDiscoverable,
  );
  if (effectiveLevel == GuildVerificationLevel.none) {
    return GuildComposerAccess.allowed;
  }
  if (memberHasAssignedRoles(input.memberRoleIdsJson)) {
    return GuildComposerAccess.allowed;
  }
  if (!input.hasVerifiedEmail) {
    return const GuildComposerAccess(
      canAccess: false,
      reason: GuildComposerBlockReason.unclaimedAccount,
    );
  }
  if (effectiveLevel >= GuildVerificationLevel.low && !input.isEmailVerified) {
    return const GuildComposerAccess(
      canAccess: false,
      reason: GuildComposerBlockReason.unverifiedEmail,
    );
  }
  if (effectiveLevel >= GuildVerificationLevel.medium) {
    final Duration accountAge = input.now.difference(input.accountCreatedAt);
    if (accountAge < kGuildVerificationAccountMinAge) {
      return GuildComposerAccess(
        canAccess: false,
        reason: GuildComposerBlockReason.accountTooNew,
        timeRemaining: kGuildVerificationAccountMinAge - accountAge,
      );
    }
  }
  if (effectiveLevel >= GuildVerificationLevel.high) {
    final DateTime? joinedAt = input.memberJoinedAt;
    if (joinedAt != null) {
      final Duration membershipDuration = input.now.difference(joinedAt);
      if (membershipDuration < kGuildVerificationMembershipMinAge) {
        return GuildComposerAccess(
          canAccess: false,
          reason: GuildComposerBlockReason.notMemberLongEnough,
          timeRemaining:
              kGuildVerificationMembershipMinAge - membershipDuration,
        );
      }
    }
  }
  if (effectiveLevel >= GuildVerificationLevel.veryHigh &&
      !input.hasVerifiedPhone) {
    return const GuildComposerAccess(
      canAccess: false,
      reason: GuildComposerBlockReason.noPhoneNumber,
    );
  }
  return GuildComposerAccess.allowed;
}
