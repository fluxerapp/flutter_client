import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_dart/export.dart';

Future<bool> executeReadSystemFocusModeEnabled() async => false;

class MessageNotificationSfxDeduper {
  MessageNotificationSfxDeduper({required int capacity}) : _capacity = capacity;

  final int _capacity;
  final List<String> _order = <String>[];
  final Set<String> _set = <String>{};

  void mark(String id) {
    if (_set.contains(id)) {
      return;
    }
    _set.add(id);
    _order.add(id);
    while (_order.length > _capacity) {
      final String removed = _order.removeAt(0);
      _set.remove(removed);
    }
  }

  bool claim(String id) {
    if (_set.contains(id)) {
      return false;
    }
    mark(id);
    return true;
  }

  void release(String id) {
    if (!_set.remove(id)) {
      return;
    }
    _order.remove(id);
  }
}

enum MessageNotificationSfxClipKind {
  message,
  directMessage,
  sameChannelMessage,
}

extension MessageNotificationSfxClipKindX on MessageNotificationSfxClipKind {
  String get soundSettingsKey => switch (this) {
    MessageNotificationSfxClipKind.message => 'message',
    MessageNotificationSfxClipKind.directMessage => 'direct-message',
    MessageNotificationSfxClipKind.sameChannelMessage => 'same-channel-message',
  };
}

class MessageNotificationSfxPlayRequest {
  const MessageNotificationSfxPlayRequest({
    required this.messageId,
    required this.channelId,
    required this.clipKind,
  });

  final String messageId;
  final String channelId;
  final MessageNotificationSfxClipKind clipKind;
}

UserGuildSettingsResponse? _decodeGuildSettings(String? data) {
  if (data == null) {
    return null;
  }
  return decodeUserGuildSettings(data);
}

class FluxerMessageNotificationSfxEvaluator {
  static Future<MessageNotificationSfxPlayRequest?> evaluate({
    required FluxerDatabase database,
    required MessageResponseSchema message,
    required String currentUserId,
    required Set<String> blockedUserIds,
    required bool selfIsDnd,
    required MessageNotificationSfxDeduper deduper,
    required bool foreground,
    required bool viewingChannel,
    required bool hasObscuringOverlay,
  }) {
    return const FluxerMessageNotificationSfxEvaluator().resolve(
      database: database,
      message: message,
      currentUserId: currentUserId,
      blockedUserIds: blockedUserIds,
      selfIsDnd: selfIsDnd,
      deduper: deduper,
      foreground: foreground,
      viewingChannel: viewingChannel,
      hasObscuringOverlay: hasObscuringOverlay,
    );
  }

  static Future<MessageNotificationSfxPlayRequest?> evaluateFromSnapshot({
    required MessageResponseSchema message,
    required MessagePersistSnapshot snapshot,
    required String currentUserId,
    required Set<String> blockedUserIds,
    required bool selfIsDnd,
    required MessageNotificationSfxDeduper deduper,
    required bool foreground,
    required bool viewingChannel,
    required bool hasObscuringOverlay,
  }) {
    return const FluxerMessageNotificationSfxEvaluator().resolveFromSnapshot(
      message: message,
      snapshot: snapshot,
      currentUserId: currentUserId,
      blockedUserIds: blockedUserIds,
      selfIsDnd: selfIsDnd,
      deduper: deduper,
      foreground: foreground,
      viewingChannel: viewingChannel,
      hasObscuringOverlay: hasObscuringOverlay,
    );
  }

  const FluxerMessageNotificationSfxEvaluator();

