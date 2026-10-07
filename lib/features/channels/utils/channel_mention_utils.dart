import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';

const Set<ChannelType> clickableChannelMentionTypes = <ChannelType>{
  ChannelType.guildText,
  ChannelType.guildAnnouncement,
  ChannelType.guildVoice,
  ChannelType.guildLink,
  ChannelType.unknown,
};

bool isClickableChannelMention(Channel channel, {bool threadsActive = false}) {
  return clickableChannelMentionTypes.contains(channel.type) ||
      (threadsActive && (channel.isThread || channel.isThreadOnly));
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
