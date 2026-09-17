import 'package:fluxer_app/core/assistant/assistant_command.dart';

const String assistantCommandTypeVoiceSetMute = 'voiceSetMute';
const String assistantCommandTypeVoiceLeave = 'voiceLeave';
const String assistantCommandTypeVoiceJoin = 'voiceJoin';
const String assistantCommandTypeVoiceStartDmCall = 'voiceStartDmCall';
const String assistantCommandTypePresenceSetStatus = 'presenceSetStatus';
const String assistantCommandTypePresenceSetCustomStatus =
    'presenceSetCustomStatus';
const String assistantCommandTypeOpenDms = 'openDms';
const String assistantCommandTypeSendDm = 'sendDm';

Map<String, Object?> encodeAssistantCommand(AssistantCommand command) {
  return switch (command) {
    VoiceSetMuteCommand(:final bool? muted) => <String, Object?>{
      'type': assistantCommandTypeVoiceSetMute,
      'muted': ?muted,
    },
    VoiceLeaveCommand() => <String, Object?>{
      'type': assistantCommandTypeVoiceLeave,
    },
    VoiceJoinCommand(:final String channelId, :final String? guildId) =>
      <String, Object?>{
        'type': assistantCommandTypeVoiceJoin,
        'channelId': channelId,
        'guildId': ?guildId,
      },
    VoiceStartDmCallCommand(
      :final String? friendId,
      :final String? channelId,
    ) =>
      <String, Object?>{
        'type': assistantCommandTypeVoiceStartDmCall,
        'friendId': ?friendId,
        'channelId': ?channelId,
      },
    PresenceSetStatusCommand(:final String status) => <String, Object?>{
      'type': assistantCommandTypePresenceSetStatus,
      'status': status,
    },
    PresenceSetCustomStatusCommand(:final String text) => <String, Object?>{
      'type': assistantCommandTypePresenceSetCustomStatus,
      'text': text,
    },
    OpenDmsCommand() => <String, Object?>{'type': assistantCommandTypeOpenDms},
    SendDmCommand(
      :final String text,
      :final String? friendId,
      :final String? channelId,
    ) =>
      <String, Object?>{
        'type': assistantCommandTypeSendDm,
        'text': text,
        'friendId': ?friendId,
        'channelId': ?channelId,
      },
  };
}

AssistantCommand? decodeAssistantCommand(Object? raw) {
  final Map<String, Object?>? map = _asStringKeyedMap(raw);
  if (map == null) {
    return null;
  }
  final String? type = map['type'] as String?;
  if (type == null || type.isEmpty) {
    return null;
  }
  switch (type) {
    case assistantCommandTypeVoiceSetMute:
      return VoiceSetMuteCommand(muted: _asBool(map['muted']));
    case assistantCommandTypeVoiceLeave:
      return const VoiceLeaveCommand();
    case assistantCommandTypeVoiceJoin:
      final String? channelId = _asNonEmptyString(map['channelId']);
      if (channelId == null) {
        return null;
      }
      return VoiceJoinCommand(
        channelId: channelId,
        guildId: _asNonEmptyString(map['guildId']),
      );
    case assistantCommandTypeVoiceStartDmCall:
      return VoiceStartDmCallCommand(
        friendId: _asNonEmptyString(map['friendId']),
        channelId: _asNonEmptyString(map['channelId']),
      );
    case assistantCommandTypePresenceSetStatus:
      final String? status = _asNonEmptyString(map['status']);
      if (status == null) {
        return null;
      }
      return PresenceSetStatusCommand(status: status);
    case assistantCommandTypePresenceSetCustomStatus:
      return PresenceSetCustomStatusCommand(text: map['text'] as String? ?? '');
    case assistantCommandTypeOpenDms:
      return const OpenDmsCommand();
    case assistantCommandTypeSendDm:
      final String? text = map['text'] as String?;
      if (text == null) {
        return null;
      }
      return SendDmCommand(
        text: text,
        friendId: _asNonEmptyString(map['friendId']),
        channelId: _asNonEmptyString(map['channelId']),
      );
    default:
      return null;
  }
}

Map<String, Object?>? _asStringKeyedMap(Object? raw) {
  if (raw is Map<String, Object?>) {
    return raw;
  }
  if (raw is Map) {
    return <String, Object?>{
      for (final MapEntry<Object?, Object?> entry in raw.entries)
        if (entry.key is String) entry.key! as String: entry.value,
    };
  }
  return null;
}

bool? _asBool(Object? value) {
  if (value is bool) {
    return value;
  }
  if (value is num) {
    if (value == 1) {
      return true;
    }
    if (value == 0) {
      return false;
    }
  }
  return null;
}

String? _asNonEmptyString(Object? value) {
  if (value is! String) {
    return null;
  }
  final String trimmed = value.trim();
  return trimmed.isEmpty ? null : trimmed;
}
