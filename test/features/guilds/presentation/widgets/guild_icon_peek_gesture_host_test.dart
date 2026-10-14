import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_folder_context_menu.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_gesture_host.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';

void main() {
  group('GuildIconPeekGestureHost', () {
    testWidgets('outside tap dismisses peek after release', (
      WidgetTester tester,
    ) async {
      const Key guildKey = Key('guild-icon');

      await tester.pumpWidget(
        pumpFluxerApp(
          child: Scaffold(
            body: GuildIconPeekGestureHost(
              itemId: 'guild-1',
              content: GuildFolderPeekMenuConfig(
                folderName: 'Test Folder',
                guilds: const <Guild>[Guild(id: 'guild-1', name: 'Alpha')],
                hasUnread: false,
                onAction: (_) async {},
              ),
              child: const SizedBox(
                key: guildKey,
                width: 48,
                height: 48,
                child: ColoredBox(color: Colors.blue),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Offset guildCenter = tester.getCenter(find.byKey(guildKey));
      final TestGesture hold = await tester.startGesture(guildCenter);
      await tester.pump(kGuildPeekHoldDelay);
      await tester.pump();
      await hold.up();
      await tester.pumpAndSettle();

      expect(find.byType(GuildFolderPeekMenuPanel), findsOneWidget);

      await tester.tapAt(const Offset(300, 300));
      await tester.pumpAndSettle();

      expect(find.byType(GuildFolderPeekMenuPanel), findsNothing);
    });

    testWidgets(
      'tapping under peek overlay dismisses peek before sibling receives tap',
      (WidgetTester tester) async {
        var dmTapCount = 0;
        const Key guildKey = Key('guild-icon');
        const Key dmKey = Key('dm-button');

        await tester.pumpWidget(
          pumpFluxerApp(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GuildIconPeekGestureHost(
                    itemId: 'guild-1',
                    content: GuildFolderPeekMenuConfig(
                      folderName: 'Test Folder',
                      guilds: const <Guild>[
                        Guild(id: 'guild-1', name: 'Alpha'),
                      ],
                      hasUnread: false,
                      onAction: (_) async {},
                    ),
                    child: const SizedBox(
                      key: guildKey,
                      width: 48,
                      height: 48,
                      child: ColoredBox(color: Colors.blue),
                    ),
                  ),
                  const SizedBox(height: 300),
                  GestureDetector(
                    key: dmKey,
                    onTap: () => dmTapCount++,
                    child: const SizedBox(
                      width: 48,
                      height: 48,
                      child: ColoredBox(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
        await tester.pumpAndSettle();

        final Offset guildCenter = tester.getCenter(find.byKey(guildKey));
        final TestGesture hold = await tester.startGesture(guildCenter);
        await tester.pump(kGuildPeekHoldDelay);
        await tester.pump();
        await hold.up();
        await tester.pumpAndSettle();

        expect(find.byType(GuildFolderPeekMenuPanel), findsOneWidget);

        await tester.tap(find.byKey(dmKey), warnIfMissed: false);
        await tester.pumpAndSettle();

        expect(find.byType(GuildFolderPeekMenuPanel), findsNothing);

        await tester.tap(find.byKey(dmKey));
        await tester.pumpAndSettle();

        expect(dmTapCount, 1);
      },
    );
  });
}
