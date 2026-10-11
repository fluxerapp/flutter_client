import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';

final Provider<Map<String, User>> userPresenceCacheProvider =
    Provider<Map<String, User>>((Ref ref) {
      ref.watch(fluxerDatabaseProvider);
      return <String, User>{};
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
  final Map<String, User> cache = ref.watch(userPresenceCacheProvider);
  return database.userDao.watchUserById(userId).map((User? user) {
    if (user == null) {
      cache.remove(userId);
    } else {
      cache[userId] = user;
    }
    return user;
  });
});

User? watchLastKnownUserPresence(WidgetRef ref, String userId) {
  final AsyncValue<User?> presence = ref.watch(userPresenceProvider(userId));
  if (presence.hasValue) {
    return presence.value;
  }
  return ref.watch(userPresenceCacheProvider)[userId];
}
