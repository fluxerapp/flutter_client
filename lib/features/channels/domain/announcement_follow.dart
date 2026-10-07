import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';

const String kChannelHasFollowedChannels = 'CHANNEL_HAS_FOLLOWED_CHANNELS';
const String kChannelHasThreads = 'CHANNEL_HAS_THREADS';
const String kMessageAlreadyCrossposted = 'MESSAGE_ALREADY_CROSSPOSTED';
const String kMessageCrosspostRateLimited = 'MESSAGE_CROSSPOST_RATE_LIMITED';
const String kPublishedMessageEditRateLimited =
    'PUBLISHED_MESSAGE_EDIT_RATE_LIMITED';

enum AnnouncementFollowRestriction { none, ageRestricted, contentWarning }

class AnnouncementFollowGuildTargets {
  const AnnouncementFollowGuildTargets({
    required this.guild,
    required this.channels,
  });

  final Guild guild;
  final List<Channel> channels;
}

AnnouncementFollowRestriction announcementFollowRestriction({
  required Channel channel,
  required Guild? guild,
  Channel? parentCategory,
}) {
  if (getEffectiveChannelMatureContent(
    channel: channel,
    guild: guild,
    parentCategory: parentCategory,
  )) {
    return AnnouncementFollowRestriction.ageRestricted;
  }
  final EffectiveContentWarning warning = getEffectiveChannelContentWarning(
    channel: channel,
    guild: guild,
    parentCategory: parentCategory,
  );
  if (warning.level == contentWarningLevelContentWarning) {
    return AnnouncementFollowRestriction.contentWarning;
  }
  return AnnouncementFollowRestriction.none;
}

bool isAllowedAnnouncementFollowTarget({
  required AnnouncementFollowRestriction source,
  required AnnouncementFollowRestriction target,
}) {
  return switch (source) {
    AnnouncementFollowRestriction.none => true,
    AnnouncementFollowRestriction.ageRestricted =>
      target == AnnouncementFollowRestriction.ageRestricted,
    AnnouncementFollowRestriction.contentWarning =>
      target == AnnouncementFollowRestriction.ageRestricted ||
          target == AnnouncementFollowRestriction.contentWarning,
  };
}

bool canManageAnnouncementFollow({required int permissionBits}) {
  return hasPermission(permissionBits, Permission.manageWebhooks) &&
      hasPermission(permissionBits, Permission.viewChannel);
}

bool canOfferAnnouncementFollow(
  Channel? channel,
  Map<String, int> guildPermissions,
) {
  if (channel == null || !isGuildAnnouncementChannelType(channel.type)) {
    return false;
  }
  if (guildPermissions.isEmpty) {
    return true;
  }
  for (final int bits in guildPermissions.values) {
    if (hasPermission(bits, Permission.manageWebhooks)) {
      return true;
    }
  }
  return false;
}

Channel? parentCategoryFor(Channel channel, List<Channel> guildChannels) {
  return findParentCategory(channel: channel, guildChannels: guildChannels);
}
