import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_skeleton.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_references_provider.dart';
import 'package:fluxer_app/features/threads/presentation/thread_messages.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/instance_runtime_config_override.dart';
import '../../helpers/message_item_test_overrides.dart';
import '../../helpers/open_test_database.dart';
import '../../helpers/test_l10n.dart';

const String _parentId = '1500';
const String _sourceId = '1600';
const String _threadId = '1700';
const String _embedTitle = '[fluxer:main] 1 new commit';
const String _embedBody = 'make the channel welcome line generic';

Map<String, Object?> _author() => <String, Object?>{
  'id': '42',
  'username': 'fullest',
  'discriminator': '0001',
  'global_name': 'Fullest',
  'avatar': null,
  'avatar_color': null,
  'flags': 0,
};

Map<String, Object?> _embed() => <String, Object?>{
  'type': 'rich',
  'title': _embedTitle,
  'description': _embedBody,
};

Map<String, Object?> _sourceJson({required bool forward}) => <String, Object?>{
  'id': _sourceId,
  'channel_id': _parentId,
  'author': _author(),
  'type': 0,
  'flags': 0,
  'content': '',
  'timestamp': DateTime.utc(2026, 10, 14, 12, 12).toIso8601String(),
  'pinned': false,
  'mention_everyone': false,
  'tts': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
  'embeds': forward ? <Object?>[] : <Object?>[_embed()],
  if (forward)
    'message_reference': <String, Object?>{
      'channel_id': '900',
      'message_id': '901',
      'guild_id': '800',
      'type': 1,
    },
  if (forward)
    'message_snapshots': <Object?>[
      <String, Object?>{
        'type': 0,
        'flags': 0,
        'content': '',
        'timestamp': DateTime.utc(2026, 10, 14, 12).toIso8601String(),
        'embeds': <Object?>[_embed()],
      },
    ],
};

Message _starter() => Message(
  id: _threadId,
  channelId: _threadId,
  authorId: '42',
  authorName: 'Fullest',
  content: '',
  timestamp: DateTime.utc(2026, 10, 14, 12, 23),
  type: messageTypeThreadStarterMessage,
  messageReference: const MessageReference(
    channelId: _parentId,
    messageId: _sourceId,
    type: MessageReferenceType.valueDefault,
  ),
);

Message _referencedSource({required bool forward}) => Message.fromReferencedSdk(
  MessageResponseSchemaReferencedMessage.fromJson(
    _sourceJson(forward: forward),
  ),
);

class _ScriptedMessageRepository extends MessageRepository {
  _ScriptedMessageRepository(FluxerDatabase database)
    : super(FluxerClient(Dio()), Dio(), database, null);

  final List<Completer<Message>> calls = <Completer<Message>>[];

  @override
  Future<Message> fetchMessage({
    required String channelId,
    required String messageId,
  }) {
    final Completer<Message> completer = Completer<Message>();
    calls.add(completer);
    return completer.future;
  }
}

late FluxerDatabase _database;
late _ScriptedMessageRepository _repository;
late ProviderContainer _container;

Widget _app() {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: _container,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: ThreadStarterMessage(message: _starter(), guildId: '800'),
        ),
      ),
    ),
  );
}

Finder _text(String value) => find.textContaining(value, findRichText: true);

void main() {
  setUp(() {
    _database = openTestDatabase();
    _repository = _ScriptedMessageRepository(_database);
    _container = ProviderContainer(
      overrides: [
        fluxerDatabaseProvider.overrideWithValue(_database),
        messageRepositoryProvider.overrideWithValue(_repository),
        instanceRuntimeConfigOverride(),
        ...messageItemTestProviderOverrides(),
      ],
    );
  });

  tearDown(() => _container.dispose());

  test('referenced messages keep the forward reference and snapshots', () {
    final Message source = _referencedSource(forward: true);
    expect(source.isForwarded, isTrue);
    expect(source.messageSnapshots.single.embeds.single.title, _embedTitle);
  });

  messageItemTestWidgets(
    'a thread started from a forward shows the forwarded embed',
    (tester) async {
      _container
          .read(messageReferencesProvider.notifier)
          .onMessagesLoaded(
            channelId: _threadId,
            messages: <Message>[_starter()],
            embeddedReplyParents: <Message>[_referencedSource(forward: true)],
          );
      await tester.pumpWidget(_app());
      await tester.pump();

      expect(_text(_embedTitle), findsOneWidget);
      expect(_text(_embedBody), findsOneWidget);
      expect(find.byType(MessageSkeletonRow), findsNothing);
      expect(_repository.calls, isEmpty);
    },
  );

  messageItemTestWidgets(
    'a thread started from an embed-only message shows the embed',
    (tester) async {
      _container
          .read(messageReferencesProvider.notifier)
          .onMessagesLoaded(
            channelId: _threadId,
            messages: <Message>[_starter()],
            embeddedReplyParents: <Message>[_referencedSource(forward: false)],
          );
      await tester.pumpWidget(_app());
      await tester.pump();

      expect(_text(_embedTitle), findsOneWidget);
      expect(_text(_embedBody), findsOneWidget);
    },
  );

  messageItemTestWidgets(
    'a cached copy without snapshots is replaced by the full message',
    (tester) async {
      final MessageReferencesNotifier notifier = _container.read(
        messageReferencesProvider.notifier,
      );
      final Message full = _referencedSource(forward: true);
      notifier
        ..seed(full.copyWith(messageSnapshots: const <MessageSnapshot>[]))
        ..seed(full);
      await tester.pumpWidget(_app());
      await tester.pump();

      expect(_text(_embedTitle), findsOneWidget);
    },
  );

  messageItemTestWidgets(
    'a slow starter fetch shows a placeholder, then the starter',
    (tester) async {
      await tester.pumpWidget(_app());
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageSkeletonRow), findsOneWidget);
      expect(_repository.calls, hasLength(1));

      await tester.pump(const Duration(seconds: 5));
      expect(find.byType(MessageSkeletonRow), findsOneWidget);

      _repository.calls.single.complete(
        Message.fromSdk(
          MessageResponseSchema.fromJson(_sourceJson(forward: true)),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageSkeletonRow), findsNothing);
      expect(_text(_embedTitle), findsOneWidget);
    },
  );

  messageItemTestWidgets(
    'a failed starter fetch retries with backoff and then fills in',
    (tester) async {
      await tester.pumpWidget(_app());
      await tester.pump();
      await tester.pump();
      expect(_repository.calls, hasLength(1));

      _repository.calls.first.completeError(
        DioException(
          requestOptions: RequestOptions(),
          type: DioExceptionType.connectionTimeout,
        ),
      );
      await tester.pump();
      expect(find.byType(MessageSkeletonRow), findsOneWidget);

      await tester.pump(const Duration(milliseconds: 900));
      expect(_repository.calls, hasLength(1));

      await tester.pump(const Duration(milliseconds: 200));
      await tester.pump();
      expect(_repository.calls, hasLength(2));

      _repository.calls.last.complete(
        Message.fromSdk(
          MessageResponseSchema.fromJson(_sourceJson(forward: true)),
        ),
      );
      await tester.pump();
      await tester.pump();

      expect(find.byType(MessageSkeletonRow), findsNothing);
      expect(_text(_embedTitle), findsOneWidget);
    },
  );
}
