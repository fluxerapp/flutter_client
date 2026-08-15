import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_gesture_host.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';

void main() {
  group('GuildIconPeekGestureHost', () {
    testWidgets(
      'dismisses peek on pointer up so the next tap reaches a sibling',
      (WidgetTester tester) async {
        var dmTapped = false;
        const Key guildKey = Key('guild-icon');
        const Key dmKey = Key('dm-button');

        await tester.pumpWidget(
          pumpFluxerApp(
            child: Scaffold(
              body: Row(
                children: <Widget>[
                  GuildIconPeekGestureHost(
                    itemId: 'guild-1',
                    peekMenu: GuildIconPeekMenuConfig(
                      guildName: 'Test Guild',
                      hasUnread: false,
                      onAction: (_, _) async {},
                    ),
                    child: const SizedBox(
                      key: guildKey,
                      width: 48,
                      height: 48,
                      child: ColoredBox(color: Colors.blue),
                    ),
                  ),
                  GestureDetector(
                    key: dmKey,
                    onTap: () => dmTapped = true,
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

        expect(find.byType(GuildIconPeekMenuPanel), findsNothing);

        await tester.tap(find.byKey(dmKey));
        await tester.pumpAndSettle();

        expect(dmTapped, isTrue);
      },
    );

    testWidgets(
      'slow guild press and release does not require an extra tap to dismiss peek',
      (WidgetTester tester) async {
        var dmTapCount = 0;
        const Key guildKey = Key('guild-icon');
        const Key dmKey = Key('dm-button');

        await tester.pumpWidget(
          pumpFluxerApp(
            child: Scaffold(
              body: Row(
                children: <Widget>[
                  GuildIconPeekGestureHost(
                    itemId: 'guild-1',
                    peekMenu: GuildIconPeekMenuConfig(
                      guildName: 'Test Guild',
                      hasUnread: false,
                      onAction: (_, _) async {},
                    ),
                    child: const SizedBox(
                      key: guildKey,
                      width: 48,
                      height: 48,
                      child: ColoredBox(color: Colors.blue),
                    ),
                  ),
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

        await tester.tap(find.byKey(dmKey));
        await tester.pumpAndSettle();

        expect(dmTapCount, 1);
      },
    );
  });
}
