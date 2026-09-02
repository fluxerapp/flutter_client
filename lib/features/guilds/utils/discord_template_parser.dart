import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_dart/export.dart';

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
      if (type == ChannelType.guildText.wireValue) {
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
      channelType == ChannelType.guildVoice.wireValue ||
      channelType == ChannelType.guildCategory.wireValue) {
    return channelType;
  }
  if (channelType == _discordGuildAnnouncementChannelType) {
    return ChannelType.guildText.wireValue;
  }
  if (channelType == _discordGuildStageVoiceChannelType) {
    return ChannelType.guildVoice.wireValue;
  }
  return null;
}

bool isTemplateEveryoneRole(TemplateRole role) {
  if (role.name == '@everyone') {
    return true;
  }
  final Object? id = role.id;
  return id == 0 || id == '0';
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
  try {
    return DiscordGuildTemplate(
      name: name,
      sourceGuild: TemplateSerializedGuild.fromJson(guildJson),
    );
  } on Object {
    return null;
  }
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
