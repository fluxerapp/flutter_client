import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/domain/voice_output_route.dart';
import 'package:livekit_client/livekit_client.dart';

const MethodChannel _voiceSpeakerRouteChannel = MethodChannel(
  'fluxer_app/voice_speaker_route',
);

Future<void> applyNativeVoiceOutputRoute(VoiceOutputRoute route) async {
  if (kIsWeb ||
      (defaultTargetPlatform != TargetPlatform.android &&
          defaultTargetPlatform != TargetPlatform.iOS)) {
    return;
  }
  try {
    await _voiceSpeakerRouteChannel.invokeMethod<void>(
      'setRoute',
      <String, Object>{'route': route.name},
    );
  } on Object {
    return;
  }
}

Future<Set<VoiceOutputRoute>> readAvailableVoiceOutputRoutes() async {
  if (kIsWeb ||
      (defaultTargetPlatform != TargetPlatform.android &&
          defaultTargetPlatform != TargetPlatform.iOS)) {
    return kPhoneVoiceOutputRoutes;
  }
  try {
    final List<Object?>? names = await _voiceSpeakerRouteChannel
        .invokeMethod<List<Object?>>('availableRoutes');
    if (names == null || names.isEmpty) {
      return kPhoneVoiceOutputRoutes;
    }
    return names
        .map((Object? name) => voiceOutputRouteFromName('$name'))
        .toSet();
  } on Object {
    return kPhoneVoiceOutputRoutes;
  }
}

class VoiceAvailableOutputRoutes extends Notifier<Set<VoiceOutputRoute>> {
  @override
  Set<VoiceOutputRoute> build() {
    final StreamSubscription<List<MediaDevice>> subscription = Hardware
        .instance
        .onDeviceChange
        .stream
        .listen((_) {
          unawaited(_refresh());
        });
    ref.onDispose(subscription.cancel);
    unawaited(_refresh());
    return kPhoneVoiceOutputRoutes;
  }

  Future<void> _refresh() async {
    final Set<VoiceOutputRoute> routes = await readAvailableVoiceOutputRoutes();
    if (!ref.mounted) {
      return;
    }
    state = routes;
  }
}

final NotifierProvider<VoiceAvailableOutputRoutes, Set<VoiceOutputRoute>>
voiceAvailableOutputRoutesProvider =
    NotifierProvider<VoiceAvailableOutputRoutes, Set<VoiceOutputRoute>>(
      VoiceAvailableOutputRoutes.new,
    );
