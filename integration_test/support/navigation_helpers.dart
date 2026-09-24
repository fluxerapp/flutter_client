import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'requirements.dart';
import 'scroll_utils.dart';
import 'test_config.dart';

Future<void> openGuildChannel(WidgetTester tester) async {
  requireGuildChannelConfig();

  const String guildId = IntegrationTestConfig.guildId;
  const String channelId = IntegrationTestConfig.channelId;

  final Finder guildRail = find
      .byKey(const ValueKey<String>('guild-$guildId'))
      .hitTestable();
  if (guildRail.evaluate().isEmpty) {
    await tapBottomNav(tester, 'Home');
    await pumpUntil(tester, guildRail);
    expect(
      guildRail,
      findsWidgets,
      reason:
          'guild $guildId is not on screen and the Home tab did not bring the '
          'guild rail back',
    );
  }

  await tester.tap(
    find.byKey(const ValueKey<String>('guild-$guildId')).hitTestable().first,
  );
  await tester.pump();
  await tester.pump(const Duration(seconds: 2));

  // A `.first` finder throws Bad state on zero matches instead of reporting
  // empty, which scrollUntilVisible evaluates before every drag.
  final Finder channelList = find
      .descendant(
        of: find.byKey(const ValueKey<String>(guildId)),
        matching: find.byType(Scrollable),
      )
      .first;
  final Finder channelTile = find.descendant(
    of: channelList,
    matching: find.byKey(const ValueKey<String>(channelId)),
  );
  await pumpUntil(tester, channelList);
  await tester.scrollUntilVisible(channelTile, 200, scrollable: channelList);

  await tester.ensureVisible(channelTile);
  await tester.pump(const Duration(milliseconds: 300));
  await tester.tapAt(tester.getRect(channelTile).center);
  await tester.pump();
  await pumpUntil(
    tester,
    find.bySemanticsLabel('Loading messages'),
    found: false,
  );
  await pumpUntil(tester, find.byKey(const ValueKey<String>('message-list')));
  expect(
    find.byKey(const ValueKey<String>('message-list')),
    findsWidgets,
    reason:
        'tapping channel $channelId did not open a message list; the tile was '
        'found but the tap did not land',
  );
}

Future<void> openPersonalNotes(WidgetTester tester) async {
  await tapBottomNav(tester, 'Home');
  await pumpUntil(tester, find.text(IntegrationTestConfig.personalNotesTitle));

  await tester.tap(find.text(IntegrationTestConfig.personalNotesTitle));
  await tester.pump();
  await pumpUntil(
    tester,
    find.bySemanticsLabel('Loading messages'),
    found: false,
  );
}
