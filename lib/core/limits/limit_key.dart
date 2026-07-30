abstract final class LimitKeys {
  static const String avatarMaxSize = 'avatar_max_size';
  static const String emojiMaxSize = 'emoji_max_size';
  static const String featureAnimatedAvatar = 'feature_animated_avatar';
  static const String featureAnimatedBanner = 'feature_animated_banner';
  static const String featureCustomDiscriminator =
      'feature_custom_discriminator';
  static const String featureCustomNotificationSounds =
      'feature_custom_notification_sounds';
  static const String featureEarlyAccess = 'feature_early_access';
  static const String featureGlobalExpressions = 'feature_global_expressions';
  static const String featureHigherVideoQuality =
      'feature_higher_video_quality';
  static const String featurePerGuildProfiles = 'feature_per_guild_profiles';
  static const String featureVoiceEntranceSounds =
      'feature_voice_entrance_sounds';
  static const String maxAttachmentsPerMessage = 'max_attachments_per_message';
  static const String maxAttachmentFileSize = 'max_attachment_file_size';
  static const String maxBioLength = 'max_bio_length';
  static const String maxBookmarks = 'max_bookmarks';
  static const String maxChannelsPerCategory = 'max_channels_per_category';
  static const String maxCreatedPacks = 'max_created_packs';
  static const String maxCustomBackgrounds = 'max_custom_backgrounds';
  static const String maxEmbedsPerMessage = 'max_embeds_per_message';
  static const String maxFavoriteMemeTags = 'max_favorite_meme_tags';
  static const String maxFavoriteMemes = 'max_favorite_memes';
  static const String maxGroupDmRecipients = 'max_group_dm_recipients';
  static const String maxGroupDmsPerUser = 'max_group_dms_per_user';
  static const String maxGuildChannels = 'max_guild_channels';
  static const String maxGuildEmojis = 'max_guild_emojis';
  static const String maxGuildEmojisAnimatedMore =
      'max_guild_emojis_animated_more';
  static const String maxGuildEmojisAnimated = 'max_guild_emojis_animated';
  static const String maxGuildEmojisStaticMore = 'max_guild_emojis_static_more';
  static const String maxGuildEmojisStatic = 'max_guild_emojis_static';
  static const String maxGuildInvites = 'max_guild_invites';
  static const String maxGuildMembers = 'max_guild_members';
  static const String maxGuildRoles = 'max_guild_roles';
  static const String maxGuildStickersMore = 'max_guild_stickers_more';
  static const String maxGuildStickers = 'max_guild_stickers';
  static const String maxGuilds = 'max_guilds';
  static const String maxInstalledPacks = 'max_installed_packs';
  static const String maxMessageLength = 'max_message_length';
  static const String maxPackExpressions = 'max_pack_expressions';
  static const String maxPrivateChannelsPerUser =
      'max_private_channels_per_user';
  static const String maxReactionsPerMessage = 'max_reactions_per_message';
  static const String maxRelationships = 'max_relationships';
  static const String maxUsersPerMessageReaction =
      'max_users_per_message_reaction';
  static const String maxVoiceMessageDuration = 'max_voice_message_duration';
  static const String maxWebhooksPerChannel = 'max_webhooks_per_channel';
  static const String maxWebhooksPerGuild = 'max_webhooks_per_guild';
  static const String stickerMaxSize = 'sticker_max_size';
}

enum LimitScope { user, guild, both }

