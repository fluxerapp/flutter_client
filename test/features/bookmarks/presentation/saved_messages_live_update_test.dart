// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show ChannelsCompanion, FluxerDatabase, ServersCompanion;
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/bookmarks/domain/saved_messages.dart';
import 'package:fluxer_app/features/bookmarks/presentation/widgets/saved_messages_body.dart';
import 'package:fluxer_app/features/bookmarks/providers/saved_messages_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/instance_runtime_config_override.dart';
import '../../../helpers/noop_guild_member_hydration_service.dart';
import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

const String _guildId = 'guild_1';
const String _channelId = 'chan_1';
const String _existingId = '1000000000000000000';
const String _incomingId = '2000000000000000000';

class _SeededSavedMessages extends SavedMessagesNotifier {
  _SeededSavedMessages(this._initial);

  final SavedMessagesState _initial;

  @override
  SavedMessagesState build() {
    super.build();
    return _initial;
  }
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

Message _localMessage({required String id, required String content}) {
  return Message(
    id: id,
    channelId: _channelId,
    authorId: '123456789012345678',
    authorName: 'Webhook',
    webhookId: 'wh1',
    content: content,
    timestamp: DateTime.utc(2024),
  );
}

MessageResponseSchema _schema({
  required String id,
  required String content,
  DateTime? editedTimestamp,
}) {
  return MessageResponseSchema(
    id: id,
    channelId: _channelId,
    author: const UserPartialResponse(
      id: '300',
      username: 'desktop-user',
      discriminator: '0001',
      globalName: null,
      avatar: null,
      avatarColor: null,
      flags: 0,
    ),
    type: MessageResponseSchemaTypeType.valueDefault,
    flags: 0,
    content: content,
    timestamp: DateTime.utc(2026, 1, 2),
    editedTimestamp: editedTimestamp,
    pinned: false,
    mentionEveryone: false,
    tts: false,
    mentions: const [],
    mentionRoles: const [],
  );
}

void main() {
  late FluxerDatabase database;

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
      _localMessage(id: _existingId, content: 'already saved').toCompanion(),
    );
    await database.savedMessageDao.addSavedMessage(_existingId);
  });

  Future<void> pumpBody(WidgetTester tester) async {
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: <Override>[
          instanceRuntimeConfigOverride(),
          fluxerDatabaseProvider.overrideWithValue(database),
          guildMemberHydrationServiceProvider.overrideWithValue(
            NoopGuildMemberHydrationService(database: database),
          ),
          savedMessagesProvider.overrideWith(
            () => _SeededSavedMessages(
              SavedMessagesState(
                fetched: true,
                hasMore: false,
                messages: <Message>[
                  _localMessage(id: _existingId, content: 'already saved'),
                ],
              ),
            ),
          ),
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
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: const Scaffold(body: SavedMessagesBody()),
        ),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets('a live bookmark from another client renders its content', (
    WidgetTester tester,
  ) async {
    await pumpBody(tester);

    expect(find.text('general'), findsOneWidget);
    expect(find.text(testL10n.notificationsMessageUnavailable), findsNothing);

    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(SavedMessagesBody)),
    );
    await GatewayEventHandler(
      database: database,
      onSavedMessageCreate: container
          .read(savedMessagesProvider.notifier)
          .handleSavedCreate,
    ).handle(
      SavedMessageCreateEvent(
        message: _schema(id: _incomingId, content: 'from desktop'),
      ),
    );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('general'), findsNWidgets(2));
    expect(find.text(testL10n.notificationsMessageUnavailable), findsNothing);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });

  testWidgets('an edit from another client updates an open bookmark list', (
    WidgetTester tester,
  ) async {
    await pumpBody(tester);

    expect(
      tester.widget<MessageItem>(find.byType(MessageItem)).message.content,
      'already saved',
    );

    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(SavedMessagesBody)),
    );
    container
        .read(messageRealtimeBusProvider)
        .emit(
          MessageUpdated(
            MessageUpdateEvent(
              message: _schema(
                id: _existingId,
                content: 'edited on desktop',
                editedTimestamp: DateTime.utc(2026, 1, 3),
              ),
            ),
          ),
        );
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1));

    expect(
      tester.widget<MessageItem>(find.byType(MessageItem)).message.content,
      'edited on desktop',
    );

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump(const Duration(milliseconds: 1));
  });
}
