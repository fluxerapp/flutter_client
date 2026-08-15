import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/sheets/create_dm_bottom_sheet.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_presence_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/open_test_database.dart';

void main() {
  group('Create DM flow', () {
    testWidgets('opens bottom sheet and lists friends', (tester) async {
      _setMobileSurface(tester);
      final _RecordingDmSetup setup = _createRecordingRepository();

      await tester.pumpWidget(
        _buildHarness(setup: setup, friends: _sampleFriends),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open create DM'));
      await tester.pumpAndSettle();

      expect(find.text('Select friends'), findsOneWidget);
      expect(find.text('Choose friends to message.'), findsOneWidget);
      expect(find.text('Alice'), findsOneWidget);
      expect(find.text('Bob'), findsOneWidget);
      expect(find.text('Create group DM'), findsOneWidget);
    });

    testWidgets('updates primary action label when selecting friends', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final _RecordingDmSetup setup = _createRecordingRepository();

      await tester.pumpWidget(
        _buildHarness(setup: setup, friends: _sampleFriends),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Open create DM'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Alice'));
      await tester.pumpAndSettle();
      expect(find.text('Create DM'), findsOneWidget);

      await tester.tap(find.text('Bob'));
      await tester.pumpAndSettle();
      expect(find.text('Create group DM'), findsOneWidget);
    });

    testWidgets('creates a one-to-one dm and closes without throwing', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final _RecordingDmSetup setup = _createRecordingRepository(
        createResult: 'existing-dm-channel',
      );

      await tester.pumpWidget(
        _buildHarness(setup: setup, friends: _sampleFriends),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Open create DM'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Alice'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Create DM'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
      expect(setup.repository.createCallCount, 1);
      expect(setup.repository.lastCreateSelection, <String>['200']);
      expect(find.text('Select friends'), findsNothing);
    });

    testWidgets('creates a group dm when two friends are selected', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final _RecordingDmSetup setup = _createRecordingRepository(
        createResult: 'new-group-channel',
      );

      await tester.pumpWidget(
        _buildHarness(setup: setup, friends: _sampleFriends),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Open create DM'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Alice'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Bob'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Create group DM'));
      await tester.pumpAndSettle();

      expect(setup.repository.createCallCount, 1);
      expect(setup.repository.lastCreateSelection, <String>['200', '300']);
      expect(find.text('Select friends'), findsNothing);
    });

    testWidgets('shows duplicate group confirmation before creating', (
      tester,
    ) async {
      _setMobileSurface(tester);
      final _RecordingDmSetup setup = _createRecordingRepository(
        createResult: 'duplicate-group-channel',
        duplicates: <DmConversation>[
          DmConversation(
            id: '900',
            type: 3,
            recipientId: '300',
            recipientName: 'Existing group',
            lastMessage: '',
            lastMessageTime: DateTime.utc(2026, 4, 2),
          ),
        ],
      );

      await tester.pumpWidget(
        _buildHarness(setup: setup, friends: _sampleFriends),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Open create DM'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Alice'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Bob'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Create group DM'));
      await tester.pumpAndSettle();

      expect(find.text('Confirm new group'), findsOneWidget);
      expect(
        find.text(
          "You already have a group with these users. Do you really want to create a new one? That's fine too!",
        ),
        findsOneWidget,
      );

      await tester.tap(find.text('Create new group'));
      await tester.pumpAndSettle();

      expect(setup.repository.createCallCount, 1);
      expect(setup.repository.lastCreateSelection, <String>['200', '300']);
    });

    testWidgets('shows verify-email restriction empty state', (tester) async {
      _setMobileSurface(tester);
      final _RecordingDmSetup setup = _createRecordingRepository();

      await tester.pumpWidget(
        _buildHarness(
          setup: setup,
          friends: _sampleFriends,
          settings: _unverifiedSettings,
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('Open create DM'));
      await tester.pumpAndSettle();

      expect(find.text('Verify your email'), findsOneWidget);
      expect(find.text('Verify your email to start DMs.'), findsOneWidget);
      expect(find.text('Alice'), findsNothing);
    });

    testWidgets('dm list fab opens create dm sheet on mobile', (tester) async {
      _setMobileSurface(tester);
      final _RecordingDmSetup setup = _createRecordingRepository();
      final GoRouter router = _buildRouter(home: const DMList());

      await tester.pumpWidget(
        _buildDmListHarness(
          router: router,
          setup: setup,
          friends: _sampleFriends,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.bySemanticsLabel('New message'));
      await tester.pumpAndSettle();

      expect(find.text('Select friends'), findsOneWidget);
      expect(find.text('Alice'), findsOneWidget);
    });
  });
}

