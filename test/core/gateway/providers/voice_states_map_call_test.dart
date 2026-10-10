import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_dart/gateway.dart';

VoiceState _callVoiceState({
  required String userId,
  required String connectionId,
  String channelId = 'dm-1',
  bool selfMute = false,
  int version = 1,
}) => VoiceState.fromJson(<String, dynamic>{
  'guild_id': null,
  'channel_id': channelId,
  'user_id': userId,
  'connection_id': connectionId,
  'session_id': 'session-$userId',
  'member': null,
  'mute': false,
  'deaf': false,
  'self_mute': selfMute,
  'self_deaf': false,
  'self_video': false,
  'self_stream': false,
  'is_mobile': false,
  'suppress': false,
  'viewer_stream_keys': <String>[],
  'e2ee_capable': false,
  'region_id': null,
  'server_id': null,
  'version': version,
});

void main() {
  ProviderContainer makeContainer() {
    final ProviderContainer container = ProviderContainer();
    addTearDown(container.dispose);
    return container;
  }

  group('VoiceStatesMap call snapshot', () {
    test('CALL_CREATE voice_states fill a call already in progress', () {
      final ProviderContainer container = makeContainer();

      container
          .read(voiceStatesMapProvider.notifier)
          .replacePrivateChannel('dm-1', <VoiceState>[
            _callVoiceState(userId: 'u1', connectionId: 'conn-1'),
            _callVoiceState(userId: 'u2', connectionId: 'conn-2'),
          ]);

      expect(
        container.read(privateChannelVoiceParticipantCountProvider('dm-1')),
        2,
      );
      expect(
        container
            .read(voiceStatesInPrivateChannelProvider('dm-1'))
            .map((VoiceState vs) => vs.connectionId),
        unorderedEquals(<String>['conn-1', 'conn-2']),
      );
    });

    test('CALL_UPDATE voice_states drop users who left the call', () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier).updateBulk(<VoiceState>[
        _callVoiceState(userId: 'u1', connectionId: 'conn-1'),
        _callVoiceState(userId: 'u2', connectionId: 'conn-2'),
        _callVoiceState(
          userId: 'u3',
          connectionId: 'conn-3',
          channelId: 'dm-2',
        ),
        const VoiceState(
          userId: 'u2',
          guildId: 'g1',
          channelId: 'voice-1',
          connectionId: 'conn-guild',
        ),
      ]);

      container.read(voiceStatesMapProvider.notifier).replacePrivateChannel(
        'dm-1',
        <VoiceState>[_callVoiceState(userId: 'u1', connectionId: 'conn-1')],
      );

      expect(
        container.read(voiceStatesMapProvider).keys,
        unorderedEquals(<String>['conn-1', 'conn-3', 'conn-guild']),
      );
    });

    test('CALL_UPDATE keeps another connection of a user still listed', () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier).updateBulk(<VoiceState>[
        _callVoiceState(userId: 'u1', connectionId: 'conn-phone'),
        _callVoiceState(userId: 'u1', connectionId: 'conn-desktop'),
      ]);

      container.read(voiceStatesMapProvider.notifier).replacePrivateChannel(
        'dm-1',
        <VoiceState>[
          _callVoiceState(userId: 'u1', connectionId: 'conn-desktop'),
        ],
      );

      expect(
        container.read(voiceStatesMapProvider).keys,
        unorderedEquals(<String>['conn-phone', 'conn-desktop']),
      );
    });

    test('CALL_UPDATE older than the live state keeps the live flags', () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier)
        ..update(
          _callVoiceState(
            userId: 'u1',
            connectionId: 'conn-1',
            selfMute: true,
            version: 2,
          ),
        )
        ..update(
          _callVoiceState(userId: 'u1', connectionId: 'conn-1', version: 3),
        )
        ..replacePrivateChannel('dm-1', <VoiceState>[
          _callVoiceState(
            userId: 'u1',
            connectionId: 'conn-1',
            selfMute: true,
            version: 2,
          ),
        ]);

      final VoiceState live = container.read(voiceStatesMapProvider)['conn-1']!;
      expect(live.selfMute, isFalse);
      expect(live.version, 3);
    });

    test('CALL_UPDATE newer than the live state replaces it', () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier)
        ..update(
          _callVoiceState(userId: 'u1', connectionId: 'conn-1', version: 2),
        )
        ..replacePrivateChannel('dm-1', <VoiceState>[
          _callVoiceState(
            userId: 'u1',
            connectionId: 'conn-1',
            selfMute: true,
            version: 3,
          ),
        ]);

      final VoiceState live = container.read(voiceStatesMapProvider)['conn-1']!;
      expect(live.selfMute, isTrue);
      expect(live.version, 3);
    });

    test('late VOICE_STATE_UPDATE after a newer CALL_UPDATE is ignored', () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier)
        ..replacePrivateChannel('dm-1', <VoiceState>[
          _callVoiceState(userId: 'u1', connectionId: 'conn-1', version: 3),
        ])
        ..update(
          _callVoiceState(
            userId: 'u1',
            connectionId: 'conn-1',
            selfMute: true,
            version: 2,
          ),
        );

      final VoiceState live = container.read(voiceStatesMapProvider)['conn-1']!;
      expect(live.selfMute, isFalse);
      expect(live.version, 3);
    });

    test('late VOICE_STATE_UPDATE after a newer one is ignored', () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier)
        ..update(
          _callVoiceState(userId: 'u1', connectionId: 'conn-1', version: 3),
        )
        ..update(
          _callVoiceState(
            userId: 'u1',
            connectionId: 'conn-1',
            selfMute: true,
            version: 2,
          ),
        );

      final VoiceState live = container.read(voiceStatesMapProvider)['conn-1']!;
      expect(live.selfMute, isFalse);
      expect(live.version, 3);
    });

    test('VOICE_STATE_UPDATE with an equal version still applies', () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier)
        ..update(
          _callVoiceState(userId: 'u1', connectionId: 'conn-1', version: 3),
        )
        ..update(
          _callVoiceState(
            userId: 'u1',
            connectionId: 'conn-1',
            selfMute: true,
            version: 3,
          ),
        );

      final VoiceState live = container.read(voiceStatesMapProvider)['conn-1']!;
      expect(live.selfMute, isTrue);
    });

    test('CALL_DELETE removes the voice states of that call only', () {
      final ProviderContainer container = makeContainer();
      container.read(voiceStatesMapProvider.notifier).updateBulk(<VoiceState>[
        _callVoiceState(userId: 'u1', connectionId: 'conn-1'),
        _callVoiceState(
          userId: 'u3',
          connectionId: 'conn-3',
          channelId: 'dm-2',
        ),
      ]);

      container
          .read(voiceStatesMapProvider.notifier)
          .replacePrivateChannel('dm-1', const <VoiceState>[]);

      expect(container.read(voiceStatesMapProvider).keys, <String>['conn-3']);
    });
  });
}
