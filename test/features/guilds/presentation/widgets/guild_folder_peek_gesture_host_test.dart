import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_context_menu.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_menu_data.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_gesture_host.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';
import '../../../../helpers/test_l10n.dart';

const Guild _kFolderGuild = Guild(id: 'guild-1', name: 'Alpha');

Widget _folderPeekHost({
  required Key folderKey,
  required Future<void> Function(FolderMenuAction action) onAction,
}) {
  return Scaffold(
    body: GuildIconPeekGestureHost(
      itemId: 'folder-1',
      content: GuildFolderPeekMenuConfig(
        folderName: 'Test Folder',
        guilds: const <Guild>[_kFolderGuild],
        hasUnread: true,
        onAction: onAction,
      ),
      child: SizedBox(
        key: folderKey,
        width: 48,
        height: 48,
        child: const ColoredBox(color: Colors.blue),
      ),
    ),
  );
}

Future<TestGesture> _holdUntilPeek(WidgetTester tester, Finder folder) async {
  final Offset folderCenter = tester.getCenter(folder);
  final TestGesture hold = await tester.startGesture(folderCenter);
  await tester.pump(kGuildPeekHoldDelay);
  await tester.pump();
  return hold;
}

void main() {
  group('GuildFolderPeekGestureHost', () {
    testWidgets('shows peek panel after hold delay without pointerUp', (
      WidgetTester tester,
    ) async {
      const Key folderKey = Key('folder-icon');

      await tester.pumpWidget(
        pumpFluxerApp(
          child: _folderPeekHost(folderKey: folderKey, onAction: (_) async {}),
        ),
      );
      await tester.pumpAndSettle();

      final TestGesture hold = await _holdUntilPeek(
        tester,
        find.byKey(folderKey),
      );

      expect(find.byType(GuildFolderPeekMenuPanel), findsOneWidget);
      expect(find.text(testL10n.guildFolderMarkAsRead), findsOneWidget);

      await hold.up();
      await tester.pumpAndSettle();
    });

    testWidgets('selects a concrete item on pointerUp over that item', (
      WidgetTester tester,
    ) async {
      const Key folderKey = Key('folder-icon');
      final List<FolderMenuAction> selected = <FolderMenuAction>[];

      await tester.pumpWidget(
        pumpFluxerApp(
          child: _folderPeekHost(
            folderKey: folderKey,
            onAction: (FolderMenuAction action) async {
              selected.add(action);
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final TestGesture hold = await _holdUntilPeek(
        tester,
        find.byKey(folderKey),
      );
      expect(find.byType(GuildFolderPeekMenuPanel), findsOneWidget);

      final Offset settingsCenter = tester.getCenter(
        find.text(testL10n.guildFolderSettingsTitle),
      );
      await hold.moveTo(settingsCenter);
      await hold.up();
      await tester.pumpAndSettle();

      expect(selected, <FolderMenuAction>[FolderMenuAction.folderSettings]);
      expect(find.byType(GuildFolderPeekMenuPanel), findsNothing);
    });

    testWidgets('opens submenu bottom sheet and restores peek on back', (
      WidgetTester tester,
    ) async {
      const Key folderKey = Key('folder-icon');
      final List<FolderMenuAction> selected = <FolderMenuAction>[];

      await tester.pumpWidget(
        pumpFluxerApp(
          child: _folderPeekHost(
            folderKey: folderKey,
            onAction: (FolderMenuAction action) async {
              selected.add(action);
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final TestGesture hold = await _holdUntilPeek(
        tester,
        find.byKey(folderKey),
      );
      final Offset muteCenter = tester.getCenter(
        find.text(testL10n.guildBulkMuteCommunities),
      );
      await hold.moveTo(muteCenter);
      await hold.up();
      await tester.pumpAndSettle();

      expect(find.byType(GuildFolderPeekMenuPanel), findsNothing);
      expect(find.text(testL10n.guildBulkUnmuteCommunities), findsOneWidget);

      await tester.tap(find.byTooltip(testL10n.back));
      await tester.pumpAndSettle();

      expect(selected, isEmpty);
      expect(find.byType(GuildFolderPeekMenuPanel), findsOneWidget);
      expect(find.text(testL10n.guildFolderMarkAsRead), findsOneWidget);
    });

    testWidgets('cancels peek when the pointer moves past the drag threshold', (
      WidgetTester tester,
    ) async {
      const Key folderKey = Key('folder-icon');
      final List<FolderMenuAction> selected = <FolderMenuAction>[];

      await tester.pumpWidget(
        pumpFluxerApp(
          child: _folderPeekHost(
            folderKey: folderKey,
            onAction: (FolderMenuAction action) async {
              selected.add(action);
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final TestGesture hold = await _holdUntilPeek(
        tester,
        find.byKey(folderKey),
      );
      expect(find.byType(GuildFolderPeekMenuPanel), findsOneWidget);

      await hold.moveBy(const Offset(0, kGuildDragCollapseThreshold));
      await tester.pump();

      expect(find.byType(GuildFolderPeekMenuPanel), findsNothing);

      await hold.up();
      await tester.pumpAndSettle();

      expect(selected, isEmpty);
    });

    testWidgets('keeps original group dividers in the peek panel', (
      WidgetTester tester,
    ) async {
      const Key folderKey = Key('folder-icon');

      await tester.pumpWidget(
        pumpFluxerApp(
          child: _folderPeekHost(folderKey: folderKey, onAction: (_) async {}),
        ),
      );
      await tester.pumpAndSettle();

      final TestGesture hold = await _holdUntilPeek(
        tester,
        find.byKey(folderKey),
      );

      expect(find.byType(ContextMenuDivider), findsNWidgets(3));
      expect(find.text(testL10n.guildFolderMarkAsRead), findsOneWidget);
      expect(find.text(testL10n.guildBulkMuteCommunities), findsOneWidget);
      expect(find.text(testL10n.guildFolderSettingsTitle), findsOneWidget);

      await hold.up();
      await tester.pumpAndSettle();
    });
  });
}
