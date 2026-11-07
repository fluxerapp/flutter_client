import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_announcer_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_magic_tap_provider.g.dart';

const MethodChannel kVoiceMagicTapChannel = MethodChannel(
  'fluxer_app/voice_magic_tap',
);

bool get voiceMagicTapSupported =>
    !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

Future<void> handleVoiceMagicTap(Ref ref) async {
  if (!ref.read(voiceSessionProvider).isInVoice) {
    return;
  }
  await ref.read(voiceSessionProvider.notifier).toggleSelfMute();
  final bool muted = ref.read(localVoiceStateProvider).selfMute;
  final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
  ref
      .read(voiceCallAnnouncerProvider.notifier)
      .announce(
        muted ? l10n.voiceAnnounceMicMuted : l10n.voiceAnnounceMicUnmuted,
      );
}

@Riverpod(keepAlive: true)
void voiceMagicTapBridge(Ref ref) {
  if (!voiceMagicTapSupported) {
    return;
  }
  kVoiceMagicTapChannel.setMethodCallHandler((MethodCall call) async {
    if (call.method == 'magicTap') {
      await handleVoiceMagicTap(ref);
    }
  });
  ref
    ..onDispose(() => kVoiceMagicTapChannel.setMethodCallHandler(null))
    ..listen<bool>(
      voiceSessionProvider.select((VoiceSessionState s) => s.isInVoice),
      (_, bool inVoice) {
        unawaited(
          kVoiceMagicTapChannel
              .invokeMethod<void>('setInCall', inVoice)
              .catchError((Object _) {}),
        );
      },
      fireImmediately: true,
    );
}
