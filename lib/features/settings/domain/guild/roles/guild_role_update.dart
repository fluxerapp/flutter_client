import 'package:fluxer_app/features/members/domain/member.dart';

class GuildRoleUpdate {
  const GuildRoleUpdate({
    required this.id,
    this.name,
    this.color,
    this.hoist,
    this.mentionable,
    this.permissions,
  });

  final String id;
  final String? name;
  final int? color;
  final bool? hoist;
  final bool? mentionable;
  final int? permissions;

  GuildRoleUpdate copyWith({
    String? name,
    int? color,
    bool? hoist,
    bool? mentionable,
    int? permissions,
  }) {
    return GuildRoleUpdate(
      id: id,
      name: name ?? this.name,
      color: color ?? this.color,
      hoist: hoist ?? this.hoist,
      mentionable: mentionable ?? this.mentionable,
      permissions: permissions ?? this.permissions,
    );
  }

  GuildRoleUpdate merge(GuildRoleUpdate other) {
    return GuildRoleUpdate(
      id: id,
      name: other.name ?? name,
      color: other.color ?? color,
      hoist: other.hoist ?? hoist,
      mentionable: other.mentionable ?? mentionable,
      permissions: other.permissions ?? permissions,
    );
  }
}

MemberRole applyGuildRoleUpdate(MemberRole role, GuildRoleUpdate? updates) {
  if (updates == null) {
    return role;
  }
  return MemberRole(
    id: role.id,
    name: updates.name ?? role.name,
    color: updates.color ?? role.color,
    position: role.position,
    hoist: updates.hoist ?? role.hoist,
    mentionable: updates.mentionable ?? role.mentionable,
    permissions: updates.permissions ?? role.permissions,
    hoistPosition: role.hoistPosition,
  );
}

bool guildRoleUpdateHasChanges({
  required MemberRole original,
  required GuildRoleUpdate update,
}) {
  return (update.name != null && update.name != original.name) ||
      (update.color != null && update.color != original.color) ||
      (update.hoist != null && update.hoist != original.hoist) ||
      (update.mentionable != null &&
          update.mentionable != original.mentionable) ||
      (update.permissions != null &&
          update.permissions != original.permissions);
}

GuildRoleUpdate? mergeGuildRoleUpdate({
  required MemberRole original,
  required GuildRoleUpdate? existing,
  required GuildRoleUpdate incoming,
}) {
  final GuildRoleUpdate merged = existing == null
      ? incoming
      : existing.merge(incoming);
  if (!guildRoleUpdateHasChanges(original: original, update: merged)) {
    return null;
  }
  return merged;
}
