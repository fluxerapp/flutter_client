import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';

const int kMaxMessageLengthNonPremium = 2000;
const int kMaxMessageLengthPremium = 4000;
const int kMaxGuildsNonPremium = 100;
const int kMaxGuildsPremium = 200;
const int kMaxBookmarksNonPremium = 50;
const int kMaxBookmarksPremium = 300;
const int kMaxFavoriteMemesNonPremium = 50;
const int kMaxFavoriteMemesPremium = 500;
const int kAvatarMaxSizeBytes = 10 * 1024 * 1024;
const int kEmojiMaxSizeBytes = 512 * 1024;
const int kStickerMaxSizeBytes = 512 * 1024;
const int kMaxGuildEmojisDefault = 500;
const int kMaxGuildStickersDefault = 50;

const Map<String, int> kDefaultFreeLimits = <String, int>{
  LimitKeys.avatarMaxSize: kAvatarMaxSizeBytes,
  LimitKeys.emojiMaxSize: kEmojiMaxSizeBytes,
  LimitKeys.featureAnimatedAvatar: 0,
  LimitKeys.featureAnimatedBanner: 0,
  LimitKeys.featureCustomDiscriminator: 0,
  LimitKeys.featureCustomNotificationSounds: 1,
  LimitKeys.featureEarlyAccess: 0,
  LimitKeys.featureGlobalExpressions: 0,
  LimitKeys.featureHigherVideoQuality: 0,
  LimitKeys.featurePerGuildProfiles: 0,
  LimitKeys.featureVoiceEntranceSounds: 0,
  LimitKeys.maxAttachmentFileSize: kNonPremiumMaxAttachmentBytes,
  LimitKeys.maxAttachmentsPerMessage: kMaxAttachmentsPerMessage,
  LimitKeys.maxBioLength: 320,
  LimitKeys.maxBookmarks: kMaxBookmarksNonPremium,
  LimitKeys.maxChannelsPerCategory: 50,
  LimitKeys.maxCreatedPacks: 0,
  LimitKeys.maxCustomBackgrounds: 1,
  LimitKeys.maxEmbedsPerMessage: 10,
  LimitKeys.maxFavoriteMemeTags: 10,
  LimitKeys.maxFavoriteMemes: kMaxFavoriteMemesNonPremium,
  LimitKeys.maxGroupDmRecipients: 49,
  LimitKeys.maxGroupDmsPerUser: 150,
  LimitKeys.maxGuildChannels: 500,
  LimitKeys.maxGuildEmojis: kMaxGuildEmojisDefault,
  LimitKeys.maxGuildEmojisAnimatedMore: 250,
  LimitKeys.maxGuildEmojisAnimated: 50,
  LimitKeys.maxGuildEmojisStaticMore: 250,
  LimitKeys.maxGuildEmojisStatic: 50,
  LimitKeys.maxGuildInvites: 1000,
  LimitKeys.maxGuildMembers: 1000000,
  LimitKeys.maxGuildRoles: 250,
  LimitKeys.maxGuildStickersMore: 250,
  LimitKeys.maxGuildStickers: kMaxGuildStickersDefault,
  LimitKeys.maxGuilds: kMaxGuildsNonPremium,
  LimitKeys.maxInstalledPacks: 0,
  LimitKeys.maxMessageLength: kMaxMessageLengthNonPremium,
  LimitKeys.maxPackExpressions: 200,
  LimitKeys.maxPrivateChannelsPerUser: 250,
  LimitKeys.maxReactionsPerMessage: 30,
  LimitKeys.maxRelationships: 1000,
  LimitKeys.maxUsersPerMessageReaction: 1000000,
  LimitKeys.maxVoiceMessageDuration: 1200,
  LimitKeys.maxWebhooksPerChannel: 15,
  LimitKeys.maxWebhooksPerGuild: 1000,
  LimitKeys.stickerMaxSize: kStickerMaxSizeBytes,
};
