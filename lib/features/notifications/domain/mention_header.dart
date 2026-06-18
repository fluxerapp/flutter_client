import 'package:fluxer_app/features/channels/domain/channel.dart';

/// Snapshot of the metadata rendered above a mention card: channel name,
/// optional guild line, channel-type icon hint, and the rounded server-icon
/// avatar inputs.
class MentionHeader {
  const MentionHeader({
    required this.primary,
    required this.secondaryLine,
    required this.guildChannelVisualType,
    required this.isDm,
    required this.guildIconUrl,
    required this.guildIconName,
    required this.isGuildUnavailable,
  });

  factory MentionHeader.dm({required String title}) {
    return MentionHeader(
      primary: title,
      secondaryLine: '',
      guildChannelVisualType: ChannelType.text,
      isDm: true,
      guildIconUrl: null,
      guildIconName: title,
      isGuildUnavailable: false,
    );
  }

  factory MentionHeader.guild({
    required String primary,
    required ChannelType visual,
    required String secondaryLine,
    required String iconName,
    required bool isUnavailable,
    String? iconUrl,
  }) {
    return MentionHeader(
      primary: primary,
      secondaryLine: secondaryLine,
      guildChannelVisualType: visual,
      isDm: false,
      guildIconUrl: iconUrl,
      guildIconName: iconName,
      isGuildUnavailable: isUnavailable,
    );
  }

  final String primary;
  final String secondaryLine;
  final ChannelType guildChannelVisualType;
  final bool isDm;
  final String? guildIconUrl;
  final String guildIconName;
  final bool isGuildUnavailable;
}

/// Result returned by header loaders: the [header] for rendering and the guild
/// id used to resolve role colors in the inline preview (empty string for DMs).
class MentionHeaderResult {
  const MentionHeaderResult({
    required this.header,
    required this.guildIdForPreview,
  });

  final MentionHeader header;
  final String guildIdForPreview;
}
