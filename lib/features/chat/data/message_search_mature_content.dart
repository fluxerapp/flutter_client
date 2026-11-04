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

MessageSearchQuery applyMatureContentToSearchQuery(
  MessageSearchQuery query, {
  required bool matureAllowed,
  required bool includeNsfw,
}) {
  final bool? requested = query.parsed.includeNsfw;
  if (!matureAllowed) {
    if (requested ?? false) {
      return query.copyWith(parsed: query.parsed.copyWith(includeNsfw: false));
    }
    return query;
  }
  if (!includeNsfw || (requested ?? false)) {
    return query;
  }
  return query.copyWith(parsed: query.parsed.copyWith(includeNsfw: true));
}
