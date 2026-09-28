import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:livekit_client/livekit_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_active_speakers_provider.g.dart';

/// How long a participant stays flagged as "recently spoke" after they stop,
/// used to keep them ordered near the top of the grid without flicker.
const Duration _kRecentlySpokeHold = Duration(milliseconds: 4500);

/// Debounce duration for batching rapid speaker updates.
const Duration _kSpeakerDebounce = Duration(milliseconds: 100);

/// Speaking state derived from LiveKit active speaker updates.
class VoiceActiveSpeakersState {
  const VoiceActiveSpeakersState({
    this.speakingKeys = const <String>{},
    this.recentlySpokeKeys = const <String>{},
  });

  final Set<String> speakingKeys;
  final Set<String> recentlySpokeKeys;

  bool isParticipantSpeaking(Participant? participant) {
    if (participant == null) {
      return false;
    }
    return speakingKeys.contains(participant.identity) ||
        speakingKeys.contains(participant.sid);
  }

  bool participantSpokeRecently(Participant? participant) {
    if (participant == null) {
      return false;
    }
    if (isParticipantSpeaking(participant)) {
      return true;
    }
    return recentlySpokeKeys.contains(participant.identity) ||
        recentlySpokeKeys.contains(participant.sid);
  }
}

/// Tracks which participants are currently speaking in the active voice room.
///
/// Listens to [ActiveSpeakersChangedEvent] and keeps a short hold window so the
/// speaker priority ordering does not flicker as people pause between words.
@Riverpod(keepAlive: true)
class VoiceActiveSpeakers extends _$VoiceActiveSpeakers {
  EventsListener<RoomEvent>? _listener;
  Room? _attachedRoom;
  final Map<String, Timer> _holdTimers = <String, Timer>{};
  Set<String> _speakingKeys = <String>{};
  final Set<String> _recentlySpokeKeys = <String>{};
  Timer? _debounceTimer;
  bool _hasPendingEmit = false;

  @override
  VoiceActiveSpeakersState build() {
    final Room? room = ref.watch(
      voiceSessionProvider.select((VoiceSessionState s) => s.liveKitRoom),
    );
    ref.onDispose(_detach);
    _attachTo(room);
    return const VoiceActiveSpeakersState();
  }

  void _attachTo(Room? room) {
    if (identical(_attachedRoom, room)) {
      return;
    }
    _detach();
    if (room == null) {
      return;
    }
    _attachedRoom = room;
    final EventsListener<RoomEvent> listener = room.createListener();
    _listener = listener;
    listener.on<ActiveSpeakersChangedEvent>((ActiveSpeakersChangedEvent event) {
      _handleSpeakers(event.speakers);
    });
    _handleSpeakers(room.activeSpeakers);
  }

  void _handleSpeakers(List<Participant> speakers) {
    final Set<String> next = <String>{};
    for (final Participant speaker in speakers) {
      next
        ..add(speaker.identity)
        ..add(speaker.sid);
    }
    for (final String key in _speakingKeys) {
      if (!next.contains(key)) {
        _startHold(key);
      }
    }
    for (final String key in next) {
      _holdTimers.remove(key)?.cancel();
      _recentlySpokeKeys.remove(key);
    }
    _speakingKeys = next;
    _scheduleEmit();
  }

  void _scheduleEmit() {
    if (_debounceTimer != null) {
      _hasPendingEmit = true;
      return;
    }
    _emit();
    _debounceTimer = Timer(_kSpeakerDebounce, () {
      _debounceTimer = null;
      if (_hasPendingEmit) {
        _hasPendingEmit = false;
        _emit();
      }
    });
  }

  void _startHold(String key) {
    _holdTimers.remove(key)?.cancel();
    _recentlySpokeKeys.add(key);
    _holdTimers[key] = Timer(_kRecentlySpokeHold, () {
      _holdTimers.remove(key);
      _recentlySpokeKeys.remove(key);
      _scheduleEmit();
    });
  }

  void _emit() {
    state = VoiceActiveSpeakersState(
      speakingKeys: Set<String>.unmodifiable(_speakingKeys),
      recentlySpokeKeys: Set<String>.unmodifiable(_recentlySpokeKeys),
    );
  }

  void _detach() {
    _debounceTimer?.cancel();
    _debounceTimer = null;
    _hasPendingEmit = false;
    for (final Timer timer in _holdTimers.values) {
      timer.cancel();
    }
    _holdTimers.clear();
    _recentlySpokeKeys.clear();
    _speakingKeys = <String>{};
    final EventsListener<RoomEvent>? listener = _listener;
    _listener = null;
    _attachedRoom = null;
    if (listener != null) {
      unawaited(listener.dispose());
    }
    _emit();
  }
}
