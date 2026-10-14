import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

enum EmojiAttributionType {
  defaultEmoji,
  customGuild,
  customInviteRequired,
  customCommunity,
}

class EmojiAttribution {
  const EmojiAttribution({required this.type, this.guild});

  final EmojiAttributionType type;
  final Guild? guild;

  bool get isVerified => guild?.isVerified ?? false;
}

EmojiAttribution resolveEmojiAttribution({
  required Set<String> memberGuildIds,
  String? currentGuildId,
  String? emojiId,
  String? guildId,
  Guild? guild,
}) {
  if (emojiId == null || emojiId.isEmpty) {
    return const EmojiAttribution(type: EmojiAttributionType.defaultEmoji);
  }

  if (guild != null) {
    return EmojiAttribution(
      type: guild.id == currentGuildId
          ? EmojiAttributionType.customGuild
          : EmojiAttributionType.customCommunity,
      guild: guild,
    );
  }

  if (guildId != null && memberGuildIds.contains(guildId)) {
    return const EmojiAttribution(type: EmojiAttributionType.customCommunity);
  }

  return const EmojiAttribution(
    type: EmojiAttributionType.customInviteRequired,
  );
}

String emojiAttributionDescription(
  FluxerLocalizations l10n,
  EmojiAttribution attribution, {
  String productName = InstanceConstants.defaultProductName,
}) {
  return switch (attribution.type) {
    EmojiAttributionType.defaultEmoji => l10n.emojiInfoDefaultDescription(
      productName,
    ),
    EmojiAttributionType.customGuild => l10n.emojiInfoCustomGuildDescription,
    EmojiAttributionType.customInviteRequired =>
      l10n.emojiInfoCustomInviteRequiredDescription,
    EmojiAttributionType.customCommunity =>
      l10n.emojiInfoCustomUnknownDescription,
  };
}
