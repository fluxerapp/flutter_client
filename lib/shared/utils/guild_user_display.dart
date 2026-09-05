import 'package:fluxer_app/core/constants/media_proxy_sizes.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/media/fluxer_media_hash.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/display_name.dart';
import 'package:fluxer_dart/export.dart';

const int guildProfileDefaultAccentColor = 0x4641D9;
const int guildProfileAvatarUnsetFlag = 1 << 0;
const int guildProfileBannerUnsetFlag = 1 << 1;

@immutable
class GuildUserDisplay {
  const GuildUserDisplay({
    required this.displayName,
    required this.avatarUrl,
    required this.avatarColor,
    required this.accountDisplayName,
    this.isBot = false,
    this.bannerUrl,
    this.bannerColor,
    this.bio,
    this.pronouns,
    this.hasGuildProfile = false,
    this.isShowingGlobalProfile = false,
    this.avatarHash,
  });

  final String displayName;
  final String accountDisplayName;
  final bool isBot;
  final String? avatarUrl;
  final String? avatarHash;
  final int? avatarColor;
  final String? bannerUrl;
  final Color? bannerColor;
  final String? bio;
  final String? pronouns;
  final bool hasGuildProfile;
  final bool isShowingGlobalProfile;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuildUserDisplay &&
          other.displayName == displayName &&
          other.accountDisplayName == accountDisplayName &&
          other.isBot == isBot &&
          other.avatarUrl == avatarUrl &&
          other.avatarHash == avatarHash &&
          other.avatarColor == avatarColor &&
          other.bannerUrl == bannerUrl &&
          other.bannerColor == bannerColor &&
          other.bio == bio &&
          other.pronouns == pronouns &&
          other.hasGuildProfile == hasGuildProfile &&
          other.isShowingGlobalProfile == isShowingGlobalProfile;

  @override
  int get hashCode => Object.hash(
    displayName,
    accountDisplayName,
    isBot,
    avatarUrl,
    avatarHash,
    avatarColor,
    bannerUrl,
    bannerColor,
    bio,
    pronouns,
    hasGuildProfile,
    isShowingGlobalProfile,
  );
}

Color resolveGuildProfileBannerColor({
  required int? bannerColor,
  required int? accentColor,
  required int? avatarColor,
  int defaultAccentColor = guildProfileDefaultAccentColor,
}) {
  final List<int?> candidates = <int?>[bannerColor, accentColor, avatarColor];
  for (final int? candidate in candidates) {
    if (candidate != null) {
      return Color(0xFF000000 | candidate);
    }
  }
  return Color(0xFF000000 | defaultAccentColor);
}

String resolveAccountDisplayName({
  required String username,
  String? globalName,
}) {
  return resolveDisplayName(username: username, globalName: globalName);
}

String resolveMessageAuthorName(UserPartialResponse author) {
  return resolveAccountDisplayName(
    username: author.username,
    globalName: author.globalName,
  );
}

String resolveMessageAuthorNameFromJson(Map<String, dynamic> author) {
  return resolveAccountDisplayName(
    username: (author['username'] as String?) ?? '',
    globalName: author['global_name'] as String?,
  );
}

GuildUserDisplay resolveGuildUserDisplayFromRows({
  required db.User user,
  required db.Member? member,
  required String? guildId,
  String? friendNickname,
  String? fallbackDisplayName,
  String? fallbackAvatarHash,
  int? fallbackAvatarColor,
}) {
  final String displayName = resolveDisplayName(
    guildNickname: member?.nick,
    friendNickname: friendNickname,
    fallbackDisplayName: fallbackDisplayName,
    globalName: user.globalName,
    username: user.username,
  );
  final String? memberAvatar = member?.serverAvatar;
  final bool isAvatarUnset =
      guildId != null &&
      member != null &&
      hasMemberProfileFlag(member.profileFlags, guildProfileAvatarUnsetFlag);
  final String? resolvedAvatarHash =
      memberAvatar ?? fallbackAvatarHash ?? user.avatar;
  final String? avatarUrl = isAvatarUnset
      ? null
      : guildId != null && memberAvatar != null && memberAvatar.isNotEmpty
      ? FluxerMediaUrl.guildMemberMedia(
          guildId: guildId,
          userId: user.id,
          type: GuildMemberMediaType.avatar,
          hash: memberAvatar,
        )
      : FluxerMediaUrl.userAvatar(
          userId: user.id,
          hash: resolvedAvatarHash,
          size: MediaProxySizes.avatarProfile,
        );
  return GuildUserDisplay(
    displayName: displayName,
    accountDisplayName: resolveAccountDisplayName(
      username: user.username,
      globalName: user.globalName,
    ),
    isBot: user.bot,
    avatarUrl: avatarUrl,
    avatarHash: resolvedAvatarHash,
    avatarColor: fallbackAvatarColor ?? user.avatarColor,
  );
}

