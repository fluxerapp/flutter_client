import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/utils/group_dm_display_name.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';

void main() {
  final FluxerLocalizationsEn l10n = FluxerLocalizationsEn();

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
}
