import 'dart:async';
import 'dart:typed_data';

import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_state.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_expressions_repository_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_repository_provider.dart';
import 'package:fluxer_app/features/settings/utils/expression_image_optimizer.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_search_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_sticker_settings_provider.g.dart';

const Duration _kSearchDebounce = Duration(milliseconds: 300);

@riverpod
class GuildStickerSettings extends _$GuildStickerSettings {
  Timer? _searchDebounce;

  @override
  Future<GuildStickerSettingsState> build(String guildId) {
    ref.onDispose(() => _searchDebounce?.cancel());
    return _loadState();
  }

  void setSearchQuery(String query) {
    final GuildStickerSettingsState? current = state.value;
    if (current == null) {
      return;
    }
    state = AsyncData<GuildStickerSettingsState>(
      current.copyWith(searchQuery: query),
    );
    _searchDebounce?.cancel();
    _searchDebounce = Timer(_kSearchDebounce, () {
      final GuildStickerSettingsState? latest = state.value;
      if (latest == null) {
        return;
      }
      final List<int> indices = filterGuildStickerIndices(
        latest.stickers,
        query,
      );
      state = AsyncData<GuildStickerSettingsState>(
        latest.copyWith(debouncedSearchQuery: query, filteredIndices: indices),
      );
    });
  }

  void setDensity(GuildStickerDensity density) {
    final GuildStickerSettingsState? current = state.value;
    if (current == null) {
      return;
    }
    state = AsyncData<GuildStickerSettingsState>(
      current.copyWith(density: density),
    );
  }

  Future<void> reload() async {
    state = const AsyncLoading<GuildStickerSettingsState>();
    state = AsyncData<GuildStickerSettingsState>(await _loadState());
  }

  Future<GuildStickerSettingsEntry> createSticker({
    required String name,
    required String description,
    required List<String> tags,
    required Uint8List imageBytes,
    required int maxSizeBytes,
  }) async {
    final GuildStickerSettingsState? current = state.value;
    if (current == null || current.isSavingSticker) {
      throw StateError('Sticker settings not ready');
    }
    state = AsyncData<GuildStickerSettingsState>(
      current.copyWith(isSavingSticker: true),
    );
    try {
      final String image = await optimizeGuildStickerImage(
        bytes: imageBytes,
        maxSizeBytes: maxSizeBytes,
      );
      final GuildStickerSettingsEntry created = await ref
          .read(guildExpressionsRepositoryProvider)
          .createSticker(
            guildId: guildId,
            body: GuildStickerCreateRequest(
              name: name,
              description: description.isEmpty ? null : description,
              tags: tags.isEmpty ? null : tags,
              image: image,
            ),
          );
      final List<GuildStickerSettingsEntry> stickers =
          List<GuildStickerSettingsEntry>.from(current.stickers)
            ..insert(0, created);
      final List<int> indices = filterGuildStickerIndices(
        stickers,
        current.debouncedSearchQuery,
      );
      state = AsyncData<GuildStickerSettingsState>(
        current.copyWith(
          stickers: stickers,
          filteredIndices: indices,
          isSavingSticker: false,
        ),
      );
      return created;
    } on Object {
      state = AsyncData<GuildStickerSettingsState>(
        current.copyWith(isSavingSticker: false),
      );
      rethrow;
    }
  }

