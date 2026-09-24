import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/assistant/assistant_command.dart';
import 'package:fluxer_app/core/assistant/assistant_command_policy.dart';
import 'package:fluxer_app/core/assistant/assistant_command_result.dart';

AssistantCommandSnapshot _snapshot({
  bool authenticated = true,
  bool gatewayReady = true,
  bool connectionFailed = false,
  bool inVoice = false,
  bool dmsDisabled = false,
  bool voiceEnabled = true,
  Set<String> knownGuildIds = const <String>{},
  Set<String> voiceChannelIds = const <String>{},
  Map<String, String> voiceChannelGuildIds = const <String, String>{},
}) {
  return AssistantCommandSnapshot(
    authenticated: authenticated,
    gatewayReady: gatewayReady,
    connectionFailed: connectionFailed,
    inVoice: inVoice,
    dmsDisabled: dmsDisabled,
    voiceEnabled: voiceEnabled,
    knownGuildIds: knownGuildIds,
    voiceChannelIds: voiceChannelIds,
    voiceChannelGuildIds: voiceChannelGuildIds,
  );
}

void main() {
  group('assistant command dispatcher gates', () {
    test('blocks voice controls when there is no session', () {
      final AssistantCommandSnapshot snapshot = _snapshot();
      expect(
        gateAssistantCommand(
          command: const VoiceSetMuteCommand(),
          snapshot: snapshot,
        ),
        AssistantCommandGate.notInVoice,
      );
      expect(
        gateAssistantCommand(
          command: const VoiceLeaveCommand(),
          snapshot: snapshot,
        ),
        AssistantCommandGate.notInVoice,
      );
      expect(
        statusForAssistantGate(AssistantCommandGate.notInVoice),
        AssistantCommandStatus.notInVoice,
      );
    });

    test('says not in a call instead of asking to log in', () {
      expect(
        gateAssistantCommand(
          command: const VoiceSetMuteCommand(muted: true),
          snapshot: _snapshot(authenticated: false),
        ),
        AssistantCommandGate.notInVoice,
      );
    });

    test('allows mute while already in voice without waiting on gateway', () {
      expect(
        gateAssistantCommand(
          command: const VoiceSetMuteCommand(muted: true),
          snapshot: _snapshot(inVoice: true, gatewayReady: false),
        ),
        AssistantCommandGate.proceed,
      );
    });

    test('blocks DM actions when DMs are disabled', () {
      final AssistantCommandSnapshot snapshot = _snapshot(dmsDisabled: true);
      expect(
        gateAssistantCommand(
          command: const OpenDmsCommand(),
          snapshot: snapshot,
        ),
        AssistantCommandGate.dmsDisabled,
      );
      expect(
        gateAssistantCommand(
          command: const SendDmCommand(text: 'hi', friendId: 'u-1'),
          snapshot: snapshot,
        ),
        AssistantCommandGate.dmsDisabled,
      );
    });

    test('returns notFound for unknown entities', () {
      final AssistantCommandSnapshot snapshot = _snapshot(
        knownGuildIds: <String>{'g-1'},
        voiceChannelIds: <String>{'v-1'},
      );
      expect(
        gateAssistantCommand(
          command: const VoiceJoinCommand(channelId: 'missing'),
          snapshot: snapshot,
        ),
        AssistantCommandGate.notFound,
      );
      expect(
        gateAssistantCommand(
          command: const SendDmCommand(text: 'hi', friendId: 'missing'),
          snapshot: snapshot,
        ),
        AssistantCommandGate.proceed,
      );
      expect(
        gateAssistantCommand(
          command: const SendDmCommand(text: 'hi'),
          snapshot: snapshot,
        ),
        AssistantCommandGate.notFound,
      );
    });

    test('waits for gateway before sending a DM', () {
      expect(
        gateAssistantCommand(
          command: const SendDmCommand(text: 'hi', friendId: 'u-1'),
          snapshot: _snapshot(gatewayReady: false),
        ),
        AssistantCommandGate.waitForReady,
      );
      expect(
        gateAssistantCommand(
          command: const SendDmCommand(text: 'hi', friendId: 'u-1'),
          snapshot: _snapshot(),
        ),
        AssistantCommandGate.proceed,
      );
    });

    test('allows selectable presence statuses', () {
      for (final String status in <String>[
        'online',
        'idle',
        'dnd',
        'invisible',
      ]) {
        expect(
          gateAssistantCommand(
            command: PresenceSetStatusCommand(status: status),
            snapshot: _snapshot(),
          ),
          AssistantCommandGate.proceed,
          reason: status,
        );
      }
    });

    test('rejects unknown presence statuses', () {
      expect(
        gateAssistantCommand(
          command: const PresenceSetStatusCommand(status: 'offline'),
          snapshot: _snapshot(),
        ),
        AssistantCommandGate.failed,
      );
    });

    test('allows custom status to be set or cleared', () {
      expect(
        gateAssistantCommand(
          command: const PresenceSetCustomStatusCommand(),
          snapshot: _snapshot(),
        ),
        AssistantCommandGate.proceed,
      );
      expect(
        gateAssistantCommand(
          command: const PresenceSetCustomStatusCommand(text: 'in a meeting'),
          snapshot: _snapshot(),
        ),
        AssistantCommandGate.proceed,
      );
    });

    test('requires login before navigation commands', () {
      expect(
        gateAssistantCommand(
          command: const OpenDmsCommand(),
          snapshot: _snapshot(authenticated: false),
        ),
        AssistantCommandGate.needsLogin,
      );
    });

    test('rejects voice join when the community does not own the channel', () {
      final AssistantCommandSnapshot snapshot = _snapshot(
        knownGuildIds: <String>{'g-1', 'g-2'},
        voiceChannelIds: <String>{'v-1'},
        voiceChannelGuildIds: <String, String>{'v-1': 'g-1'},
      );
      expect(
        gateAssistantCommand(
          command: const VoiceJoinCommand(channelId: 'v-1', guildId: 'g-2'),
          snapshot: snapshot,
        ),
        AssistantCommandGate.notFound,
      );
      expect(
        gateAssistantCommand(
          command: const VoiceJoinCommand(channelId: 'v-1', guildId: 'g-1'),
          snapshot: snapshot,
        ),
        AssistantCommandGate.proceed,
      );
    });
  });
}
