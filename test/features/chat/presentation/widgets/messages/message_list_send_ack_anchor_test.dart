import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' show Value;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/app_ui_lifecycle_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/data/ack_batcher.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/ack_batcher_provider.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/guild/guild_composer_access_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/instance_runtime_config_override.dart';
import '../../../../../helpers/message_realtime_test_helpers.dart';
import '../../../../../helpers/noop_guild_member_hydration_service.dart';
import '../../../../../helpers/open_test_database.dart';
import '../../../../../helpers/test_l10n.dart';

const String _channelId = 'channel-1';
const String _currentUserId = 'me';
const String _sentContent = 'ack-measurement-body';

String _snowflakeForUtc(DateTime utc) {
  final int internal = (utc.millisecondsSinceEpoch - kSnowflakeEpochMs) << 22;
  return internal.toString();
}

Map<String, Object?> _messageJson({
  required String id,
  required String channelId,
  required String authorId,
  String content = 'message',
  String? nonce,
}) => <String, Object?>{
  'id': id,
  'channel_id': channelId,
  'author': <String, Object?>{
    'id': authorId,
    'username': 'user-$authorId',
    'discriminator': '0001',
    'global_name': null,
    'avatar': null,
    'avatar_color': null,
    'flags': 0,
  },
  'type': 0,
  'flags': 0,
  'tts': false,
  'content': content,
  'timestamp': dateTimeFromUserSnowflakeOrNull(id)!.toIso8601String(),
  'pinned': false,
  'mention_everyone': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
  'nonce': ?nonce,
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'an acked own send keeps its rect because the renamed anchor is not treated as a delete',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(420, 640);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final DateTime historicalBase = DateTime.utc(2026, 6, 16, 12);
      final List<Map<String, Object?>> latestMessages = <Map<String, Object?>>[
        for (int i = 0; i < 12; i++)
          _messageJson(
            id: _snowflakeForUtc(historicalBase.add(Duration(minutes: i))),
            channelId: _channelId,
            authorId: 'other',
            content: 'historical $i',
          ),
      ];
      final String serverMessageId = _snowflakeForUtc(
        DateTime.now().toUtc().add(const Duration(days: 1)),
      );
      final _SendAdapter adapter = _SendAdapter(
        serverMessageId: serverMessageId,
        latestMessages: latestMessages,
      )..holdSend = true;
      final db.FluxerDatabase database = openTestDatabase();
      await database.channelDao.upsertChannel(
        db.ChannelsCompanion.insert(id: _channelId, guildId: '', name: 'dm'),
      );
      await database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: const Value<String>(_channelId),
          lastMessageId: Value<String?>(latestMessages.last['id']! as String),
        ),
      );

      final ProviderContainer container = _container(
        database,
        adapter,
        overrides: _messageListUiOverrides(),
      );
      addTearDown(() {
        adapter.releaseSend();
        container.dispose();
      });

      final ChatViewModel notifier = container.read(
        chatViewModelProvider.notifier,
      );

      await tester.pumpWidget(_messageListApp(container));
      await tester.pump();

      await tester.runAsync(() async {
        await notifier.switchChannel(_channelId);
      });
      expect(
        container.read(chatViewModelProvider).messages,
        isNotEmpty,
        reason: 'switchChannel never installed messages',
      );
      expect(container.read(chatViewModelProvider).isLoading, isFalse);
      for (int i = 0; i < 4; i++) {
        await tester.pump();
      }

      unawaited(notifier.sendMessage(text: _sentContent));
      var sentVisible = false;
      for (int i = 0; i < 20; i++) {
        await tester.pump();
        if (container
                .read(chatViewModelProvider)
                .messages
                .any((Message m) => m.content == _sentContent) &&
            tester.any(
              _tileKey(
                container
                    .read(chatViewModelProvider)
                    .messages
                    .lastWhere((Message m) => m.content == _sentContent)
                    .id,
              ),
            )) {
          sentVisible = true;
          break;
        }
        await _yieldEventLoop(tester);
      }
      expect(
        sentVisible,
        isTrue,
        reason: 'optimistic send never appeared in state or as a tile',
      );

      final Message optimistic = container
          .read(chatViewModelProvider)
          .messages
          .lastWhere((Message m) => m.content == _sentContent);
      expect(optimistic.id, optimistic.clientNonce);
      expect(_tileKey(optimistic.id), findsOneWidget);

      Rect? previousOptimisticRect;
      Rect? rectBefore;
      for (int i = 0; i < 20; i++) {
        await tester.pump();
        expect(_tileKey(optimistic.id), findsOneWidget);
        final Rect current = tester.getRect(_tileKey(optimistic.id));
        if (previousOptimisticRect != null &&
            current == previousOptimisticRect) {
          rectBefore = current;
          break;
        }
        previousOptimisticRect = current;
        await _yieldEventLoop(tester);
      }
      expect(
        rectBefore,
        isNotNull,
        reason: 'optimistic row never settled to a stable rect',
      );

      container
          .read(messageRealtimeBusProvider)
          .emit(
            testMessageCreated(
              MessageCreateEvent(
                message: MessageResponseSchema.fromJson(
                  _messageJson(
                    id: serverMessageId,
                    channelId: _channelId,
                    authorId: _currentUserId,
                    content: _sentContent,
                    nonce: optimistic.clientNonce,
                  ),
                ),
              ),
            ),
          );

      Rect? ackRect;
      var ackAppeared = false;
      for (int i = 0; i < 20; i++) {
        await tester.pump();
        final bool hasServerRow = container
            .read(chatViewModelProvider)
            .messages
            .any(
              (Message m) =>
                  m.content == _sentContent && m.id == serverMessageId,
            );
        if (hasServerRow && tester.any(_tileKey(serverMessageId))) {
          ackRect = tester.getRect(_tileKey(serverMessageId));
          ackAppeared = true;
          break;
        }
        await _yieldEventLoop(tester);
      }
      expect(
        ackAppeared,
        isTrue,
        reason:
            'acknowledged row never appeared: no message with '
            'id == serverMessageId and a findable tile',
      );
      expect(ackRect, isNotNull, reason: 'ack frame had no tile rect');
      expect(ackRect, rectBefore, reason: 'ack frame moved the sent row');
      expect(_tileKey(optimistic.id), findsNothing);
      expect(_tileKey(serverMessageId), findsOneWidget);

      for (int frame = 0; frame < 4; frame++) {
        await tester.pump();
      }
      final Rect rectSettled = tester.getRect(_tileKey(serverMessageId));
      expect(rectSettled, rectBefore, reason: 'settled frames moved the row');

      adapter.releaseSend();
      await tester.pump();
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump(const Duration(milliseconds: 1));
    },
  );
}

