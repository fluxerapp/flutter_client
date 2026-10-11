import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/dm_header_avatar.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_cluster.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  group('groupDmStackMembers', () {
    test('shows the first two recipients in stored order', () {
      final List<AvatarClusterMember> members = groupDmStackMembers(
        members: const <GroupMemberInfo>[
          GroupMemberInfo(id: '11', name: 'A'),
          GroupMemberInfo(id: '12', name: 'B'),
          GroupMemberInfo(id: '13', name: 'C'),
        ],
        currentUserId: '1',
        currentUserAvatar: null,
      );

      expect(members.map((AvatarClusterMember m) => m.userId), <String>[
        '11',
        '12',
      ]);
    });

    test('pairs a lone recipient with the current user', () {
      final List<AvatarClusterMember> members = groupDmStackMembers(
        members: const <GroupMemberInfo>[GroupMemberInfo(id: '11', name: 'A')],
        currentUserId: '1',
        currentUserAvatar: 'abc',
      );

      expect(members.map((AvatarClusterMember m) => m.userId), <String>[
        '11',
        '1',
      ]);
      expect(members.last.imageUrl, contains('avatars/1/abc'));
    });

    test('leaves a self-only group without members', () {
      expect(
        groupDmStackMembers(
          members: const <GroupMemberInfo>[],
          currentUserId: '1',
          currentUserAvatar: null,
        ),
        isEmpty,
      );
    });
  });

  group('GroupDmMemberCountSubtitle', () {
    Future<void> pump(WidgetTester tester, List<String> recipients) {
      final colorTheme = buildDarkColorTheme();
      return tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Scaffold(
            body: GroupDmMemberCountSubtitle(
              dm: DmConversation(
                id: '9',
                type: 3,
                recipientId: '',
                recipientName: '',
                lastMessage: '',
                lastMessageTime: DateTime.fromMillisecondsSinceEpoch(0),
                remoteRecipientIds: recipients,
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('counts the other members', (tester) async {
      await pump(tester, const <String>['11', '12']);
      expect(find.text('2 Members'), findsOneWidget);
    });

    testWidgets('uses the singular for one member', (tester) async {
      await pump(tester, const <String>['11']);
      expect(find.text('1 Member'), findsOneWidget);
    });

    testWidgets('shows zero for a self-only group', (tester) async {
      await pump(tester, const <String>[]);
      expect(find.text('0 Members'), findsOneWidget);
    });
  });
}
