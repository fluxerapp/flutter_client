import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/service/message_notification_sfx_gate.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fluxer_sfx_provider.g.dart';

@Riverpod(keepAlive: true)
FluxerSFX fluxerSfx(Ref ref) {
  final FluxerSFX sfx = FluxerSFX();
  ref.onDispose(() {
    unawaited(sfx.dispose());
  });
  return sfx;
}

@Riverpod(keepAlive: true)
void fluxerMessageSfxBinding(Ref ref) {
  final MessageNotificationSfxDeduper deduper = MessageNotificationSfxDeduper(
    capacity: 500,
  );
  final StreamSubscription<MessageRealtimeEvent> sub = ref
      .read(messageRealtimeBusProvider)
      .stream
      .listen((MessageRealtimeEvent evt) async {
        if (evt is! MessageCreated) {
          return;
        }
        final String? uid = ref.read(currentUserIdProvider);
        if (uid == null) {
          return;
        }
        final db = ref.read(fluxerDatabaseProvider);
        final User? self = await db.userDao.getUserById(uid);
        final bool selfDnd = self?.status == 'dnd';
        final MessageNotificationSfxResolution? resolution =
            await FluxerMessageNotificationSfxEvaluator.evaluate(
              database: db,
              message: evt.event.message,
              currentUserId: uid,
              blockedUserIds: ref.read(blockedUserIdsProvider),
              selfIsDnd: selfDnd,
              deduper: deduper,
            );
        if (resolution == null) {
          return;
        }
        if (await executeReadSystemFocusModeEnabled()) {
          return;
        }
        final bool foreground = ref.read(appUiForegroundProvider);
        final String? activeCh = ref.read(activeChannelIdProvider);
        final bool suppressSfxSound =
            foreground && activeCh != null && activeCh == resolution.channelId;
        if (!suppressSfxSound) {
          unawaited(
            ref.read(fluxerSfxProvider).playOneShot(FluxerSfxClip.message),
          );
        }
      });
  ref.onDispose(sub.cancel);
}

@Riverpod(keepAlive: true)
void fluxerSfxIncomingRingBinding(Ref ref) {
  final FluxerSFX sfx = ref.read(fluxerSfxProvider);
  bool isIncomingRingPlaying = false;
  final bool isMobileCallKitPlatform =
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  void syncIncomingRingLoop() {
    final List<String> pending = ref.read(
      pendingIncomingVoiceChannelIdsProvider,
    );
    final bool isForeground = ref.read(appUiForegroundProvider);
    final bool shouldPlay = shouldPlayIncomingVoiceRingSfx(
      isMobileCallKitPlatform: isMobileCallKitPlatform,
      isForeground: isForeground,
      hasPendingIncoming: pending.isNotEmpty,
    );
    if (shouldPlay) {
      if (isIncomingRingPlaying) {
        return;
      }
      isIncomingRingPlaying = true;
      unawaited(sfx.startLoop(FluxerSfxClip.incomingRing));
      return;
    }
    if (!isIncomingRingPlaying) {
      return;
    }
    isIncomingRingPlaying = false;
    unawaited(sfx.stopLoop());
  }

  ref
    ..listen<List<String>>(pendingIncomingVoiceChannelIdsProvider, (_, _) {
      syncIncomingRingLoop();
    }, fireImmediately: true)
    ..listen<bool>(appUiForegroundProvider, (_, _) {
      syncIncomingRingLoop();
    });
}
