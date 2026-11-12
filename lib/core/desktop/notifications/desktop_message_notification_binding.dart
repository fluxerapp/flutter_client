import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart' show CancellationException;
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/desktop/notifications/desktop_message_notification_content.dart';
import 'package:fluxer_app/core/desktop/notifications/desktop_notification_tracker.dart';
import 'package:fluxer_app/core/desktop/window/desktop_main_window.dart';
import 'package:fluxer_app/core/desktop/window/desktop_window_focus_provider.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/push/android/local_notifications.dart';
import 'package:fluxer_app/core/push/android/media/cache.dart';
import 'package:fluxer_app/core/push/notification/ids.dart';
import 'package:fluxer_app/core/push/notification/tap_handler.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/services/message_notification_sfx_gate.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/profile/domain/presence_notification_policy.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/notification_preferences_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'desktop_message_notification_binding.g.dart';

bool shouldShowDesktopMessageNotification({
  required MessageResponseSchema message,
  required MessagePersistSnapshot snapshot,
  required String currentUserId,
  required Set<String> blockedUserIds,
  required bool selfIsDnd,
  required bool popupsEnabled,
  required bool windowFocused,
  required String? activeChannelId,
}) {
  if (!popupsEnabled) {
    return false;
  }
  if (!isNotifiableMessageAuthor(
    message: message,
    currentUserId: currentUserId,
    blockedUserIds: blockedUserIds,
  )) {
    return false;
  }
  if (windowFocused && activeChannelId == message.channelId) {
    return false;
  }
  if (message.type != MessageType.valueDefault &&
      message.type != MessageType.reply) {
    return false;
  }
  return passesMessageNotificationRules(
    message: message,
    snapshot: snapshot,
    selfIsDnd: selfIsDnd,
  );
}

Map<String, String> buildDesktopNotificationPayload({
  required String channelId,
  required String messageId,
  required String? guildId,
  required String currentUserId,
}) {
  return <String, String>{
    'channel_id': channelId,
    'message_id': messageId,
    'guild_id': ?guildId,
    'target_user_id': currentUserId,
    kLocalNotificationMessageIdKey: messageId,
  };
}

const Duration _kAvatarWait = Duration(seconds: 3);

Future<String?> _downloadAvatar(String? url) async {
  if (url == null) {
    return null;
  }
  try {
    return await downloadPushNotificationAvatar(
      resolvePushAvatarDownloadUrl(url),
    ).timeout(_kAvatarWait, onTimeout: () => null);
  } on Object {
    return null;
  }
}

@Riverpod(keepAlive: true)
void desktopMessageNotificationBinding(Ref ref) {
  if (!isFluxerDesktopOs) {
    return;
  }
  final LocalPushNotifications notifications = LocalPushNotifications();
  final MessageNotificationSfxDeduper deduper = MessageNotificationSfxDeduper(
    capacity: 500,
  );
  final DesktopNotificationTracker tracker = DesktopNotificationTracker();
  unawaited(
    notifications.ensureInitialized(
      onNotificationTap: ref
          .read(pushNotificationTapHandlerProvider.notifier)
          .handlePayloadJson,
    ),
  );

  void cancel(List<int> ids) {
    if (ids.isNotEmpty) {
      unawaited(notifications.cancelIds(ids));
    }
  }

  void clearActiveChannelIfFocused() {
    final String? channelId = ref.read(activeChannelIdProvider);
    if (channelId != null && isDesktopMainWindowFocused()) {
      cancel(tracker.takeChannel(channelId));
    }
  }

  ref
    ..listen<String?>(
      activeChannelIdProvider,
      (_, _) => clearActiveChannelIfFocused(),
    )
    ..listen<bool>(desktopWindowFocusedProvider, (_, bool focused) {
      if (focused) {
        clearActiveChannelIfFocused();
      }
    });

  Future<void> handleCreated(MessageCreated event) async {
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId == null) {
      return;
    }
    final MessageResponseSchema raw = event.event.message;
    if (!shouldShowDesktopMessageNotification(
      message: raw,
      snapshot: event.snapshot,
      currentUserId: currentUserId,
      blockedUserIds: ref.read(blockedUserIdsProvider),
      selfIsDnd: isPresenceDoNotDisturb(
        ref.read(userSettingsStatusProvider)?.status,
      ),
      popupsEnabled: ref
          .read(notificationPreferencesProvider)
          .notificationsEnabled,
      windowFocused: isDesktopMainWindowFocused(),
      activeChannelId: ref.read(activeChannelIdProvider),
    )) {
      return;
    }
    if (!deduper.claim(raw.id)) {
      return;
    }
    final Message message = Message.fromSdk(raw, currentUserId: currentUserId);
    final DesktopMessageNotificationContent? content =
        await buildDesktopMessageNotification(
          database: ref.read(fluxerDatabaseProvider),
          message: message,
          l10n: ref.read(appLocalizationsProvider),
          useSubtitle: Platform.isMacOS,
        );
    if (content == null || !ref.mounted) {
      return;
    }
    final String? iconPath = await _downloadAvatar(content.avatarUrl);
    if (!ref.mounted ||
        (isDesktopMainWindowFocused() &&
            ref.read(activeChannelIdProvider) == message.channelId)) {
      return;
    }
    final int id = pushMessageNotificationId(message.id);
    final bool shown = await notifications.showDesktopMessage(
      id: id,
      title: content.title,
      subtitle: content.subtitle,
      body: content.body,
      iconPath: iconPath,
      payload: buildDesktopNotificationPayload(
        channelId: message.channelId,
        messageId: message.id,
        guildId: content.guildId,
        currentUserId: currentUserId,
      ),
    );
    if (shown) {
      cancel(
        tracker.track(
          channelId: message.channelId,
          messageId: message.id,
          id: id,
        ),
      );
    }
  }

  final StreamSubscription<MessageRealtimeEvent> sub = ref
      .read(messageRealtimeBusProvider)
      .stream
      .listen((MessageRealtimeEvent event) async {
        try {
          switch (event) {
            case MessageCreated():
              await handleCreated(event);
            case MessageDeleted(event: final MessageDeleteEvent deleted):
              cancel(
                tracker.takeMessages(deleted.channelId, <String>[
                  deleted.messageId,
                ]),
              );
            case MessagesDeletedBulk(event: final MessageDeleteBulkEvent bulk):
              cancel(tracker.takeMessages(bulk.channelId, bulk.ids));
            default:
              break;
          }
        } on CancellationException {
          return;
        } on Object catch (e, st) {
          if (kDebugMode) {
            debugPrint('[DesktopMessageNotification] $e\n$st');
          }
        }
      });
  ref.onDispose(sub.cancel);
}
