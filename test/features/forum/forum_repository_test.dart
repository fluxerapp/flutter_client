import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart'
    show FluxerDatabase;
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/open_test_database.dart';

class _Adapter implements HttpClientAdapter {
  final List<RequestOptions> requests = <RequestOptions>[];
  final List<String> bodies = <String>[];
  int status = 200;
  Object body = <String, Object?>{};
  void Function()? onFetch;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    onFetch?.call();
    final List<int> sent = <int>[];
    if (requestStream != null) {
      await for (final Uint8List chunk in requestStream) {
        sent.addAll(chunk);
      }
    }
    bodies.add(utf8.decode(sent, allowMalformed: true));
    return ResponseBody.fromString(
      jsonEncode(body),
      status,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

Map<String, Object?> _thread(String id, {bool archived = false}) =>
    <String, Object?>{
      'id': id,
      'guild_id': 'g1',
      'parent_id': 'f1',
      'type': 11,
      'name': 'post $id',
      'flags': 0,
      'owner_id': 'u1',
      'message_count': 2,
      'member_count': 1,
      'applied_tags': <String>['t1'],
      'thread_metadata': <String, Object?>{
        'archived': archived,
        'auto_archive_duration': 4320,
        'archive_timestamp': '2026-09-27T00:00:00.000Z',
        'locked': false,
        'create_timestamp': '2026-09-27T00:00:00.000Z',
      },
    };

Map<String, Object?> _message(String id) => <String, Object?>{
  'id': id,
  'channel_id': id,
  'type': 0,
  'content': 'hello',
  'flags': 0,
  'timestamp': '2026-09-27T00:00:00.000Z',
  'edited_timestamp': null,
  'pinned': false,
  'tts': false,
  'mention_everyone': false,
  'mentions': <Object?>[],
  'mention_roles': <Object?>[],
  'attachments': <Object?>[],
  'embeds': <Object?>[],
  'author': <String, Object?>{
    'id': 'u1',
    'username': 'someone',
    'discriminator': '0001',
    'global_name': null,
    'avatar': null,
    'avatar_color': null,
    'flags': 0,
  },
};

void main() {
  late _Adapter adapter;
  late FluxerDatabase db;
  late ThreadsGate gate;
  late ForumRepository repository;

  setUp(() {
    adapter = _Adapter();
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
      ..httpClientAdapter = adapter;
    db = openTestDatabase();
    gate = ThreadsGate();
    repository = ForumRepository(FluxerClient(dio), dio, db, gate);
  });

  test('nothing is sent while the guild is inactive', () async {
    await expectLater(
      repository.searchPosts(
        guildId: 'g1',
        forumId: 'f1',
        query: const ForumSearchQuery(archived: true),
      ),
      throwsA(isA<ThreadsInactiveException>()),
    );
    await expectLater(
      repository.createPost(
        guildId: 'g1',
        forumId: 'f1',
        draft: const ForumPostDraft(name: 'x', content: 'y'),
      ),
      throwsA(isA<ThreadsInactiveException>()),
    );
    expect(adapter.requests, isEmpty);
  });

  test('a gate flip during the request writes nothing', () async {
    gate.apply('g1', active: true);
    adapter
      ..body = _thread('p9')
      ..onFetch = () => gate.apply('g1', active: false);
    await expectLater(
      repository.updatePost(
        guildId: 'g1',
        postId: 'p9',
        patch: const <String, Object?>{'name': 'x'},
      ),
      throwsA(isA<ThreadsInactiveException>()),
    );
    expect(await db.channelDao.getChannelById('p9'), isNull);
  });

  test('a 202 reply asks the caller to retry', () async {
    gate.apply('g1', active: true);
    adapter
      ..status = 202
      ..body = <String, Object?>{
        'message': 'indexing',
        'code': 'SEARCH_INDEX_NOT_READY',
        'documents_indexed': 3,
        'retry_after': 4,
      };
    final ForumSearchOutcome outcome = await repository.searchPosts(
      guildId: 'g1',
      forumId: 'f1',
      query: const ForumSearchQuery(archived: true),
    );
    expect(outcome, isA<ForumSearchNotReady>());
    expect((outcome as ForumSearchNotReady).retryAfterSeconds, 4);
    final Uri uri = adapter.requests.single.uri;
    expect(uri.path, '/channels/f1/threads/search');
    expect(uri.queryParameters['archived'], 'true');
    expect(uri.queryParameters['sort_by'], 'last_message_time');
  });

  test('a search page stores posts, members and first messages', () async {
    gate.apply('g1', active: true);
    adapter.body = <String, Object?>{
      'threads': <Object?>[_thread('p1', archived: true), _thread('p2')],
      'members': <Object?>[
        <String, Object?>{
          'id': 'p2',
          'user_id': 'me',
          'join_timestamp': '2026-09-27T00:00:00.000Z',
          'flags': 0,
        },
      ],
      'has_more': true,
      'total_results': 2,
      'first_messages': <Object?>[_message('p1')],
    };
    final ForumSearchOutcome outcome = await repository.searchPosts(
      guildId: 'g1',
      forumId: 'f1',
      query: const ForumSearchQuery(
        name: 'bug',
        tagIds: <String>['t1', 't2'],
        tagMatch: ForumTagMatch.all,
      ),
    );
    final ForumSearchPage page = outcome as ForumSearchPage;
    expect(page.postIds, <String>['p1', 'p2']);
    expect(page.hasMore, isTrue);
    expect(page.firstMessages['p1']?.content, 'hello');
    expect((await db.channelDao.getChannelById('p1'))?.threadArchived, isTrue);
    expect(await db.threadDao.getJoinedThreadIds(), <String>{'p2'});
    final Uri uri = adapter.requests.single.uri;
    expect(uri.queryParameters['name'], 'bug');
    expect(uri.queryParameters['sort_by'], 'relevance');
    expect(uri.queryParameters['tag_setting'], 'match_all');
    expect(uri.queryParametersAll['tag'], <String>['t1', 't2']);
  });

  test('a disabled search index is reported, not thrown', () async {
    gate.apply('g1', active: true);
    adapter
      ..status = 403
      ..body = <String, Object?>{
        'code': 'FEATURE_TEMPORARILY_DISABLED',
        'message': 'off',
      };
    expect(
      await repository.searchPosts(
        guildId: 'g1',
        forumId: 'f1',
        query: const ForumSearchQuery(archived: true),
      ),
      isA<ForumSearchUnavailable>(),
    );
  });

  test('a post without files is JSON', () async {
    gate.apply('g1', active: true);
    adapter
      ..status = 201
      ..body = <String, Object?>{..._thread('p9'), 'message': _message('p9')};
    final ({String postId, Message? firstMessage}) created = await repository
        .createPost(
          guildId: 'g1',
          forumId: 'f1',
          draft: const ForumPostDraft(
            name: ' Title ',
            content: 'body',
            appliedTags: <String>['t1'],
          ),
        );
    expect(created.postId, 'p9');
    expect(created.firstMessage?.content, 'hello');
    expect(jsonDecode(adapter.bodies.single), <String, Object?>{
      'name': 'Title',
      'applied_tags': <String>['t1'],
      'message': <String, Object?>{'content': 'body'},
    });
    expect(await db.channelDao.getChannelById('p9'), isNotNull);
  });

  test('a post carries the forum default archive duration', () async {
    gate.apply('g1', active: true);
    adapter
      ..status = 201
      ..body = _thread('p9');
    await repository.createPost(
      guildId: 'g1',
      forumId: 'f1',
      draft: const ForumPostDraft(
        name: 'Title',
        content: 'body',
        autoArchiveDuration: 60,
      ),
    );
    expect(
      (jsonDecode(adapter.bodies.single)
          as Map<String, Object?>)['auto_archive_duration'],
      60,
    );
  });

  test('a post with files is multipart with payload_json', () async {
    gate.apply('g1', active: true);
    final Directory dir = await Directory.systemTemp.createTemp('forum');
    addTearDown(() => dir.delete(recursive: true));
    final File file = File('${dir.path}/cat.png')
      ..writeAsBytesSync(<int>[1, 2, 3]);
    adapter
      ..status = 201
      ..body = _thread('p9');
    await repository.createPost(
      guildId: 'g1',
      forumId: 'f1',
      draft: ForumPostDraft(
        name: 'Cat',
        content: '',
        files: <ComposerUploadFile>[composerUploadFile(XFile(file.path))],
      ),
    );
    final RequestOptions request = adapter.requests.single;
    expect(request.contentType, startsWith('multipart/form-data'));
    final String body = adapter.bodies.single;
    expect(body, contains('name="payload_json"'));
    expect(body, contains('name="files[0]"; filename="cat.png"'));
    expect(
      body,
      contains(
        jsonEncode(<String, Object?>{
          'name': 'Cat',
          'message': <String, Object?>{
            'attachments': <Object?>[
              <String, String>{
                'id': '0',
                'filename': 'cat.png',
                'title': 'cat.png',
              },
            ],
          },
        }),
      ),
    );
  });
}