const Map<String, LimitScope> kLimitKeyScopes = <String, LimitScope>{
  LimitKeys.avatarMaxSize: LimitScope.user,
  LimitKeys.emojiMaxSize: LimitScope.guild,
  LimitKeys.featureAnimatedAvatar: LimitScope.user,
  LimitKeys.featureAnimatedBanner: LimitScope.user,
  LimitKeys.featureCustomDiscriminator: LimitScope.user,
  LimitKeys.featureCustomNotificationSounds: LimitScope.user,
  LimitKeys.featureEarlyAccess: LimitScope.user,
  LimitKeys.featureGlobalExpressions: LimitScope.user,
  LimitKeys.featureHigherVideoQuality: LimitScope.user,
  LimitKeys.featurePerGuildProfiles: LimitScope.user,
  LimitKeys.featureVoiceEntranceSounds: LimitScope.user,
  LimitKeys.maxAttachmentsPerMessage: LimitScope.both,
  LimitKeys.maxBioLength: LimitScope.user,
  LimitKeys.maxBookmarks: LimitScope.user,
  LimitKeys.maxChannelsPerCategory: LimitScope.guild,
  LimitKeys.maxCreatedPacks: LimitScope.user,
  LimitKeys.maxCustomBackgrounds: LimitScope.user,
  LimitKeys.maxEmbedsPerMessage: LimitScope.both,
  LimitKeys.maxFavoriteMemeTags: LimitScope.user,
  LimitKeys.maxFavoriteMemes: LimitScope.user,
  LimitKeys.maxGroupDmRecipients: LimitScope.user,
  LimitKeys.maxGroupDmsPerUser: LimitScope.user,
  LimitKeys.maxGuildChannels: LimitScope.guild,
  LimitKeys.maxGuildEmojis: LimitScope.guild,
  LimitKeys.maxGuildEmojisAnimatedMore: LimitScope.guild,
  LimitKeys.maxGuildEmojisAnimated: LimitScope.guild,
  LimitKeys.maxGuildEmojisStaticMore: LimitScope.guild,
  LimitKeys.maxGuildEmojisStatic: LimitScope.guild,
  LimitKeys.maxGuildInvites: LimitScope.guild,
  LimitKeys.maxGuildMembers: LimitScope.guild,
  LimitKeys.maxGuildRoles: LimitScope.guild,
  LimitKeys.maxGuildStickersMore: LimitScope.guild,
  LimitKeys.maxGuildStickers: LimitScope.guild,
  LimitKeys.maxGuilds: LimitScope.user,
  LimitKeys.maxInstalledPacks: LimitScope.user,
  LimitKeys.maxAttachmentFileSize: LimitScope.both,
  LimitKeys.maxMessageLength: LimitScope.both,
  LimitKeys.maxPackExpressions: LimitScope.guild,
  LimitKeys.maxPrivateChannelsPerUser: LimitScope.user,
  LimitKeys.maxReactionsPerMessage: LimitScope.guild,
  LimitKeys.maxRelationships: LimitScope.user,
  LimitKeys.maxUsersPerMessageReaction: LimitScope.guild,
  LimitKeys.maxVoiceMessageDuration: LimitScope.both,
  LimitKeys.maxWebhooksPerChannel: LimitScope.guild,
  LimitKeys.maxWebhooksPerGuild: LimitScope.guild,
  LimitKeys.stickerMaxSize: LimitScope.guild,
};

const List<String> kAllLimitKeys = <String>[
  LimitKeys.avatarMaxSize,
  LimitKeys.emojiMaxSize,
  LimitKeys.featureAnimatedAvatar,
  LimitKeys.featureAnimatedBanner,
  LimitKeys.featureCustomDiscriminator,
  LimitKeys.featureCustomNotificationSounds,
  LimitKeys.featureEarlyAccess,
  LimitKeys.featureGlobalExpressions,
  LimitKeys.featureHigherVideoQuality,
  LimitKeys.featurePerGuildProfiles,
  LimitKeys.featureVoiceEntranceSounds,
  LimitKeys.maxAttachmentsPerMessage,
  LimitKeys.maxAttachmentFileSize,
  LimitKeys.maxBioLength,
  LimitKeys.maxBookmarks,
  LimitKeys.maxChannelsPerCategory,
  LimitKeys.maxCreatedPacks,
  LimitKeys.maxCustomBackgrounds,
  LimitKeys.maxEmbedsPerMessage,
  LimitKeys.maxFavoriteMemeTags,
  LimitKeys.maxFavoriteMemes,
  LimitKeys.maxGroupDmRecipients,
  LimitKeys.maxGroupDmsPerUser,
  LimitKeys.maxGuildChannels,
  LimitKeys.maxGuildEmojis,
  LimitKeys.maxGuildEmojisAnimatedMore,
  LimitKeys.maxGuildEmojisAnimated,
  LimitKeys.maxGuildEmojisStaticMore,
  LimitKeys.maxGuildEmojisStatic,
  LimitKeys.maxGuildInvites,
  LimitKeys.maxGuildMembers,
  LimitKeys.maxGuildRoles,
  LimitKeys.maxGuildStickersMore,
  LimitKeys.maxGuildStickers,
  LimitKeys.maxGuilds,
  LimitKeys.maxInstalledPacks,
  LimitKeys.maxMessageLength,
  LimitKeys.maxPackExpressions,
  LimitKeys.maxPrivateChannelsPerUser,
  LimitKeys.maxReactionsPerMessage,
  LimitKeys.maxRelationships,
  LimitKeys.maxUsersPerMessageReaction,
  LimitKeys.maxVoiceMessageDuration,
  LimitKeys.maxWebhooksPerChannel,
  LimitKeys.maxWebhooksPerGuild,
  LimitKeys.stickerMaxSize,
];
