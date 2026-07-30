import 'dart:async';
import 'dart:typed_data';

import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/data/guild_expressions_repository.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_expression_uploader.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_expressions_repository_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_repository_provider.dart';
import 'package:fluxer_app/features/settings/utils/expression_image_optimizer.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_name_validation.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_search_utils.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_upload_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_emoji_settings_provider.g.dart';

const Duration _kSearchDebounce = Duration(milliseconds: 300);

class GuildEmojiUploadFailure {
  const GuildEmojiUploadFailure({required this.name, required this.error});

  final String name;
  final String error;
}

class GuildEmojiUploadResult {
  const GuildEmojiUploadResult({
    required this.uploaded,
    required this.failures,
  });

  final List<GuildEmojiSettingsEntry> uploaded;
  final List<GuildEmojiUploadFailure> failures;
}

@riverpod
class GuildEmojiSettings extends _$GuildEmojiSettings {
  Timer? _searchDebounce;

  @override
  Future<GuildEmojiSettingsState> build(String guildId) {
    ref.onDispose(() => _searchDebounce?.cancel());
    return _loadState();
  }

  void setSearchQuery(String query) {
    final GuildEmojiSettingsState? current = state.value;
    if (current == null) {
      return;
    }
    state = AsyncData<GuildEmojiSettingsState>(
      current.copyWith(searchQuery: query),
    );
    _searchDebounce?.cancel();
    _searchDebounce = Timer(_kSearchDebounce, () {
      final GuildEmojiSettingsState? latest = state.value;
      if (latest == null) {
        return;
      }
      final List<int> indices = filterGuildEmojiIndices(latest.emojis, query);
      state = AsyncData<GuildEmojiSettingsState>(
        latest.copyWith(debouncedSearchQuery: query, filteredIndices: indices),
      );
    });
  }

  Future<void> reload() async {
    state = const AsyncLoading<GuildEmojiSettingsState>();
    state = AsyncData<GuildEmojiSettingsState>(await _loadState());
  }

  Future<void> renameEmoji({
    required String emojiId,
    required String name,
  }) async {
    final GuildEmojiSettingsState? current = state.value;
    if (current == null || current.renamingEmojiId != null) {
      return;
    }
    state = AsyncData<GuildEmojiSettingsState>(
      current.copyWith(renamingEmojiId: emojiId),
    );
    try {
      await ref
          .read(guildExpressionsRepositoryProvider)
          .updateEmoji(guildId: guildId, emojiId: emojiId, name: name);
      final List<GuildEmojiSettingsEntry> updatedEmojis = current.emojis
          .map(
            (GuildEmojiSettingsEntry entry) => entry.id == emojiId
                ? GuildEmojiSettingsEntry(
                    id: entry.id,
                    name: name,
                    animated: entry.animated,
                    uploader: entry.uploader,
                  )
                : entry,
          )
          .toList(growable: false);
      final List<int> indices = filterGuildEmojiIndices(
        updatedEmojis,
        current.debouncedSearchQuery,
      );
      state = AsyncData<GuildEmojiSettingsState>(
        current.copyWith(
          emojis: updatedEmojis,
          filteredIndices: indices,
          clearRenamingEmojiId: true,
        ),
      );
    } on Object {
      state = AsyncData<GuildEmojiSettingsState>(
        current.copyWith(clearRenamingEmojiId: true),
      );
      rethrow;
    }
  }

  Future<void> deleteEmoji({
    required String emojiId,
    bool purge = false,
  }) async {
    final GuildEmojiSettingsState? current = state.value;
    if (current == null || current.deletingEmojiId != null) {
      return;
    }
    state = AsyncData<GuildEmojiSettingsState>(
      current.copyWith(deletingEmojiId: emojiId),
    );
    try {
      await ref
          .read(guildExpressionsRepositoryProvider)
          .deleteEmoji(guildId: guildId, emojiId: emojiId, purge: purge);
      final List<GuildEmojiSettingsEntry> updatedEmojis = current.emojis
          .where((GuildEmojiSettingsEntry entry) => entry.id != emojiId)
          .toList();
      final List<int> indices = filterGuildEmojiIndices(
        updatedEmojis,
        current.debouncedSearchQuery,
      );
      state = AsyncData<GuildEmojiSettingsState>(
        current.copyWith(
          emojis: updatedEmojis,
          filteredIndices: indices,
          clearDeletingEmojiId: true,
        ),
      );
    } on Object {
      state = AsyncData<GuildEmojiSettingsState>(
        current.copyWith(clearDeletingEmojiId: true),
      );
      rethrow;
    }
  }

