import 'package:flutter/material.dart' hide SensitiveContent;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_sidebar_icon_connect_bits_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_collapsed_categories_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_scroll_indicator.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mute_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_read_state_provider.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';

const String _guildId = 'g1';
const String _otherGuildId = 'g2';

class _GuildSwitchTestHarness {
  String activeGuildId = _guildId;
  late ChannelListState channelListState;
}

void main() {
  group('GuildSidebar collapsed category visibility', () {
    testWidgets('keeps the unread channel and hides the read one', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            collapsed: const {'cat1'},
            unread: const {
              'c1': UnreadState(hasUnread: true, hasUnreadMessages: true),
              'c2': UnreadState(),
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('My Category'), findsOneWidget);
      expect(find.text('general'), findsOneWidget);
      expect(find.text('random'), findsNothing);
    });

    testWidgets('keeps the selected channel even when it is read', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(selectedChannelId: 'c2'),
            selectedChannelId: 'c2',
            collapsed: const {'cat1'},
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('random'), findsOneWidget);
      expect(find.text('general'), findsNothing);
    });
  });

  group('GuildSidebar hide muted channels', () {
    testWidgets('keeps a mentioned muted channel and hides a plain muted one', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            hideMuted: true,
            muted: const {'c1', 'c2'},
            unread: const {
              'c1': UnreadState(
                hasUnread: true,
                hasUnreadMessages: true,
                mentionCount: 1,
              ),
              'c2': UnreadState(),
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('general'), findsOneWidget);
      expect(find.text('random'), findsNothing);
    });
  });

  group('GuildSidebar channels without a category', () {
    testWidgets('renders channels without a category with no header', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: const ChannelListState(
              guild: Guild(id: _guildId, name: 'Test Guild'),
              categories: [
                ChannelCategory(
                  id: kUncategorizedCategoryId,
                  name: 'Channels',
                  channels: [
                    Channel(
                      id: 'uncategorized',
                      guildId: _guildId,
                      name: 'uncategorized',
                    ),
                  ],
                ),
              ],
              selectedChannelId: null,
            ),
            collapsed: const {kUncategorizedCategoryId},
            unread: const {'uncategorized': UnreadState()},
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('uncategorized'), findsOneWidget);
      expect(find.text('Channels'), findsNothing);
    });
  });

  group('GuildSidebar long-press menus', () {
    testWidgets('channel menu hides mark as read when channel is read', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('general'));
      await tester.pumpAndSettle();

      expect(find.text('Mark as Read'), findsNothing);
      expect(find.text('Copy Link'), findsOneWidget);
      expect(find.text('Copy Channel ID'), findsOneWidget);
      expect(find.text('Notification Settings'), findsOneWidget);
      expect(find.text('Delete My Messages'), findsOneWidget);
      expect(find.text('Open link'), findsNothing);
      expect(find.text('Debug Channel'), findsNothing);
      expect(find.text('Delete Channel'), findsNothing);

      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Copy Link'), lessThan(dy('Mute Channel')));
      expect(dy('Mute Channel'), lessThan(dy('Notification Settings')));
      expect(dy('Notification Settings'), lessThan(dy('Copy Channel ID')));
      expect(dy('Copy Channel ID'), lessThan(dy('Delete My Messages')));
    });

    testWidgets('channel menu shows mark as read when channel is unread', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {
              'c1': UnreadState(hasUnread: true, hasUnreadMessages: true),
              'c2': UnreadState(),
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('general'));
      await tester.pumpAndSettle();

      expect(find.text('Mark as Read'), findsOneWidget);
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Mark as Read'), lessThan(dy('Copy Link')));
    });

    testWidgets('channel menu shows invite people when permitted', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            permissionBits: {
              'c1': Permission.createInstantInvite.value,
              'c2': Permission.viewChannel.value,
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('general'));
      await tester.pumpAndSettle();

      expect(find.text('Invite People'), findsOneWidget);
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Invite People'), lessThan(dy('Copy Link')));
    });

    testWidgets('voice channel menu shows open chat and delete my messages', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _mixedChannelState(),
            unread: const {'c1': UnreadState(), 'voice-1': UnreadState()},
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('voice-room'));
      await tester.pumpAndSettle();

      expect(find.text('Open chat'), findsOneWidget);
      expect(find.text('Delete My Messages'), findsOneWidget);
    });

    testWidgets('category menu shows mute, copy id, and mark read actions', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('My Category'));
      await tester.pumpAndSettle();

      expect(find.text('Mute Category'), findsOneWidget);
      expect(find.text('Copy Category ID'), findsOneWidget);
      expect(find.text('Mark Category as Read'), findsOneWidget);
      expect(find.text('Debug Category'), findsNothing);

      // Order must mirror the web category menu: Mark as Read -> Mute -> Copy ID.
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Mark Category as Read'), lessThan(dy('Mute Category')));
      expect(dy('Mute Category'), lessThan(dy('Copy Category ID')));
    });

    testWidgets('channel menu shows Delete Channel for managers', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            permissionBits: {'c1': Permission.manageChannels.value},
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('general'));
      await tester.pumpAndSettle();

      expect(find.text('Edit Channel'), findsOneWidget);
      expect(find.text('Duplicate channel'), findsOneWidget);
      expect(find.text('Delete Channel'), findsOneWidget);
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Edit Channel'), lessThan(dy('Duplicate channel')));
      expect(dy('Duplicate channel'), lessThan(dy('Copy Channel ID')));
      expect(dy('Copy Channel ID'), lessThan(dy('Delete Channel')));
      expect(dy('Delete Channel'), lessThan(dy('Delete My Messages')));
    });

    testWidgets('channel menu shows Debug Channel in developer mode', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            developerMode: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('general'));
      await tester.pumpAndSettle();

      expect(find.text('Debug Channel'), findsOneWidget);
    });

    testWidgets('category menu shows Debug Category in developer mode', (
      tester,
    ) async {
      _setMobileSurface(tester);
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _state(),
            unread: const {'c1': UnreadState(), 'c2': UnreadState()},
            developerMode: true,
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('My Category'));
      await tester.pumpAndSettle();

      expect(find.text('Debug Category'), findsOneWidget);
    });

    testWidgets('link channel menu shows Open Link', (tester) async {
      _setMobileSurface(tester);
      final linkState = ChannelListState(
        guild: const Guild(id: _guildId, name: 'Test Guild'),
        categories: [
          ChannelCategory(
            id: 'cat1',
            name: 'My Category',
            channels: [
              _linkChannel('c1', 'announcements', 'https://example.com'),
            ],
          ),
        ],
        selectedChannelId: null,
      );
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: linkState,
            unread: const {'c1': UnreadState()},
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.longPress(find.text('announcements'));
      await tester.pumpAndSettle();

      expect(find.text('Open link'), findsOneWidget);
      expect(find.text('Copy Link'), findsOneWidget);
      expect(find.text('Notification Settings'), findsOneWidget);
      expect(find.text('Mute Channel'), findsNothing);
    });
  });

  group('GuildSidebar voice channel access icons', () {
    testWidgets('shows no-connect icon when connect permission is denied', (
      tester,
    ) async {
      _setMobileSurface(tester);
      const String voiceChannelId = 'voice-1';
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _voiceChannelState(),
            unread: const {'voice-1': UnreadState()},
            sidebarConnectBits: {voiceChannelId: Permission.viewChannel.value},
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder voiceRow = find.ancestor(
        of: find.text('locked-voice'),
        matching: find.byType(Row),
      );
      final SvgPicture svg = tester.widget<SvgPicture>(
        find.descendant(of: voiceRow, matching: find.byType(SvgPicture)),
      );
      final String asset = (svg.bytesLoader as SvgAssetLoader).assetName;
      expect(asset, contains('voice_no_connect'));
    });

    testWidgets('shows default voice icon while connect bits are unresolved', (
      tester,
    ) async {
      _setMobileSurface(tester);
      const String voiceChannelId = 'voice-1';
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _voiceChannelState(),
            unread: const {'voice-1': UnreadState()},
            sidebarConnectBits: {voiceChannelId: null},
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder voiceRow = find.ancestor(
        of: find.text('locked-voice'),
        matching: find.byType(Row),
      );
      final SvgPicture svg = tester.widget<SvgPicture>(
        find.descendant(of: voiceRow, matching: find.byType(SvgPicture)),
      );
      final String asset = (svg.bytesLoader as SvgAssetLoader).assetName;
      expect(asset, contains('voice.svg'));
      expect(asset, isNot(contains('voice_no_connect')));
    });

    testWidgets('shows default voice icon when connect is allowed', (
      tester,
    ) async {
      _setMobileSurface(tester);
      const String voiceChannelId = 'voice-1';
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: _voiceChannelState(),
            unread: const {'voice-1': UnreadState()},
            sidebarConnectBits: {
              voiceChannelId:
                  Permission.viewChannel.value | Permission.connect.value,
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder voiceRow = find.ancestor(
        of: find.text('locked-voice'),
        matching: find.byType(Row),
      );
      final SvgPicture svg = tester.widget<SvgPicture>(
        find.descendant(of: voiceRow, matching: find.byType(SvgPicture)),
      );
      final String asset = (svg.bytesLoader as SvgAssetLoader).assetName;
      expect(asset, contains('voice.svg'));
      expect(asset, isNot(contains('voice_no_connect')));
    });
  });

  group('GuildSidebar scroll indicator', () {
    testWidgets('shows NEW MESSAGE when unread channel is off-screen below', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 220);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      const String unreadChannelId = 'c20';
      final List<Channel> channels = List<Channel>.generate(
        20,
        (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
      );
      final Map<String, UnreadState> unread = <String, UnreadState>{
        for (int index = 1; index <= 20; index++)
          'c$index': index == 20
              ? const UnreadState(hasUnread: true, hasUnreadMessages: true)
              : const UnreadState(),
      };
      await tester.pumpWidget(
        _buildTestApp(
          overrides: _buildOverrides(
            channelListState: ChannelListState(
              guild: const Guild(id: _guildId, name: 'Test Guild'),
              categories: [
                ChannelCategory(
                  id: 'cat1',
                  name: 'My Category',
                  channels: channels,
                ),
              ],
              selectedChannelId: 'c1',
            ),
            selectedChannelId: 'c1',
            unread: unread,
            guildReadState: {
              _guildId: GuildReadStateEntry.empty.copyWith(hasUnread: true),
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      final Finder indicator = find.text('NEW MESSAGE');
      expect(indicator, findsNWidgets(2));

      await tester.tap(indicator.last);
      await tester.pump(const Duration(milliseconds: 250));
      await tester.pump(const Duration(milliseconds: 250));

      expect(find.text('channel-20'), findsOneWidget);
    });

    testWidgets(
      'shows only one NEW MESSAGE pill when unread channels exist above and below',
      (tester) async {
        tester.view.physicalSize = const Size(390, 220);
        tester.view.devicePixelRatio = 1;
        addTearDown(tester.view.resetPhysicalSize);
        addTearDown(tester.view.resetDevicePixelRatio);

        final List<Channel> channels = List<Channel>.generate(
          20,
          (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
        );
        final Map<String, UnreadState> unread = <String, UnreadState>{
          for (int index = 1; index <= 20; index++)
            'c$index': index == 1 || index == 20
                ? const UnreadState(hasUnread: true, hasUnreadMessages: true)
                : const UnreadState(),
        };
        await tester.pumpWidget(
          _buildTestApp(
            overrides: _buildOverrides(
              channelListState: ChannelListState(
                guild: const Guild(id: _guildId, name: 'Test Guild'),
                categories: [
                  ChannelCategory(
                    id: 'cat1',
                    name: 'My Category',
                    channels: channels,
                  ),
                ],
                selectedChannelId: 'c10',
              ),
              selectedChannelId: 'c10',
              unread: unread,
              guildReadState: {
                _guildId: GuildReadStateEntry.empty.copyWith(hasUnread: true),
              },
            ),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 300));

        final ScrollableState scrollable = tester.state<ScrollableState>(
          find.byType(Scrollable).first,
        );
        scrollable.position.jumpTo(scrollable.position.maxScrollExtent / 2);
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 300));

        final Iterable<AnimatedOpacity> opacities = tester
            .widgetList<AnimatedOpacity>(
              find.descendant(
                of: find.byType(GuildScrollIndicatorLayer),
                matching: find.byType(AnimatedOpacity),
              ),
            );
        final int visibleCount = opacities
            .where((AnimatedOpacity opacity) => opacity.opacity == 1.0)
            .length;
        expect(visibleCount, 1);
      },
    );
  });

  group('GuildSidebar scroll persistence', () {
    testWidgets('restores channel list scroll after widget recreation', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 220);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final List<Channel> channels = List<Channel>.generate(
        20,
        (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
      );
      final Map<String, UnreadState> unread = <String, UnreadState>{
        for (int index = 1; index <= 20; index++)
          'c$index': index == 20
              ? const UnreadState(hasUnread: true, hasUnreadMessages: true)
              : const UnreadState(),
      };
      final List<Override> overrides = _buildOverrides(
        channelListState: ChannelListState(
          guild: const Guild(id: _guildId, name: 'Test Guild'),
          categories: [
            ChannelCategory(
              id: 'cat1',
              name: 'My Category',
              channels: channels,
            ),
          ],
          selectedChannelId: 'c1',
        ),
        selectedChannelId: 'c1',
        unread: unread,
      );
      final ProviderContainer container = ProviderContainer(
        overrides: overrides,
      );
      addTearDown(container.dispose);
      final colorTheme = buildDarkColorTheme();
      Future<void> pumpSidebar() async {
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              localizationsDelegates:
                  FluxerLocalizations.localizationsDelegates,
              supportedLocales: FluxerLocalizations.supportedLocales,
              theme: buildFluxerTheme(
                colorTheme: colorTheme,
                textTheme: FluxerTextTheme.fromColors(colorTheme),
                layoutTheme: FluxerLayoutTheme.scaled(),
              ),
              home: const Scaffold(body: GuildSidebar()),
            ),
          ),
        );
        await tester.pumpAndSettle();
      }

      await pumpSidebar();
      await tester.scrollUntilVisible(
        find.text('channel-20'),
        100,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();
      expect(find.text('channel-20'), findsOneWidget);

      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      await pumpSidebar();

      expect(find.text('channel-20'), findsOneWidget);
    });

    testWidgets('restores channel list scroll after switching guilds', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(390, 220);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final List<Channel> guildAChannels = List<Channel>.generate(
        20,
        (int index) => _channel('c${index + 1}', 'channel-${index + 1}'),
      );
      final List<Channel> guildBChannels = List<Channel>.generate(
        5,
        (int index) => Channel(
          id: 'b${index + 1}',
          guildId: _otherGuildId,
          name: 'guild-b-${index + 1}',
          parentId: 'cat-b1',
        ),
      );
      final Map<String, UnreadState> unread = <String, UnreadState>{
        for (int index = 1; index <= 20; index++)
          'c$index': index == 20
              ? const UnreadState(hasUnread: true, hasUnreadMessages: true)
              : const UnreadState(),
      };
      final _GuildSwitchTestHarness harness = _GuildSwitchTestHarness();
      final ChannelListState guildAState = ChannelListState(
        guild: const Guild(id: _guildId, name: 'Test Guild'),
        categories: <ChannelCategory>[
          ChannelCategory(
            id: 'cat1',
            name: 'My Category',
            channels: guildAChannels,
          ),
        ],
        selectedChannelId: 'c1',
      );
      final ChannelListState guildBState = ChannelListState(
        guild: const Guild(id: _otherGuildId, name: 'Other Guild'),
        categories: <ChannelCategory>[
          ChannelCategory(
            id: 'cat-b1',
            name: 'Other Category',
            channels: guildBChannels,
          ),
        ],
        selectedChannelId: 'b1',
      );
      harness.channelListState = guildAState;
      final List<Override> overrides = <Override>[
        ..._buildOverrides(
          channelListState: guildAState,
          selectedChannelId: 'c1',
          unread: unread,
          activeGuildIdReader: (Ref ref) => harness.activeGuildId,
          channelListViewModelFactory: () =>
              _HarnessChannelListViewModel(harness),
        ),
        guildMuteProvider(_otherGuildId).overrideWith(
          (Ref ref) => Stream<GuildMuteState>.value(const GuildMuteState()),
        ),
        mutedChannelIdsProvider(_otherGuildId).overrideWith(
          (Ref ref) => Stream<Set<String>>.value(const <String>{}),
        ),
        guildCollapsedCategoriesProvider(_otherGuildId).overrideWith(
          (Ref ref) => Stream<Set<String>>.value(const <String>{}),
        ),
        for (final Channel channel in guildBChannels)
          channelUnreadProvider(channel.id).overrideWith(
            (Ref ref) => Stream<UnreadState>.value(const UnreadState()),
          ),
      ];
      final ProviderContainer container = ProviderContainer(
        overrides: overrides,
      );
      addTearDown(container.dispose);
      final colorTheme = buildDarkColorTheme();
      Future<void> pumpSidebar() async {
        await tester.pumpWidget(
          UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              localizationsDelegates:
                  FluxerLocalizations.localizationsDelegates,
              supportedLocales: FluxerLocalizations.supportedLocales,
              theme: buildFluxerTheme(
                colorTheme: colorTheme,
                textTheme: FluxerTextTheme.fromColors(colorTheme),
                layoutTheme: FluxerLayoutTheme.scaled(),
              ),
              home: const Scaffold(body: GuildSidebar()),
            ),
          ),
        );
        await tester.pumpAndSettle();
      }

      await pumpSidebar();
      await tester.scrollUntilVisible(
        find.text('channel-20'),
        100,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();
      expect(find.text('channel-20'), findsOneWidget);

      harness.activeGuildId = _otherGuildId;
      harness.channelListState = guildBState;
      container
        ..invalidate(activeGuildIdProvider)
        ..invalidate(channelListViewModelProvider);
      await pumpSidebar();
      expect(find.text('guild-b-1'), findsOneWidget);

      harness.activeGuildId = _guildId;
      harness.channelListState = guildAState;
      container
        ..invalidate(activeGuildIdProvider)
        ..invalidate(channelListViewModelProvider);
      await pumpSidebar();
      expect(find.text('channel-20'), findsOneWidget);
    });
  });

  group('GuildSidebar voice session isolation', () {
    testWidgets(
      'keeps text channels visible when voice session is connecting',
      (tester) async {
        _setMobileSurface(tester);
        final _MutableVoiceSession session = _MutableVoiceSession();
        await tester.pumpWidget(
          _buildTestApp(
            overrides: _buildOverrides(
              channelListState: _mixedChannelState(),
              unread: const {'c1': UnreadState(), 'voice-1': UnreadState()},
              voiceSessionFactory: () => session,
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text('general'), findsOneWidget);

        session.setSession(
          const VoiceSessionState(
            isConnecting: true,
            guildId: _guildId,
            channelId: 'voice-1',
            voiceServerEndpoint: 'wss://voice.example',
          ),
        );
        await tester.pump();

        expect(find.text('general'), findsOneWidget);
      },
    );
  });
}

void _setMobileSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

Channel _channel(String id, String name) =>
    Channel(id: id, guildId: _guildId, name: name, parentId: 'cat1');

Channel _linkChannel(String id, String name, String url) => Channel(
  id: id,
  guildId: _guildId,
  name: name,
  url: url,
  type: ChannelType.guildLink,
  parentId: 'cat1',
);

ChannelListState _state({String? selectedChannelId}) => ChannelListState(
  guild: const Guild(id: _guildId, name: 'Test Guild'),
  categories: [
    ChannelCategory(
      id: 'cat1',
      name: 'My Category',
      channels: [_channel('c1', 'general'), _channel('c2', 'random')],
    ),
  ],
  selectedChannelId: selectedChannelId,
);

ChannelListState _voiceChannelState() => const ChannelListState(
  guild: Guild(id: _guildId, name: 'Test Guild'),
  categories: [
    ChannelCategory(
      id: 'cat1',
      name: 'Voice',
      channels: [
        Channel(
          id: 'voice-1',
          guildId: _guildId,
          name: 'locked-voice',
          type: ChannelType.guildVoice,
          parentId: 'cat1',
        ),
      ],
    ),
  ],
  selectedChannelId: null,
);

ChannelListState _mixedChannelState() => ChannelListState(
  guild: const Guild(id: _guildId, name: 'Test Guild'),
  selectedChannelId: null,
  categories: [
    ChannelCategory(
      id: 'cat1',
      name: 'My Category',
      channels: [
        _channel('c1', 'general'),
        const Channel(
          id: 'voice-1',
          guildId: _guildId,
          name: 'voice-room',
          type: ChannelType.guildVoice,
          parentId: 'cat1',
        ),
      ],
    ),
  ],
);

List<Override> _buildOverrides({
  required ChannelListState channelListState,
  String? selectedChannelId,
  Set<String> collapsed = const {},
  Set<String> muted = const {},
  bool hideMuted = false,
  Map<String, UnreadState> unread = const {},
  Map<String, GuildReadStateEntry> guildReadState = const {},
  Map<String, int> permissionBits = const {},
  Map<String, int?> sidebarConnectBits = const {},
  bool developerMode = false,
  VoiceSession Function()? voiceSessionFactory,
  String? Function(Ref ref)? activeGuildIdReader,
  ChannelListViewModel Function()? channelListViewModelFactory,
}) {
  final db = openTestDatabase();
  return [
    fluxerDatabaseProvider.overrideWithValue(db),
    currentUserIdProvider.overrideWithValue('me'),
    if (activeGuildIdReader != null)
      activeGuildIdProvider.overrideWith(activeGuildIdReader)
    else
      activeGuildIdProvider.overrideWithValue(_guildId),
    activeChannelIdProvider.overrideWithValue(selectedChannelId),
    channelListViewModelProvider.overrideWith(
      channelListViewModelFactory ??
          () => _FakeChannelListViewModel(channelListState),
    ),
    appearancePreferencesProvider.overrideWith(_FakeAppearancePreferences.new),
    voiceSessionProvider.overrideWith(
      voiceSessionFactory ?? _FakeVoiceSession.new,
    ),
    userSettingsViewModelProvider.overrideWith(
      () => _FakeUserSettings(developerMode: developerMode),
    ),
    sensitiveContentProvider.overrideWith(_FakeSensitiveContent.new),
    matureContentAgreementsProvider.overrideWith(_FakeMatureAgreements.new),
    guildMuteProvider(_guildId).overrideWith(
      (ref) => Stream.value(GuildMuteState(hideMutedChannels: hideMuted)),
    ),
    mutedChannelIdsProvider(
      _guildId,
    ).overrideWith((ref) => Stream.value(muted)),
    guildCollapsedCategoriesProvider(
      _guildId,
    ).overrideWith((ref) => Stream.value(collapsed)),
    for (final Channel channel in channelListState.categories.expand<Channel>(
      (ChannelCategory category) => category.channels,
    )) ...[
      effectiveGuildChannelPermissionBitsProvider(
        channel.id,
      ).overrideWith((ref) => permissionBits[channel.id] ?? 0),
      if (sidebarConnectBits.containsKey(channel.id))
        channelSidebarIconConnectBitsProvider(
          channel.id,
        ).overrideWith((ref) => sidebarConnectBits[channel.id]),
    ],
    for (final entry in unread.entries)
      channelUnreadProvider(
        entry.key,
      ).overrideWith((ref) => Stream.value(entry.value)),
    guildReadStateProvider.overrideWithValue(guildReadState),
  ];
}

Widget _buildTestApp({required List<Override> overrides}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp.router(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      routerConfig: GoRouter(
        initialLocation: '/channels/$_guildId',
        routes: [
          GoRoute(
            path: '/channels/$_guildId',
            builder: (context, state) => const Scaffold(body: GuildSidebar()),
          ),
          GoRoute(
            path: '/channels/$_guildId/:channelId',
            builder: (context, state) => const Scaffold(body: GuildSidebar()),
          ),
        ],
      ),
    ),
  );
}

