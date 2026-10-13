import 'package:fluxer_app/features/channels/domain/channel.dart';

class MentionHeader {
  const MentionHeader({
    required this.primary,
    required this.secondaryLine,
    required this.guildChannelVisualType,
    required this.isDm,
    required this.isGroupDm,
    required this.guildIconUrl,
    required this.guildIconName,
    required this.isGuildUnavailable,
  });

  factory MentionHeader.dm({required String title, bool isGroup = false}) {
    return MentionHeader(
      primary: title,
      secondaryLine: '',
      guildChannelVisualType: ChannelType.guildText,
      isDm: true,
      isGroupDm: isGroup,
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
      isGroupDm: false,
      guildIconUrl: iconUrl,
      guildIconName: iconName,
      isGuildUnavailable: isUnavailable,
    );
  }

  final String primary;
  final String secondaryLine;
  final ChannelType guildChannelVisualType;
  final bool isDm;
  final bool isGroupDm;
  final String? guildIconUrl;
  final String guildIconName;
  final bool isGuildUnavailable;
}

class MentionHeaderResult {
  const MentionHeaderResult({
    required this.header,
    required this.guildIdForPreview,
  });

  final MentionHeader header;
  final String guildIdForPreview;
}
