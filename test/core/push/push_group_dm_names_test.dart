import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/push/notification/group_dm_names.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

DmConversation _conversation({
  required String id,
  required int type,
  String? name,
  List<GroupMemberInfo> members = const <GroupMemberInfo>[],
}) {
  return DmConversation(
    id: id,
    type: type,
    recipientId: 'u2',
    recipientName: 'alice',
    lastMessage: '',
    lastMessageTime: DateTime(2026),
    name: name,
    groupMembers: members,
  );
}

void main() {
  final FluxerLocalizations l10n = lookupFluxerLocalizations(
    const Locale('en'),
  );

  test('names group dms the way the app does and skips 1:1 dms', () {
    expect(
      resolvePushGroupDmNames(
        <DmConversation>[
          _conversation(id: 'g1', type: 3, name: 'Weekend plans'),
          _conversation(
            id: 'g2',
            type: 3,
            members: const <GroupMemberInfo>[
              GroupMemberInfo(id: 'u1', name: 'me'),
              GroupMemberInfo(id: 'u2', name: 'alice'),
            ],
          ),
          _conversation(id: 'd1', type: 1),
        ],
        l10n: l10n,
        currentUserId: 'u1',
      ),
      <String, String>{'g1': 'Weekend plans', 'g2': 'alice'},
    );
  });

  test('writes only when the names or the account change', () {
    final List<(String, Map<String, String>)> writes =
        <(String, Map<String, String>)>[];
    final PushGroupDmNamesMirror mirror = PushGroupDmNamesMirror((
      String userId,
      Map<String, String> names,
    ) async {
      writes.add((userId, names));
    });
    final List<DmConversation> groups = <DmConversation>[
      _conversation(id: 'g1', type: 3, name: 'Weekend plans'),
    ];
    mirror
      ..sync(userId: 'u1', conversations: groups, l10n: l10n)
      ..sync(userId: 'u1', conversations: groups, l10n: l10n)
      ..sync(userId: null, conversations: groups, l10n: l10n)
      ..sync(userId: 'u3', conversations: groups, l10n: l10n);
    expect(
      writes.map(((String, Map<String, String>) write) => write.$1),
      <String>['u1', 'u3'],
    );
  });
}