  Future<GuildEmojiUploadResult> uploadFiles({
    required List<({String name, Uint8List bytes})> files,
    required int maxSizeBytes,
    required int maxEmojis,
  }) async {
    final GuildEmojiSettingsState? current = state.value;
    if (current == null || current.uploadingCount != null) {
      return const GuildEmojiUploadResult(
        uploaded: <GuildEmojiSettingsEntry>[],
        failures: <GuildEmojiUploadFailure>[],
      );
    }
    state = AsyncData<GuildEmojiSettingsState>(
      current.copyWith(uploadingCount: files.length),
    );
    final List<GuildEmojiUploadFailure> preparationFailures =
        <GuildEmojiUploadFailure>[];
    final List<GuildEmojiCreateRequest> requests = <GuildEmojiCreateRequest>[];
    final int availableSlots = maxEmojis < 0
        ? files.length
        : (maxEmojis - current.emojis.length).clamp(0, files.length);
    final List<({String name, Uint8List bytes})> filesToProcess = files
        .take(availableSlots)
        .toList(growable: false);
    for (int index = availableSlots; index < files.length; index++) {
      preparationFailures.add(
        GuildEmojiUploadFailure(name: files[index].name, error: 'slots_full'),
      );
    }
    for (final ({String name, Uint8List bytes}) file in filesToProcess) {
      try {
        final String image = await optimizeGuildEmojiImage(
          bytes: file.bytes,
          maxSizeBytes: maxSizeBytes,
        );
        final String emojiName = deriveGuildEmojiNameFromFileName(file.name);
        requests.add(GuildEmojiCreateRequest(name: emojiName, image: image));
      } on ExpressionImageOptimizationException catch (error) {
        preparationFailures.add(
          GuildEmojiUploadFailure(name: file.name, error: error.reason.name),
        );
      } on Object {
        preparationFailures.add(
          GuildEmojiUploadFailure(name: file.name, error: 'preparation_failed'),
        );
      }
    }
    final GuildExpressionsRepository repository = ref.read(
      guildExpressionsRepositoryProvider,
    );
    final List<GuildEmojiSettingsEntry> uploaded = <GuildEmojiSettingsEntry>[];
    final List<GuildEmojiUploadFailure> uploadFailures =
        <GuildEmojiUploadFailure>[];
    for (final List<GuildEmojiCreateRequest> chunk
        in chunkExpressionUploadBatch(requests)) {
      if (chunk.isEmpty) {
        continue;
      }
      try {
        final GuildEmojiBulkCreateResponse response = await repository
            .bulkCreateEmojis(guildId: guildId, emojis: chunk);
        for (final GuildEmojiResponse emoji in response.success) {
          uploaded.add(
            GuildEmojiSettingsEntry(
              id: emoji.id,
              name: emoji.name,
              animated: emoji.animated,
              uploader: current.emojis.isNotEmpty
                  ? current.emojis.first.uploader
                  : const GuildExpressionUploader(id: '', username: 'Unknown'),
            ),
          );
        }
        for (final GuildEmojiBulkCreateResponseFailed failure
            in response.failed) {
          uploadFailures.add(
            GuildEmojiUploadFailure(name: failure.name, error: failure.error),
          );
        }
      } on Object {
        for (final GuildEmojiCreateRequest request in chunk) {
          uploadFailures.add(
            GuildEmojiUploadFailure(name: request.name, error: 'upload_failed'),
          );
        }
      }
    }
    final GuildEmojiSettingsState latest = state.value ?? current;
    final List<GuildEmojiSettingsEntry> merged = await repository.listEmojis(
      guildId,
    );
    final List<int> indices = filterGuildEmojiIndices(
      merged,
      latest.debouncedSearchQuery,
    );
    state = AsyncData<GuildEmojiSettingsState>(
      latest.copyWith(
        emojis: merged,
        filteredIndices: indices,
        clearUploadingCount: true,
      ),
    );
    return GuildEmojiUploadResult(
      uploaded: uploaded,
      failures: <GuildEmojiUploadFailure>[
        ...preparationFailures,
        ...uploadFailures,
      ],
    );
  }

  Future<void> toggleCloneAllowed({
    required List<String> currentFeatures,
    required bool allowed,
  }) async {
    final List<String> updatedFeatures = setGuildFeatureEnabled(
      features: currentFeatures,
      feature: GuildFeatures.cloneEmojiDisabled,
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

  Future<GuildEmojiSettingsState> _loadState() async {
    try {
      final List<GuildEmojiSettingsEntry> emojis =
          List<GuildEmojiSettingsEntry>.from(
            await ref
                .read(guildExpressionsRepositoryProvider)
                .listEmojis(guildId),
          )..sort(
            (GuildEmojiSettingsEntry left, GuildEmojiSettingsEntry right) =>
                compareGuildExpressionEntriesByIdDesc(left.id, right.id),
          );
      final List<int> indices = filterGuildEmojiIndices(emojis, '');
      return GuildEmojiSettingsState(
        loadStatus: GuildEmojiSettingsLoadStatus.success,
        emojis: emojis,
        searchQuery: '',
        debouncedSearchQuery: '',
        filteredIndices: indices,
      );
    } on Object {
      return const GuildEmojiSettingsState(
        loadStatus: GuildEmojiSettingsLoadStatus.error,
        emojis: <GuildEmojiSettingsEntry>[],
        searchQuery: '',
        debouncedSearchQuery: '',
        filteredIndices: <int>[],
      );
    }
  }
}