const UserSettingsViewState _verifiedSettings = UserSettingsViewState(
  userId: '1',
  username: 'user',
  displayName: 'user',
  discriminator: '0001',
  avatar: null,
  avatarColor: null,
  memberSince: null,
  status: 'online',
  messageDisplayCompact: false,
  developerMode: false,
  trustedDomains: <String>[],
  email: 'user@example.com',
  verified: true,
);

const UserSettingsViewState _unverifiedSettings = UserSettingsViewState(
  userId: '1',
  username: 'user',
  displayName: 'user',
  discriminator: '0001',
  avatar: null,
  avatarColor: null,
  memberSince: null,
  status: 'online',
  messageDisplayCompact: false,
  developerMode: false,
  trustedDomains: <String>[],
  email: 'user@example.com',
  isProfileLoaded: true,
);

const List<Friend> _sampleFriends = <Friend>[
  Friend(
    id: '200',
    username: 'alice',
    globalName: 'Alice',
    friendStatus: FriendStatus.accepted,
    status: 'online',
  ),
  Friend(
    id: '300',
    username: 'bob',
    globalName: 'Bob',
    friendStatus: FriendStatus.accepted,
    status: 'online',
  ),
];

class _CreateDmLauncher extends StatelessWidget {
  const _CreateDmLauncher();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => CreateDmBottomSheet.show(context),
          child: const Text('Open create DM'),
        ),
      ),
    );
  }
}

class _RecordingDmRepository extends DmRepository {
  _RecordingDmRepository(
    super._client,
    super._db,
    super._guildUserSettingsRepository, {
    required this.createResult,
    this.duplicates = const <DmConversation>[],
  });

  final String createResult;
  final List<DmConversation> duplicates;
  int createCallCount = 0;
  List<String>? lastCreateSelection;

  @override
  Future<String> createDmFromSelection(List<String> userIds) async {
    createCallCount++;
    lastCreateSelection = List<String>.from(userIds);
    return createResult;
  }

  @override
  Future<List<DmConversation>> findDuplicateGroupDms(
    List<String> recipientIds, {
    String? excludeChannelId,
  }) async {
    return duplicates;
  }
}

typedef _RecordingDmSetup = ({
  _RecordingDmRepository repository,
  FluxerDatabase database,
});

_RecordingDmSetup _createRecordingRepository({
  String createResult = 'dm-channel',
  List<DmConversation> duplicates = const <DmConversation>[],
}) {
  final FluxerDatabase db = openTestDatabase();
  final ProviderContainer container = ProviderContainer(
    overrides: <Override>[
      fluxerDatabaseProvider.overrideWithValue(db),
      fluxerClientProvider.overrideWithValue(
        FluxerClient(Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))),
      ),
    ],
  );
  addTearDown(container.dispose);
  final _RecordingDmRepository repository = _RecordingDmRepository(
    container.read(fluxerClientProvider),
    db,
    container.read(guildUserSettingsRepositoryProvider),
    createResult: createResult,
    duplicates: duplicates,
  );
  return (repository: repository, database: db);
}

void _setMobileSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

