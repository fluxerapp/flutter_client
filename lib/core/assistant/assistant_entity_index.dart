import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/assistant/assistant_entities.dart';

class AssistantEntityIndex {
  const AssistantEntityIndex({
    this.voiceChannelIds = const <String>{},
    this.voiceChannelGuildIds = const <String, String>{},
  });

  factory AssistantEntityIndex.fromDonation(AssistantEntityDonation donation) {
    return AssistantEntityIndex(
      voiceChannelIds: <String>{
        for (final AssistantChannelEntity channel in donation.channels)
          if (channel.kind == assistantChannelKindVoice) channel.id,
      },
      voiceChannelGuildIds: <String, String>{
        for (final AssistantChannelEntity channel in donation.channels)
          if (channel.kind == assistantChannelKindVoice)
            if (channel.guildId case final String guildId
                when guildId.isNotEmpty)
              channel.id: guildId,
      },
    );
  }

  final Set<String> voiceChannelIds;
  final Map<String, String> voiceChannelGuildIds;
}

class AssistantEntityIndexController extends Notifier<AssistantEntityIndex> {
  @override
  AssistantEntityIndex build() => const AssistantEntityIndex();

  AssistantEntityIndex get index => state;

  set index(AssistantEntityIndex next) {
    state = next;
  }
}

final NotifierProvider<AssistantEntityIndexController, AssistantEntityIndex>
assistantEntityIndexProvider =
    NotifierProvider<AssistantEntityIndexController, AssistantEntityIndex>(
      AssistantEntityIndexController.new,
    );