Finder _tileKey(String messageId) =>
    find.byKey(ValueKey<String>('msg-$messageId'));

Future<void> _emptyFuture() => Future<void>.value();

Future<void> _yieldEventLoop(WidgetTester tester) {
  return tester.runAsync(_emptyFuture);
}

List<Override> _messageListUiOverrides() {
  return <Override>[
    appStartupProvider.overrideWith(_IdleAppStartup.new),
    blockedUserIdsProvider.overrideWithValue(<String>{}),
    activeGuildIdProvider.overrideWithValue(null),
    channelListViewModelProvider.overrideWithValue(
      const ChannelListState(
        guild: null,
        categories: <ChannelCategory>[],
        selectedChannelId: _channelId,
      ),
    ),
    guildComposerAccessProvider(
      _channelId,
    ).overrideWith((Ref ref) => GuildComposerAccess.allowed),
    dmViewModelProvider.overrideWithValue(
      const DmViewState(
        conversations: <DmConversation>[],
        friendsList: <Friend>[],
        activeTab: FriendsTab.online,
        searchQuery: '',
      ),
    ),
    channelMessagePermissionsProvider(
      _channelId,
    ).overrideWith((ref) => ChannelMessagePermissions.all),
    themePreferenceProvider.overrideWithValue(ThemePreferenceState()),
    userSettingsViewModelProvider.overrideWithValue(
      const UserSettingsViewState(
        userId: _currentUserId,
        username: 'tester',
        displayName: 'Tester',
        discriminator: '0',
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
      ),
    ),
    chatPreferencesProvider.overrideWithValue(const ChatPreferencesState()),
    appearancePreferencesProvider.overrideWithValue(
      const AppearancePreferencesState(),
    ),
  ];
}