GuildUserDisplay resolveGuildUserDisplayFromMessage({
  required String userId,
  required String fallbackDisplayName,
  required String? fallbackAvatarHash,
  required int? fallbackAvatarColor,
  required db.Member? member,
  required String? guildId,
  bool animatedAvatar = true,
}) {
  final String displayName = resolveDisplayName(
    guildNickname: member?.nick,
    username: fallbackDisplayName,
  );
  final String? memberAvatar = member?.serverAvatar;
  final bool isAvatarUnset =
      guildId != null &&
      member != null &&
      hasMemberProfileFlag(member.profileFlags, guildProfileAvatarUnsetFlag);
  final String? resolvedAvatarHash = memberAvatar ?? fallbackAvatarHash;
  final String? avatarUrl = isAvatarUnset
      ? null
      : guildId != null && memberAvatar != null && memberAvatar.isNotEmpty
      ? FluxerMediaUrl.guildMemberMedia(
          guildId: guildId,
          userId: userId,
          type: GuildMemberMediaType.avatar,
          hash: memberAvatar,
          animated: animatedAvatar,
        )
      : FluxerMediaUrl.userAvatar(
          userId: userId,
          hash: resolvedAvatarHash,
          size: MediaProxySizes.avatarProfile,
          animated: animatedAvatar,
        );
  return GuildUserDisplay(
    displayName: displayName,
    accountDisplayName: fallbackDisplayName,
    avatarUrl: avatarUrl,
    avatarHash: resolvedAvatarHash,
    avatarColor: fallbackAvatarColor,
  );
}

bool messageAuthorAvatarDiffers({
  required String? messageAvatarHash,
  required String? guildAvatarHash,
}) {
  final String? messageHash = _comparableAvatarHash(messageAvatarHash);
  final String? guildHash = _comparableAvatarHash(guildAvatarHash);
  if (messageHash == null && guildHash == null) {
    return false;
  }
  if (messageHash == null || guildHash == null) {
    return true;
  }
  return messageHash != guildHash;
}

String? _comparableAvatarHash(String? hash) {
  if (hash == null || hash.isEmpty) {
    return null;
  }
  return normalizeMediaHash(hash);
}

bool messagePrefersPersistedAuthorDisplay(Message message) {
  final String? webhookId = message.webhookId;
  if (webhookId != null && webhookId.isNotEmpty) {
    return true;
  }
  return message.authorIsBot;
}

GuildUserDisplay resolveMessageAuthorDisplay({
  required Message message,
  required String? guildId,
  GuildUserDisplay? guildDisplay,
  String productName = InstanceConstants.defaultProductName,
}) {
  final GuildUserDisplay messageDisplay = resolveGuildUserDisplayFromMessage(
    userId: message.authorId,
    fallbackDisplayName: resolveSystemBotDisplayName(
      userId: message.authorId,
      fallbackName: message.authorName,
      productName: productName,
    ),
    fallbackAvatarHash: message.authorAvatar,
    fallbackAvatarColor: message.authorAvatarColor,
    member: null,
    guildId: null,
    animatedAvatar: false,
  );
  final String? webhookId = message.webhookId;
  if (webhookId != null && webhookId.isNotEmpty) {
    return messageDisplay;
  }
  if (guildDisplay == null) {
    return messageDisplay;
  }
  final bool treatsAsBot = message.authorIsBot || guildDisplay.isBot;
  if (!treatsAsBot) {
    return guildDisplay;
  }
  if (message.authorName != guildDisplay.accountDisplayName ||
      messageAuthorAvatarDiffers(
        messageAvatarHash: message.authorAvatar,
        guildAvatarHash: guildDisplay.avatarHash,
      )) {
    return messageDisplay;
  }
  final String branded = resolveSystemBotDisplayName(
    userId: message.authorId,
    fallbackName: guildDisplay.displayName,
    productName: productName,
  );
  if (branded == guildDisplay.displayName) {
    return guildDisplay;
  }
  return GuildUserDisplay(
    displayName: branded,
    accountDisplayName: branded,
    isBot: guildDisplay.isBot,
    avatarUrl: guildDisplay.avatarUrl,
    avatarHash: guildDisplay.avatarHash,
    avatarColor: guildDisplay.avatarColor,
    bannerUrl: guildDisplay.bannerUrl,
    bannerColor: guildDisplay.bannerColor,
    bio: guildDisplay.bio,
    pronouns: guildDisplay.pronouns,
    hasGuildProfile: guildDisplay.hasGuildProfile,
    isShowingGlobalProfile: guildDisplay.isShowingGlobalProfile,
  );
}

