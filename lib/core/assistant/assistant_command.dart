sealed class AssistantCommand {
  const AssistantCommand();
}

class VoiceSetMuteCommand extends AssistantCommand {
  const VoiceSetMuteCommand({this.muted});

  final bool? muted;
}

class VoiceLeaveCommand extends AssistantCommand {
  const VoiceLeaveCommand();
}

class VoiceJoinCommand extends AssistantCommand {
  const VoiceJoinCommand({required this.channelId, this.guildId});

  final String channelId;
  final String? guildId;
}

class VoiceStartDmCallCommand extends AssistantCommand {
  const VoiceStartDmCallCommand({this.friendId, this.channelId});

  final String? friendId;
  final String? channelId;
}

class PresenceSetStatusCommand extends AssistantCommand {
  const PresenceSetStatusCommand({required this.status});

  final String status;
}

class PresenceSetCustomStatusCommand extends AssistantCommand {
  const PresenceSetCustomStatusCommand({this.text = ''});

  final String text;
}

class OpenDmsCommand extends AssistantCommand {
  const OpenDmsCommand();
}

class SendDmCommand extends AssistantCommand {
  const SendDmCommand({required this.text, this.friendId, this.channelId});

  final String text;
  final String? friendId;
  final String? channelId;
}
