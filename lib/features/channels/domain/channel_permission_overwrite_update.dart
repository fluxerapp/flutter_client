import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/channel_permission_resolver.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

enum ChannelPermissionState { inherit, allow, deny }

class ChannelPermissionOverwriteEntry {
  const ChannelPermissionOverwriteEntry({
    required this.id,
    required this.type,
    required this.allow,
    required this.deny,
    required this.label,
    this.isEveryone = false,
  });

  final String id;
  final int type;
  final BigInt allow;
  final BigInt deny;
  final String label;
  final bool isEveryone;

  ChannelPermissionOverwriteEntry copyWith({
    BigInt? allow,
    BigInt? deny,
    String? label,
    bool? isEveryone,
  }) {
    return ChannelPermissionOverwriteEntry(
      id: id,
      type: type,
      allow: allow ?? this.allow,
      deny: deny ?? this.deny,
      label: label ?? this.label,
      isEveryone: isEveryone ?? this.isEveryone,
    );
  }
}

ChannelPermissionState resolvePermissionState({
  required BigInt permissionBit,
  required BigInt allow,
  required BigInt deny,
}) {
  if ((allow & permissionBit) != BigInt.zero) {
    return ChannelPermissionState.allow;
  }
  if ((deny & permissionBit) != BigInt.zero) {
    return ChannelPermissionState.deny;
  }
  return ChannelPermissionState.inherit;
}

BigInt applyPermissionAllow({
  required BigInt permissionBit,
  required BigInt allow,
  required ChannelPermissionState state,
}) {
  var nextAllow = allow & ~permissionBit;
  if (state == ChannelPermissionState.allow) {
    nextAllow |= permissionBit;
  }
  return nextAllow;
}

BigInt applyPermissionDeny({
  required BigInt permissionBit,
  required BigInt deny,
  required ChannelPermissionState state,
}) {
  var nextDeny = deny & ~permissionBit;
  if (state == ChannelPermissionState.deny) {
    nextDeny |= permissionBit;
  }
  return nextDeny;
}

ChannelPermissionOverwriteEntry setPermissionState({
  required ChannelPermissionOverwriteEntry entry,
  required BigInt permissionBit,
  required ChannelPermissionState state,
}) {
  return entry.copyWith(
    allow: applyPermissionAllow(
      permissionBit: permissionBit,
      allow: entry.allow,
      state: state,
    ),
    deny: applyPermissionDeny(
      permissionBit: permissionBit,
      deny: entry.deny,
      state: state,
    ),
  );
}

List<ChannelPermissionOverwriteEntry> parseChannelPermissionOverwriteEntries(
  String? permissionOverwritesJson,
) {
  return parseChannelPermissionOverwritesJson(permissionOverwritesJson)
      .map(
        (ChannelOverwriteEntry entry) => ChannelPermissionOverwriteEntry(
          id: entry.id,
          type: entry.isRoleType ? 0 : 1,
          allow: entry.allow,
          deny: entry.deny,
          label: entry.id,
        ),
      )
      .toList();
}

List<ChannelPermissionOverwriteEntry>
buildOrderedChannelPermissionOverwriteEntries({
  required String guildId,
  required String? permissionOverwritesJson,
  required Map<String, db.Role> rolesById,
  required FluxerLocalizations l10n,
  Map<String, String> memberDisplayNames = const <String, String>{},
}) {
  final List<ChannelPermissionOverwriteEntry> parsed =
      parseChannelPermissionOverwriteEntries(permissionOverwritesJson);
  ChannelPermissionOverwriteEntry? everyoneOverwrite;
  final List<ChannelPermissionOverwriteEntry> roleOverwrites =
      <ChannelPermissionOverwriteEntry>[];
  final List<ChannelPermissionOverwriteEntry> memberOverwrites =
      <ChannelPermissionOverwriteEntry>[];
  for (final ChannelPermissionOverwriteEntry entry in parsed) {
    if (entry.type == 0 && entry.id == guildId) {
      everyoneOverwrite = entry;
    } else if (entry.type == 0) {
      roleOverwrites.add(entry);
    } else {
      memberOverwrites.add(entry);
    }
  }
  roleOverwrites.sort(
    (ChannelPermissionOverwriteEntry a, ChannelPermissionOverwriteEntry b) =>
        _compareRoleOverwrites(a, b, rolesById),
  );
  memberOverwrites.sort(_compareMemberOverwrites);
  final ChannelPermissionOverwriteEntry resolvedEveryone =
      everyoneOverwrite ??
      ChannelPermissionOverwriteEntry(
        id: guildId,
        type: 0,
        allow: BigInt.zero,
        deny: BigInt.zero,
        label: l10n.channelSettingsEveryoneRole,
        isEveryone: true,
      );
  return <ChannelPermissionOverwriteEntry>[
    ...roleOverwrites.map(
      (ChannelPermissionOverwriteEntry entry) => _labelOverwriteEntry(
        entry: entry,
        guildId: guildId,
        rolesById: rolesById,
        memberDisplayNames: memberDisplayNames,
        l10n: l10n,
      ),
    ),
    ...memberOverwrites.map(
      (ChannelPermissionOverwriteEntry entry) => _labelOverwriteEntry(
        entry: entry,
        guildId: guildId,
        rolesById: rolesById,
        memberDisplayNames: memberDisplayNames,
        l10n: l10n,
      ),
    ),
    _labelOverwriteEntry(
      entry: resolvedEveryone,
      guildId: guildId,
      rolesById: rolesById,
      memberDisplayNames: memberDisplayNames,
      l10n: l10n,
    ),
  ];
}

