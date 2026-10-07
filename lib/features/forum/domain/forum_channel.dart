import 'dart:convert';
import 'dart:math' as math;

import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

const int channelFlagPinned = 1 << 1;
const int channelFlagRequireTag = 1 << 4;
const int channelFlagHideMediaDownloadOptions = 1 << 15;
const int channelOverrideNewForumThreadsOff = 1 << 13;
const int channelOverrideNewForumThreadsOn = 1 << 14;
const int channelOverrideForumThreadsMask =
    channelOverrideNewForumThreadsOff | channelOverrideNewForumThreadsOn;

const int maxForumTagsPerChannel = 20;
const int maxAppliedTagsPerPost = 5;
const int forumTagNameMaxLength = 50;
const int forumTopicMaxLength = 4096;
const int forumPostNameMaxLength = 100;
const int forumSearchPageSize = 25;
const int forumPostDataMaxIds = 100;
const int forumUnreadsMaxThreads = 40;
const int forumSearchRetryMaxAttempts = 6;
const Duration forumSearchRetryMaxDelay = Duration(seconds: 60);
const Duration forumSearchDebounce = Duration(milliseconds: 300);
const Duration forumPostDataDebounce = Duration(milliseconds: 50);

enum ForumSortOrder {
  latestActivity(0),
  creationTime(1);

  const ForumSortOrder(this.wireValue);

  final int wireValue;
}

enum ForumLayout {
  list(1),
  gallery(2);

  const ForumLayout(this.wireValue);

  final int wireValue;
}

enum ForumTagMatch {
  some('match_some'),
  all('match_all');

  const ForumTagMatch(this.wireValue);

  final String wireValue;
}

bool isMediaChannel(Channel channel) => channel.type == ChannelType.guildMedia;

ForumSortOrder forumDefaultSortOrder(Channel forum) =>
    forum.defaultSortOrder == ForumSortOrder.creationTime.wireValue
    ? ForumSortOrder.creationTime
    : ForumSortOrder.latestActivity;

ForumLayout forumDefaultLayout(Channel forum) {
  if (isMediaChannel(forum)) {
    return ForumLayout.gallery;
  }
  return forum.defaultForumLayout == ForumLayout.gallery.wireValue
      ? ForumLayout.gallery
      : ForumLayout.list;
}

ForumTagMatch forumTagMatch(Channel forum) =>
    forum.defaultTagSetting == ForumTagMatch.all.wireValue
    ? ForumTagMatch.all
    : ForumTagMatch.some;

List<ForumTagResponse> forumAvailableTags(Channel forum) {
  final String? raw = forum.availableTagsJson;
  if (raw == null || raw.isEmpty) {
    return const <ForumTagResponse>[];
  }
  try {
    return <ForumTagResponse>[
      for (final Object? entry in jsonDecode(raw) as List<Object?>)
        ForumTagResponse.fromJson((entry! as Map<Object?, Object?>).cast()),
    ];
  } on Object {
    return const <ForumTagResponse>[];
  }
}

List<String> postAppliedTags(Channel post) {
  final String? raw = post.appliedTagsJson;
  if (raw == null || raw.isEmpty) {
    return const <String>[];
  }
  try {
    return <String>[
      for (final Object? id in jsonDecode(raw) as List<Object?>) '$id',
    ];
  } on Object {
    return const <String>[];
  }
}

List<ForumTagResponse> resolveForumTags(
  List<ForumTagResponse> available,
  Iterable<String> tagIds,
) {
  final Map<String, ForumTagResponse> byId = <String, ForumTagResponse>{
    for (final ForumTagResponse tag in available) tag.id: tag,
  };
  return <ForumTagResponse>[
    for (final String id in tagIds)
      if (byId[id] case final ForumTagResponse tag) tag,
  ];
}

DefaultReactionEmojiResponse? forumDefaultReaction(Channel forum) {
  final String? raw = forum.defaultReactionEmojiJson;
  if (raw == null || raw.isEmpty) {
    return null;
  }
  try {
    final DefaultReactionEmojiResponse reaction =
        DefaultReactionEmojiResponse.fromJson(
          (jsonDecode(raw) as Map<Object?, Object?>).cast(),
        );
    if (reaction.emojiId == null && (reaction.emojiName ?? '').isEmpty) {
      return null;
    }
    return reaction;
  } on Object {
    return null;
  }
}