  Future<MessageNotificationSfxPlayRequest?> resolveFromSnapshot({
    required MessageResponseSchema message,
    required MessagePersistSnapshot snapshot,
    required String currentUserId,
    required Set<String> blockedUserIds,
    required bool selfIsDnd,
    required MessageNotificationSfxDeduper deduper,
    required bool foreground,
    required bool viewingChannel,
    required bool hasObscuringOverlay,
  }) async {
    if (!_passesBasicAuthorChecks(
      message: message,
      currentUserId: currentUserId,
      blockedUserIds: blockedUserIds,
    )) {
      return null;
    }
    final bool isFocusedViewingChannel =
        foreground && viewingChannel && !hasObscuringOverlay;
    if (isFocusedViewingChannel) {
      if (!deduper.claim(message.id)) {
        return null;
      }
      return MessageNotificationSfxPlayRequest(
        messageId: message.id,
        channelId: message.channelId,
        clipKind: MessageNotificationSfxClipKind.sameChannelMessage,
      );
    }
    if (!deduper.claim(message.id)) {
      return null;
    }
    if (selfIsDnd) {
      deduper.release(message.id);
      return null;
    }
    if ((message.flags & messageFlagSuppressNotifications) != 0) {
      deduper.release(message.id);
      return null;
    }
    final UserNotificationSettings? level = snapshot.notificationLevel;
    if (snapshot.isDm) {
      if (!shouldNotifyMessageBasedOnSettings(
        level: level ?? UserNotificationSettings.allMessages,
        isMentioned: snapshot.mentionsCurrentUser,
        isPrivateChannel: true,
        isPrivateChannelMuted: false,
      )) {
        deduper.release(message.id);
        return null;
      }
      return MessageNotificationSfxPlayRequest(
        messageId: message.id,
        channelId: message.channelId,
        clipKind: MessageNotificationSfxClipKind.directMessage,
      );
    }
    if (!shouldNotifyMessageBasedOnSettings(
      level: level ?? UserNotificationSettings.allMessages,
      isMentioned: snapshot.mentionsCurrentUser,
      isPrivateChannel: false,
      isPrivateChannelMuted: false,
    )) {
      deduper.release(message.id);
      return null;
    }
    return MessageNotificationSfxPlayRequest(
      messageId: message.id,
      channelId: message.channelId,
      clipKind: MessageNotificationSfxClipKind.message,
    );
  }

  Future<MessageNotificationSfxPlayRequest?> resolve({
    required FluxerDatabase database,
    required MessageResponseSchema message,
    required String currentUserId,
    required Set<String> blockedUserIds,
    required bool selfIsDnd,
    required MessageNotificationSfxDeduper deduper,
    required bool foreground,
    required bool viewingChannel,
    required bool hasObscuringOverlay,
  }) async {
    final ChannelResolution? channel = await _resolveChannel(
      database: database,
      channelId: message.channelId,
    );
    if (channel == null) {
      return null;
    }
    if (!_passesBasicAuthorChecks(
      message: message,
      currentUserId: currentUserId,
      blockedUserIds: blockedUserIds,
    )) {
      return null;
    }
    final bool isFocusedViewingChannel =
        foreground && viewingChannel && !hasObscuringOverlay;
    if (isFocusedViewingChannel) {
      if (!deduper.claim(message.id)) {
        return null;
      }
      return MessageNotificationSfxPlayRequest(
        messageId: message.id,
        channelId: message.channelId,
        clipKind: MessageNotificationSfxClipKind.sameChannelMessage,
      );
    }
    if (!deduper.claim(message.id)) {
      return null;
    }
    if (selfIsDnd) {
      deduper.release(message.id);
      return null;
    }
    if ((message.flags & messageFlagSuppressNotifications) != 0) {
      deduper.release(message.id);
      return null;
    }
    final DateTime now = DateTime.now();
    final UserGuildSettingsResponse? guildSettings = await _loadGuildSettings(
      database: database,
      guildStorageId: channel.guildStorageId,
    );
    if (channel.isPrivate) {
      if (allowNoMessagesForPrivateChannel(
        guildSettings: guildSettings,
        channelId: channel.channelId,
        now: now,
      )) {
        deduper.release(message.id);
        return null;
      }
      final bool isMentioned = await resolveMessageMentionsUser(
        database,
        currentUserId: currentUserId,
        channelId: message.channelId,
        authorId: message.author.id,
        mentionedUserIds: message.mentions
            .map((UserPartialResponse u) => u.id)
            .toList(),
        mentionEveryone: message.mentionEveryone,
        mentionRoleIds: message.mentionRoles,
      );
      final bool isPrivateMuted = isChannelOverrideMuted(
        guildSettings?.channelOverrides?[channel.channelId],
        now: now,
      );
      final UserNotificationSettings level = resolvePrivateMessageNotifications(
        guildSettings: guildSettings,
        channelId: channel.channelId,
      );
      if (!shouldNotifyMessageBasedOnSettings(
        level: level,
        isMentioned: isMentioned,
        isPrivateChannel: true,
        isPrivateChannelMuted: isPrivateMuted,
      )) {
        deduper.release(message.id);
        return null;
      }
      return MessageNotificationSfxPlayRequest(
        messageId: message.id,
        channelId: message.channelId,
        clipKind: MessageNotificationSfxClipKind.directMessage,
      );
    }
    final Channel guildChannel = channel.guildChannel!;
    if (allowNoMessagesForGuildChannel(
      channel: guildChannel,
      guildSettings: guildSettings,
      now: now,
    )) {
      deduper.release(message.id);
      return null;
    }
    final bool isMentioned = await resolveMessageMentionsUser(
      database,
      currentUserId: currentUserId,
      channelId: message.channelId,
      authorId: message.author.id,
      mentionedUserIds: message.mentions
          .map((UserPartialResponse u) => u.id)
          .toList(),
      mentionEveryone: message.mentionEveryone,
      mentionRoleIds: message.mentionRoles,
    );
    final UserNotificationSettings level = resolveMessageNotifications(
      channel: guildChannel,
      guildSettings: guildSettings,
    );
    if (!shouldNotifyMessageBasedOnSettings(
      level: level,
      isMentioned: isMentioned,
      isPrivateChannel: false,
      isPrivateChannelMuted: false,
    )) {
      deduper.release(message.id);
      return null;
    }
    return MessageNotificationSfxPlayRequest(
      messageId: message.id,
      channelId: message.channelId,
      clipKind: MessageNotificationSfxClipKind.message,
    );
  }

