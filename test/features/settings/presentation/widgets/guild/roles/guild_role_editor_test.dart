import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_update.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_role_editor.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../../helpers/test_l10n.dart';

const String _guildId = 'guild-1';

class _EditorHost extends StatefulWidget {
  const _EditorHost({required this.initialRole});

  final MemberRole initialRole;

  @override
  State<_EditorHost> createState() => _EditorHostState();
}

class _EditorHostState extends State<_EditorHost> {
  late MemberRole role = widget.initialRole;

  void replaceRole(MemberRole next) => setState(() => role = next);

  @override
  Widget build(BuildContext context) {
    return GuildRoleEditor(
      guildId: _guildId,
      role: role,
      isLocked: false,
      canManageRoles: true,
      mentionEveryonePermissionLabel: '@everyone',
      filteredPermissionSpecs: const [],
      onRoleUpdate:
          ({
            String? name,
            int? color,
            bool? hoist,
            bool? mentionable,
            int? permissions,
          }) {
            if (name != null) {
              setState(
                () => role = applyGuildRoleUpdate(
                  role,
                  GuildRoleUpdate(id: role.id, name: name),
                ),
              );
            }
          },
      onDeleteRole: () {},
      onClearPermissions: () {},
      onPermissionToggle: (_) {},
      onPermissionSearchQueryChange: (_) {},
      permissionDisabledReason: (_) => null,
    );
  }
}

void main() {
  Widget buildTestApp(Widget child) {
    final colorTheme = buildDarkColorTheme();
    return ProviderScope(
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
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

  _EditorHostState host(WidgetTester tester) =>
      tester.state(find.byType(_EditorHost));

  TextEditingController nameController(WidgetTester tester) =>
      tester.widget<EditableText>(find.byType(EditableText).first).controller;

  testWidgets('deleting mid-name keeps the caret where it was', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      buildTestApp(
        const _EditorHost(
          initialRole: MemberRole(id: '200', name: 'Moderator', color: 0),
        ),
      ),
    );
    await tester.pumpAndSettle();

    await tester.showKeyboard(find.byType(EditableText).first);
    tester.testTextInput.updateEditingValue(
      const TextEditingValue(
        text: 'Moderator',
        selection: TextSelection.collapsed(offset: 3),
      ),
    );
    await tester.pump();

    tester.testTextInput.updateEditingValue(
      const TextEditingValue(
        text: 'Moerator',
        selection: TextSelection.collapsed(offset: 2),
      ),
    );
    await tester.pump();

    expect(nameController(tester).text, 'Moerator');
    expect(
      nameController(tester).selection,
      const TextSelection.collapsed(offset: 2),
    );
  });

  testWidgets('an outside name change or role switch rewrites the field', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      buildTestApp(
        const _EditorHost(
          initialRole: MemberRole(id: '200', name: 'Moderator', color: 0),
        ),
      ),
    );
    await tester.pumpAndSettle();
    host(
      tester,
    ).replaceRole(const MemberRole(id: '200', name: 'Mods', color: 0));
    await tester.pump();
    expect(nameController(tester).text, 'Mods');

    host(
      tester,
    ).replaceRole(const MemberRole(id: '300', name: 'Helper', color: 0));
    await tester.pump();
    expect(nameController(tester).text, 'Helper');
  });
}
