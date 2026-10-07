import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

class ForumSettingsForm {
  const ForumSettingsForm({
    required this.name,
    required this.topic,
    required this.rateLimitPerUser,
    required this.defaultThreadRateLimitPerUser,
    required this.defaultAutoArchiveDuration,
    required this.reactionEmojiId,
    required this.reactionEmojiName,
    required this.sortOrder,
    required this.layout,
    required this.tagMatch,
    required this.requireTag,
    required this.hideMediaDownloads,
    required this.nsfwOverride,
    required this.contentWarningLevel,
    required this.contentWarningText,
  });

  factory ForumSettingsForm.fromChannel(Channel forum) {
    final DefaultReactionEmojiResponse? reaction = forumDefaultReaction(forum);
    return ForumSettingsForm(
      name: forum.name,
      topic: forum.topic ?? '',
      rateLimitPerUser: forum.rateLimitPerUser,
      defaultThreadRateLimitPerUser: forum.defaultThreadRateLimitPerUser ?? 0,
      defaultAutoArchiveDuration: forum.defaultAutoArchiveDuration,
      reactionEmojiId: reaction?.emojiId,
      reactionEmojiName: reaction?.emojiName,
      sortOrder: forum.defaultSortOrder,
      layout: forum.defaultForumLayout,
      tagMatch: forum.defaultTagSetting,
      requireTag: forumRequiresTag(forum),
      hideMediaDownloads: forumHidesMediaDownloads(forum),
      nsfwOverride: forum.nsfwOverride,
      contentWarningLevel: forum.contentWarningLevel,
      contentWarningText: forum.contentWarningText ?? '',
    );
  }

  final String name;
  final String topic;
  final int rateLimitPerUser;
  final int defaultThreadRateLimitPerUser;
  final int? defaultAutoArchiveDuration;
  final String? reactionEmojiId;
  final String? reactionEmojiName;
  final int? sortOrder;
  final int? layout;
  final String? tagMatch;
  final bool requireTag;
  final bool hideMediaDownloads;
  final bool? nsfwOverride;
  final int contentWarningLevel;
  final String contentWarningText;

  static const Object _unset = Object();

  ForumSettingsForm copyWith({
    String? name,
    String? topic,
    int? rateLimitPerUser,
    int? defaultThreadRateLimitPerUser,
    Object? defaultAutoArchiveDuration = _unset,
    Object? reactionEmojiId = _unset,
    Object? reactionEmojiName = _unset,
    Object? sortOrder = _unset,
    Object? layout = _unset,
    Object? tagMatch = _unset,
    bool? requireTag,
    bool? hideMediaDownloads,
    Object? nsfwOverride = _unset,
    int? contentWarningLevel,
    String? contentWarningText,
  }) => ForumSettingsForm(
    name: name ?? this.name,
    topic: topic ?? this.topic,
    rateLimitPerUser: rateLimitPerUser ?? this.rateLimitPerUser,
    defaultThreadRateLimitPerUser:
        defaultThreadRateLimitPerUser ?? this.defaultThreadRateLimitPerUser,
    defaultAutoArchiveDuration: identical(defaultAutoArchiveDuration, _unset)
        ? this.defaultAutoArchiveDuration
        : defaultAutoArchiveDuration as int?,
    reactionEmojiId: identical(reactionEmojiId, _unset)
        ? this.reactionEmojiId
        : reactionEmojiId as String?,
    reactionEmojiName: identical(reactionEmojiName, _unset)
        ? this.reactionEmojiName
        : reactionEmojiName as String?,
    sortOrder: identical(sortOrder, _unset)
        ? this.sortOrder
        : sortOrder as int?,
    layout: identical(layout, _unset) ? this.layout : layout as int?,
    tagMatch: identical(tagMatch, _unset) ? this.tagMatch : tagMatch as String?,
    requireTag: requireTag ?? this.requireTag,
    hideMediaDownloads: hideMediaDownloads ?? this.hideMediaDownloads,
    nsfwOverride: identical(nsfwOverride, _unset)
        ? this.nsfwOverride
        : nsfwOverride as bool?,
    contentWarningLevel: contentWarningLevel ?? this.contentWarningLevel,
    contentWarningText: contentWarningText ?? this.contentWarningText,
  );
}

Map<String, Object?> buildForumSettingsPatch({
  required Channel forum,
  required ForumSettingsForm original,
  required ForumSettingsForm current,
}) {
  final Map<String, Object?> patch = <String, Object?>{};
  if (current.name != original.name) {
    patch['name'] = current.name.trim();
  }
  if (current.topic != original.topic) {
    patch['topic'] = current.topic.trim().isEmpty ? null : current.topic;
  }
  if (current.rateLimitPerUser != original.rateLimitPerUser) {
    patch['rate_limit_per_user'] = current.rateLimitPerUser;
  }
  if (current.defaultThreadRateLimitPerUser !=
      original.defaultThreadRateLimitPerUser) {
    patch['default_thread_rate_limit_per_user'] =
        current.defaultThreadRateLimitPerUser;
  }
  if (current.defaultAutoArchiveDuration !=
      original.defaultAutoArchiveDuration) {
    patch['default_auto_archive_duration'] = current.defaultAutoArchiveDuration;
  }
  if (current.reactionEmojiId != original.reactionEmojiId ||
      current.reactionEmojiName != original.reactionEmojiName) {
    patch['default_reaction_emoji'] =
        current.reactionEmojiId == null && current.reactionEmojiName == null
        ? null
        : <String, Object?>{
            'emoji_id': current.reactionEmojiId,
            'emoji_name': current.reactionEmojiId == null
                ? current.reactionEmojiName
                : null,
          };
  }
  if (current.sortOrder != original.sortOrder) {
    patch['default_sort_order'] = current.sortOrder;
  }
  if (!isMediaChannel(forum) && current.layout != original.layout) {
    patch['default_forum_layout'] = current.layout ?? 0;
  }
  if (current.tagMatch != original.tagMatch) {
    patch['default_tag_setting'] = current.tagMatch;
  }
  if (current.requireTag != original.requireTag ||
      current.hideMediaDownloads != original.hideMediaDownloads) {
    int flags = forum.flags ?? 0;
    flags = current.requireTag
        ? flags | channelFlagRequireTag
        : flags & ~channelFlagRequireTag;
    if (isMediaChannel(forum)) {
      flags = current.hideMediaDownloads
          ? flags | channelFlagHideMediaDownloadOptions
          : flags & ~channelFlagHideMediaDownloadOptions;
    }
    patch['flags'] = flags;
  }
  if (current.nsfwOverride != original.nsfwOverride) {
    patch['nsfw_override'] = current.nsfwOverride;
  }
  if (current.contentWarningLevel != original.contentWarningLevel) {
    patch['content_warning_level'] = current.contentWarningLevel;
  }
  if (current.contentWarningText != original.contentWarningText) {
    patch['content_warning_text'] = current.contentWarningText.trim().isEmpty
        ? null
        : current.contentWarningText;
  }
  return patch;
}
