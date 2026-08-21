import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

enum EmojiAttributionType {
  defaultEmoji,
  customGuild,
  customInviteRequired,
  customUnknown,
}

class EmojiAttribution {
  const EmojiAttribution({
    required this.type,
    this.guild,
  });

  final EmojiAttributionType type;
  final Guild? guild;

  bool get isVerified => guild?.isVerified ?? false;
}

EmojiAttribution resolveEmojiAttribution({
  required Set<String> memberGuildIds,
  String? emojiId,
  String? guildId,
  Guild? guild,
}) {
  if (emojiId == null || emojiId.isEmpty) {
    return const EmojiAttribution(type: EmojiAttributionType.defaultEmoji);
  }

  if (guild != null) {
    return EmojiAttribution(
      type: EmojiAttributionType.customGuild,
      guild: guild,
    );
  }

  if (guildId != null && !memberGuildIds.contains(guildId)) {
    return const EmojiAttribution(type: EmojiAttributionType.customInviteRequired);
  }

  return const EmojiAttribution(type: EmojiAttributionType.customUnknown);
}

String emojiAttributionDescription(
  FluxerLocalizations l10n,
  EmojiAttribution attribution, {
  String productName = 'Fluxer',
}) {
  return switch (attribution.type) {
    EmojiAttributionType.defaultEmoji =>
      l10n.emojiInfoDefaultDescription(productName),
    EmojiAttributionType.customGuild => l10n.emojiInfoCustomGuildDescription,
    EmojiAttributionType.customInviteRequired =>
      l10n.emojiInfoCustomInviteRequiredDescription,
    EmojiAttributionType.customUnknown =>
      l10n.emojiInfoCustomUnknownDescription,
  };
}
