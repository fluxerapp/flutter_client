import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'requirements.dart';
import 'scroll_utils.dart';
import 'test_config.dart';

Future<void> openGuildChannel(WidgetTester tester) async {
  requireGuildChannelConfig();

  const String guildId = IntegrationTestConfig.guildId;
  const String channelId = IntegrationTestConfig.channelId;

  await tester.tap(find.byKey(const ValueKey<String>('guild-$guildId')));
  await tester.pump();
  await tester.pump(const Duration(seconds: 2));

  await tester.tap(find.byKey(const ValueKey<String>(channelId)));
  await tester.pump();
  await pumpUntil(
    tester,
    find.bySemanticsLabel('Loading messages'),
    found: false,
  );
}

Future<void> openDmChannel(WidgetTester tester) async {
  requireDmChannelConfig();

  await tapBottomNav(tester, 'Home');
  await pumpUntil(
    tester,
    find.byKey(
      const ValueKey<String>('dm-${IntegrationTestConfig.dmChannelId}'),
    ),
  );

  await tester.tap(
    find.byKey(
      const ValueKey<String>('dm-${IntegrationTestConfig.dmChannelId}'),
    ),
  );
  await tester.pump();
  await pumpUntil(
    tester,
    find.bySemanticsLabel('Loading messages'),
    found: false,
  );
}
