import 'dart:async';

import 'package:drift/drift.dart' show CancellationException;
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/settings/domain/tts_notification_mode.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/notification_preferences_provider.dart';
import 'package:fluxer_app/features/voice/tts/fluxer_tts.dart';
import 'package:fluxer_app/features/voice/tts/tts_incoming_message_handler.dart';
import 'package:fluxer_app/features/voice/tts/tts_locale_utils.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fluxer_tts_provider.g.dart';

class FluxerTtsSpeakingState {
  const FluxerTtsSpeakingState({
    this.isSpeaking = false,
    this.messageId,
    this.channelId,
  });

  final bool isSpeaking;
  final String? messageId;
  final String? channelId;

  bool isSpeakingMessage(String id) => isSpeaking && messageId == id;
}

@Riverpod(keepAlive: true)
class FluxerTtsService extends _$FluxerTtsService {
  late final FluxerTts _engine;

  @override
  FluxerTtsSpeakingState build() {
    _engine = FluxerTts();
    _engine.onSpeakingChanged =
        ({required bool isSpeaking, FluxerTtsSpeakingTarget? target}) {
          state = FluxerTtsSpeakingState(
            isSpeaking: isSpeaking,
            messageId: target?.messageId,
            channelId: target?.channelId,
          );
        };
    ref.onDispose(() {
      _engine.onSpeakingChanged = null;
      unawaited(_engine.dispose());
    });
    return const FluxerTtsSpeakingState();
  }

  Future<bool> isSupported() => _engine.isSupported();

  Future<void> speakPreview({
    required String text,
    required double rate,
    String? locale,
    void Function()? onEnd,
    void Function()? onError,
  }) {
    return _engine.speak(
      text: text,
      rate: rate,
      locale: locale,
      onEnd: onEnd,
      onError: onError,
    );
  }

  Future<void> speakMessage({
    required Message message,
    required double rate,
    String? locale,
  }) {
    return _engine.speakMessage(
      messageId: message.id,
      channelId: message.channelId,
      content: message.speakableContent,
      rate: rate,
      locale: locale,
    );
  }

  Future<void> stop() => _engine.stop();

  Future<void> handleIncomingMessage({
    required TtsIncomingMessageContext context,
    required db.FluxerDatabase database,
  }) {
    return handleIncomingTtsMessage(
      context: context,
      database: database,
      tts: _engine,
    );
  }
}

@Riverpod(keepAlive: true)
void fluxerTtsBinding(Ref ref) {
  final TtsRecentMessageDeduper deduper = TtsRecentMessageDeduper();
  final StreamSubscription<MessageRealtimeEvent> sub = ref
      .read(messageRealtimeBusProvider)
      .stream
      .listen((MessageRealtimeEvent event) async {
        if (event is MessageCreated) {
          await _handleMessageCreated(ref: ref, event: event, deduper: deduper);
          return;
        }
        if (event is MessageDeleted) {
          _stopIfSpeaking(ref: ref, messageId: event.event.messageId);
          return;
        }
        if (event is MessagesDeletedBulk) {
          for (final String messageId in event.event.ids) {
            _stopIfSpeaking(ref: ref, messageId: messageId);
          }
        }
      });

  ref.onDispose(sub.cancel);
}

Future<void> _handleMessageCreated({
  required Ref ref,
  required MessageCreated event,
  required TtsRecentMessageDeduper deduper,
}) async {
  try {
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (currentUserId == null) {
      return;
    }
    final AppearancePreferencesState appearance = ref.read(
      appearancePreferencesProvider,
    );
    final NotificationPreferencesState notificationPrefs = ref.read(
      notificationPreferencesProvider,
    );
    final bool isExplicitTts = event.event.message.tts;
    if (notificationPrefs.ttsNotificationMode == TtsNotificationMode.never &&
        !(isExplicitTts && appearance.enableTtsCommand)) {
      return;
    }
    final Message message = Message.fromSdk(
      event.event.message,
      currentUserId: currentUserId,
    );
    final TtsIncomingMessageContext context = TtsIncomingMessageContext(
      message: message,
      currentUserId: currentUserId,
      blockedUserIds: ref.read(blockedUserIdsProvider),
      activeChannelId: ref.read(activeChannelIdProvider),
      enableTtsCommand: appearance.enableTtsCommand,
      ttsRate: appearance.ttsRate,
      ttsNotificationMode: notificationPrefs.ttsNotificationMode,
      locale: formatTtsLocaleTag(ref.read(effectiveAppLocaleProvider)),
      l10n: ref.read(appLocalizationsProvider),
      deduper: deduper,
    );
    await ref
        .read(fluxerTtsServiceProvider.notifier)
        .handleIncomingMessage(
          context: context,
          database: ref.read(fluxerDatabaseProvider),
        );
  } on CancellationException {
    // Ignore during teardown.
  }
}

void _stopIfSpeaking({required Ref ref, required String messageId}) {
  final FluxerTtsSpeakingState speaking = ref.read(fluxerTtsServiceProvider);
  if (!speaking.isSpeaking || speaking.messageId != messageId) {
    return;
  }
  unawaited(ref.read(fluxerTtsServiceProvider.notifier).stop());
}
