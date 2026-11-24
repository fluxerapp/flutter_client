import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_spec.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';

import '../../../helpers/test_l10n.dart';

List<GuildPermissionEntry> _entries(
  ChannelType channelType, {
  required bool threads,
}) => <GuildPermissionEntry>[
  for (final GuildPermissionCategorySpec category
      in generateChannelPermissionSpec(testL10n, channelType, threads: threads))
    ...category.permissions,
];

(String, String?) _label(ChannelType channelType, Permission permission) {
  final GuildPermissionEntry entry = _entries(
    channelType,
    threads: true,
  ).singleWhere((GuildPermissionEntry e) => e.flag == permission);
  return (entry.title, entry.description);
}

List<String> _messagesCategoryTitles(
  ChannelType channelType, {
  required bool threads,
}) => generateChannelPermissionSpec(testL10n, channelType, threads: threads)
    .singleWhere(
      (GuildPermissionCategorySpec c) => c.title == 'Messages & media',
    )
    .permissions
    .map((GuildPermissionEntry e) => e.title)
    .toList();

void main() {
  group('generateChannelPermissionSpec', () {
    test('forum channel labels send messages as Create posts', () {
      expect(_label(ChannelType.guildForum, Permission.sendMessages), (
        'Create posts',
        'Allows members to create posts in this channel.',
      ));
    });

    test(
      'forum channel labels send messages in threads as Send messages in posts',
      () {
        expect(
          _label(ChannelType.guildForum, Permission.sendMessagesInThreads),
          (
            'Send messages in posts',
            'Allows members to send messages in posts.',
          ),
        );
      },
    );

    test('forum channel labels manage threads as Manage posts', () {
      expect(_label(ChannelType.guildForum, Permission.manageThreads), (
        'Manage posts',
        'Allows members to rename, close, lock, pin and delete posts, '
            'and to edit their tags.',
      ));
    });

    test('forum channel lists no thread creation permissions', () {
      expect(
        _entries(
          ChannelType.guildForum,
          threads: true,
        ).map((GuildPermissionEntry e) => e.flag),
        isNot(
          anyOf(
            contains(Permission.createPublicThreads),
            contains(Permission.createPrivateThreads),
          ),
        ),
      );
    });

    test('forum channel lists post permissions first in messages', () {
      expect(
        _messagesCategoryTitles(ChannelType.guildForum, threads: true),
        <String>[
          'Create posts',
          'Send messages in posts',
          'Manage posts',
          'Manage messages',
          'Pin messages',
          'Embed links',
          'Attach files',
          'Read message history',
          'Use @everyone/@here and @role',
          'Use external emoji',
          'Use external stickers',
          'Add reactions',
          'Bypass slowmode',
        ],
      );
    });

    test('media channel uses the forum post permission rows', () {
      expect(
        _messagesCategoryTitles(ChannelType.guildMedia, threads: true),
        <String>[
          'Create posts',
          'Send messages in posts',
          'Manage posts',
          'Manage messages',
          'Pin messages',
          'Embed links',
          'Attach files',
          'Read message history',
          'Use @everyone/@here and @role',
          'Use external emoji',
          'Use external stickers',
          'Add reactions',
          'Bypass slowmode',
        ],
      );
    });

    test('text channel keeps the generic message permission rows', () {
      expect(
        _messagesCategoryTitles(ChannelType.guildText, threads: true),
        <String>[
          'Send messages',
          'Manage messages',
          'Pin messages',
          'Embed links',
          'Attach files',
          'Read message history',
          'Use @everyone/@here and @role',
          'Use external emoji',
          'Use external stickers',
          'Add reactions',
          'Bypass slowmode',
          'Create public threads',
          'Create private threads',
          'Send messages in threads',
          'Manage threads',
        ],
      );
    });

    test(
      'forum channel without active threads lists the generic text rows',
      () {
        expect(
          _messagesCategoryTitles(ChannelType.guildForum, threads: false),
          <String>[
            'Send messages',
            'Manage messages',
            'Pin messages',
            'Embed links',
            'Attach files',
            'Read message history',
            'Use @everyone/@here and @role',
            'Use external emoji',
            'Use external stickers',
            'Add reactions',
            'Bypass slowmode',
          ],
        );
      },
    );

    test('text channel without active threads lists no thread permissions', () {
      expect(
        _entries(
          ChannelType.guildText,
          threads: false,
        ).map((GuildPermissionEntry e) => e.flag),
        isNot(
          anyOf(
            contains(Permission.createPublicThreads),
            contains(Permission.createPrivateThreads),
            contains(Permission.sendMessagesInThreads),
            contains(Permission.manageThreads),
          ),
        ),
      );
    });
  });
}
