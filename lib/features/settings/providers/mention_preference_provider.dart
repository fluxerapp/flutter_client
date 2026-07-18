import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/utils/mention_reply_preference_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mention_preference_provider.g.dart';

@riverpod
class MentionReplyPreference extends _$MentionReplyPreference {
  @override
  Stream<MentionReplyPreferences> build() async* {
    final String? userId = ref.watch(currentUserIdProvider);
    if (userId == null) {
      yield MentionReplyPreferences.noPreference;
      return;
    }
    final FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
    await for (final User? user in database.userDao.watchUserById(userId)) {
      yield mentionFlagsFromDb(user?.mentionFlags) ??
          MentionReplyPreferences.noPreference;
    }
  }

  Future<void> setPreference(MentionReplyPreferences preference) async {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final dio = ref.read(fluxerDioProvider);
    await dio.patch<dynamic>(
      '/users/@me',
      data: <String, Object?>{'mention_flags': preference.json},
    );
    final User? existing = await database.userDao.getUserById(userId);
    if (existing == null) {
      return;
    }
    await database.userDao.upsertUser(
      UsersCompanion(id: Value(userId), mentionFlags: Value(preference.json)),
    );
  }
}
