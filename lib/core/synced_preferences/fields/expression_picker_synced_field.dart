import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/daos/user_preferences_dao.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/fields/expression_picker_sync_helpers.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/pickers.pb.dart'
    as pickers_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/chat/providers/pickers/expression_picker_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class ExpressionPickerSyncedLocalState {
  const ExpressionPickerSyncedLocalState({
    required this.favoriteKeys,
    required this.collapsedCategoryIds,
  });

  final List<String> favoriteKeys;
  final List<String> collapsedCategoryIds;

  static const empty = ExpressionPickerSyncedLocalState(
    favoriteKeys: [],
    collapsedCategoryIds: [],
  );
}

typedef ExpressionPickerFavoriteKeyNormalizer =
    List<String> Function(Iterable<String> keys);

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

class _ExpressionPickerWireCodec {
  const _ExpressionPickerWireCodec({
    required this.hasField,
    required this.readWireSubMessage,
    required this.readFavoriteKeys,
    required this.readCollapsedCategories,
    required this.toProtoForPush,
  });

  final bool Function(pb.SyncedPreferences wire) hasField;
  final $pb.GeneratedMessage? Function(pb.SyncedPreferences wire)
  readWireSubMessage;
  final List<String> Function($pb.GeneratedMessage proto) readFavoriteKeys;
  final List<String> Function($pb.GeneratedMessage proto)
  readCollapsedCategories;
  final $pb.GeneratedMessage Function({
    required ExpressionPickerSyncedLocalState local,
    $pb.GeneratedMessage? wireBase,
  })
  toProtoForPush;
}

class _ExpressionPickerSyncedField
    extends SyncedFieldAdapter<ExpressionPickerSyncedLocalState> {
  _ExpressionPickerSyncedField(
    this._ref, {
    required this.field,
    required this._favoriteKeyNormalizer,
    required this._persistence,
    required this._wireCodec,
  });

  final Ref _ref;
  @override
  final SyncedPreferenceField field;
  final ExpressionPickerFavoriteKeyNormalizer _favoriteKeyNormalizer;
  final _ExpressionPickerPersistence _persistence;
  final _ExpressionPickerWireCodec _wireCodec;

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
    _persistence.invalidateProviders(_ref);
  }

  @override
  ExpressionPickerSyncedLocalState? readFromProto(
    pb.SyncedPreferences message,
  ) {
    if (!_wireCodec.hasField(message)) {
      return null;
    }
    final wireSubMessage = _wireCodec.readWireSubMessage(message);
    if (wireSubMessage == null) {
      return null;
    }
    return _fromWireSubMessage(wireSubMessage);
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) {
    return _wireCodec.readWireSubMessage(wire);
  }

  @override
  $pb.GeneratedMessage toProtoMessage(ExpressionPickerSyncedLocalState local) {
    return _wireCodec.toProtoForPush(local: _normalize(local));
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    ExpressionPickerSyncedLocalState local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return _wireCodec.toProtoForPush(
      local: _normalize(local),
      wireBase: wireSubMessage,
    );
  }

  @override
  bool statesEqual(
    ExpressionPickerSyncedLocalState a,
    ExpressionPickerSyncedLocalState b,
  ) {
    final left = _normalize(a);
    final right = _normalize(b);
    return expressionPickerStringListsEqual(
          left.favoriteKeys,
          right.favoriteKeys,
        ) &&
        expressionPickerStringListsEqual(
          left.collapsedCategoryIds,
          right.collapsedCategoryIds,
        );
  }

  @override
  ExpressionPickerSyncedLocalState mergeForMigration({
    required ExpressionPickerSyncedLocalState local,
    required ExpressionPickerSyncedLocalState remote,
  }) {
    final normalizedLocal = _normalize(local);
    final normalizedRemote = _normalize(remote);
    return _normalize(
      ExpressionPickerSyncedLocalState(
        favoriteKeys: mergeExpressionPickerStringLists(
          remote: normalizedRemote.favoriteKeys,
          local: normalizedLocal.favoriteKeys,
        ),
        collapsedCategoryIds: mergeExpressionPickerStringLists(
          remote: normalizedRemote.collapsedCategoryIds,
          local: normalizedLocal.collapsedCategoryIds,
          maxItems: kMaxSyncedCollapsedPickerCategories,
        ),
      ),
    );
  }

  @override
  bool verifyRoundtrip(ExpressionPickerSyncedLocalState candidate) {
    final normalized = _normalize(candidate);
    final wireSubMessage = _wireCodec.toProtoForPush(local: normalized);
    final roundtripped = _fromWireSubMessage(wireSubMessage);
    return statesEqual(normalized, roundtripped);
  }

  @override
  bool hasLocalData(ExpressionPickerSyncedLocalState local) {
    final normalized = _normalize(local);
    return normalized.favoriteKeys.isNotEmpty ||
        normalized.collapsedCategoryIds.isNotEmpty;
  }

  @override
  bool hasRemoteData(ExpressionPickerSyncedLocalState remote) {
    return true;
  }

  @override
  bool hasRemoteAdditions(
    ExpressionPickerSyncedLocalState local,
    ExpressionPickerSyncedLocalState remote,
  ) {
    final normalizedLocal = _normalize(local);
    final normalizedRemote = _normalize(remote);
    return _hasRemoteListAdditions(
          normalizedLocal.favoriteKeys,
          normalizedRemote.favoriteKeys,
        ) ||
        _hasRemoteListAdditions(
          normalizedLocal.collapsedCategoryIds,
          normalizedRemote.collapsedCategoryIds,
        );
  }

  ExpressionPickerSyncedLocalState _normalize(
    ExpressionPickerSyncedLocalState state,
  ) {
    return ExpressionPickerSyncedLocalState(
      favoriteKeys: _favoriteKeyNormalizer(state.favoriteKeys),
      collapsedCategoryIds: normalizeExpressionPickerStringList(
        state.collapsedCategoryIds,
        maxItems: kMaxSyncedCollapsedPickerCategories,
      ),
    );
  }

  ExpressionPickerSyncedLocalState _fromWireSubMessage(
    $pb.GeneratedMessage wireSubMessage,
  ) {
    return _normalize(
      ExpressionPickerSyncedLocalState(
        favoriteKeys: _wireCodec.readFavoriteKeys(wireSubMessage),
        collapsedCategoryIds: _wireCodec.readCollapsedCategories(
          wireSubMessage,
        ),
      ),
    );
  }

  static bool _hasRemoteListAdditions(List<String> local, List<String> remote) {
    return remote.toSet().difference(local.toSet()).isNotEmpty;
  }
}

