import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:riverpod/riverpod.dart' as rp;

Stream<List<T>> watchExpressionsVisibleForMatureAccess<T>(
  rp.Ref ref,
  Stream<List<T>> expressions,
  String Function(T expression) guildIdOf,
) {
  final bool matureAllowed = ref.watch(
    sensitiveContentProvider.select(
      (SensitiveContentState state) => state.access == MatureAccess.allowed,
    ),
  );
  if (matureAllowed) {
    return expressions;
  }
  final FluxerDatabase db = ref.watch(fluxerDatabaseProvider);
  return combineLatest2<List<T>, List<Server>, List<T>>(
    expressions,
    db.guildDao.watchServers(),
    (List<T> items, List<Server> servers) {
      final Set<String> matureGuildIds = <String>{
        for (final Server server in servers)
          if (server.nsfw) server.id,
      };
      if (matureGuildIds.isEmpty) {
        return items;
      }
      return items
          .where((T item) => !matureGuildIds.contains(guildIdOf(item)))
          .toList(growable: false);
    },
  );
}
