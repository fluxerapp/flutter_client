import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/assistant/assistant_command.dart';
import 'package:fluxer_app/core/assistant/assistant_command_codec.dart';

void main() {
  group('assistant command codec', () {
    test('round-trips the command set', () {
      const List<AssistantCommand> commands = <AssistantCommand>[
        VoiceSetMuteCommand(),
        VoiceSetMuteCommand(muted: true),
        VoiceLeaveCommand(),
        VoiceJoinCommand(channelId: 'vc-1'),
        VoiceJoinCommand(channelId: 'vc-1', guildId: 'g-1'),
        VoiceStartDmCallCommand(friendId: 'u-1'),
        PresenceSetStatusCommand(status: 'dnd'),
        PresenceSetStatusCommand(status: 'idle'),
        PresenceSetCustomStatusCommand(text: 'in a meeting'),
        PresenceSetCustomStatusCommand(),
        OpenDmsCommand(),
        SendDmCommand(text: 'hey', friendId: 'u-1'),
      ];
      for (final AssistantCommand command in commands) {
        final Map<String, Object?> encoded = encodeAssistantCommand(command);
        final AssistantCommand? decoded = decodeAssistantCommand(encoded);
        expect(
          decoded.runtimeType,
          command.runtimeType,
          reason: '${encoded['type']}',
        );
        expect(encodeAssistantCommand(decoded!), encoded);
      }
    });

    test('decodes iOS NSNumber mute flags', () {
      expect(
        encodeAssistantCommand(
          decodeAssistantCommand(<String, Object?>{
            'type': assistantCommandTypeVoiceSetMute,
            'muted': 1,
          })!,
        ),
        <String, Object?>{
          'type': assistantCommandTypeVoiceSetMute,
          'muted': true,
        },
      );
      expect(
        encodeAssistantCommand(
          decodeAssistantCommand(<String, Object?>{
            'type': assistantCommandTypeVoiceSetMute,
            'muted': 0,
          })!,
        ),
        <String, Object?>{
          'type': assistantCommandTypeVoiceSetMute,
          'muted': false,
        },
      );
    });

    test('returns null for unknown types', () {
      expect(decodeAssistantCommand(<String, Object?>{'type': 'nope'}), isNull);
      expect(decodeAssistantCommand(null), isNull);
      expect(decodeAssistantCommand(<String, Object?>{}), isNull);
    });
  });
}
