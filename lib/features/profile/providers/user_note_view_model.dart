import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_note_view_model.g.dart';

@riverpod
class UserNoteViewModel extends _$UserNoteViewModel {
  @override
  Stream<String?> build({required String userId}) {
    final database = ref.watch(fluxerDatabaseProvider);
    return database.userNotesDao.watchNote(userId).map((row) => row?.content);
  }

  Future<void> save(String content) async {
    final String trimmed = content.trim();
    if (trimmed.isEmpty) {
      return delete();
    }
    final FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final UserNotesTableData? previous = await database.userNotesDao.getNote(
      userId,
    );
    await database.userNotesDao.upsertNote(
      UserNotesTableCompanion.insert(targetUserId: userId, content: trimmed),
    );
    try {
      await ref
          .read(fluxerClientProvider)
          .users
          .setNoteOnUser(
            targetId: userId,
            body: UserNoteUpdateRequest(note: JsonNullable.of(trimmed)),
          );
    } on Object catch (error, stackTrace) {
      talker.error('[UserNoteViewModel] Save note failed', error, stackTrace);
      await _restoreNote(database, previous);
      rethrow;
    }
  }

  Future<void> delete() async {
    final FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final UserNotesTableData? previous = await database.userNotesDao.getNote(
      userId,
    );
    await database.userNotesDao.deleteNote(userId);
    try {
      await ref
          .read(fluxerClientProvider)
          .users
          .setNoteOnUser(
            targetId: userId,
            body: UserNoteUpdateRequest(note: const JsonNullable.of('')),
          );
    } on Object catch (error, stackTrace) {
      talker.error('[UserNoteViewModel] Delete note failed', error, stackTrace);
      await _restoreNote(database, previous);
      rethrow;
    }
  }

  Future<void> _restoreNote(
    FluxerDatabase database,
    UserNotesTableData? previous,
  ) async {
    if (previous == null) {
      await database.userNotesDao.deleteNote(userId);
      return;
    }
    await database.userNotesDao.upsertNote(
      UserNotesTableCompanion.insert(
        targetUserId: userId,
        content: previous.content,
      ),
    );
  }
}
