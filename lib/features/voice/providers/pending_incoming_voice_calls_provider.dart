import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';

/// Channel ids where this user still has a pending incoming ring presentation.
final Provider<List<String>> pendingIncomingVoiceChannelIdsProvider =
    Provider<List<String>>((Ref ref) {
      final String? uid = ref.watch(currentUserIdProvider);
      if (uid == null) {
        return const <String>[];
      }
      final VoiceSessionState voice = ref.watch(voiceSessionProvider);
      final Map<String, CallState> calls = ref.watch(activeCallsProvider);
      final Set<String> initiatorChannels = ref.watch(
        outgoingVoiceCallInitiatorProvider,
      );
      final List<String> out = <String>[];
      for (final MapEntry<String, CallState> e in calls.entries) {
        final String channelId = e.key;
        if (!e.value.pendingRingUserIds.contains(uid)) {
          continue;
        }
        if (voice.isInVoice && voice.channelId == channelId) {
          continue;
        }
        if (initiatorChannels.contains(channelId)) {
          continue;
        }
        out.add(channelId);
      }
      out.sort();
      return out;
    });
