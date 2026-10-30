import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_icon_field_update.dart';

class GuildRoleUpdate {
  const GuildRoleUpdate({
    required this.id,
    this.name,
    this.color,
    this.hoist,
    this.mentionable,
    this.permissions,
    this.iconField,
  });

  final String id;
  final String? name;
  final int? color;
  final bool? hoist;
  final bool? mentionable;
  final int? permissions;
  final GuildRoleIconFieldUpdate? iconField;

  GuildRoleUpdate merge(GuildRoleUpdate other) {
    return GuildRoleUpdate(
      id: id,
      name: other.name ?? name,
      color: other.color ?? color,
      hoist: other.hoist ?? hoist,
      mentionable: other.mentionable ?? mentionable,
      permissions: other.permissions ?? permissions,
      iconField: other.iconField ?? iconField,
    );
  }
}

MemberRole applyGuildRoleUpdate(MemberRole role, GuildRoleUpdate? updates) {
  if (updates == null) {
    return role;
  }
  final GuildRoleIconFieldUpdate? iconField = updates.iconField;
  return MemberRole(
    id: role.id,
    name: updates.name ?? role.name,
    color: updates.color ?? role.color,
    position: role.position,
    hoist: updates.hoist ?? role.hoist,
    mentionable: updates.mentionable ?? role.mentionable,
    permissions: updates.permissions ?? role.permissions,
    hoistPosition: role.hoistPosition,
    icon: iconField != null ? iconField.icon : role.icon,
    unicodeEmoji: iconField != null
        ? iconField.unicodeEmoji
        : role.unicodeEmoji,
  );
}

bool _iconFieldsEqual(MemberRole role, GuildRoleUpdate update) {
  if (update.iconField == null) {
    return true;
  }
  final GuildRoleIconFieldUpdate patch = update.iconField!;
  return patch.icon == role.icon && patch.unicodeEmoji == role.unicodeEmoji;
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
          update.permissions != original.permissions) ||
      (update.iconField != null && !_iconFieldsEqual(original, update));
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
