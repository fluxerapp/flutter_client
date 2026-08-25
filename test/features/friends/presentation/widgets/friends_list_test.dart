import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/presentation/widgets/friends_list.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/wide_layout_test_sizes.dart';

const Friend _alice = Friend(
  id: '200',
  username: 'alice',
  globalName: 'Alice',
  discriminator: '0001',
  status: 'online',
  friendStatus: FriendStatus.accepted,
);

void main() {
  testWidgets('FriendsList chat button opens DM for friend', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = kWideTestViewportSize;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
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
    final _SpyDmRepository repository = _SpyDmRepository(
      container.read(fluxerClientProvider),
      db,
      container.read(guildUserSettingsRepositoryProvider),
    );
    final GoRouter router = GoRouter(
      initialLocation: '/friends',
      routes: <RouteBase>[
        GoRoute(
          path: '/friends',
          builder: (BuildContext context, GoRouterState state) {
            return const Scaffold(body: FriendsList());
          },
        ),
        GoRoute(
          path: '/channels/@me/:channelId',
          builder: (BuildContext context, GoRouterState state) {
            return const SizedBox.shrink();
          },
        ),
      ],
    );
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          fluxerRouterProvider.overrideWithValue(router),
          fluxerDatabaseProvider.overrideWithValue(db),
          dmRepositoryProvider.overrideWithValue(repository),
          userPresenceProvider(
            '200',
          ).overrideWith((Ref ref) => Stream.value(null)),
          matureContentGateReasonProvider('dm-channel-1').overrideWith(
            (Ref ref) => Future.value(MatureContentGateReason.none),
          ),
          dmViewModelProvider.overrideWith(
            () => _StaticDmViewModel(
              const DmViewState(
                conversations: <DmConversation>[],
                friendsList: <Friend>[_alice],
                activeTab: FriendsTab.online,
                searchQuery: '',
              ),
            ),
          ),
          appearancePreferencesProvider.overrideWith(
            _DefaultAppearancePreferences.new,
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
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Alice'), findsOneWidget);
    await tester.tap(
      find.byWidgetPredicate(
        (Widget widget) =>
            widget is PhosphorIcon &&
            widget.icon == PhosphorIconsFill.chatCircle,
      ),
    );
    await tester.pumpAndSettle();

    expect(repository.lastEnsureUserId, '200');
  });
}

class _StaticDmViewModel extends DmViewModel {
  _StaticDmViewModel(this._state);

  final DmViewState _state;

  @override
  DmViewState build() => _state;
}

class _DefaultAppearancePreferences extends AppearancePreferences {
  @override
  AppearancePreferencesState build() => const AppearancePreferencesState();
}

class _SpyDmRepository extends DmRepository {
  _SpyDmRepository(
    super._client,
    super._db,
    super._guildUserSettingsRepository,
  );

  String? lastEnsureUserId;

  @override
  Future<String> ensureDmChannel(String userId) async {
    lastEnsureUserId = userId;
    return 'dm-channel-1';
  }
}
