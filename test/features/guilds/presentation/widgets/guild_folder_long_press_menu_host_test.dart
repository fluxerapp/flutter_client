import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_long_press_menu_host.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';

void main() {
  group('GuildFolderLongPressMenuHost', () {
    testWidgets('does not open menu before peek hold delay on release', (
      WidgetTester tester,
    ) async {
      var menuOpenCount = 0;
      final GlobalKey folderKey = GlobalKey();

      await tester.pumpWidget(
        pumpFluxerApp(
          child: Scaffold(
            body: GuildFolderLongPressMenuHost(
              itemId: 'folder-1',
              menuAnchorKey: folderKey,
              onLongPressMenu: (_) async {
                menuOpenCount++;
              },
              child: SizedBox(
                key: folderKey,
                width: 48,
                height: 48,
                child: const ColoredBox(color: Colors.blue),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Offset folderCenter = tester.getCenter(find.byKey(folderKey));
      final TestGesture hold = await tester.startGesture(folderCenter);
      await tester.pump(kGuildPeekHoldDelay - const Duration(milliseconds: 50));
      await hold.up();
      await tester.pumpAndSettle();

      expect(menuOpenCount, 0);
    });

    testWidgets('opens menu on release after peek hold delay', (
      WidgetTester tester,
    ) async {
      var menuOpenCount = 0;
      final GlobalKey folderKey = GlobalKey();

      await tester.pumpWidget(
        pumpFluxerApp(
          child: Scaffold(
            body: GuildFolderLongPressMenuHost(
              itemId: 'folder-1',
              menuAnchorKey: folderKey,
              onLongPressMenu: (_) async {
                menuOpenCount++;
              },
              child: SizedBox(
                key: folderKey,
                width: 48,
                height: 48,
                child: const ColoredBox(color: Colors.blue),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Offset folderCenter = tester.getCenter(find.byKey(folderKey));
      final TestGesture hold = await tester.startGesture(folderCenter);
      await tester.pump(kGuildPeekHoldDelay);
      await hold.up();
      await tester.pumpAndSettle();

      expect(menuOpenCount, 1);
    });

    testWidgets(
      'does not open menu on release when hold was cancelled by move',
      (WidgetTester tester) async {
        var menuOpenCount = 0;
        final GlobalKey folderKey = GlobalKey();

        await tester.pumpWidget(
          pumpFluxerApp(
            child: Scaffold(
              body: GuildFolderLongPressMenuHost(
                itemId: 'folder-1',
                menuAnchorKey: folderKey,
                onLongPressMenu: (_) async {
                  menuOpenCount++;
                },
                child: SizedBox(
                  key: folderKey,
                  width: 48,
                  height: 48,
                  child: const ColoredBox(color: Colors.blue),
                ),
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final Offset folderCenter = tester.getCenter(find.byKey(folderKey));
        final TestGesture hold = await tester.startGesture(folderCenter);
        await tester.pump(kGuildPeekHoldDelay);
        await hold.moveBy(const Offset(0, kGuildPeekHoldCancelThreshold));
        await hold.up();
        await tester.pumpAndSettle();

        expect(menuOpenCount, 0);
      },
    );
  });
}
