import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/utils/group_dm_display_name.dart';
import 'package:fluxer_dart/export.dart';
import '../../../helpers/test_l10n.dart';

void main() {
  final FluxerLocalizations l10n = testL10n;

  DmConversation groupDm({
    String? name,
    List<GroupMemberInfo> groupMembers = const <GroupMemberInfo>[],
    Map<String, String> channelNicks = const <String, String>{},
  }) {
    return DmConversation(
      id: '100',
      type: 3,
      recipientId: '200',
      recipientName: 'Ignored',
      name: name,
      lastMessage: '',
      lastMessageTime: DateTime(2020),
      groupMembers: groupMembers,
      channelNicks: channelNicks,
    );
  }

  group('resolveGroupDmDisplayName', () {
    test('uses custom name when set', () {
      expect(
        resolveGroupDmDisplayName(
          dm: groupDm(name: 'My Squad'),
          l10n: l10n,
        ),
        'My Squad',
      );
    });

    test('uses single other participant name', () {
      expect(
        resolveGroupDmDisplayName(
          dm: groupDm(
            groupMembers: const <GroupMemberInfo>[
              GroupMemberInfo(id: '2', name: 'Alice'),
            ],
          ),
          l10n: l10n,
          currentUserId: '1',
        ),
        'Alice',
      );
    });

    test('joins 2-4 participant names sorted by id descending', () {
      expect(
        resolveGroupDmDisplayName(
          dm: groupDm(
            groupMembers: const <GroupMemberInfo>[
              GroupMemberInfo(id: '10', name: 'Alpha'),
              GroupMemberInfo(id: '20', name: 'Beta'),
              GroupMemberInfo(id: '5', name: 'Gamma'),
            ],
          ),
          l10n: l10n,
          currentUserId: '1',
        ),
        'Beta, Alpha, Gamma',
      );
    });

    test('falls back to unnamed group for 5+ other participants', () {
      expect(
        resolveGroupDmDisplayName(
          dm: groupDm(
            groupMembers: List<GroupMemberInfo>.generate(
              5,
              (int index) => GroupMemberInfo(id: '$index', name: 'User $index'),
            ),
          ),
          l10n: l10n,
          currentUserId: 'self',
        ),
        'Unnamed group',
      );
    });

    test('prefers channel nick over member name', () {
      expect(
        resolveGroupDmDisplayName(
          dm: groupDm(
            groupMembers: const <GroupMemberInfo>[
              GroupMemberInfo(id: '2', name: 'Alice'),
            ],
            channelNicks: const <String, String>{'2': 'Ace'},
          ),
          l10n: l10n,
          currentUserId: '1',
        ),
        'Ace',
      );
    });

    test('uses owner group label when no other participants', () {
      expect(
        resolveGroupDmDisplayName(
          dm: groupDm(),
          l10n: l10n,
          currentUserId: '1',
          currentUserDisplayName: 'Alice',
        ),
        "Alice's group",
      );
    });

    test('uses unnamed group when member data is missing', () {
      expect(
        resolveGroupDmDisplayName(
          dm: groupDm(
            groupMembers: const <GroupMemberInfo>[
              GroupMemberInfo(id: '2', name: ''),
            ],
          ),
          l10n: l10n,
          currentUserId: '1',
        ),
        'Unnamed group',
      );
    });
  });

  group('resolveGroupDmInviteDisplayName', () {
    ChannelPartialResponse channel({
      String? name,
      List<ChannelPartialResponseRecipients>? recipients,
    }) {
      return ChannelPartialResponse(
        id: '100',
        type: 3,
        name: name,
        recipients: recipients,
      );
    }

    test('uses channel name when set', () {
      expect(
        resolveGroupDmInviteDisplayName(
          channel: channel(name: 'Weekend Crew'),
          l10n: l10n,
        ),
        'Weekend Crew',
      );
    });

    test('joins recipient usernames when name is empty', () {
      expect(
        resolveGroupDmInviteDisplayName(
          channel: channel(
            recipients: const <ChannelPartialResponseRecipients>[
              ChannelPartialResponseRecipients(username: 'alice'),
              ChannelPartialResponseRecipients(username: 'bob'),
            ],
          ),
          l10n: l10n,
        ),
        'alice, bob',
      );
    });

    test('falls back to unnamed group', () {
      expect(
        resolveGroupDmInviteDisplayName(channel: channel(), l10n: l10n),
        'Unnamed group',
      );
    });
  });

  group('resolveGroupDmInviteMemberCount', () {
    test('uses invite count when local channel is missing', () {
      expect(resolveGroupDmInviteMemberCount(inviteMemberCount: 4), 4);
    });

    test('counts local group members plus current user', () {
      expect(
        resolveGroupDmInviteMemberCount(
          inviteMemberCount: 2,
          localChannel: groupDm(
            groupMembers: const <GroupMemberInfo>[
              GroupMemberInfo(id: '2', name: 'Alice'),
              GroupMemberInfo(id: '3', name: 'Bob'),
            ],
          ),
          currentUserId: '1',
        ),
        3,
      );
    });
  });
}
