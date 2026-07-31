import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/members/data/guild_member_role_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guild_member_role_repository_provider.g.dart';

@riverpod
GuildMemberRoleRepository guildMemberRoleRepository(Ref ref) {
  return GuildMemberRoleRepository(ref.watch(fluxerClientProvider));
}
