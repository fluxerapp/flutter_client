import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';

GuildVerificationInput _input({
  String? currentUserId = 'user-1',
  String? guildOwnerId = 'owner-1',
  bool isSendDisabled = false,
  int verificationLevel = 0,
  bool isDiscoverable = false,
  DateTime? communicationDisabledUntil,
  String? memberRoleIdsJson,
  DateTime? memberJoinedAt,
  bool hasVerifiedEmail = true,
  bool isEmailVerified = true,
  DateTime? accountCreatedAt,
  bool hasVerifiedPhone = true,
  DateTime? now,
}) {
  final DateTime resolvedNow = now ?? DateTime(2026, 6, 8, 12);
  return GuildVerificationInput(
    currentUserId: currentUserId,
    guildOwnerId: guildOwnerId,
    isSendDisabled: isSendDisabled,
    verificationLevel: verificationLevel,
    isDiscoverable: isDiscoverable,
    communicationDisabledUntil: communicationDisabledUntil,
    memberRoleIdsJson: memberRoleIdsJson,
    memberJoinedAt: memberJoinedAt,
    hasVerifiedEmail: hasVerifiedEmail,
    isEmailVerified: isEmailVerified,
    accountCreatedAt:
        accountCreatedAt ?? resolvedNow.subtract(const Duration(days: 30)),
    hasVerifiedPhone: hasVerifiedPhone,
    now: resolvedNow,
  );
}

void main() {
  group('evaluateGuildComposerAccess', () {
    test('blocks when guild send is disabled', () {
      final GuildComposerAccess access = evaluateGuildComposerAccess(
        _input(isSendDisabled: true),
      );
      expect(access.canAccess, isFalse);
      expect(access.reason, GuildComposerBlockReason.guildSendDisabled);
    });

    test('blocks when member is timed out', () {
      final DateTime now = DateTime(2026, 6, 8, 12);
      final GuildComposerAccess access = evaluateGuildComposerAccess(
        _input(
          now: now,
          communicationDisabledUntil: now.add(const Duration(minutes: 5)),
        ),
      );
      expect(access.canAccess, isFalse);
      expect(access.reason, GuildComposerBlockReason.timedOut);
      expect(access.timeRemaining, const Duration(minutes: 5));
    });

    test('allows guild owner regardless of verification', () {
      final GuildComposerAccess access = evaluateGuildComposerAccess(
        _input(
          currentUserId: 'owner-1',
          verificationLevel: GuildVerificationLevel.veryHigh,
          hasVerifiedPhone: false,
        ),
      );
      expect(access.canAccess, isTrue);
    });

    test('blocks unverified email at low verification', () {
      final GuildComposerAccess access = evaluateGuildComposerAccess(
        _input(
          verificationLevel: GuildVerificationLevel.low,
          isEmailVerified: false,
        ),
      );
      expect(access.canAccess, isFalse);
      expect(access.reason, GuildComposerBlockReason.unverifiedEmail);
    });

    test('blocks account that is too new at medium verification', () {
      final DateTime now = DateTime(2026, 6, 8, 12);
      final GuildComposerAccess access = evaluateGuildComposerAccess(
        _input(
          verificationLevel: GuildVerificationLevel.medium,
          accountCreatedAt: now.subtract(const Duration(minutes: 2)),
          now: now,
        ),
      );
      expect(access.canAccess, isFalse);
      expect(access.reason, GuildComposerBlockReason.accountTooNew);
    });

    test('allows members with assigned roles', () {
      final GuildComposerAccess access = evaluateGuildComposerAccess(
        _input(
          verificationLevel: GuildVerificationLevel.veryHigh,
          hasVerifiedPhone: false,
          memberRoleIdsJson: '["role-1"]',
        ),
      );
      expect(access.canAccess, isTrue);
    });

    test('discoverable guilds enforce at least low verification', () {
      final GuildComposerAccess access = evaluateGuildComposerAccess(
        _input(isDiscoverable: true, isEmailVerified: false),
      );
      expect(access.canAccess, isFalse);
      expect(access.reason, GuildComposerBlockReason.unverifiedEmail);
    });
  });

  group('effectiveGuildVerificationLevel', () {
    test('raises none to low for discoverable guilds', () {
      expect(
        effectiveGuildVerificationLevel(GuildVerificationLevel.none, true),
        GuildVerificationLevel.low,
      );
    });
  });
}
