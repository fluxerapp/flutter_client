import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/gateway/presence_store.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';

export 'package:fluxer_app/core/gateway/presence_store.dart'
    show PresenceStore, UserPresence;

final Provider<PresenceStore> presenceStoreProvider = Provider<PresenceStore>(
  (Ref ref) => presenceStoreFor(ref.watch(fluxerDatabaseProvider)),
);

final NotifierProviderFamily<UserPresenceNotifier, UserPresence?, String>
userPresenceProvider = NotifierProvider.autoDispose
    .family<UserPresenceNotifier, UserPresence?, String>(
      UserPresenceNotifier.new,
    );

class UserPresenceNotifier extends Notifier<UserPresence?> {
  UserPresenceNotifier(this.userId);

  final String userId;

  @override
  UserPresence? build() {
    final PresenceStore store = ref.watch(presenceStoreProvider);
    ref.onDispose(store.listen(userId, () => state = store[userId]));
    return store[userId];
  }
}

final StreamProviderFamily<User?, String> userRowProvider = StreamProvider
    .autoDispose
    .family<User?, String>(
      (Ref ref, String userId) =>
          ref.watch(fluxerDatabaseProvider).userDao.watchUserById(userId),
    );
