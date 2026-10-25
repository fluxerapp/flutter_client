import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/daos/user_preferences_dao.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/expression_picker_sync_helpers.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/core/synced_preferences/usage_frecency.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/expression_usage_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

const Duration kExpressionPickerPushDebounce = Duration(milliseconds: 1500);

class ExpressionPickerSyncedLocalState {
  const ExpressionPickerSyncedLocalState({
    required this.favoriteKeys,
    required this.collapsedCategoryIds,
    this.usage = const <String, UsageEntry>{},
  });

  final List<String> favoriteKeys;
  final List<String> collapsedCategoryIds;
  final Map<String, UsageEntry> usage;

  static const empty = ExpressionPickerSyncedLocalState(
    favoriteKeys: [],
    collapsedCategoryIds: [],
  );
}

class _ExpressionPickerPersistence {
  const _ExpressionPickerPersistence({
    required this.readFavoriteKeys,
    required this.writeFavoriteKeys,
    required this.readCollapsedCategories,
    required this.writeCollapsedCategories,
    required this.invalidateProviders,
  });

  final Future<List<String>> Function(UserPreferencesDao dao, String userId)
  readFavoriteKeys;
  final Future<void> Function(
    UserPreferencesDao dao,
    String userId,
    List<String> keys,
  )
  writeFavoriteKeys;
  final Future<List<String>> Function(UserPreferencesDao dao, String userId)
  readCollapsedCategories;
  final Future<void> Function(
    UserPreferencesDao dao,
    String userId,
    List<String> categories,
  )
  writeCollapsedCategories;
  final void Function(Ref ref) invalidateProviders;
}

typedef _ProtoLists = ({
  List<String> favorites,
  List<String> collapsed,
  Map<String, pickers_pb.UsageStat> usage,
});

class _ExpressionPickerWireCodec {
  const _ExpressionPickerWireCodec({
    required this.hasField,
    required this.read,
    required this.create,
    required this.lists,
  });

  final bool Function(pb.SyncedPreferences wire) hasField;
  final $pb.GeneratedMessage Function(pb.SyncedPreferences wire) read;
  final $pb.GeneratedMessage Function() create;
  final _ProtoLists Function($pb.GeneratedMessage proto) lists;
}

