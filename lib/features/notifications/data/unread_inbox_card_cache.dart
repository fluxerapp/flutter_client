import 'dart:async';

import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_sticker_image.dart';
import 'package:fluxer_app/features/notifications/data/notifications_repository.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_meta.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';

class UnreadInboxCardData {
  const UnreadInboxCardData({
    required this.cacheKey,
    required this.meta,
    required this.messages,
    required this.hasMoreUnread,
  });

  final String cacheKey;
  final UnreadInboxCardMeta meta;
  final List<Message> messages;
  final bool hasMoreUnread;
}

class UnreadInboxCardCache {
  UnreadInboxCardCache({required this._database, required this._repository});

  final FluxerDatabase _database;
  final NotificationsRepository _repository;
  final Map<String, UnreadInboxCardData> _entries =
      <String, UnreadInboxCardData>{};
  final Map<String, Future<UnreadInboxCardData>> _inFlight =
      <String, Future<UnreadInboxCardData>>{};

  static String cacheKeyFor(UnreadInboxEntry entry) =>
      '${entry.ackMessageId ?? ''}:${entry.lastMessageId ?? ''}';

  Future<UnreadInboxCardData> load(UnreadInboxEntry entry) {
    final String cacheKey = cacheKeyFor(entry);
    final UnreadInboxCardData? cached = _entries[entry.channelId];
    if (cached != null && cached.cacheKey == cacheKey) {
      return Future<UnreadInboxCardData>.value(cached);
    }
    final String flightKey = '${entry.channelId}:$cacheKey';
    return _inFlight[flightKey] ??= _fetch(entry, cacheKey).whenComplete(() {
      unawaited(_inFlight.remove(flightKey));
    });
  }

  void clear() => _entries.clear();

  Future<UnreadInboxCardData> _fetch(
    UnreadInboxEntry entry,
    String cacheKey,
  ) async {
    final UnreadInboxCardMeta meta = await loadUnreadInboxCardMeta(
      _database,
      entry,
    );
    final List<Message> messages = await _repository.loadUnreadPreview(entry);
    await prefetchMessageStickerAspectRatios(messages);
    final UnreadInboxCardData data = UnreadInboxCardData(
      cacheKey: cacheKey,
      meta: meta,
      messages: messages,
      hasMoreUnread:
          messages.isNotEmpty &&
          compareSnowflakeIds(messages.last.id, entry.lastMessageId) < 0,
    );
    _entries[entry.channelId] = data;
    return data;
  }
}