ChannelPermissionOverwriteEntry _labelOverwriteEntry({
  required ChannelPermissionOverwriteEntry entry,
  required String guildId,
  required Map<String, db.Role> rolesById,
  required Map<String, String> memberDisplayNames,
  required FluxerLocalizations l10n,
}) {
  if (entry.id == guildId) {
    return ChannelPermissionOverwriteEntry(
      id: entry.id,
      type: entry.type,
      allow: entry.allow,
      deny: entry.deny,
      label: l10n.channelSettingsEveryoneRole,
      isEveryone: true,
    );
  }
  if (entry.type == 0) {
    final String label =
        rolesById[entry.id]?.name ?? l10n.channelSettingsUnknownRole;
    return ChannelPermissionOverwriteEntry(
      id: entry.id,
      type: entry.type,
      allow: entry.allow,
      deny: entry.deny,
      label: label,
    );
  }
  final String label =
      memberDisplayNames[entry.id] ?? l10n.channelSettingsUnknownUser;
  return ChannelPermissionOverwriteEntry(
    id: entry.id,
    type: entry.type,
    allow: entry.allow,
    deny: entry.deny,
    label: label,
  );
}

List<ChannelPermissionOverwriteEntry> insertChannelPermissionOverwriteEntry({
  required List<ChannelPermissionOverwriteEntry> entries,
  required ChannelPermissionOverwriteEntry newEntry,
  required Map<String, db.Role> rolesById,
}) {
  final ChannelPermissionOverwriteEntry everyone = entries.lastWhere(
    (ChannelPermissionOverwriteEntry entry) => entry.isEveryone,
  );
  final List<ChannelPermissionOverwriteEntry> rest = entries
      .where((ChannelPermissionOverwriteEntry entry) => !entry.isEveryone)
      .toList();
  rest.add(newEntry);
  final List<ChannelPermissionOverwriteEntry> roles = rest
      .where((ChannelPermissionOverwriteEntry entry) => entry.type == 0)
      .toList();
  final List<ChannelPermissionOverwriteEntry> members = rest
      .where((ChannelPermissionOverwriteEntry entry) => entry.type == 1)
      .toList();
  roles.sort(
    (ChannelPermissionOverwriteEntry a, ChannelPermissionOverwriteEntry b) =>
        _compareRoleOverwrites(a, b, rolesById),
  );
  members.sort(_compareMemberOverwrites);
  return <ChannelPermissionOverwriteEntry>[...roles, ...members, everyone];
}

int _compareRoleOverwrites(
  ChannelPermissionOverwriteEntry a,
  ChannelPermissionOverwriteEntry b,
  Map<String, db.Role> rolesById,
) {
  final db.Role? roleA = rolesById[a.id];
  final db.Role? roleB = rolesById[b.id];
  if (roleA == null || roleB == null) {
    return 0;
  }
  if (roleA.position != roleB.position) {
    return roleB.position.compareTo(roleA.position);
  }
  return BigInt.parse(a.id).compareTo(BigInt.parse(b.id));
}

int _compareMemberOverwrites(
  ChannelPermissionOverwriteEntry a,
  ChannelPermissionOverwriteEntry b,
) {
  return BigInt.parse(a.id).compareTo(BigInt.parse(b.id));
}

GuildTextChannelUpdateRequestPermissionOverwritesTypeType
_textOverwriteTypeForPatch(int type) {
  return type == 0
      ? GuildTextChannelUpdateRequestPermissionOverwritesTypeType.role
      : GuildTextChannelUpdateRequestPermissionOverwritesTypeType.member;
}

GuildVoiceChannelUpdateRequestPermissionOverwritesTypeType
_voiceOverwriteTypeForPatch(int type) {
  return type == 0
      ? GuildVoiceChannelUpdateRequestPermissionOverwritesTypeType.role
      : GuildVoiceChannelUpdateRequestPermissionOverwritesTypeType.member;
}

