// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show ChannelsCompanion, FluxerDatabase, ServersCompanion;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/bookmarks/presentation/widgets/bookmarks_sheet.dart';
import 'package:fluxer_app/features/bookmarks/presentation/widgets/saved_messages_body.dart';
import 'package:fluxer_app/features/bookmarks/providers/saved_message_list_provider.dart';
import 'package:fluxer_app/features/bookmarks/providers/saved_messages_sync_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

const String _guildId = 'guild_1';
const String _channelId = 'chan_1';
const String _messageId = '1000000000000000000';
const String _targetPath = '/channels/$_guildId/$_channelId/$_messageId';

class _FetchedSavedMessagesSync extends SavedMessagesSyncNotifier {
  @override
  SavedMessagesSyncState build() => const SavedMessagesSyncState(fetched: true);
}

class _FakeUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: 'viewer',
    username: 'viewer',
    displayName: 'viewer',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
    renderEmbeds: false,
    renderReactions: false,
    inlineAttachmentMedia: false,
  );
}

void main() {
  late FluxerDatabase database;
  late GoRouter router;

  setUp(() async {
    database = openTestDatabase();
    await database.guildDao.upsertServer(
      ServersCompanion.insert(id: _guildId, name: 'Guild'),
    );
    await database.channelDao.upsertChannel(
      ChannelsCompanion.insert(
        id: _channelId,
        guildId: _guildId,
        name: 'general',
        type: const Value(0),
      ),
    );
    await database.messageDao.upsertMessage(
      Message(
        id: _messageId,
        channelId: _channelId,
        authorId: '123456789012345678',
        authorName: 'Webhook',
        webhookId: 'wh1',
        content: 'bookmarked',
        timestamp: DateTime.utc(2024),
      ).toCompanion(),
    );

    router = GoRouter(
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const SizedBox.shrink(),
        ),
        GoRoute(
          path: '/channels/:guildId/:channelId/:messageId',
          builder: (BuildContext context, GoRouterState state) =>
              const SizedBox.shrink(),
        ),
      ],
    );
    addTearDown(router.dispose);
  });

  Future<BuildContext> pumpHost(WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    late BuildContext host;
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          instanceRuntimeConfigOverride(),
          fluxerDatabaseProvider.overrideWithValue(database),
          fluxerRouterProvider.overrideWithValue(router),
          savedMessagesSyncProvider.overrideWith(_FetchedSavedMessagesSync.new),
          savedMessageIdsProvider.overrideWith(
            (Ref ref) => Stream<List<String>>.value(const <String>[_messageId]),
          ),
          isMessageSavedProvider(
            _messageId,
          ).overrideWith((Ref ref) => Stream<bool>.value(true)),
          chatPreferencesProvider.overrideWithValue(
            const ChatPreferencesState(),
          ),
          appearancePreferencesProvider.overrideWithValue(
            const AppearancePreferencesState(),
          ),
          userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
        ],
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Builder(
            builder: (BuildContext context) {
              host = context;
              return const Scaffold(body: Text('home'));
            },
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return host;
  }

  testWidgets('jumping to a bookmark dismisses the sheet', (
    WidgetTester tester,
  ) async {
    final BuildContext host = await pumpHost(tester);

    unawaited(BookmarksSheet.show(host));
    await tester.pumpAndSettle();

    expect(find.byType(SavedMessagesBody), findsOneWidget);
    expect(find.text(testL10n.quickSwitcherBookmarksLabel), findsOneWidget);

    final Finder jump = find.byTooltip(testL10n.notificationsJump);
    expect(jump, findsOneWidget);
    await tester.tap(jump);
    await tester.pumpAndSettle();

    expect(
      find.byType(SavedMessagesBody),
      findsNothing,
      reason: 'the bookmarks sheet must close so the jumped message is visible',
    );
    expect(
      router.routeInformationProvider.value.uri.path,
      _targetPath,
      reason: 'and the jump must actually have run',
    );

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });
}