  Future<GuildStickerSettingsEntry> updateSticker({
    required String stickerId,
    required String name,
    required String description,
    required List<String> tags,
  }) async {
    final GuildStickerSettingsState? current = state.value;
    if (current == null || current.isSavingSticker) {
      throw StateError('Sticker settings not ready');
    }
    state = AsyncData<GuildStickerSettingsState>(
      current.copyWith(isSavingSticker: true),
    );
    try {
      final GuildStickerSettingsEntry updated = await ref
          .read(guildExpressionsRepositoryProvider)
          .updateSticker(
            guildId: guildId,
            stickerId: stickerId,
            body: GuildStickerUpdateRequest(
              name: name,
              description: description.isEmpty ? null : description,
              tags: tags,
            ),
          );
      final List<GuildStickerSettingsEntry> stickers = current.stickers
          .map(
            (GuildStickerSettingsEntry entry) =>
                entry.id == stickerId ? updated : entry,
          )
          .toList(growable: false);
      final List<int> indices = filterGuildStickerIndices(
        stickers,
        current.debouncedSearchQuery,
      );
      state = AsyncData<GuildStickerSettingsState>(
        current.copyWith(
          stickers: stickers,
          filteredIndices: indices,
          isSavingSticker: false,
        ),
      );
      return updated;
    } on Object {
      state = AsyncData<GuildStickerSettingsState>(
        current.copyWith(isSavingSticker: false),
      );
      rethrow;
    }
  }

  Future<void> deleteSticker({
    required String stickerId,
    bool purge = false,
  }) async {
    final GuildStickerSettingsState? current = state.value;
    if (current == null || current.deletingStickerId != null) {
      return;
    }
    state = AsyncData<GuildStickerSettingsState>(
      current.copyWith(deletingStickerId: stickerId),
    );
    try {
      await ref
          .read(guildExpressionsRepositoryProvider)
          .deleteSticker(guildId: guildId, stickerId: stickerId, purge: purge);
      final List<GuildStickerSettingsEntry> stickers = current.stickers
          .where((GuildStickerSettingsEntry entry) => entry.id != stickerId)
          .toList();
      final List<int> indices = filterGuildStickerIndices(
        stickers,
        current.debouncedSearchQuery,
      );
      state = AsyncData<GuildStickerSettingsState>(
        current.copyWith(
          stickers: stickers,
          filteredIndices: indices,
          clearDeletingStickerId: true,
        ),
      );
    } on Object {
      state = AsyncData<GuildStickerSettingsState>(
        current.copyWith(clearDeletingStickerId: true),
      );
      rethrow;
    }
  }

  Future<void> toggleCloneAllowed({
    required List<String> currentFeatures,
    required bool allowed,
  }) async {
    final List<String> updatedFeatures = setGuildFeatureEnabled(
      features: currentFeatures,
      feature: GuildFeatures.cloneStickerDisabled,
      enabled: !allowed,
    );
    final List<String>? featuresUpdate = buildGuildFeaturesUpdate(
      original: currentFeatures,
      updated: updatedFeatures,
    );
    if (featuresUpdate == null) {
      return;
    }
    await ref
        .read(guildSettingsRepositoryProvider)
        .updateGuild(
          guildId: guildId,
          body: GuildUpdateRequest(features: featuresUpdate),
        );
    await ref.read(guildRepositoryProvider).getServer(guildId);
    ref.invalidate(guildByIdProvider(guildId));
  }

  Future<GuildStickerSettingsState> _loadState() async {
    try {
      final List<GuildStickerSettingsEntry> stickers =
          List<GuildStickerSettingsEntry>.from(
            await ref
                .read(guildExpressionsRepositoryProvider)
                .listStickers(guildId),
          )..sort(
            (GuildStickerSettingsEntry left, GuildStickerSettingsEntry right) =>
                compareGuildExpressionEntriesByIdDesc(left.id, right.id),
          );
      final List<int> indices = filterGuildStickerIndices(stickers, '');
      return GuildStickerSettingsState(
        loadStatus: GuildStickerSettingsLoadStatus.success,
        stickers: stickers,
        searchQuery: '',
        debouncedSearchQuery: '',
        filteredIndices: indices,
        density: GuildStickerDensity.cozy,
      );
    } on Object {
      return const GuildStickerSettingsState(
        loadStatus: GuildStickerSettingsLoadStatus.error,
        stickers: <GuildStickerSettingsEntry>[],
        searchQuery: '',
        debouncedSearchQuery: '',
        filteredIndices: <int>[],
        density: GuildStickerDensity.cozy,
      );
    }
  }
}
