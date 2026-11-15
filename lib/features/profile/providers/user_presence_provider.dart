import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/utils/bounded_lru_cache.dart';

const int kUserPresenceCacheCapacity = 2000;

final Provider<BoundedLruCache<String, User>> userPresenceCacheProvider =
    Provider<BoundedLruCache<String, User>>((Ref ref) {
      ref.watch(fluxerDatabaseProvider);
      return BoundedLruCache<String, User>(
        capacity: kUserPresenceCacheCapacity,
      );
    });

// `StreamProviderFamily` is not exposed by the public API; the explicit type
// would require a `package:riverpod/src/...` import. Type is obvious from the
// right-hand side.
// ignore: specify_nonobvious_property_types
final userPresenceProvider = StreamProvider.autoDispose.family<User?, String>((
  ref,
  userId,
) {
  final database = ref.watch(fluxerDatabaseProvider);
  final BoundedLruCache<String, User> cache = ref.watch(
    userPresenceCacheProvider,
  );
  return database.userDao.watchUserById(userId).map((User? user) {
    if (user == null) {
      cache.remove(userId);
    } else {
      cache.set(userId, user);
    }
    return user;
  });
});

User? watchLastKnownUserPresence(WidgetRef ref, String userId) {
  final AsyncValue<User?> presence = ref.watch(userPresenceProvider(userId));
  if (presence.hasValue) {
    return presence.value;
  }
  return ref.watch(userPresenceCacheProvider).peek(userId);
}
