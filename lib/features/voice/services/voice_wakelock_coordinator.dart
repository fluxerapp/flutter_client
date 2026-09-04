import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_wakelock_policy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'voice_wakelock_coordinator.g.dart';

final voiceWakelockEnabledProvider = Provider<bool>((Ref ref) {
  return voiceWakelockShouldBeEnabled(
    voice: ref.watch(voiceSessionProvider),
    watchedTileId: ref.watch(voiceScreenShareWatchTileProvider),
    route: ref.watch(routeStateProvider),
    showsOverlay: ref.watch(
      voiceCallOverlayProvider.select(
        (VoiceCallOverlayState state) => state.showsOverlay,
      ),
    ),
  );
});

@Riverpod(keepAlive: true)
void voiceWakelockCoordinator(Ref ref) {
  if (kIsWeb) {
    return;
  }

  var enabled = false;

  Future<void> apply(bool shouldEnable) async {
    if (shouldEnable == enabled) {
      return;
    }
    enabled = shouldEnable;
    try {
      await WakelockPlus.toggle(enable: shouldEnable);
    } on Object {
      // Unsupported platforms are best-effort.
    }
  }

  ref
    ..listen<bool>(
      voiceWakelockEnabledProvider,
      (_, bool shouldEnable) => unawaited(apply(shouldEnable)),
      fireImmediately: true,
    )
    ..onDispose(() => unawaited(WakelockPlus.disable()));
}
