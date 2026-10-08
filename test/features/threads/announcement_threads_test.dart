import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_spec.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/forward_destinations_provider.dart';
import 'package:fluxer_app/features/chat/utils/messages/message_action_permissions.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const Channel _announcement = Channel(
  id: '100',
  guildId: 'g1',
  name: 'news',
  type: ChannelType.guildAnnouncement,
);

const Channel _text = Channel(id: '200', guildId: 'g1', name: 'general');

const Channel _announcementThread = Channel(
  id: '300',
  guildId: 'g1',
  name: 'launch',
  type: ChannelType.announcementThread,
  parentId: '100',
);

final int _everyone =
    Permission.viewChannel.value |
    Permission.sendMessages.value |
    Permission.readMessageHistory.value;

Message _message(String channelId) => Message(
  id: '400',
  channelId: channelId,
  authorId: '1',
  authorName: 'author',
  content: 'hello',
  timestamp: DateTime.utc(2026, 10, 3),
);

void main() {
  test('announcement threads are public thread types of type 10', () {
    expect(ChannelType.fromWire(10), ChannelType.announcementThread);
    expect(isThreadChannelType(10), isTrue);
    expect(isThreadFeatureChannelType(10), isTrue);
    expect(_announcementThread.isThread, isTrue);
    expect(isPublicThreadChannelType(ChannelType.announcementThread), isTrue);
    expect(isPublicThreadChannelType(ChannelType.privateThread), isFalse);
  });

  test('announcement channels create announcement threads', () {
    expect(isTextThreadParentType(ChannelType.guildAnnouncement), isTrue);
    expect(isTextThreadParentType(ChannelType.guildForum), isFalse);
    expect(
      publicThreadTypeFor(ChannelType.guildAnnouncement),
      ChannelType.announcementThread,
    );
    expect(
      publicThreadTypeFor(ChannelType.guildText),
      ChannelType.publicThread,
    );
  });

  test('announcement channels never offer private threads', () {
    expect(allowsPrivateThreads(_announcement), isFalse);
    expect(allowsPrivateThreads(_text), isTrue);
    final ThreadActor privateOnly = ThreadActor(
      permissions: _everyone | Permission.createPrivateThreads.value,
    );
    expect(canStartThreadIn(_text, privateOnly), isTrue);
    expect(canStartThreadIn(_announcement, privateOnly), isFalse);
    final ThreadActor publicOnly = ThreadActor(
      permissions: _everyone | Permission.createPublicThreads.value,
    );
    expect(canStartThreadIn(_announcement, publicOnly), isTrue);
    expect(canStartThreadIn(_announcementThread, publicOnly), isFalse);
  });

  test('threads start from messages in announcement channels', () {
    final ThreadActor actor = ThreadActor(
      permissions: _everyone | Permission.createPublicThreads.value,
    );
    expect(
      canStartThreadFromMessage(
        parent: _announcement,
        message: _message(_announcement.id),
        actor: actor,
      ),
      isTrue,
    );
    expect(
      canStartThreadFromMessage(
        parent: _announcementThread,
        message: _message(_announcementThread.id),
        actor: actor,
      ),
      isFalse,
    );
  });

  test('messages inside announcement threads are never publishable', () {
    bool publishable(ChannelType type) => canPublishMessage(
      message: _message('1'),
      channelType: type,
      isOwnMessage: true,
      canSendMessages: true,
      canManageMessages: true,
      isDmChannel: false,
      isSendDisabled: false,
    );
    expect(publishable(ChannelType.guildAnnouncement), isTrue);
    expect(publishable(ChannelType.announcementThread), isFalse);
  });

  test('announcement threads forward like public threads', () {
    expect(isForwardableThread(_announcementThread, joined: false), isTrue);
    expect(
      isForwardableThread(
        const Channel(
          id: '1',
          guildId: 'g1',
          name: 'secret',
          type: ChannelType.privateThread,
        ),
        joined: false,
      ),
      isFalse,
    );
  });

  test('announcement threads group under their parent in the sidebar', () {
    final Map<String, List<Channel>> grouped = groupSidebarThreads(
      activeThreads: const <Channel>[_announcementThread],
      joinedIds: const <String>{'300'},
      selected: null,
    );
    expect(grouped['100']?.single.id, '300');
  });

  test('announcement permission rows omit private thread creation', () {
    final FluxerLocalizations l10n = lookupFluxerLocalizations(
      const Locale('en'),
    );
    Set<Permission> flags(ChannelType type, {required bool threads}) =>
        <Permission>{
          for (final category in generateChannelPermissionSpec(
            l10n,
            type,
            threads: threads,
          ))
            for (final entry in category.permissions) entry.flag,
        };
    final Set<Permission> announcement = flags(
      ChannelType.guildAnnouncement,
      threads: true,
    );
    expect(announcement, contains(Permission.createPublicThreads));
    expect(announcement, contains(Permission.sendMessagesInThreads));
    expect(announcement, contains(Permission.manageThreads));
    expect(announcement, isNot(contains(Permission.createPrivateThreads)));
    expect(
      flags(ChannelType.guildText, threads: true),
      contains(Permission.createPrivateThreads),
    );
    expect(
      flags(ChannelType.guildAnnouncement, threads: false),
      isNot(contains(Permission.createPublicThreads)),
    );
  });
}