GuildUserDisplay resolveGuildUserDisplayFromProfile({
  required UserProfileFullResponse response,
  required String? guildId,
  required String? friendNickname,
  bool showGlobalProfile = false,
}) {
  final UserProfileFullResponseUser user = response.user;
  final GuildMemberResponse? guildMember = response.guildMember;
  final bool canUseGuildProfile =
      guildId != null &&
      !showGlobalProfile &&
      (guildMember != null || response.guildMemberProfile != null);
  final UserProfileFullResponseGuildMemberProfile? guildProfile =
      canUseGuildProfile ? response.guildMemberProfile : null;
  final bool isAvatarUnset =
      canUseGuildProfile &&
      hasGuildProfileFlag(guildMember, guildProfileAvatarUnsetFlag);
  final bool isBannerUnset =
      canUseGuildProfile &&
      hasGuildProfileFlag(guildMember, guildProfileBannerUnsetFlag);
  final String? guildAvatar = guildMember?.avatar;
  final String? guildBanner = guildProfile?.banner;
  final String? avatarUrl = isAvatarUnset
      ? null
      : canUseGuildProfile && guildAvatar != null
      ? FluxerMediaUrl.guildMemberMedia(
          guildId: guildId,
          userId: user.id,
          type: GuildMemberMediaType.avatar,
          hash: guildAvatar,
          animated: true,
        )
      : FluxerMediaUrl.userAvatar(
          userId: user.id,
          hash: user.avatar,
          size: MediaProxySizes.avatarProfile,
          animated: true,
        );
  final String? bannerUrl = isBannerUnset
      ? null
      : guildBanner != null && guildId != null
      ? FluxerMediaUrl.guildMemberMedia(
          guildId: guildId,
          userId: user.id,
          type: GuildMemberMediaType.banner,
          hash: guildBanner,
          size: MediaProxySizes.profileBannerModal,
          animated: true,
        )
      : FluxerMediaUrl.userBanner(
          userId: user.id,
          hash: response.userProfile.banner,
          animated: true,
        );
  final int? bannerColor = isBannerUnset
      ? null
      : response.userProfile.bannerColor;
  final int? accentColor =
      guildProfile?.accentColor ??
      (canUseGuildProfile ? guildMember?.accentColor : null) ??
      response.userProfile.accentColor;
  return GuildUserDisplay(
    displayName: resolveGuildProfileDisplayName(
      user: user,
      guildMember: guildMember,
      friendNickname: friendNickname,
      useGuildProfile: canUseGuildProfile,
    ),
    accountDisplayName: resolveAccountDisplayName(
      username: user.username,
      globalName: user.globalName,
    ),
    isBot: user.bot ?? false,
    avatarUrl: avatarUrl,
    avatarColor: user.avatarColor,
    bannerUrl: bannerUrl,
    bannerColor: resolveGuildProfileBannerColor(
      bannerColor: bannerColor,
      accentColor: accentColor,
      avatarColor: user.avatarColor,
    ),
    bio: guildProfile?.bio ?? response.userProfile.bio,
    pronouns: guildProfile?.pronouns ?? response.userProfile.pronouns,
    isShowingGlobalProfile: showGlobalProfile,
    hasGuildProfile: response.guildMemberProfile != null && guildId != null,
  );
}

bool hasGuildProfileFlag(GuildMemberResponse? member, int flag) {
  return hasMemberProfileFlag(member?.profileFlags, flag);
}

String? resolveGuildMemberAvatarUrl({
  required String guildId,
  required String userId,
  required String? memberAvatar,
  required String? userAvatarHash,
  bool avatarUnset = false,
}) {
  if (avatarUnset) {
    return null;
  }
  if (memberAvatar != null && memberAvatar.isNotEmpty) {
    return FluxerMediaUrl.guildMemberMedia(
      guildId: guildId,
      userId: userId,
      type: GuildMemberMediaType.avatar,
      hash: memberAvatar,
    );
  }
  return FluxerMediaUrl.userAvatar(userId: userId, hash: userAvatarHash);
}

String? resolveGuildMemberResponseAvatarUrl({
  required String guildId,
  required GuildMemberResponse member,
}) {
  return resolveGuildMemberAvatarUrl(
    guildId: guildId,
    userId: member.user.id,
    memberAvatar: member.avatar,
    userAvatarHash: member.user.avatar,
    avatarUnset: hasGuildProfileFlag(member, guildProfileAvatarUnsetFlag),
  );
}

bool hasMemberProfileFlag(int? profileFlags, int flag) {
  return profileFlags != null && (profileFlags & flag) != 0;
}

String resolveGuildProfileDisplayName({
  required UserProfileFullResponseUser user,
  required GuildMemberResponse? guildMember,
  required String? friendNickname,
  required bool useGuildProfile,
}) {
  return resolveDisplayName(
    guildNickname: useGuildProfile ? guildMember?.nick : null,
    friendNickname: friendNickname,
    globalName: user.globalName,
    username: user.username,
  );
}
