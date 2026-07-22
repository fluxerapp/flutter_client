import 'dart:async';

import 'package:drift/drift.dart' show CancellationException;
import 'package:fluxer_app/core/audio/enums/fluxer_sfx_clip.dart';
import 'package:fluxer_app/core/audio/fluxer_sfx.dart';
import 'package:fluxer_app/core/audio/message_notification_sfx_scheduler.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/service/message_notification_sfx_gate.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/settings/providers/sound_preferences_provider.dart';
import 'package:fluxer_app/features/settings/utils/sound_type_utils.dart';
import 'package:fluxer_app/features/settings/utils/sound_volume_utils.dart';
import 'package:fluxer_app/features/voice/providers/pending_incoming_voice_calls_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_callkit_policy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fluxer_sfx_provider.g.dart';

FluxerSfxClip _clipForKind(MessageNotificationSfxClipKind kind) {
  return switch (kind) {
    MessageNotificationSfxClipKind.message => FluxerSfxClip.message,
    MessageNotificationSfxClipKind.directMessage => FluxerSfxClip.directMessage,
    MessageNotificationSfxClipKind.sameChannelMessage =>
      FluxerSfxClip.sameChannelMessage,
  };
}

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
  final MessageNotificationSfxScheduler scheduler =
      MessageNotificationSfxScheduler(
        cooldownMsForClip: (FluxerSfxClip clip) {
          if (clip == FluxerSfxClip.sameChannelMessage) {
            return 2000;
          }
          return null;
        },
      );
  ref.onDispose(scheduler.dispose);
  final StreamSubscription<MessageRealtimeEvent> sub = ref
      .read(messageRealtimeBusProvider)
      .stream
      .listen((MessageRealtimeEvent evt) async {
        if (evt is! MessageCreated) {
          return;
        }
        try {
          final String? uid = ref.read(currentUserIdProvider);
          if (uid == null) {
            return;
          }
          final db = ref.read(fluxerDatabaseProvider);
          final User? self = await db.userDao.getUserById(uid);
          final bool selfDnd = self?.status == 'dnd';
          final bool foreground = ref.read(appUiForegroundProvider);
          final String? activeCh = ref.read(activeChannelIdProvider);
          final MessageNotificationSfxPlayRequest? request =
              await FluxerMessageNotificationSfxEvaluator.evaluateFromSnapshot(
                message: evt.event.message,
                snapshot: evt.snapshot,
                currentUserId: uid,
                blockedUserIds: ref.read(blockedUserIdsProvider),
                selfIsDnd: selfDnd,
                deduper: deduper,
                foreground: foreground,
                viewingChannel:
                    activeCh != null && activeCh == evt.event.message.channelId,
                hasObscuringOverlay: ref.read(hasObscuringOverlayProvider),
              );
          if (request == null) {
            return;
          }
          if (await executeReadSystemFocusModeEnabled()) {
            return;
          }
          final SoundPreferencesState soundPrefs = ref.read(
            soundPreferencesProvider,
          );
          if (!soundPrefs.isSoundTypeEnabled(
            request.clipKind.soundSettingsKey,
          )) {
            return;
          }
          final FluxerSfxClip clip = _clipForKind(request.clipKind);
          final double volume = computeEffectiveSfxVolume(
            prefs: soundPrefs,
            soundType: request.clipKind.soundSettingsKey,
          );
          scheduler.schedule(
            clip: clip,
            play: (FluxerSfxClip scheduledClip) {
              unawaited(
                ref
                    .read(fluxerSfxProvider)
                    .playOneShot(scheduledClip, volume: volume),
              );
            },
          );
        } on CancellationException {
          // Best-effort sound: the database connection closed while this
          // event was in flight (app teardown or hot restart).
        }
      });
  ref.onDispose(sub.cancel);
}

@Riverpod(keepAlive: true)
void fluxerSfxIncomingRingBinding(Ref ref) {
  final FluxerSFX sfx = ref.read(fluxerSfxProvider);
  bool isIncomingRingPlaying = false;
  final bool isNativeVoiceCallKitPlatform = isFluxerNativeMobileOs;
  void syncIncomingRingLoop() {
    final List<String> pending = ref.read(
      pendingIncomingVoiceChannelIdsProvider,
    );
    final bool isForeground = ref.read(appUiForegroundProvider);
    final bool shouldPlay = shouldPlayIncomingVoiceRingSfx(
      isNativeVoiceCallKitPlatform: isNativeVoiceCallKitPlatform,
      isForeground: isForeground,
      hasPendingIncoming: pending.isNotEmpty,
    );
    final SoundPreferencesState soundPrefs = ref.read(soundPreferencesProvider);
    final bool soundEnabled = soundPrefs.isSoundTypeEnabled(
      kSoundTypeIncomingRing,
    );
    if (shouldPlay && soundEnabled) {
      if (isIncomingRingPlaying) {
        return;
      }
      isIncomingRingPlaying = true;
      final double volume = computeEffectiveSfxVolume(
        prefs: soundPrefs,
        soundType: kSoundTypeIncomingRing,
      );
      unawaited(sfx.startLoop(FluxerSfxClip.incomingRing, volume: volume));
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