class _ExpressionPickerSyncedField
    extends SyncedFieldAdapter<ExpressionPickerSyncedLocalState> {
  _ExpressionPickerSyncedField(
    this._ref, {
    required this.usageKind,
    required this._favoriteKeyNormalizer,
    required this._persistence,
    required this._wireCodec,
  });

  final Ref _ref;
  final ExpressionUsageKind usageKind;
  final List<String> Function(Iterable<String> keys) _favoriteKeyNormalizer;
  final _ExpressionPickerPersistence _persistence;
  final _ExpressionPickerWireCodec _wireCodec;

  @override
  SyncedPreferenceField get field => usageKind.field;

  @override
  Duration get pushDebounce => kExpressionPickerPushDebounce;

  @override
  bool get keepsUnpushedEditsAcrossLaunches => true;

  @override
  ExpressionPickerSyncedLocalState readLocal() {
    throw UnsupportedError('Use readLocalValue for expression pickers');
  }

  @override
  Future<ExpressionPickerSyncedLocalState> readLocalValue() async {
    final userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return ExpressionPickerSyncedLocalState.empty;
    }
    final dao = _ref.read(fluxerDatabaseProvider).userPreferencesDao;
    return _normalize(
      ExpressionPickerSyncedLocalState(
        favoriteKeys: await _persistence.readFavoriteKeys(dao, userId),
        collapsedCategoryIds: await _persistence.readCollapsedCategories(
          dao,
          userId,
        ),
        usage: await usageKind.read(dao, userId),
      ),
    );
  }

  @override
  Future<void> applyRemote(ExpressionPickerSyncedLocalState value) async {
    final userId = _ref.read(currentUserIdProvider);
    if (userId == null) {
      return;
    }
    final normalized = _normalize(value);
    final dao = _ref.read(fluxerDatabaseProvider).userPreferencesDao;
    await _persistence.writeFavoriteKeys(dao, userId, normalized.favoriteKeys);
    await _persistence.writeCollapsedCategories(
      dao,
      userId,
      normalized.collapsedCategoryIds,
    );
    await usageKind.write(dao, userId, normalized.usage);
    _persistence.invalidateProviders(_ref);
    _ref.invalidate(expressionUsageProvider(usageKind));
  }

  @override
  ExpressionPickerSyncedLocalState? readFromProto(
    pb.SyncedPreferences message,
  ) {
    if (!_wireCodec.hasField(message)) {
      return null;
    }
    return _fromProto(_wireCodec.read(message));
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) {
    return _wireCodec.hasField(wire) ? _wireCodec.read(wire) : null;
  }

  @override
  $pb.GeneratedMessage toProtoMessage(ExpressionPickerSyncedLocalState local) {
    return _toProto(_normalize(local), _wireCodec.create());
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    ExpressionPickerSyncedLocalState local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    final proto = _wireCodec.create();
    if (wireSubMessage != null) {
      proto.mergeFromMessage(wireSubMessage);
    }
    return _toProto(_normalize(local), proto);
  }

  @override
  bool statesEqual(
    ExpressionPickerSyncedLocalState a,
    ExpressionPickerSyncedLocalState b,
  ) {
    final int nowMs = DateTime.now().millisecondsSinceEpoch;
    final left = _normalize(a, nowMs: nowMs);
    final right = _normalize(b, nowMs: nowMs);
    return expressionPickerStringListsEqual(
          left.favoriteKeys,
          right.favoriteKeys,
        ) &&
        expressionPickerStringListsEqual(
          left.collapsedCategoryIds,
          right.collapsedCategoryIds,
        ) &&
        usageMapsEqual(left.usage, right.usage);
  }

  @override
  ExpressionPickerSyncedLocalState mergeRemote({
    required ExpressionPickerSyncedLocalState local,
    required ExpressionPickerSyncedLocalState remote,
  }) {
    return ExpressionPickerSyncedLocalState(
      favoriteKeys: remote.favoriteKeys,
      collapsedCategoryIds: remote.collapsedCategoryIds,
      usage: _mergeUsage(local, remote),
    );
  }

  @override
  ExpressionPickerSyncedLocalState mergeForMigration({
    required ExpressionPickerSyncedLocalState local,
    required ExpressionPickerSyncedLocalState remote,
  }) {
    return ExpressionPickerSyncedLocalState(
      favoriteKeys: local.favoriteKeys,
      collapsedCategoryIds: local.collapsedCategoryIds,
      usage: _mergeUsage(local, remote),
    );
  }

  @override
  ExpressionPickerSyncedLocalState mergeProtectedInbound({
    required ExpressionPickerSyncedLocalState local,
    required ExpressionPickerSyncedLocalState remote,
    required ExpressionPickerSyncedLocalState? baseline,
  }) {
    final ExpressionPickerSyncedLocalState base =
        baseline ?? ExpressionPickerSyncedLocalState.empty;
    return _normalize(
      ExpressionPickerSyncedLocalState(
        favoriteKeys: mergeExpressionPickerListsThreeWay(
          local: local.favoriteKeys,
          remote: remote.favoriteKeys,
          baseline: base.favoriteKeys,
        ),
        collapsedCategoryIds: mergeExpressionPickerListsThreeWay(
          local: local.collapsedCategoryIds,
          remote: remote.collapsedCategoryIds,
          baseline: base.collapsedCategoryIds,
        ),
        usage: _mergeUsage(local, remote),
      ),
    );
  }

  @override
  bool hasInboundUpdatesWhileProtected(
    ExpressionPickerSyncedLocalState local,
    ExpressionPickerSyncedLocalState remote,
  ) => true;

  @override
  bool verifyRoundtrip(ExpressionPickerSyncedLocalState candidate) {
    final normalized = _normalize(candidate);
    return statesEqual(
      normalized,
      _fromProto(_toProto(normalized, _wireCodec.create())),
    );
  }

  @override
  bool hasLocalData(ExpressionPickerSyncedLocalState local) {
    final normalized = _normalize(local);
    return normalized.favoriteKeys.isNotEmpty ||
        normalized.collapsedCategoryIds.isNotEmpty ||
        normalized.usage.isNotEmpty;
  }

  @override
  ExpressionPickerSyncedLocalState? clearedRemoteValue() {
    return ExpressionPickerSyncedLocalState.empty;
  }

  Map<String, UsageEntry> _mergeUsage(
    ExpressionPickerSyncedLocalState local,
    ExpressionPickerSyncedLocalState remote,
  ) {
    final int nowMs = DateTime.now().millisecondsSinceEpoch;
    return usageKind.sanitize(
      mergeUsageMaps(local.usage, remote.usage, nowMs),
      nowMs,
    );
  }

  ExpressionPickerSyncedLocalState _normalize(
    ExpressionPickerSyncedLocalState state, {
    int? nowMs,
  }) {
    return ExpressionPickerSyncedLocalState(
      favoriteKeys: _favoriteKeyNormalizer(state.favoriteKeys),
      collapsedCategoryIds: normalizeCollapsedPickerCategoryIds(
        state.collapsedCategoryIds,
      ),
      usage: usageKind.sanitize(
        state.usage,
        nowMs ?? DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  ExpressionPickerSyncedLocalState _fromProto($pb.GeneratedMessage proto) {
    final lists = _wireCodec.lists(proto);
    return _normalize(
      ExpressionPickerSyncedLocalState(
        favoriteKeys: lists.favorites,
        collapsedCategoryIds: lists.collapsed,
        usage: usageMapFromWire(lists.usage),
      ),
    );
  }

  $pb.GeneratedMessage _toProto(
    ExpressionPickerSyncedLocalState local,
    $pb.GeneratedMessage proto,
  ) {
    final lists = _wireCodec.lists(proto);
    lists.favorites
      ..clear()
      ..addAll(local.favoriteKeys);
    lists.collapsed
      ..clear()
      ..addAll(local.collapsedCategoryIds);
    writeUsageMapToWire(lists.usage, local.usage);
    return proto;
  }
}

class EmojiPickerSyncedField extends _ExpressionPickerSyncedField {
  EmojiPickerSyncedField(super._ref)
    : super(
        usageKind: ExpressionUsageKind.emoji,
        favoriteKeyNormalizer: normalizeExpressionPickerStringList,
        persistence: _ExpressionPickerPersistence(
          readFavoriteKeys: (dao, userId) => dao.getFavoriteEmojiKeys(userId),
          writeFavoriteKeys: (dao, userId, keys) =>
              dao.setFavoriteEmojiKeys(userId, keys),
          readCollapsedCategories: (dao, userId) =>
              dao.getCollapsedEmojiPickerCategories(userId),
          writeCollapsedCategories: (dao, userId, categories) =>
              dao.setCollapsedEmojiPickerCategories(userId, categories),
          invalidateProviders: (ref) => ref
            ..invalidate(favoriteEmojiKeysProvider)
            ..invalidate(collapsedEmojiPickerCategoriesProvider),
        ),
        wireCodec: _ExpressionPickerWireCodec(
          hasField: (wire) => wire.hasEmojiPicker(),
          read: (wire) => wire.emojiPicker,
          create: pickers_pb.EmojiPickerState.new,
          lists: (proto) => switch (proto as pickers_pb.EmojiPickerState) {
            final state => (
              favorites: state.favoriteEmojiIds,
              collapsed: state.collapsedCategoryIds,
              usage: state.usage,
            ),
          },
        ),
      );
}

class StickerPickerSyncedField extends _ExpressionPickerSyncedField {
  StickerPickerSyncedField(super._ref)
    : super(
        usageKind: ExpressionUsageKind.sticker,
        favoriteKeyNormalizer: normalizeStickerFavoriteKeys,
        persistence: _ExpressionPickerPersistence(
          readFavoriteKeys: (dao, userId) => dao.getFavoriteStickerKeys(userId),
          writeFavoriteKeys: (dao, userId, keys) =>
              dao.setFavoriteStickerKeys(userId, keys),
          readCollapsedCategories: (dao, userId) =>
              dao.getCollapsedStickerPickerCategories(userId),
          writeCollapsedCategories: (dao, userId, categories) =>
              dao.setCollapsedStickerPickerCategories(userId, categories),
          invalidateProviders: (ref) => ref
            ..invalidate(favoriteStickerKeysProvider)
            ..invalidate(collapsedStickerPickerCategoriesProvider),
        ),
        wireCodec: _ExpressionPickerWireCodec(
          hasField: (wire) => wire.hasStickerPicker(),
          read: (wire) => wire.stickerPicker,
          create: pickers_pb.StickerPickerState.new,
          lists: (proto) => switch (proto as pickers_pb.StickerPickerState) {
            final state => (
              favorites: state.favoriteStickerIds,
              collapsed: state.collapsedCategoryIds,
              usage: state.usage,
            ),
          },
        ),
      );
}

class MemesPickerSyncedField extends _ExpressionPickerSyncedField {
  MemesPickerSyncedField(super._ref)
    : super(
        usageKind: ExpressionUsageKind.meme,
        favoriteKeyNormalizer: normalizeExpressionPickerStringList,
        persistence: _ExpressionPickerPersistence(
          readFavoriteKeys: (dao, userId) => dao.getFavoriteMemeIds(userId),
          writeFavoriteKeys: (dao, userId, ids) =>
              dao.setFavoriteMemeIds(userId, ids),
          readCollapsedCategories: (dao, userId) =>
              dao.getCollapsedMemePickerCategories(userId),
          writeCollapsedCategories: (dao, userId, categories) =>
              dao.setCollapsedMemePickerCategories(userId, categories),
          invalidateProviders: (_) {},
        ),
        wireCodec: _ExpressionPickerWireCodec(
          hasField: (wire) => wire.hasMemesPicker(),
          read: (wire) => wire.memesPicker,
          create: pickers_pb.MemesPickerState.new,
          lists: (proto) => switch (proto as pickers_pb.MemesPickerState) {
            final state => (
              favorites: state.favoriteMemeIds,
              collapsed: state.collapsedCategoryIds,
              usage: state.usage,
            ),
          },
        ),
      );
}
