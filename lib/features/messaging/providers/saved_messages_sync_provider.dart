import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/messaging/data/saved_messages_repository.dart';

class SavedMessagesSyncState {
  const SavedMessagesSyncState({
    this.fetched = false,
    this.busy = false,
    this.lastError,
  });

  final bool fetched;
  final bool busy;
  final Object? lastError;

  SavedMessagesSyncState copyWith({
    bool? fetched,
    bool? busy,
    Object? lastError,
    bool resetError = false,
  }) {
    return SavedMessagesSyncState(
      fetched: fetched ?? this.fetched,
      busy: busy ?? this.busy,
      lastError: resetError ? null : (lastError ?? this.lastError),
    );
  }
}

final savedMessagesRepositoryProvider = Provider<SavedMessagesRepository>((
  Ref ref,
) {
  return SavedMessagesRepository(
    database: ref.watch(fluxerDatabaseProvider),
    client: ref.watch(fluxerClientProvider),
    currentUserId: ref.watch(currentUserIdProvider),
  );
});

final savedMessagesSyncProvider =
    NotifierProvider<SavedMessagesSyncNotifier, SavedMessagesSyncState>(
      SavedMessagesSyncNotifier.new,
    );

class SavedMessagesSyncNotifier extends Notifier<SavedMessagesSyncState> {
  @override
  SavedMessagesSyncState build() => const SavedMessagesSyncState();

  Future<void> refresh() async {
    if (state.busy) {
      return;
    }
    state = state.copyWith(busy: true, resetError: true);
    try {
      await ref.read(savedMessagesRepositoryProvider).syncFromApi();
      state = const SavedMessagesSyncState(fetched: true);
    } on Object catch (error, stackTrace) {
      talker.error('[SavedMessagesSync] Fetch failed', error, stackTrace);
      state = SavedMessagesSyncState(fetched: true, lastError: error);
    }
  }
}
