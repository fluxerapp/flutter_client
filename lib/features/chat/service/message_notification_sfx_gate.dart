import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
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

class MessageNotificationSfxResolution {
  const MessageNotificationSfxResolution({
    required this.messageId,
    required this.channelId,
  });

  final String messageId;
  final String channelId;
}

UserGuildSettingsResponse _defaultUserGuildSettings() {
  return const UserGuildSettingsResponse(
    guildId: null,
    messageNotifications: UserNotificationSettings.allMessages,
    muted: false,
    muteConfig: null,
    mobilePush: true,
    suppressEveryone: false,
    suppressRoles: false,
    hideMutedChannels: false,
    channelOverrides: null,
    version: 0,
  );
}

bool _muteEndActive(String? endTimeStr) {
  if (endTimeStr == null) {
    return true;
  }
  final DateTime? end = DateTime.tryParse(endTimeStr);
  if (end == null) {
    return true;
  }
  return !end.isBefore(DateTime.now());
}

bool _guildMuteActive(UserGuildSettingsResponse gs) {
  if (!gs.muted) {
    return false;
  }
  return _muteEndActive(gs.muteConfig?.endTime);
}

bool _channelOverrideMuteActive(ChannelOverrides? o) {
  if (o == null || !o.muted) {
    return false;
  }
  return _muteEndActive(o.muteConfig?.endTime);
}

UserNotificationSettings _resolveNotificationLevel({
  required UserGuildSettingsResponse gs,
  required String channelId,
  String? categoryId,
}) {
  final Map<String, ChannelOverrides>? map = gs.channelOverrides;
  final ChannelOverrides? channelOv = map?[channelId];
  if (channelOv != null &&
      channelOv.messageNotifications != UserNotificationSettings.inherit) {
    return channelOv.messageNotifications;
  }
  if (categoryId != null) {
    final ChannelOverrides? catOv = map?[categoryId];
    if (catOv != null &&
        catOv.messageNotifications != UserNotificationSettings.inherit) {
      return catOv.messageNotifications;
    }
  }
  return gs.messageNotifications;
}

bool _shouldSuppressAll({
  required UserGuildSettingsResponse gs,
  required String channelId,
  String? categoryId,
}) {
  if (_guildMuteActive(gs)) {
    return true;
  }
  final Map<String, ChannelOverrides>? map = gs.channelOverrides;
  if (_channelOverrideMuteActive(map?[channelId])) {
    return true;
  }
  if (categoryId != null && _channelOverrideMuteActive(map?[categoryId])) {
    return true;
  }
  final UserNotificationSettings resolved = _resolveNotificationLevel(
    gs: gs,
    channelId: channelId,
    categoryId: categoryId,
  );
  return resolved == UserNotificationSettings.noMessages;
}

bool _computeIsMentioned({
  required MessageResponseSchema message,
  required String currentUserId,
  required UserGuildSettingsResponse gs,
}) {
  if (message.mentions.any((UserPartialResponse u) => u.id == currentUserId)) {
    return true;
  }
  if (message.mentionEveryone) {
    if (gs.suppressEveryone) {
      return false;
    }
    return true;
  }
  return false;
}

bool _shouldNotifyFromLevel({
  required UserNotificationSettings resolved,
  required bool isMentioned,
}) {
  if (resolved == UserNotificationSettings.allMessages) {
    return true;
  }
  if (resolved == UserNotificationSettings.onlyMentions) {
    return isMentioned;
  }
  if (resolved == UserNotificationSettings.noMessages) {
    return false;
  }
  if (resolved == UserNotificationSettings.inherit) {
    return isMentioned;
  }
  return isMentioned;
}

class FluxerMessageNotificationSfxEvaluator {
  static Future<MessageNotificationSfxResolution?> evaluate({
    required FluxerDatabase database,
    required MessageResponseSchema message,
    required String currentUserId,
    required Set<String> blockedUserIds,
    required bool selfIsDnd,
    required MessageNotificationSfxDeduper deduper,
  }) {
    return const FluxerMessageNotificationSfxEvaluator().resolve(
      database: database,
      message: message,
      currentUserId: currentUserId,
      blockedUserIds: blockedUserIds,
      selfIsDnd: selfIsDnd,
      deduper: deduper,
    );
  }

  const FluxerMessageNotificationSfxEvaluator();

  Future<MessageNotificationSfxResolution?> resolve({
    required FluxerDatabase database,
    required MessageResponseSchema message,
    required String currentUserId,
    required Set<String> blockedUserIds,
    required bool selfIsDnd,
    required MessageNotificationSfxDeduper deduper,
  }) async {
    final String messageId = message.id;
    if (!deduper.claim(messageId)) {
      return null;
    }
    if (message.author.id == currentUserId) {
      deduper.release(messageId);
      return null;
    }
    if (blockedUserIds.contains(message.author.id)) {
      deduper.release(messageId);
      return null;
    }
    if (selfIsDnd) {
      deduper.release(messageId);
      return null;
    }
    if ((message.flags & messageFlagSuppressNotifications) != 0) {
      deduper.release(messageId);
      return null;
    }
    final Channel? guildChannel = await database.channelDao.getChannelById(
      message.channelId,
    );
    final DmChannel? dmRow = guildChannel == null
        ? await database.dmChannelDao.getDmChannelById(message.channelId)
        : null;
    if (guildChannel == null && dmRow == null) {
      deduper.release(messageId);
      return null;
    }
    final settingsRow = guildChannel != null
        ? await database.userGuildSettingsDao.getByGuildId(guildChannel.guildId)
        : await database.userGuildSettingsDao.getByGuildId('@me');
    final UserGuildSettingsResponse gs = settingsRow == null
        ? _defaultUserGuildSettings()
        : UserGuildSettingsResponse.fromJson(
            jsonDecode(settingsRow.data) as Map<String, dynamic>,
          );
    final String? categoryId = guildChannel?.parentId;
    if (guildChannel != null) {
      if (_shouldSuppressAll(
        gs: gs,
        channelId: guildChannel.id,
        categoryId: categoryId,
      )) {
        deduper.release(messageId);
        return null;
      }
      final UserNotificationSettings resolved = _resolveNotificationLevel(
        gs: gs,
        channelId: guildChannel.id,
        categoryId: categoryId,
      );
      final bool isMentioned = _computeIsMentioned(
        message: message,
        currentUserId: currentUserId,
        gs: gs,
      );
      if (!_shouldNotifyFromLevel(
        resolved: resolved,
        isMentioned: isMentioned,
      )) {
        deduper.release(messageId);
        return null;
      }
    } else {
      if (_shouldSuppressAll(gs: gs, channelId: dmRow!.id)) {
        deduper.release(messageId);
        return null;
      }
      final UserNotificationSettings resolved = _resolveNotificationLevel(
        gs: gs,
        channelId: dmRow.id,
      );
      final bool isMentioned = _computeIsMentioned(
        message: message,
        currentUserId: currentUserId,
        gs: gs,
      );
      if (!_shouldNotifyFromLevel(
        resolved: resolved,
        isMentioned: isMentioned,
      )) {
        deduper.release(messageId);
        return null;
      }
    }
    return MessageNotificationSfxResolution(
      messageId: message.id,
      channelId: message.channelId,
    );
  }
}
