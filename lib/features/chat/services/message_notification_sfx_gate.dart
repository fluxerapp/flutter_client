import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/settings/providers/preferences/sound_preferences_provider.dart';
import 'package:fluxer_dart/export.dart';

class MessageNotificationSfxDeduper {
  MessageNotificationSfxDeduper({required this._capacity});

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
    MessageNotificationSfxClipKind.message => kSoundTypeMessage,
    MessageNotificationSfxClipKind.directMessage => kSoundTypeDirectMessage,
    MessageNotificationSfxClipKind.sameChannelMessage =>
      kSoundTypeSameChannelMessage,
  };
}

class MessageNotificationSfxPlayRequest {
  const MessageNotificationSfxPlayRequest({required this.clipKind});

  final MessageNotificationSfxClipKind clipKind;
}

class FluxerMessageNotificationSfxEvaluator {
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
    if (!isNotifiableMessageAuthor(
      message: message,
      currentUserId: currentUserId,
      blockedUserIds: blockedUserIds,
    )) {
      return null;
    }
    if (!foreground) {
      return null;
    }
    final bool isFocusedViewingChannel = viewingChannel && !hasObscuringOverlay;
    if (isFocusedViewingChannel) {
      if (!deduper.claim(message.id)) {
        return null;
      }
      return const MessageNotificationSfxPlayRequest(
        clipKind: MessageNotificationSfxClipKind.sameChannelMessage,
      );
    }
    if (!deduper.claim(message.id)) {
      return null;
    }
    if (!passesMessageNotificationRules(
      message: message,
      snapshot: snapshot,
      selfIsDnd: selfIsDnd,
    )) {
      deduper.release(message.id);
      return null;
    }
    return MessageNotificationSfxPlayRequest(
      clipKind: snapshot.isDm
          ? MessageNotificationSfxClipKind.directMessage
          : MessageNotificationSfxClipKind.message,
    );
  }
}

bool isNotifiableMessageAuthor({
  required MessageResponseSchema message,
  required String currentUserId,
  required Set<String> blockedUserIds,
}) {
  if (message.author.id == currentUserId) {
    return false;
  }
  return !blockedUserIds.contains(message.author.id);
}

bool passesMessageNotificationRules({
  required MessageResponseSchema message,
  required MessagePersistSnapshot snapshot,
  required bool selfIsDnd,
}) {
  if (selfIsDnd) {
    return false;
  }
  if ((message.flags & messageFlagSuppressNotifications) != 0) {
    return false;
  }
  if (snapshot.isChannelMuted) {
    return false;
  }
  return shouldNotifyMessageBasedOnSettings(
    level: snapshot.notificationLevel ?? UserNotificationSettings.allMessages,
    isMentioned: snapshot.mentionsCurrentUser,
    isPrivateChannel: snapshot.isDm,
    isPrivateChannelMuted: false,
  );
}
