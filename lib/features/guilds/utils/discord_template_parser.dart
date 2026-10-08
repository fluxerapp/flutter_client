import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

const String kDiscordTemplateExampleUrl = 'https://discord.new/abcd1234';

const int _discordGuildAnnouncementChannelType = 5;
const int _discordGuildStageVoiceChannelType = 13;

final RegExp _discordNewPattern = RegExp(r'discord\.new/([A-Za-z0-9]+)');
final RegExp _discordApiPattern = RegExp(
  r'discord\.com/api/guilds/templates/([A-Za-z0-9]+)',
);
final RegExp _discordTemplatePathPattern = RegExp(
  r'discord\.com/template/([A-Za-z0-9]+)',
);
final RegExp _bareTemplateCodePattern = RegExp(r'^[A-Za-z0-9]+$');

class DiscordGuildTemplate {
  DiscordGuildTemplate({required this.name, required this.sourceGuild})
    : stats = _statsFor(sourceGuild);

  final String name;
  final TemplateSerializedGuild sourceGuild;
  final DiscordTemplateStats stats;

  static DiscordTemplateStats _statsFor(TemplateSerializedGuild sourceGuild) {
    int textChannelCount = 0;
    int voiceChannelCount = 0;
    int categoryCount = 0;
    for (final TemplateChannel channel in sourceGuild.channels) {
      final int? type = mapTemplateChannelTypeToFluxer(channel.type.toInt());
      if (type == ChannelType.guildText.wireValue ||
          type == ChannelType.guildAnnouncement.wireValue) {
        textChannelCount++;
      } else if (type == ChannelType.guildVoice.wireValue) {
        voiceChannelCount++;
      } else if (type == ChannelType.guildCategory.wireValue) {
        categoryCount++;
      }
    }
    int roleCount = 0;
    for (final TemplateRole role in sourceGuild.roles) {
      if (!isTemplateEveryoneRole(role)) {
        roleCount++;
      }
    }
    return DiscordTemplateStats(
      textChannelCount: textChannelCount,
      voiceChannelCount: voiceChannelCount,
      categoryCount: categoryCount,
      roleCount: roleCount,
    );
  }
}

class DiscordTemplateStats {
  const DiscordTemplateStats({
    required this.textChannelCount,
    required this.voiceChannelCount,
    required this.categoryCount,
    required this.roleCount,
  });

  final int textChannelCount;
  final int voiceChannelCount;
  final int categoryCount;
  final int roleCount;
}

String discordTemplateApiUrl(String code) =>
    'https://discord.com/api/guilds/templates/$code';

String? parseTemplateCode(String input) {
  final String trimmed = input.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  final RegExpMatch? newMatch = _discordNewPattern.firstMatch(trimmed);
  if (newMatch != null) {
    return newMatch.group(1);
  }
  final RegExpMatch? apiMatch = _discordApiPattern.firstMatch(trimmed);
  if (apiMatch != null) {
    return apiMatch.group(1);
  }
  final RegExpMatch? templateMatch = _discordTemplatePathPattern.firstMatch(
    trimmed,
  );
  if (templateMatch != null) {
    return templateMatch.group(1);
  }
  if (_bareTemplateCodePattern.hasMatch(trimmed)) {
    return trimmed;
  }
  return null;
}

int? mapTemplateChannelTypeToFluxer(int channelType) {
  if (channelType == ChannelType.guildText.wireValue ||
      channelType == ChannelType.guildAnnouncement.wireValue ||
      channelType == ChannelType.guildVoice.wireValue ||
      channelType == ChannelType.guildCategory.wireValue) {
    return channelType;
  }
  if (channelType == _discordGuildAnnouncementChannelType) {
    return ChannelType.guildAnnouncement.wireValue;
  }
  if (channelType == _discordGuildStageVoiceChannelType) {
    return ChannelType.guildVoice.wireValue;
  }
  return null;
}

bool isTemplateEveryoneRole(TemplateRole role) {
  if (role.name.value == '@everyone') {
    return true;
  }
  return role.id == '0';
}

DiscordGuildTemplate? parseDiscordGuildTemplate(Object? json) {
  final Map<String, Object?>? data = _stringKeyedMap(json);
  if (data == null) {
    return null;
  }
  final Object? code = data['code'];
  final Object? name = data['name'];
  final Map<String, Object?>? guildJson = _stringKeyedMap(
    data['serialized_source_guild'],
  );
  if (code is! String ||
      code.isEmpty ||
      name is! String ||
      name.isEmpty ||
      guildJson == null) {
    return null;
  }
  final Object? guildName = guildJson['name'];
  if (guildName is! String ||
      guildName.isEmpty ||
      guildJson['roles'] is! List ||
      guildJson['channels'] is! List) {
    return null;
  }
  final Map<String, Object?>? normalizedGuildJson =
      _normalizeSerializedSourceGuild(guildJson);
  if (normalizedGuildJson == null) {
    return null;
  }
  try {
    return DiscordGuildTemplate(
      name: name,
      sourceGuild: TemplateSerializedGuild.fromJson(normalizedGuildJson),
    );
  } on Object {
    return null;
  }
}

