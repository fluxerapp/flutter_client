import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

const Set<ChannelType> clickableChannelMentionTypes = <ChannelType>{
  ChannelType.guildText,
  ChannelType.guildVoice,
  ChannelType.guildLink,
};

bool isClickableChannelMention(Channel channel) {
  return clickableChannelMentionTypes.contains(channel.type);
}

MessageChannelMention? findChannelMentionFallback(
  List<MessageChannelMention> mentions,
  String channelId,
) {
  for (final MessageChannelMention mention in mentions) {
    if (mention.id == channelId) {
      return mention;
    }
  }
  return null;
}
