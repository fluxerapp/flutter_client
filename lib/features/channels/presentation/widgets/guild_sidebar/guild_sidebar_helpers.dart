part of 'guild_sidebar.dart';

ReadStateRepository _readStateRepository(WidgetRef ref) => ReadStateRepository(
  ref.read(fluxerClientProvider),
  ref.read(fluxerDatabaseProvider),
);

Future<ChannelOverridesMuteConfig?> _loadChannelMuteConfig(
  WidgetRef ref,
  String guildId,
  String channelId,
) async {
  final row = await ref
      .read(fluxerDatabaseProvider)
      .userGuildSettingsDao
      .getByGuildId(guildId);
  if (row == null) {
    return null;
  }
  try {
    final settings = UserGuildSettingsResponse.fromJson(
      jsonDecode(row.data) as Map<String, dynamic>,
    );
    return settings.channelOverrides?[channelId]?.muteConfig;
  } on Object {
    return null;
  }
}

bool _canMarkChannelRead(Channel channel) =>
    channel.type != ChannelType.guildCategory &&
    channel.type != ChannelType.guildLink;
