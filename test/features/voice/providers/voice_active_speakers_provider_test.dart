import 'package:fake_async/fake_async.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/providers/voice_active_speakers_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/services/mesh/voice_mesh_transport.dart';

class _FakeMesh extends ChangeNotifier implements VoiceMeshTransport {
  Set<String> keys = const <String>{};

  void speak(Set<String> next) {
    keys = next;
    notifyListeners();
  }

  @override
  Set<String> get speakingKeys => keys;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _MeshVoiceSession extends VoiceSession {
  _MeshVoiceSession(this.mesh);

  final VoiceMeshTransport mesh;

  @override
  VoiceSessionState build() => VoiceSessionState(mesh: mesh);
}

void main() {
  test('reuses the speaking set when only the recent set changes', () {
    fakeAsync((FakeAsync async) {
      final _FakeMesh mesh = _FakeMesh();
      final ProviderContainer container = ProviderContainer(
        overrides: [
          voiceSessionProvider.overrideWith(() => _MeshVoiceSession(mesh)),
        ],
      );
      final List<VoiceActiveSpeakersState> states =
          <VoiceActiveSpeakersState>[];
      container.listen(
        voiceActiveSpeakersProvider,
        (VoiceActiveSpeakersState? _, VoiceActiveSpeakersState next) =>
            states.add(next),
      );

      mesh.speak(<String>{'a'});
      async.elapse(const Duration(milliseconds: 200));
      mesh.speak(const <String>{});
      async.elapse(const Duration(milliseconds: 200));

      final VoiceActiveSpeakersState holding = states.last;
      expect(holding.speakingKeys, isEmpty);
      expect(holding.recentlySpokeKeys, <String>{'a'});

      async.elapse(const Duration(seconds: 5));

      final VoiceActiveSpeakersState settled = states.last;
      expect(settled.recentlySpokeKeys, isEmpty);
      expect(settled.speakingKeys, same(holding.speakingKeys));

      container.dispose();
      async.flushTimers();
    });
  });

  test('does not emit when the speaking set is unchanged', () {
    fakeAsync((FakeAsync async) {
      final _FakeMesh mesh = _FakeMesh();
      final ProviderContainer container = ProviderContainer(
        overrides: [
          voiceSessionProvider.overrideWith(() => _MeshVoiceSession(mesh)),
        ],
      );
      final List<VoiceActiveSpeakersState> states =
          <VoiceActiveSpeakersState>[];
      container.listen(
        voiceActiveSpeakersProvider,
        (VoiceActiveSpeakersState? _, VoiceActiveSpeakersState next) =>
            states.add(next),
      );

      mesh.speak(<String>{'a'});
      async.elapse(const Duration(milliseconds: 200));
      final int emitted = states.length;

      mesh.speak(<String>{'a'});
      async.elapse(const Duration(milliseconds: 200));

      expect(states, hasLength(emitted));

      container.dispose();
      async.flushTimers();
    });
  });
}
