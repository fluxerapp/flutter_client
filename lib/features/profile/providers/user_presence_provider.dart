import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';

// `StreamProviderFamily` is not exposed by the public API; the explicit type
// would require a `package:riverpod/src/...` import. Type is obvious from the
// right-hand side.
// ignore: specify_nonobvious_property_types
final userPresenceProvider = StreamProvider.autoDispose.family<User?, String>((
  ref,
  userId,
) {
  final database = ref.watch(fluxerDatabaseProvider);
  return database.userDao.watchUserById(userId);
});
