import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/chat/domain/favorite_gif_entry.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_gifs_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' as sdk;

const int kMaxFavoriteGifs = 10000;
const int _kResolveBatchSize = 100;
const Duration _kBatchDelay = Duration(milliseconds: 700);

@immutable
class FavoriteGifImportState {
  const FavoriteGifImportState({
    this.isRunning = false,
    this.isDone = false,
    this.totalToImport = 0,
    this.processedCount = 0,
    this.importedCount = 0,
    this.skippedCount = 0,
  });

  final bool isRunning;
  final bool isDone;
  final int totalToImport;
  final int processedCount;
  final int importedCount;
  final int skippedCount;

  double get progress =>
      totalToImport == 0 ? 0 : processedCount / totalToImport;

  FavoriteGifImportState copyWith({
    bool? isRunning,
    bool? isDone,
    int? totalToImport,
    int? processedCount,
    int? importedCount,
    int? skippedCount,
  }) => FavoriteGifImportState(
    isRunning: isRunning ?? this.isRunning,
    isDone: isDone ?? this.isDone,
    totalToImport: totalToImport ?? this.totalToImport,
    processedCount: processedCount ?? this.processedCount,
    importedCount: importedCount ?? this.importedCount,
    skippedCount: skippedCount ?? this.skippedCount,
  );
}

final NotifierProvider<FavoriteGifImportNotifier, FavoriteGifImportState>
favoriteGifImportProvider =
    NotifierProvider<FavoriteGifImportNotifier, FavoriteGifImportState>(
      FavoriteGifImportNotifier.new,
    );

List<String> parseFavoriteGifImportUrls(String raw) {
  final Set<String> unique = <String>{};
  for (final String line in raw.split('\n')) {
    final String trimmed = line.trim();
    if (trimmed.isEmpty) {
      continue;
    }
    final Uri? uri = Uri.tryParse(trimmed);
    if (uri == null ||
        !(uri.isScheme('http') || uri.isScheme('https')) ||
        uri.host.isEmpty) {
      continue;
    }
    unique.add(trimmed);
  }
  return unique.toList(growable: false);
}

class FavoriteGifImportNotifier extends Notifier<FavoriteGifImportState> {
  int _run = 0;

  @override
  FavoriteGifImportState build() {
    ref.watch(currentUserIdProvider);
    _run++;
    return const FavoriteGifImportState();
  }

  void reset() {
    _run++;
    state = const FavoriteGifImportState();
  }

  void cancel() {
    if (state.isRunning) {
      state = state.copyWith(isRunning: false);
    }
  }

  Future<void> start(String raw) async {
    if (state.isRunning) {
      return;
    }
    final List<String> urls = parseFavoriteGifImportUrls(raw);
    if (urls.isEmpty) {
      return;
    }
    final int run = _run;
    state = FavoriteGifImportState(isRunning: true, totalToImport: urls.length);
    final FavoriteGifs favorites = ref.read(favoriteGifsProvider.notifier);
    var index = 0;
    while (index < urls.length && state.isRunning) {
      final List<String> batch = urls.sublist(
        index,
        index + _kResolveBatchSize > urls.length
            ? urls.length
            : index + _kResolveBatchSize,
      );
      index += _kResolveBatchSize;
      final int remaining =
          kMaxFavoriteGifs - ref.read(favoriteGifsProvider).entries.length;
      final List<String> toResolve = <String>[];
      var skipped = 0;
      for (final String url in batch) {
        if (favorites.hasUrl(url) || toResolve.length >= remaining) {
          skipped++;
        } else {
          toResolve.add(url);
        }
      }
      List<FavoriteGifEntry> resolved = const <FavoriteGifEntry>[];
      var failures = 0;
      if (toResolve.isNotEmpty) {
        try {
          final sdk.ResolveGifUrlsResponse response = await ref
              .read(fluxerClientProvider)
              .savedMedia
              .resolveGifUrls(
                body: sdk.ResolveGifUrlsBodySchema(urls: toResolve),
              );
          resolved = response.entries
              .map(favoriteGifEntryFromResolved)
              .toList(growable: false);
        } on Object {
          failures = toResolve.length;
        }
      }
      if (!ref.mounted || run != _run) {
        return;
      }
      final int added = favorites.addEntries(resolved);
      state = state.copyWith(
        processedCount: state.processedCount + batch.length,
        importedCount: state.importedCount + added,
        skippedCount:
            state.skippedCount + skipped + failures + resolved.length - added,
      );
      if (index < urls.length && state.isRunning) {
        await Future<void>.delayed(_kBatchDelay);
        if (!ref.mounted || run != _run) {
          return;
        }
      }
    }
    state = state.copyWith(isRunning: false, isDone: true);
  }
}