GoRouter _buildRouter({required Widget home}) {
  return GoRouter(
    initialLocation: '/test',
    routes: <RouteBase>[
      GoRoute(
        path: '/test',
        builder: (BuildContext context, GoRouterState state) {
          return Scaffold(body: Center(child: home));
        },
      ),
      GoRoute(
        path: '/channels/@me',
        builder: (BuildContext context, GoRouterState state) {
          return const SizedBox.shrink();
        },
        routes: <RouteBase>[
          GoRoute(
            path: ':channelId',
            builder: (BuildContext context, GoRouterState state) {
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    ],
  );
}

List<Override> _userPresenceOverrides(Iterable<Friend> friends) {
  return <Override>[
    for (final Friend friend in friends)
      userPresenceProvider(
        friend.id,
      ).overrideWith((Ref ref) => Stream.value(null)),
  ];
}

List<Override> _buildOverrides({
  required FluxerDatabase database,
  required _RecordingDmRepository repository,
  required List<Friend> friends,
  UserSettingsViewState settings = _verifiedSettings,
  String gateChannelId = 'existing-dm-channel',
}) {
  return <Override>[
    fluxerDatabaseProvider.overrideWithValue(database),
    dmRepositoryProvider.overrideWithValue(repository),
    dmViewModelProvider.overrideWithValue(
      DmViewState(
        conversations: const <DmConversation>[],
        friendsList: friends,
        activeTab: FriendsTab.online,
        searchQuery: '',
      ),
    ),
    ..._userPresenceOverrides(friends),
    friendsListProvider.overrideWith((Ref ref) => Stream.value(friends)),
    userSettingsViewModelProvider.overrideWith(
      () => _StaticUserSettingsViewModel(settings),
    ),
    instanceLimitProvider(
      LimitKeys.maxGroupDmRecipients,
    ).overrideWith((Ref ref) => 49),
    matureContentGateReasonProvider(
      gateChannelId,
    ).overrideWith((Ref ref) => Future.value(MatureContentGateReason.none)),
    matureContentGateReasonProvider(
      'new-group-channel',
    ).overrideWith((Ref ref) => Future.value(MatureContentGateReason.none)),
    matureContentGateReasonProvider(
      'duplicate-group-channel',
    ).overrideWith((Ref ref) => Future.value(MatureContentGateReason.none)),
  ];
}

List<Override> _buildDmListOverrides({required List<Friend> friends}) {
  return <Override>[
    dmListRecipientRowDataProvider.overrideWith(
      (Ref ref) => Stream.value(const <String, DmListRecipientRowData>{}),
    ),
    appearancePreferencesProvider.overrideWith(
      _DefaultAppearancePreferences.new,
    ),
    pinnedDmChannelIdsProvider.overrideWith(
      (Ref ref) => Stream.value(const <String>{}),
    ),
    pinnedDmChannelOrderProvider.overrideWith(
      (Ref ref) => Stream.value(const <String>[]),
    ),
    mutedDmChannelIdsProvider.overrideWith(
      (Ref ref) => Stream.value(const <String>{}),
    ),
    pendingFriendRequestCountProvider.overrideWith(
      (Ref ref) => Stream.value(0),
    ),
    friendNicknameProvider.overrideWith(
      (Ref ref, String userId) => Stream.value(null),
    ),
    allChannelsProvider.overrideWith(
      (Ref ref) => Stream<List<Channel>>.value(const <Channel>[]),
    ),
    guildListViewModelProvider.overrideWith(_EmptyGuildListViewModel.new),
    favoriteChannelsProvider.overrideWith((Ref ref) => Stream.value(const [])),
    currentUserIdProvider.overrideWithValue('1'),
  ];
}

Widget _buildHarness({
  required _RecordingDmSetup setup,
  required List<Friend> friends,
  UserSettingsViewState settings = _verifiedSettings,
}) {
  final GoRouter router = _buildRouter(home: const _CreateDmLauncher());
  addTearDown(router.dispose);
  final colorTheme = buildDarkColorTheme();

  return ProviderScope(
    overrides: <Override>[
      fluxerRouterProvider.overrideWithValue(router),
      ..._buildOverrides(
        database: setup.database,
        repository: setup.repository,
        friends: friends,
        settings: settings,
      ),
    ],
    child: MaterialApp.router(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      routerConfig: router,
    ),
  );
}

Widget _buildDmListHarness({
  required GoRouter router,
  required _RecordingDmSetup setup,
  required List<Friend> friends,
}) {
  addTearDown(router.dispose);
  final colorTheme = buildDarkColorTheme();

  return ProviderScope(
    overrides: <Override>[
      fluxerRouterProvider.overrideWithValue(router),
      ..._buildOverrides(
        database: setup.database,
        repository: setup.repository,
        friends: friends,
      ),
      ..._buildDmListOverrides(friends: friends),
    ],
    child: MaterialApp.router(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      routerConfig: router,
    ),
  );
}

class _DefaultAppearancePreferences extends AppearancePreferences {
  @override
  AppearancePreferencesState build() => const AppearancePreferencesState();
}

class _EmptyGuildListViewModel extends GuildListViewModel {
  @override
  GuildListViewState build() => const GuildListViewState(guilds: <Guild>[]);
}

class _StaticUserSettingsViewModel extends UserSettingsViewModel {
  _StaticUserSettingsViewModel(this._settings);

  final UserSettingsViewState _settings;

  @override
  UserSettingsViewState build() => _settings;
}