class _FakeChannelListViewModel extends ChannelListViewModel {
  _FakeChannelListViewModel(this._state);

  final ChannelListState _state;

  @override
  ChannelListState build() => _state;
}

class _HarnessChannelListViewModel extends ChannelListViewModel {
  _HarnessChannelListViewModel(this._harness);

  final _GuildSwitchTestHarness _harness;

  @override
  ChannelListState build() => _harness.channelListState;
}

class _FakeAppearancePreferences extends AppearancePreferences {
  @override
  AppearancePreferencesState build() =>
      const AppearancePreferencesState(showFavorites: false);
}

class _FakeVoiceSession extends VoiceSession {
  @override
  VoiceSessionState build() => const VoiceSessionState();
}

class _MutableVoiceSession extends VoiceSession {
  VoiceSessionState _sessionState = const VoiceSessionState();

  @override
  VoiceSessionState build() => _sessionState;

  void setSession(VoiceSessionState next) {
    _sessionState = next;
    state = next;
  }
}

class _FakeUserSettings extends UserSettingsViewModel {
  _FakeUserSettings({required this.developerMode});

  final bool developerMode;

  @override
  UserSettingsViewState build() => UserSettingsViewState(
    userId: 'me',
    username: '',
    displayName: '',
    discriminator: '0',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'offline',
    messageDisplayCompact: false,
    developerMode: developerMode,
    trustedDomains: const [],
  );
}

class _FakeSensitiveContent extends SensitiveContent {
  @override
  SensitiveContentState build() =>
      const SensitiveContentState(isLoading: false);
}

class _FakeMatureAgreements extends MatureContentAgreements {
  @override
  MatureContentAgreementsState build() =>
      const MatureContentAgreementsState(isLoaded: true);
}