Widget _messageListApp(ProviderContainer container) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: const Scaffold(body: MessageList(expectedChannelId: _channelId)),
    ),
  );
}

ProviderContainer _container(
  db.FluxerDatabase database,
  _SendAdapter adapter, {
  List<Override> overrides = const <Override>[],
}) {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.fluxer.app/v1'))
    ..httpClientAdapter = adapter;
  final FluxerClient client = FluxerClient(
    dio,
    baseUrl: 'https://api.fluxer.app/v1',
  );
  return ProviderContainer(
    overrides: [
      instanceRuntimeConfigOverride(),
      fluxerDatabaseProvider.overrideWithValue(database),
      appUiForegroundProvider.overrideWithValue(true),
      fluxerDioProvider.overrideWithValue(dio),
      fluxerClientProvider.overrideWithValue(client),
      currentUserIdProvider.overrideWithValue(_currentUserId),
      ackBatcherProvider.overrideWith((ref) {
        final AckBatcher batcher = AckBatcher(
          client: client,
          batchDelay: Duration.zero,
        );
        ref.onDispose(() {
          unawaited(batcher.dispose());
        });
        return batcher;
      }),
      guildMemberHydrationServiceProvider.overrideWithValue(
        NoopGuildMemberHydrationService(database: database),
      ),
      ...overrides,
    ],
  );
}

class _SendAdapter implements HttpClientAdapter {
  _SendAdapter({
    required this.serverMessageId,
    this.latestMessages = const <Map<String, Object?>>[],
  });

  final String serverMessageId;
  final List<Map<String, Object?>> latestMessages;
  String? lastSentNonce;
  bool holdSend = false;
  Completer<void>? _sendCompleter;

  void releaseSend() {
    holdSend = false;
    final Completer<void>? completer = _sendCompleter;
    _sendCompleter = null;
    if (completer != null && !completer.isCompleted) {
      completer.complete();
    }
  }

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final String path = options.uri.path;
    final bool isMessages = RegExp(
      r'/channels/([^/]+)/messages$',
    ).hasMatch(path);
    if (options.method == 'GET' && isMessages) {
      return _json(latestMessages);
    }
    if (options.method == 'POST' && isMessages) {
      if (holdSend) {
        _sendCompleter ??= Completer<void>();
        await _sendCompleter!.future;
      }
      final String? raw = await _readRequestBody(requestStream, options.data);
      final Map<String, dynamic> body = raw == null || raw.isEmpty
          ? <String, dynamic>{}
          : jsonDecode(raw) as Map<String, dynamic>;
      lastSentNonce = body['nonce'] as String?;
      return _json(
        _messageJson(
          id: serverMessageId,
          channelId: _channelId,
          authorId: _currentUserId,
          content: body['content'] as String? ?? '',
          nonce: lastSentNonce,
        ),
      );
    }
    if (options.method == 'POST' &&
        (path.endsWith('/ack') ||
            path.endsWith('/read-states/ack') ||
            path.endsWith('/read-states/ack-bulk'))) {
      return ResponseBody.fromString('', 204, statusMessage: 'No Content');
    }
    return ResponseBody.fromString('Not found', 404);
  }

  ResponseBody _json(Object data) => ResponseBody.fromString(
    jsonEncode(data),
    200,
    headers: {
      Headers.contentTypeHeader: ['application/json'],
    },
  );

  @override
  void close({bool force = false}) {}
}

Future<String?> _readRequestBody(
  Stream<Uint8List>? requestStream,
  dynamic data,
) async {
  if (requestStream != null) {
    final chunks = await requestStream.toList();
    if (chunks.isEmpty) {
      return null;
    }
    final totalLength = chunks.fold<int>(0, (sum, c) => sum + c.length);
    final bytes = Uint8List(totalLength);
    var offset = 0;
    for (final chunk in chunks) {
      bytes.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }
    return utf8.decode(bytes);
  }
  if (data is String) {
    return data;
  }
  if (data is Map<String, dynamic>) {
    return jsonEncode(data);
  }
  return null;
}

class _IdleAppStartup extends AppStartup {
  @override
  Future<void> build() => Future<void>.value();
}
