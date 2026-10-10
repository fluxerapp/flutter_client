import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/settings/providers/voice_prompts_preferences_provider.dart';
import 'package:fluxer_app/features/voice/domain/voice_connect_failed_target.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_p2p_sheets.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_p2p_consent_provider.g.dart';

@Riverpod(keepAlive: true)
void voiceP2pConsentRetry(Ref ref) {
  String? retriedChannelId;
  ref
    ..listen<bool>(
      voiceSessionProvider.select((VoiceSessionState s) => s.isConnected),
      (bool? previous, bool next) {
        if (next) {
          retriedChannelId = null;
        }
      },
    )
    ..listen<String?>(
      voiceSessionProvider.select((VoiceSessionState s) => s.errorMessage),
      (String? previous, String? next) {
        if (next == null) {
          return;
        }
        final VoiceConnectFailedTarget? target = ref
            .read(voiceSessionProvider)
            .connectFailedTarget;
        if (next != kVoiceSessionErrorP2pConsentRequired ||
            target == null ||
            target.channelId == retriedChannelId) {
          retriedChannelId = null;
          return;
        }
        retriedChannelId = target.channelId;
        unawaited(
          _agreeAndRetry(ref, target).then((bool retrying) {
            if (!retrying && retriedChannelId == target.channelId) {
              retriedChannelId = null;
            }
          }),
        );
      },
    );
}

Future<bool> _agreeAndRetry(Ref ref, VoiceConnectFailedTarget target) async {
  final bool agreed = await _agreeToJoin(ref, target);
  if (!ref.mounted) {
    return false;
  }
  final VoiceSession notifier = ref.read(voiceSessionProvider.notifier);
  if (ref.read(voiceSessionProvider).connectFailedTarget?.channelId !=
      target.channelId) {
    return false;
  }
  notifier.dismissFailedVoiceConnection();
  if (!agreed) {
    return false;
  }
  return notifier.connectToVoiceChannel(
    guildId: target.guildId,
    channelId: target.channelId,
    p2p: true,
    forceJoin: true,
    skipChannelGate: true,
  );
}

Future<bool> _agreeToJoin(Ref ref, VoiceConnectFailedTarget target) async {
  if (ref.read(voicePromptsPreferencesProvider).skipP2pJoinConfirm) {
    return true;
  }
  final db.Channel? channel = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(target.channelId);
  final BuildContext? ctx = rootNavigatorKey.currentContext;
  if (ctx == null || !ctx.mounted) {
    return false;
  }
  return showVoiceP2pConsentSheet(ctx, pinned: channel?.rtcP2p ?? false);
}
