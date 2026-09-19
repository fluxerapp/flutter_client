import 'package:fluxer_app/core/assistant/assistant_command.dart';
import 'package:fluxer_app/core/assistant/assistant_command_result.dart';

class AssistantCommandSnapshot {
  const AssistantCommandSnapshot({
    required this.authenticated,
    required this.gatewayReady,
    required this.connectionFailed,
    required this.inVoice,
    required this.dmsDisabled,
    required this.voiceEnabled,
    required this.knownGuildIds,
    required this.voiceChannelIds,
    required this.voiceChannelGuildIds,
  });

  final bool authenticated;
  final bool gatewayReady;
  final bool connectionFailed;
  final bool inVoice;
  final bool dmsDisabled;
  final bool voiceEnabled;
  final Set<String> knownGuildIds;
  final Set<String> voiceChannelIds;
  final Map<String, String> voiceChannelGuildIds;

  bool get isNavigationReady =>
      authenticated && gatewayReady && !connectionFailed;
}

enum AssistantCommandGate {
  proceed,
  waitForReady,
  needsLogin,
  notInVoice,
  notFound,
  dmsDisabled,
  failed,
}

bool assistantCommandNeedsVoiceSession(AssistantCommand command) {
  return command is VoiceSetMuteCommand || command is VoiceLeaveCommand;
}

bool assistantCommandNeedsDms(AssistantCommand command) {
  return command is OpenDmsCommand ||
      command is VoiceStartDmCallCommand ||
      command is SendDmCommand;
}

AssistantCommandGate gateAssistantCommand({
  required AssistantCommand command,
  required AssistantCommandSnapshot snapshot,
}) {
  if (assistantCommandNeedsVoiceSession(command)) {
    if (!snapshot.inVoice) {
      return AssistantCommandGate.notInVoice;
    }
    return AssistantCommandGate.proceed;
  }

  if (!snapshot.authenticated) {
    return AssistantCommandGate.needsLogin;
  }

  if (assistantCommandNeedsDms(command) && snapshot.dmsDisabled) {
    return AssistantCommandGate.dmsDisabled;
  }

  if (command is VoiceJoinCommand) {
    if (!snapshot.voiceEnabled) {
      return AssistantCommandGate.failed;
    }
    if (!_idIsKnown(snapshot.voiceChannelIds, command.channelId)) {
      return AssistantCommandGate.notFound;
    }
    final String? guildId = command.guildId;
    if (guildId != null) {
      if (!_idIsKnown(snapshot.knownGuildIds, guildId)) {
        return AssistantCommandGate.notFound;
      }
      final String? channelGuildId =
          snapshot.voiceChannelGuildIds[command.channelId];
      if (channelGuildId != null && channelGuildId != guildId) {
        return AssistantCommandGate.notFound;
      }
    }
  } else if (command is VoiceStartDmCallCommand) {
    if (!snapshot.voiceEnabled) {
      return AssistantCommandGate.failed;
    }
    if (!_hasFriend(command.friendId)) {
      return AssistantCommandGate.notFound;
    }
  } else if (command is SendDmCommand) {
    if (command.text.trim().isEmpty) {
      return AssistantCommandGate.failed;
    }
    if (!_hasFriend(command.friendId)) {
      return AssistantCommandGate.notFound;
    }
  } else if (command is PresenceSetStatusCommand) {
    if (command.status != 'online' && command.status != 'dnd') {
      return AssistantCommandGate.failed;
    }
  }

  if (!snapshot.isNavigationReady) {
    return AssistantCommandGate.waitForReady;
  }
  return AssistantCommandGate.proceed;
}

AssistantCommandStatus statusForAssistantGate(AssistantCommandGate gate) {
  return switch (gate) {
    AssistantCommandGate.proceed ||
    AssistantCommandGate.waitForReady => AssistantCommandStatus.ok,
    AssistantCommandGate.needsLogin => AssistantCommandStatus.needsLogin,
    AssistantCommandGate.notInVoice => AssistantCommandStatus.notInVoice,
    AssistantCommandGate.notFound => AssistantCommandStatus.notFound,
    AssistantCommandGate.dmsDisabled => AssistantCommandStatus.dmsDisabled,
    AssistantCommandGate.failed => AssistantCommandStatus.failed,
  };
}

bool _hasFriend(String? friendId) {
  return friendId != null && friendId.trim().isNotEmpty;
}

bool _idIsKnown(Set<String> known, String? id) {
  if (id == null || id.isEmpty) {
    return false;
  }
  if (known.isEmpty) {
    return true;
  }
  return known.contains(id);
}
