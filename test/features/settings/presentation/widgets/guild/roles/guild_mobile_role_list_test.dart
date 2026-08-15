import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_mobile_role_list.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../../../helpers/test_l10n.dart';

void main() {
  Widget buildTestApp({required Widget child}) {
    final colorTheme = buildDarkColorTheme();
    return ProviderScope(
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: FluxerLocalizations.localizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Scaffold(body: child),
      ),
    );
  }

  const String guildId = 'guild-1';

  final List<MemberRole> roles = <MemberRole>[
    const MemberRole(id: guildId, name: '@everyone', color: 0),
    const MemberRole(
      id: '200',
      name: 'Moderator',
      color: 0xFF3366FF,
      position: 2,
      hoist: true,
    ),
  ];

  final List<MemberRole> hoistedRoles = <MemberRole>[
    const MemberRole(
      id: '200',
      name: 'Moderator',
      color: 0xFF3366FF,
      position: 2,
      hoist: true,
    ),
  ];

  GuildMobileRoleList buildList({required bool hoistOrderMode}) {
    return GuildMobileRoleList(
      guildId: guildId,
      roles: roles,
      hoistedRoles: hoistedRoles,
      canManageRoles: true,
      hoistOrderMode: hoistOrderMode,
      hasCustomHoistOrder: false,
      isRoleLocked: (_) => false,
      isCreatingRole: false,
      onCreateRole: () {},
      onSelectRole: (_) {},
      onEnterHoistOrderMode: () {},
      onExitHoistOrderMode: () {},
      onResetHoistOrder: () {},
      onReorder: (_, _) {},
    );
  }

  testWidgets('renders create role button and role names', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      buildTestApp(child: buildList(hoistOrderMode: false)),
    );
    await tester.pumpAndSettle();

    expect(find.text('Create role'), findsOneWidget);
    expect(find.text('Moderator'), findsOneWidget);
    expect(find.text('Roles'), findsOneWidget);
    expect(find.text('Custom hoist order'), findsNothing);
    expect(find.text('Search permissions'), findsNothing);
  });

  testWidgets('renders hoist order mode controls', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestApp(child: buildList(hoistOrderMode: true)),
    );
    await tester.pumpAndSettle();

    expect(find.text('Hoist order'), findsOneWidget);
    expect(find.text('Back to roles'), findsOneWidget);
    expect(
      find.text(
        'Drag roles to customize the order they appear in the member list.',
      ),
      findsOneWidget,
    );
    expect(find.text('Moderator'), findsOneWidget);
  });
}