Map<String, Object?>? _normalizeSerializedSourceGuild(
  Map<String, Object?> guildJson,
) {
  final Object? rolesRaw = guildJson['roles'];
  final Object? channelsRaw = guildJson['channels'];
  if (rolesRaw is! List || channelsRaw is! List) {
    return null;
  }
  final Map<String, Object?> normalized = Map<String, Object?>.from(guildJson);
  if (normalized.containsKey('system_channel_id')) {
    normalized['system_channel_id'] = _discordTemplateScalarToString(
      normalized['system_channel_id'],
    );
  }
  final List<Map<String, Object?>>? roles = _normalizeObjectList(
    rolesRaw,
    _normalizeTemplateRole,
  );
  final List<Map<String, Object?>>? channels = _normalizeObjectList(
    channelsRaw,
    _normalizeTemplateChannel,
  );
  if (roles == null || channels == null) {
    return null;
  }
  normalized['roles'] = roles;
  normalized['channels'] = channels;
  return normalized;
}

List<Map<String, Object?>>? _normalizeObjectList(
  List<dynamic> values,
  Map<String, Object?>? Function(Map<String, Object?>?) normalize,
) {
  final List<Map<String, Object?>> normalized = <Map<String, Object?>>[];
  for (final Object? value in values) {
    final Map<String, Object?>? item = normalize(_stringKeyedMap(value));
    if (item == null) {
      return null;
    }
    normalized.add(item);
  }
  return normalized;
}

Map<String, Object?>? _normalizeTemplateRole(Map<String, Object?>? role) {
  if (role == null) {
    return null;
  }
  final Map<String, Object?> normalized = Map<String, Object?>.from(role);
  normalized['id'] = _discordTemplateScalarToString(normalized['id']);
  if (normalized.containsKey('permissions')) {
    normalized['permissions'] = _discordTemplateScalarToString(
      normalized['permissions'],
    );
  }
  if (normalized.containsKey('permissions_new')) {
    normalized['permissions_new'] = _discordTemplateScalarToString(
      normalized['permissions_new'],
    );
  }
  return normalized;
}

Map<String, Object?>? _normalizeTemplateChannel(Map<String, Object?>? channel) {
  if (channel == null) {
    return null;
  }
  final Map<String, Object?> normalized = Map<String, Object?>.from(channel);
  normalized['id'] = _discordTemplateScalarToString(normalized['id']);
  if (normalized.containsKey('parent_id')) {
    normalized['parent_id'] = _discordTemplateScalarToString(
      normalized['parent_id'],
    );
  }
  final Object? overwritesRaw = normalized['permission_overwrites'];
  if (overwritesRaw is List) {
    final List<Map<String, Object?>>? overwrites = _normalizeObjectList(
      overwritesRaw,
      _normalizePermissionOverwrite,
    );
    if (overwrites == null) {
      return null;
    }
    normalized['permission_overwrites'] = overwrites;
  }
  return normalized;
}

Map<String, Object?>? _normalizePermissionOverwrite(
  Map<String, Object?>? overwrite,
) {
  if (overwrite == null) {
    return null;
  }
  final Map<String, Object?> normalized = Map<String, Object?>.from(overwrite);
  normalized['id'] = _discordTemplateScalarToString(normalized['id']);
  normalized['type'] = _permissionOverwriteTypeToString(normalized['type']);
  normalized['allow'] = _discordTemplateScalarToString(normalized['allow']);
  normalized['deny'] = _discordTemplateScalarToString(normalized['deny']);
  return normalized;
}

String _discordTemplateScalarToString(Object? value) {
  if (value is String) {
    return value;
  }
  if (value is num) {
    return value.toString();
  }
  return value?.toString() ?? '0';
}

String _permissionOverwriteTypeToString(Object? value) {
  if (value is String) {
    if (value == 'role') {
      return '0';
    }
    if (value == 'member') {
      return '1';
    }
    return value;
  }
  if (value is num) {
    return value.toInt().toString();
  }
  return '0';
}

Map<String, Object?>? _stringKeyedMap(Object? value) {
  if (value is Map<String, Object?>) {
    return value;
  }
  if (value is Map) {
    try {
      return value.cast<String, Object?>();
    } on Object {
      return null;
    }
  }
  return null;
}
