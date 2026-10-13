import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar_scroll_targets.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/material_ui.dart';

GuildReadStateEntry _readState({required int mentionCount}) {
  return GuildReadStateEntry(
    hasUnread: true,
    hasPlainUnread: mentionCount == 0,
    mentionCount: mentionCount,
    mentionCountByChannel: mentionCount > 0
        ? <String, int>{'c1': mentionCount}
        : const <String, int>{},
    unreadChannelId: 'c1',
    sentinel: 0,
  );
}

GuildNavbarGuild _guild(String id) => GuildNavbarGuild(
  guild: Guild(id: id, name: id),
);

String _rowId(GuildNavbarItem item) => switch (item) {
  GuildNavbarGuild(:final Guild guild) => guild.id,
  GuildNavbarFolder(:final int id) => guildFolderScrollIndicatorId(id),
};

void main() {
  const folder = GuildNavbarFolder(
    id: 7,
    guilds: <Guild>[
      Guild(id: 'quiet-in-folder', name: 'quiet'),
      Guild(id: 'pinged', name: 'pinged'),
    ],
  );
  final List<GuildNavbarItem> items = <GuildNavbarItem>[
    for (var i = 0; i < 10; i++) _guild('unread-$i'),
    for (var i = 0; i < 30; i++) _guild('quiet-$i'),
    folder,
  ];
  final Map<String, GuildReadStateEntry> readStates =
      <String, GuildReadStateEntry>{
        for (var i = 0; i < 10; i++) 'unread-$i': _readState(mentionCount: 0),
        'pinged': _readState(mentionCount: 1),
      };
  final Map<String, List<Guild>> folderGuilds =
      guildNavbarScrollIndicatorFolderGuilds(items);

  test('a collapsed folder is one target that takes its guilds mention', () {
    final List<String> order = guildNavbarScrollIndicatorOrder(
      items: items,
      expandedFolderIds: const <int>{},
    );

    expect(order.last, guildFolderScrollIndicatorId(7));
    expect(order, isNot(contains('pinged')));
    expect(
      guildNavbarScrollIndicatorSeverity(
        id: guildFolderScrollIndicatorId(7),
        folderGuilds: folderGuilds,
        readStates: readStates,
      ),
      GuildScrollIndicatorSeverity.mention,
    );
  });

  test('an expanded folder exposes each guild instead of itself', () {
    final List<String> order = guildNavbarScrollIndicatorOrder(
      items: items,
      expandedFolderIds: const <int>{7},
    );

    expect(order.sublist(order.length - 2), <String>[
      'quiet-in-folder',
      'pinged',
    ]);
    expect(order, isNot(contains(guildFolderScrollIndicatorId(7))));
  });

  testWidgets('a mention in a collapsed folder far down the rail shows '
      'alongside unread communities above', (WidgetTester tester) async {
    final scrollController = ScrollController();
    final itemKeys = <String, GlobalKey>{};
    final indicator = GuildScrollIndicatorController(
      scrollController: scrollController,
      itemKeys: itemKeys,
      resolveSeverity: (String id) => guildNavbarScrollIndicatorSeverity(
        id: id,
        folderGuilds: folderGuilds,
        readStates: readStates,
      ),
      orderedIds: () => guildNavbarScrollIndicatorOrder(
        items: items,
        expandedFolderIds: const <int>{},
      ),
    );
    addTearDown(() {
      indicator.detach();
      scrollController.dispose();
    });

    await tester.pumpWidget(
      MaterialApp(
        home: Center(
          child: SizedBox(
            width: 72,
            height: 400,
            child: ListView.builder(
              controller: scrollController,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) => SizedBox(
                key: itemKeys.putIfAbsent(_rowId(items[index]), GlobalKey.new),
                height: 56,
              ),
            ),
          ),
        ),
      ),
    );
    scrollController.jumpTo(300);
    await tester.pump();
    indicator.update();

    expect(indicator.topIndicator.value.show, isTrue);
    expect(
      indicator.topIndicator.value.severity,
      GuildScrollIndicatorSeverity.unread,
    );
    expect(indicator.bottomIndicator.value.show, isTrue);
    expect(
      indicator.bottomIndicator.value.severity,
      GuildScrollIndicatorSeverity.mention,
    );
    expect(
      indicator.bottomIndicator.value.targetId,
      guildFolderScrollIndicatorId(7),
    );
  });
}