String forumReactionKey({
  required String? emojiId,
  required String? emojiName,
  String? reactedName,
  String? storedName,
}) {
  if (emojiId != null && emojiId.isNotEmpty) {
    final String name = <String?>[reactedName, emojiName, storedName]
        .whereType<String>()
        .firstWhere((String name) => name.isNotEmpty, orElse: () => 'emoji');
    return '$name:$emojiId';
  }
  return emojiName ?? '';
}

bool _hasFlag(int? flags, int bit) => ((flags ?? 0) & bit) != 0;

bool forumRequiresTag(Channel forum) =>
    _hasFlag(forum.flags, channelFlagRequireTag);

bool forumHidesMediaDownloads(Channel forum) =>
    isMediaChannel(forum) &&
    _hasFlag(forum.flags, channelFlagHideMediaDownloadOptions);

bool isPinnedPost(Channel post) => _hasFlag(post.flags, channelFlagPinned);

bool isPostArchived(Channel post) => post.threadArchived ?? false;

String postLastActivityId(Channel post, String? lastMessageId) {
  final String? last = lastMessageId;
  if (last == null || compareSnowflakeIds(last, post.id) < 0) {
    return post.id;
  }
  return last;
}

String postSortKey(
  Channel post,
  ForumSortOrder sortOrder,
  String? lastMessageId,
) => sortOrder == ForumSortOrder.creationTime
    ? post.id
    : postLastActivityId(post, lastMessageId);

bool matchesTagFilter(
  List<String> appliedTags,
  List<String> tagIds,
  ForumTagMatch match,
) {
  if (tagIds.isEmpty) {
    return true;
  }
  return match == ForumTagMatch.all
      ? tagIds.every(appliedTags.contains)
      : tagIds.any(appliedTags.contains);
}

class ForumPostList {
  const ForumPostList({
    required this.pinned,
    required this.active,
    required this.archived,
  });

  final Channel? pinned;
  final List<Channel> active;
  final List<Channel> archived;

  bool get isEmpty => pinned == null && active.isEmpty && archived.isEmpty;
}

ForumPostList buildForumPostList({
  required String forumId,
  required Iterable<Channel> active,
  required Iterable<Channel> extra,
  required ForumSortOrder sortOrder,
  required List<String> tagIds,
  required ForumTagMatch tagMatch,
  Map<String, String?> lastMessageIds = const <String, String?>{},
}) {
  final Set<String> seen = <String>{};
  final List<Channel> activePosts = <Channel>[];
  final List<Channel> archivedPosts = <Channel>[];
  Channel? pinned;
  for (final Channel post in <Channel>[...active, ...extra]) {
    if (post.parentId != forumId || !post.isThread || !seen.add(post.id)) {
      continue;
    }
    if (!matchesTagFilter(postAppliedTags(post), tagIds, tagMatch)) {
      continue;
    }
    final bool archived = isPostArchived(post);
    if (pinned == null && !archived && isPinnedPost(post)) {
      pinned = post;
      continue;
    }
    (archived ? archivedPosts : activePosts).add(post);
  }
  activePosts.sort(
    (Channel a, Channel b) => compareSnowflakeIds(
      postSortKey(b, sortOrder, lastMessageIds[b.id]),
      postSortKey(a, sortOrder, lastMessageIds[a.id]),
    ),
  );
  return ForumPostList(
    pinned: pinned,
    active: activePosts,
    archived: archivedPosts,
  );
}

Duration forumSearchRetryDelay(num? retryAfterSeconds, int attempt) {
  final double base = math.max(1, retryAfterSeconds ?? 1) * 1000;
  final double delay = base * math.pow(2, attempt);
  return Duration(
    milliseconds: math
        .min(delay, forumSearchRetryMaxDelay.inMilliseconds)
        .round(),
  );
}

bool forumNewPostsUnreadEnabled(int? overrideFlags) =>
    !_hasFlag(overrideFlags, channelOverrideNewForumThreadsOff);

int withForumNewPostsUnread(int? overrideFlags, {required bool enabled}) =>
    ((overrideFlags ?? 0) & ~channelOverrideForumThreadsMask) |
    (enabled
        ? channelOverrideNewForumThreadsOn
        : channelOverrideNewForumThreadsOff);

bool isNewForumPost({
  required Channel post,
  required String? snapshotAckId,
  required String? currentUserId,
}) {
  if (snapshotAckId == null) {
    return false;
  }
  if (post.ownerId != null && post.ownerId == currentUserId) {
    return false;
  }
  return compareSnowflakeIds(post.id, snapshotAckId) > 0;
}
