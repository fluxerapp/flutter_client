import 'package:fluxer_app/core/database/fluxer_database.dart';

bool readStateCompanionMatchesPersisted(
  ReadState? existing,
  ReadStatesCompanion companion,
) {
  if (existing == null) {
    return false;
  }
  final String? lastMessageId = companion.lastMessageId.present
      ? companion.lastMessageId.value
      : existing.lastMessageId;
  final int mentionCount = companion.mentionCount.present
      ? companion.mentionCount.value
      : existing.mentionCount;
  final bool manual = companion.manual.present
      ? companion.manual.value
      : existing.manual;
  final String? sticky = companion.stickyUnreadMessageId.present
      ? companion.stickyUnreadMessageId.value
      : existing.stickyUnreadMessageId;
  final String? lastPinTimestamp = companion.lastPinTimestamp.present
      ? companion.lastPinTimestamp.value
      : existing.lastPinTimestamp;
  final String? version = companion.version.present
      ? companion.version.value
      : existing.version;
  final int? flags = companion.flags.present
      ? companion.flags.value
      : existing.flags;
  return existing.lastMessageId == lastMessageId &&
      existing.mentionCount == mentionCount &&
      existing.manual == manual &&
      existing.stickyUnreadMessageId == sticky &&
      existing.lastPinTimestamp == lastPinTimestamp &&
      existing.version == version &&
      existing.flags == flags;
}

Future<bool> upsertReadStateIfChanged(
  FluxerDatabase database,
  ReadStatesCompanion companion,
) async {
  final String channelId = companion.channelId.value;
  final ReadState? existing = await database.readStateDao.getReadState(
    channelId,
  );
  if (readStateCompanionMatchesPersisted(existing, companion)) {
    return false;
  }
  await database.readStateDao.upsertReadState(companion);
  return true;
}

Future<void> upsertReadStatesIfChanged(
  FluxerDatabase database,
  List<ReadStatesCompanion> companions,
) async {
  if (companions.isEmpty) {
    return;
  }
  for (final ReadStatesCompanion companion in companions) {
    await upsertReadStateIfChanged(database, companion);
  }
}
