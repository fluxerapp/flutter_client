import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_member_row.dart';
import 'package:fluxer_app/features/members/presentation/widgets/member_list_shared_widgets.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

import '../../../../helpers/open_test_database.dart';

GuildMemberResponse _member(String userId) => GuildMemberResponse(
  user: UserPartialResponse(
    id: userId,
    username: 'user-$userId',
    discriminator: '0001',
    globalName: null,
    avatar: null,
    avatarColor: null,
    flags: 0,
  ),
  roles: const <String>[],
  joinedAt: DateTime.utc(2024),
  mute: false,
  deaf: false,
);

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  final overrides = <Override>[
    fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
  ];
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('sidebar member rows show the offline dot', (tester) async {
    await tester.pumpWidget(
      _app(
        MemberListSidebarMemberRow(
          guildId: '1',
          channelId: '2',
          userId: '3',
          rolesById: const {},
          listMember: MemberListMember(member: _member('3'), status: 'offline'),
        ),
      ),
    );
    await tester.pump();

    final FluxerAvatar avatar = tester.widget<FluxerAvatar>(
      find.byType(FluxerAvatar),
    );
    expect(avatar.showStatus, isTrue);
    expect(avatar.status, 'offline');
    expect(
      tester
          .widget<FluxerStatusIndicator>(find.byType(FluxerStatusIndicator))
          .status,
      'offline',
    );
    await releaseTestWidgetTree(tester);
  });

  testWidgets('details member row press highlight follows the group corners', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        MemberListDetailsMemberShell(
          isFirstInGroup: true,
          isLastInGroup: false,
          child: MemberListDetailsMemberRow(
            guildId: '1',
            userId: '3',
            rolesById: const {},
            dimmed: false,
            listMember: MemberListMember(
              member: _member('3'),
              status: 'online',
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final Finder clip = find.ancestor(
      of: find.byType(InkWell),
      matching: find.byType(ClipRRect),
    );
    expect(clip, findsOneWidget);
    expect(
      tester.widget<ClipRRect>(clip).borderRadius,
      const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    );
    await releaseTestWidgetTree(tester);
  });
}