  bool _passesBasicAuthorChecks({
    required MessageResponseSchema message,
    required String currentUserId,
    required Set<String> blockedUserIds,
  }) {
    if (message.author.id == currentUserId) {
      return false;
    }
    if (blockedUserIds.contains(message.author.id)) {
      return false;
    }
    return true;
  }

  Future<ChannelResolution?> _resolveChannel({
    required FluxerDatabase database,
    required String channelId,
  }) async {
    final Channel? guildChannel = await database.channelDao.getChannelById(
      channelId,
    );
    if (guildChannel != null) {
      return ChannelResolution.guild(
        channelId: channelId,
        guildStorageId: guildChannel.guildId,
        guildChannel: guildChannel,
      );
    }
    final DmChannel? dmRow = await database.dmChannelDao.getDmChannelById(
      channelId,
    );
    if (dmRow == null) {
      return null;
    }
    return ChannelResolution.private(
      channelId: channelId,
      guildStorageId: '@me',
    );
  }

  Future<UserGuildSettingsResponse?> _loadGuildSettings({
    required FluxerDatabase database,
    required String guildStorageId,
  }) async {
    final row = await database.userGuildSettingsDao.getByGuildId(
      guildStorageId,
    );
    return _decodeGuildSettings(row?.data);
  }
}

class ChannelResolution {
  const ChannelResolution._({
    required this.channelId,
    required this.guildStorageId,
    required this.isPrivate,
    required this.guildChannel,
  });

  factory ChannelResolution.guild({
    required String channelId,
    required String guildStorageId,
    required Channel guildChannel,
  }) {
    return ChannelResolution._(
      channelId: channelId,
      guildStorageId: guildStorageId,
      isPrivate: false,
      guildChannel: guildChannel,
    );
  }

  factory ChannelResolution.private({
    required String channelId,
    required String guildStorageId,
  }) {
    return ChannelResolution._(
      channelId: channelId,
      guildStorageId: guildStorageId,
      isPrivate: true,
      guildChannel: null,
    );
  }

  final String channelId;
  final String guildStorageId;
  final bool isPrivate;
  final Channel? guildChannel;
}
