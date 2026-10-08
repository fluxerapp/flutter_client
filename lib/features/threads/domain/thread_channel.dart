import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart' as sdk;

const int threadNameMaxLength = 100;
const int threadMemberFlagAllMessages = 1 << 1;
const int threadMemberFlagOnlyMentions = 1 << 2;
const int threadMemberFlagNoMessages = 1 << 3;
const int threadMemberNotifyFlagMask =
    threadMemberFlagAllMessages |
    threadMemberFlagOnlyMentions |
    threadMemberFlagNoMessages;
const int defaultThreadAutoArchiveDuration = 4320;
const List<int> threadAutoArchiveDurations = <int>[60, 1440, 4320, 10080];

@immutable
class ThreadMembership {
  const ThreadMembership({required this.flags, required this.muted});

  final int flags;
  final bool muted;

  @override
  bool operator ==(Object other) =>
      other is ThreadMembership && other.flags == flags && other.muted == muted;

  @override
  int get hashCode => Object.hash(flags, muted);
}

enum ThreadNotificationSetting {
  parentDefault,
  allMessages,
  onlyMentions,
  none,
}

ThreadNotificationSetting threadNotificationSettingOf(int flags) {
  if (flags & threadMemberFlagAllMessages != 0) {
    return ThreadNotificationSetting.allMessages;
  }
  if (flags & threadMemberFlagOnlyMentions != 0) {
    return ThreadNotificationSetting.onlyMentions;
  }
  if (flags & threadMemberFlagNoMessages != 0) {
    return ThreadNotificationSetting.none;
  }
  return ThreadNotificationSetting.parentDefault;
}

int threadNotificationFlags(int current, ThreadNotificationSetting setting) {
  final int base = current & ~threadMemberNotifyFlagMask & ~1;
  return switch (setting) {
    ThreadNotificationSetting.parentDefault => base,
    ThreadNotificationSetting.allMessages => base | threadMemberFlagAllMessages,
    ThreadNotificationSetting.onlyMentions =>
      base | threadMemberFlagOnlyMentions,
    ThreadNotificationSetting.none => base | threadMemberFlagNoMessages,
  };
}

ThreadFacts threadFactsOf(Channel thread) => ThreadFacts(
  type: thread.type.wireValue,
  archived: thread.threadArchived ?? false,
  locked: thread.threadLocked ?? false,
  invitable: thread.threadInvitable ?? true,
);

extension ThreadChannelX on Channel {
  bool get isArchivedThread => threadArchived ?? false;

  bool get isLockedThread => threadLocked ?? false;

  int get threadAutoArchiveMinutes =>
      threadAutoArchiveDuration ?? defaultThreadAutoArchiveDuration;
}

String threadAutoArchiveLabel(FluxerLocalizations l10n, int minutes) =>
    switch (minutes) {
      60 => l10n.threadAutoArchiveOneHour,
      1440 => l10n.threadAutoArchiveOneDay,
      4320 => l10n.threadAutoArchiveThreeDays,
      _ => l10n.threadAutoArchiveOneWeek,
    };

Channel threadFromResponse(sdk.ThreadChannelResponse thread, String guildId) {
  final sdk.ThreadMetadataResponse? meta = thread.threadMetadata;
  return Channel(
    id: thread.id,
    guildId: thread.guildId ?? guildId,
    name: thread.name ?? '',
    type: ChannelType.fromWire(thread.type.json ?? 11),
    parentId: thread.parentId,
    rateLimitPerUser: thread.rateLimitPerUser ?? 0,
    ownerId: thread.ownerId,
    flags: thread.flags,
    threadArchived: meta?.archived,
    threadLocked: meta?.locked,
    threadInvitable: meta?.invitable,
    threadAutoArchiveDuration: meta?.autoArchiveDuration,
    threadArchiveTimestamp: meta?.archiveTimestamp.toIso8601String(),
    threadCreateTimestamp: meta?.createTimestamp.toIso8601String(),
    messageCount: thread.messageCount,
    totalMessageSent: thread.totalMessageSent,
    memberCount: thread.memberCount,
  );
}
