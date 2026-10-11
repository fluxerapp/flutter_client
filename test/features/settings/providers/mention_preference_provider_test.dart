import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart' hide isNull;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/settings/providers/mention_preference_provider.dart';
import 'package:fluxer_dart/export.dart';

import '../../../helpers/open_test_database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test(
    'setPreference saves the new mention flags for the stored current user',
    () async {
      final FluxerDatabase database = openTestDatabase();
      await database.userDao.upsertUser(
        const UsersCompanion(
          id: Value('me'),
          username: Value('me'),
          globalName: Value('Me'),
        ),
      );
      final _UserPatchAdapter adapter = _UserPatchAdapter();
      final ProviderContainer container = ProviderContainer(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(database),
          fluxerDioProvider.overrideWith(
            (Ref ref) =>
                Dio(BaseOptions(baseUrl: 'https://api.test'))
                  ..httpClientAdapter = adapter,
          ),
        ],
      );
      addTearDown(container.dispose);
      container.read(currentUserIdProvider.notifier).set('me');

      await container
          .read(mentionReplyPreferenceProvider.notifier)
          .setPreference(MentionReplyPreferences.preferNoMention);

      expect(adapter.body, <String, Object?>{
        'mention_flags': MentionReplyPreferences.preferNoMention.json,
      });
      final User? stored = await database.userDao.getUserById('me');
      expect(
        stored?.mentionFlags,
        MentionReplyPreferences.preferNoMention.json,
      );
      expect(stored?.username, 'me');
      expect(stored?.globalName, 'Me');
    },
  );
}

class _UserPatchAdapter implements HttpClientAdapter {
  Object? body;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    body = options.data;
    return ResponseBody.fromString(
      jsonEncode(<String, Object?>{
        'id': 'me',
        'username': 'me',
        'discriminator': '0001',
        'global_name': 'Me',
        'avatar': null,
        'flags': 0,
        'mention_flags': options.data is Map
            ? (options.data as Map)['mention_flags']
            : null,
      }),
      200,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