class EmojiPickerSyncedField extends _ExpressionPickerSyncedField {
  EmojiPickerSyncedField(super._ref)
    : super(
        field: SyncedPreferenceField.emojiPicker,
        favoriteKeyNormalizer: normalizeExpressionPickerStringList,
        persistence: _emojiPersistence,
        wireCodec: _emojiWireCodec,
      );

  static pickers_pb.EmojiPickerState toProtoForPush({
    required ExpressionPickerSyncedLocalState local,
    pickers_pb.EmojiPickerState? wireBase,
  }) {
    return _toEmojiProtoForPush(
      local: normalizeExpressionPickerSyncedState(
        local,
        favoriteKeyNormalizer: normalizeExpressionPickerStringList,
      ),
      wireBase: wireBase,
    );
  }
}

class StickerPickerSyncedField extends _ExpressionPickerSyncedField {
  StickerPickerSyncedField(super._ref)
    : super(
        field: SyncedPreferenceField.stickerPicker,
        favoriteKeyNormalizer: normalizeStickerFavoriteKeys,
        persistence: _stickerPersistence,
        wireCodec: _stickerWireCodec,
      );
}

ExpressionPickerSyncedLocalState normalizeExpressionPickerSyncedState(
  ExpressionPickerSyncedLocalState state, {
  required ExpressionPickerFavoriteKeyNormalizer favoriteKeyNormalizer,
}) {
  return ExpressionPickerSyncedLocalState(
    favoriteKeys: favoriteKeyNormalizer(state.favoriteKeys),
    collapsedCategoryIds: normalizeExpressionPickerStringList(
      state.collapsedCategoryIds,
      maxItems: kMaxSyncedCollapsedPickerCategories,
    ),
  );
}

final _emojiPersistence = _ExpressionPickerPersistence(
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
);

final _stickerPersistence = _ExpressionPickerPersistence(
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
);

final _emojiWireCodec = _ExpressionPickerWireCodec(
  hasField: (wire) => wire.hasEmojiPicker(),
  readWireSubMessage: (wire) => wire.hasEmojiPicker() ? wire.emojiPicker : null,
  readFavoriteKeys: (proto) =>
      (proto as pickers_pb.EmojiPickerState).favoriteEmojiIds,
  readCollapsedCategories: (proto) =>
      (proto as pickers_pb.EmojiPickerState).collapsedCategoryIds,
  toProtoForPush:
      ({
        required ExpressionPickerSyncedLocalState local,
        $pb.GeneratedMessage? wireBase,
      }) => _toEmojiProtoForPush(
        local: local,
        wireBase: wireBase as pickers_pb.EmojiPickerState?,
      ),
);

final _stickerWireCodec = _ExpressionPickerWireCodec(
  hasField: (wire) => wire.hasStickerPicker(),
  readWireSubMessage: (wire) =>
      wire.hasStickerPicker() ? wire.stickerPicker : null,
  readFavoriteKeys: (proto) =>
      (proto as pickers_pb.StickerPickerState).favoriteStickerIds,
  readCollapsedCategories: (proto) =>
      (proto as pickers_pb.StickerPickerState).collapsedCategoryIds,
  toProtoForPush:
      ({
        required ExpressionPickerSyncedLocalState local,
        $pb.GeneratedMessage? wireBase,
      }) => _toStickerProtoForPush(
        local: local,
        wireBase: wireBase as pickers_pb.StickerPickerState?,
      ),
);

pickers_pb.EmojiPickerState _toEmojiProtoForPush({
  required ExpressionPickerSyncedLocalState local,
  pickers_pb.EmojiPickerState? wireBase,
}) {
  final proto = mergeOrCreate(wireBase, pickers_pb.EmojiPickerState.new);
  proto.favoriteEmojiIds
    ..clear()
    ..addAll(local.favoriteKeys);
  proto.collapsedCategoryIds
    ..clear()
    ..addAll(local.collapsedCategoryIds);
  return proto;
}

pickers_pb.StickerPickerState _toStickerProtoForPush({
  required ExpressionPickerSyncedLocalState local,
  pickers_pb.StickerPickerState? wireBase,
}) {
  final proto = mergeOrCreate(wireBase, pickers_pb.StickerPickerState.new);
  proto.favoriteStickerIds
    ..clear()
    ..addAll(local.favoriteKeys);
  proto.collapsedCategoryIds
    ..clear()
    ..addAll(local.collapsedCategoryIds);
  return proto;
}
