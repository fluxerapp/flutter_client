import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';

bool isMatureSearchChannel({
  required Channel channel,
  required Guild? guild,
  Channel? parentCategory,
}) {
  if (channel.nsfw) {
    return true;
  }
  return isGatedMatureContent(
    resolveMatureGateContext(
      channel: channel,
      guild: guild,
      parentCategory: parentCategory,
    ),
  );
}

bool shouldIncludeNsfwInMessageSearch({
  required bool guildIsAgeRestricted,
  required bool contextChannelIsMature,
  required Iterable<bool> filterChannelsAreMature,
}) {
  return guildIsAgeRestricted ||
      contextChannelIsMature ||
      filterChannelsAreMature.any((bool mature) => mature);
}

MessageSearchQuery applyMatureContentToSearchQuery(
  MessageSearchQuery query, {
  required bool includeNsfw,
}) {
  if (!includeNsfw || (query.parsed.includeNsfw ?? false)) {
    return query;
  }
  return query.copyWith(parsed: query.parsed.copyWith(includeNsfw: true));
}
