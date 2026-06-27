import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
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
import 'package:fluxer_app/features/channels/providers/channel_sidebar_icon_connect_bits_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/guild_collapsed_categories_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_mute_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

const String _guildId = 'g1';

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
    testWidgets('channel menu shows copy and notification actions', (
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

      expect(find.text('Copy Link'), findsOneWidget);
      expect(find.text('Copy Channel ID'), findsOneWidget);
      expect(find.text('Notification Settings'), findsOneWidget);
      expect(find.text('Open Link'), findsNothing);
      expect(find.text('Debug Channel'), findsNothing);
      expect(find.text('Delete Channel'), findsNothing);

      // Order must mirror the web channel menu:
      // Mark as Read -> Copy Link -> Mute -> Notification Settings -> Copy ID.
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Mark as Read'), lessThan(dy('Copy Link')));
      expect(dy('Copy Link'), lessThan(dy('Mute Channel')));
      expect(dy('Mute Channel'), lessThan(dy('Notification Settings')));
      expect(dy('Notification Settings'), lessThan(dy('Copy Channel ID')));
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

      expect(find.text('Delete Channel'), findsOneWidget);
      // Delete is the final, destructive entry (after Copy Channel ID).
      double dy(String label) => tester.getTopLeft(find.text(label)).dy;
      expect(dy('Copy Channel ID'), lessThan(dy('Delete Channel')));
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

      expect(find.text('Open Link'), findsOneWidget);
      expect(find.text('Copy Link'), findsOneWidget);
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
  type: ChannelType.link,
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
          type: ChannelType.voice,
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
          type: ChannelType.voice,
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
  Map<String, int> permissionBits = const {},
  Map<String, int?> sidebarConnectBits = const {},
  bool developerMode = false,
  VoiceSession Function()? voiceSessionFactory,
}) {
  final db = FluxerDatabase.forTesting(NativeDatabase.memory());
  addTearDown(db.close);
  return [
    fluxerDatabaseProvider.overrideWithValue(db),
    currentUserIdProvider.overrideWithValue('me'),
    activeGuildIdProvider.overrideWithValue(_guildId),
    activeChannelIdProvider.overrideWithValue(selectedChannelId),
    channelListViewModelProvider.overrideWith(
      () => _FakeChannelListViewModel(channelListState),
    ),
    appearancePreferencesProvider.overrideWith(_FakeAppearancePreferences.new),
    voiceSessionProvider.overrideWith(
      voiceSessionFactory ?? _FakeVoiceSession.new,
    ),
    userSettingsViewModelProvider.overrideWith(
      () => _FakeUserSettings(developerMode: developerMode),
    ),
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
        ).overrideWith((ref) async => sidebarConnectBits[channel.id]),
    ],
    for (final entry in unread.entries)
      channelUnreadProvider(
        entry.key,
      ).overrideWith((ref) => Stream.value(entry.value)),
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