GuildCategoryChannelUpdateRequestPermissionOverwritesTypeType
_categoryOverwriteTypeForPatch(int type) {
  return type == 0
      ? GuildCategoryChannelUpdateRequestPermissionOverwritesTypeType.role
      : GuildCategoryChannelUpdateRequestPermissionOverwritesTypeType.member;
}

GuildLinkChannelUpdateRequestPermissionOverwritesTypeType
_linkOverwriteTypeForPatch(int type) {
  return type == 0
      ? GuildLinkChannelUpdateRequestPermissionOverwritesTypeType.role
      : GuildLinkChannelUpdateRequestPermissionOverwritesTypeType.member;
}

ChannelUpdateRequest buildChannelPermissionOverwritesUpdate({
  required Channel channel,
  required List<ChannelPermissionOverwriteEntry> overwrites,
}) {
  return switch (channel.type) {
    ChannelType.guildText => ChannelUpdateRequest0(
      topic: null,
      url: null,
      parentId: null,
      bitrate: null,
      userLimit: null,
      voiceConnectionLimit: null,
      permissionOverwrites: overwrites
          .map(
            (ChannelPermissionOverwriteEntry entry) =>
                GuildTextChannelUpdateRequestPermissionOverwrites(
                  id: entry.id,
                  type: _textOverwriteTypeForPatch(entry.type),
                  allow: entry.allow.toString(),
                  deny: entry.deny.toString(),
                ),
          )
          .toList(),
      nsfw: null,
      nsfwOverride: null,
      contentWarningLevel: null,
      contentWarningText: null,
      rateLimitPerUser: null,
      icon: null,
      ownerId: null,
      nicks: null,
      rtcRegion: null,
      type: GuildTextChannelUpdateRequestTypeType.guildText,
      name: null,
    ),
    ChannelType.guildVoice => ChannelUpdateRequest2(
      topic: null,
      url: null,
      parentId: null,
      bitrate: null,
      userLimit: null,
      voiceConnectionLimit: null,
      permissionOverwrites: overwrites
          .map(
            (ChannelPermissionOverwriteEntry entry) =>
                GuildVoiceChannelUpdateRequestPermissionOverwrites(
                  id: entry.id,
                  type: _voiceOverwriteTypeForPatch(entry.type),
                  allow: entry.allow.toString(),
                  deny: entry.deny.toString(),
                ),
          )
          .toList(),
      nsfw: null,
      nsfwOverride: null,
      contentWarningLevel: null,
      contentWarningText: null,
      rateLimitPerUser: null,
      icon: null,
      ownerId: null,
      nicks: null,
      rtcRegion: null,
      type: GuildVoiceChannelUpdateRequestTypeType.guildVoice,
      name: null,
    ),
    ChannelType.guildCategory => ChannelUpdateRequest4(
      topic: null,
      url: null,
      parentId: null,
      bitrate: null,
      userLimit: null,
      voiceConnectionLimit: null,
      permissionOverwrites: overwrites
          .map(
            (ChannelPermissionOverwriteEntry entry) =>
                GuildCategoryChannelUpdateRequestPermissionOverwrites(
                  id: entry.id,
                  type: _categoryOverwriteTypeForPatch(entry.type),
                  allow: entry.allow.toString(),
                  deny: entry.deny.toString(),
                ),
          )
          .toList(),
      nsfw: null,
      nsfwOverride: null,
      contentWarningLevel: null,
      contentWarningText: null,
      rateLimitPerUser: null,
      icon: null,
      ownerId: null,
      nicks: null,
      rtcRegion: null,
      type: GuildCategoryChannelUpdateRequestTypeType.guildCategory,
      name: null,
    ),
    ChannelType.guildLink => ChannelUpdateRequest998(
      topic: null,
      url: null,
      parentId: null,
      bitrate: null,
      userLimit: null,
      voiceConnectionLimit: null,
      permissionOverwrites: overwrites
          .map(
            (ChannelPermissionOverwriteEntry entry) =>
                GuildLinkChannelUpdateRequestPermissionOverwrites(
                  id: entry.id,
                  type: _linkOverwriteTypeForPatch(entry.type),
                  allow: entry.allow.toString(),
                  deny: entry.deny.toString(),
                ),
          )
          .toList(),
      nsfw: null,
      nsfwOverride: null,
      contentWarningLevel: null,
      contentWarningText: null,
      rateLimitPerUser: null,
      icon: null,
      ownerId: null,
      nicks: null,
      rtcRegion: null,
      type: GuildLinkChannelUpdateRequestTypeType.guildLink,
      name: null,
    ),
    _ => throw UnsupportedError(
      'Channel permission overwrites are not supported for ${channel.type}',
    ),
  };
}
