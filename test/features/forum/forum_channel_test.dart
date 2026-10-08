import 'dart:convert';

import 'package:flutter/widgets.dart' show Locale;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/domain/forum_settings.dart';
import 'package:fluxer_app/features/forum/presentation/sheets/forum_post_composer_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Channel _forum({
  ChannelType type = ChannelType.guildForum,
  int? flags,
  String? tagsJson,
  String? reactionJson,
  int? sortOrder,
  int? layout,
}) => Channel(
  id: '100',
  guildId: 'g1',
  name: 'forum',
  type: type,
  flags: flags,
  availableTagsJson: tagsJson,
  defaultReactionEmojiJson: reactionJson,
  defaultSortOrder: sortOrder,
  defaultForumLayout: layout,
);

Channel _post(
  String id, {
  String parentId = '100',
  List<String> tags = const <String>[],
  bool archived = false,
  int? flags,
  String? ownerId,
}) => Channel(
  id: id,
  guildId: 'g1',
  name: 'post $id',
  type: ChannelType.publicThread,
  parentId: parentId,
  appliedTagsJson: jsonEncode(tags),
  threadArchived: archived,
  flags: flags,
  ownerId: ownerId,
);

void main() {
  group('forum fields', () {
    test('tags, reaction and flags decode from the stored columns', () {
      final Channel forum = _forum(
        flags: channelFlagRequireTag,
        tagsJson: jsonEncode(<Map<String, Object?>>[
          <String, Object?>{
            'id': '1',
            'name': 'bug',
            'moderated': false,
            'emoji_id': null,
            'emoji_name': '🐛',
          },
          <String, Object?>{
            'id': '2',
            'name': 'staff',
            'moderated': true,
            'emoji_id': '55',
            'emoji_name': null,
          },
        ]),
        reactionJson: jsonEncode(<String, Object?>{
          'emoji_id': '77',
          'emoji_name': 'yes',
        }),
      );
      expect(forumAvailableTags(forum).map((tag) => tag.name), <String>[
        'bug',
        'staff',
      ]);
      expect(
        resolveForumTags(forumAvailableTags(forum), <String>[
          '2',
          'gone',
        ]).map((tag) => tag.id),
        <String>['2'],
      );
      expect(forumDefaultReaction(forum)?.emojiId, '77');
      expect(forumRequiresTag(forum), isTrue);
      expect(forumHidesMediaDownloads(forum), isFalse);
      expect(forumAvailableTags(_forum(tagsJson: 'not json')), isEmpty);
      expect(
        forumDefaultReaction(
          _forum(reactionJson: jsonEncode(<String, Object?>{})),
        ),
        isNull,
      );
    });

    test('media channels default to the gallery and own the hide flag', () {
      final Channel media = _forum(
        type: ChannelType.guildMedia,
        flags: channelFlagHideMediaDownloadOptions,
        layout: ForumLayout.list.wireValue,
      );
      expect(forumDefaultLayout(media), ForumLayout.gallery);
      expect(forumHidesMediaDownloads(media), isTrue);
      expect(
        forumHidesMediaDownloads(
          _forum(flags: channelFlagHideMediaDownloadOptions),
        ),
        isFalse,
      );
      expect(
        forumDefaultLayout(_forum(layout: ForumLayout.gallery.wireValue)),
        ForumLayout.gallery,
      );
      expect(forumDefaultLayout(_forum()), ForumLayout.list);
      expect(
        forumDefaultSortOrder(_forum(sortOrder: 1)),
        ForumSortOrder.creationTime,
      );
    });

    test('reaction keys use name:id for custom emoji', () {
      expect(forumReactionKey(emojiId: '9', emojiName: 'party'), 'party:9');
      expect(forumReactionKey(emojiId: '9', emojiName: null), 'emoji:9');
      expect(forumReactionKey(emojiId: null, emojiName: '👍'), '👍');
    });

    test('custom reaction keys resolve a missing emoji name', () {
      expect(
        forumReactionKey(emojiId: '9', emojiName: null, reactedName: 'party'),
        'party:9',
      );
      expect(
        forumReactionKey(emojiId: '9', emojiName: '', storedName: 'blob'),
        'blob:9',
      );
      expect(
        forumReactionKey(
          emojiId: '9',
          emojiName: 'stale',
          reactedName: 'party',
          storedName: 'blob',
        ),
        'party:9',
      );
    });
  });

  group('post list', () {
    test('pins, sorts active posts and keeps archived posts apart', () {
      final ForumPostList list = buildForumPostList(
        forumId: '100',
        active: <Channel>[
          _post('10'),
          _post('11', flags: channelFlagPinned),
          _post('12'),
          _post('13', parentId: '999'),
        ],
        extra: <Channel>[_post('5', archived: true), _post('12')],
        sortOrder: ForumSortOrder.latestActivity,
        tagIds: const <String>[],
        tagMatch: ForumTagMatch.some,
        lastMessageIds: const <String, String?>{'10': '50'},
      );
      expect(list.pinned?.id, '11');
      expect(list.active.map((post) => post.id), <String>['10', '12']);
      expect(list.archived.map((post) => post.id), <String>['5']);
    });

    test('creation time ignores activity', () {
      final ForumPostList list = buildForumPostList(
        forumId: '100',
        active: <Channel>[_post('10'), _post('12')],
        extra: const <Channel>[],
        sortOrder: ForumSortOrder.creationTime,
        tagIds: const <String>[],
        tagMatch: ForumTagMatch.some,
        lastMessageIds: const <String, String?>{'10': '50'},
      );
      expect(list.active.map((post) => post.id), <String>['12', '10']);
    });

    test('tag filters match some or all', () {
      final List<Channel> posts = <Channel>[
        _post('10', tags: <String>['a']),
        _post('11', tags: <String>['a', 'b']),
        _post('12'),
      ];
      List<String> ids(ForumTagMatch match) => buildForumPostList(
        forumId: '100',
        active: posts,
        extra: const <Channel>[],
        sortOrder: ForumSortOrder.creationTime,
        tagIds: const <String>['a', 'b'],
        tagMatch: match,
      ).active.map((post) => post.id).toList();
      expect(ids(ForumTagMatch.some), <String>['11', '10']);
      expect(ids(ForumTagMatch.all), <String>['11']);
    });

    test('new posts are newer than the snapshot and not our own', () {
      expect(
        isNewForumPost(
          post: _post('20'),
          snapshotAckId: '10',
          currentUserId: 'me',
        ),
        isTrue,
      );
      expect(
        isNewForumPost(
          post: _post('20', ownerId: 'me'),
          snapshotAckId: '10',
          currentUserId: 'me',
        ),
        isFalse,
      );
      expect(
        isNewForumPost(
          post: _post('5'),
          snapshotAckId: '10',
          currentUserId: 'me',
        ),
        isFalse,
      );
      expect(
        isNewForumPost(
          post: _post('20'),
          snapshotAckId: null,
          currentUserId: 'me',
        ),
        isFalse,
      );
    });
  });

  test('search retry backs off and caps at a minute', () {
    expect(forumSearchRetryDelay(null, 0), const Duration(seconds: 1));
    expect(forumSearchRetryDelay(5, 1), const Duration(seconds: 10));
    expect(forumSearchRetryDelay(5, 5), forumSearchRetryMaxDelay);
    expect(forumSearchRetryDelay(0.2, 0), const Duration(seconds: 1));
  });

  test('new post unread flags replace each other and keep other bits', () {
    expect(forumNewPostsUnreadEnabled(null), isTrue);
    final int off = withForumNewPostsUnread(1, enabled: false);
    expect(off, 1 | channelOverrideNewForumThreadsOff);
    expect(forumNewPostsUnreadEnabled(off), isFalse);
    final int on = withForumNewPostsUnread(off, enabled: true);
    expect(on, 1 | channelOverrideNewForumThreadsOn);
    expect(forumNewPostsUnreadEnabled(on), isTrue);
  });

  group('settings patch', () {
    test('an untouched form sends nothing', () {
      final Channel forum = _forum();
      final ForumSettingsForm form = ForumSettingsForm.fromChannel(forum);
      expect(
        buildForumSettingsPatch(forum: forum, original: form, current: form),
        isEmpty,
      );
    });

    test('only changed keys are sent', () {
      final Channel forum = _forum(flags: 1 << 8);
      final ForumSettingsForm original = ForumSettingsForm.fromChannel(forum);
      final ForumSettingsForm current = original.copyWith(
        topic: '',
        requireTag: true,
        reactionEmojiId: '9',
        reactionEmojiName: 'party',
        layout: ForumLayout.gallery.wireValue,
      );
      expect(
        buildForumSettingsPatch(
          forum: forum,
          original: original.copyWith(topic: 'old'),
          current: current,
        ),
        <String, Object?>{
          'topic': null,
          'default_reaction_emoji': <String, Object?>{
            'emoji_id': '9',
            'emoji_name': null,
          },
          'default_forum_layout': 2,
          'flags': (1 << 8) | channelFlagRequireTag,
        },
      );
    });

    test('clearing the reaction sends null and media keeps its layout', () {
      final Channel media = _forum(
        type: ChannelType.guildMedia,
        reactionJson: jsonEncode(<String, Object?>{'emoji_name': '👍'}),
      );
      final ForumSettingsForm original = ForumSettingsForm.fromChannel(media);
      final ForumSettingsForm current = original.copyWith(
        reactionEmojiName: null,
        layout: ForumLayout.list.wireValue,
        hideMediaDownloads: true,
      );
      expect(
        buildForumSettingsPatch(
          forum: media,
          original: original,
          current: current,
        ),
        <String, Object?>{
          'default_reaction_emoji': null,
          'flags': channelFlagHideMediaDownloadOptions,
        },
      );
    });
  });

  test(
    'required tags that are all moderated block non-moderators with the server reason',
    () {
      final FluxerLocalizations l10n = lookupFluxerLocalizations(
        const Locale('en'),
      );
      final Channel forum = _forum(
        flags: channelFlagRequireTag,
        tagsJson: jsonEncode(<Map<String, Object?>>[
          <String, Object?>{'id': '1', 'name': 'staff', 'moderated': true},
        ]),
      );
      String? error({required bool moderator}) => forumPostDraftError(
        forum: forum,
        title: 'title',
        content: 'body',
        tags: const <String>[],
        attachmentCount: 0,
        moderator: moderator,
        l10n: l10n,
      );
      expect(error(moderator: false), l10n.threadErrorNoTagsForEveryone);
      expect(error(moderator: true), l10n.threadErrorTagRequired);
    },
  );
}
