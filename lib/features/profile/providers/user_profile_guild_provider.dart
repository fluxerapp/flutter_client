import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/members/domain/member.dart';

// `FutureProviderFamily` is not exposed by the public API; the explicit type
// would require a `package:riverpod/src/...` import.
// ignore: specify_nonobvious_property_types
final userProfileGuildRolesProvider = FutureProvider.autoDispose
    .family<List<MemberRole>, String>((ref, guildId) async {
      final FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
      final List<Role> rows = await database.roleDao.getRoles(guildId);
      return rows.map(MemberRole.fromRow).toList(growable: false);
    });

// Same provider-family type issue as above.
// ignore: specify_nonobvious_property_types
final userProfileGuildInfoProvider = FutureProvider.autoDispose
    .family<Server?, String>((ref, guildId) {
      final FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
      return database.guildDao.getServerById(guildId);
    });

// Same provider-family type issue as above.
// ignore: specify_nonobvious_property_types
final userProfileMutualGuildInfoProvider = FutureProvider.autoDispose
    .family<Map<String, Server>, String>((ref, guildIdsKey) async {
      final FluxerDatabase database = ref.watch(fluxerDatabaseProvider);
      final Map<String, Server> serversById = <String, Server>{};
      final List<String> guildIds = guildIdsKey
          .split(',')
          .where((String guildId) => guildId.isNotEmpty)
          .toList(growable: false);
      for (final String guildId in guildIds) {
        final Server? server = await database.guildDao.getServerById(guildId);
        if (server != null) {
          serversById[guildId] = server;
        }
      }
      return serversById;
    });
