import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_evaluator.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_app/core/limits/limit_wire_format.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_dart/export.dart';

class GuildExpressionLimits {
  const GuildExpressionLimits({
    required this.maxEmojis,
    required this.maxStickers,
    required this.emojiMaxSizeBytes,
    required this.stickerMaxSizeBytes,
  });

  final int maxEmojis;
  final int maxStickers;
  final int emojiMaxSizeBytes;
  final int stickerMaxSizeBytes;

  bool get hasUnlimitedEmojis => maxEmojis == -1;
  bool get hasUnlimitedStickers => maxStickers == -1;
}

GuildExpressionLimits resolveGuildExpressionLimits({
  required Guild guild,
  required WellKnownFluxerResponseLimits limits,
}) {
  final LimitMatchContext context = LimitMatchContext(
    traits: const <String>{},
    guildFeatures: guild.features.toSet(),
  );
  final LimitConfigSnapshot snapshot = expandLimitWireFormat(limits);
  final LimitEvaluator evaluator = LimitEvaluator(snapshot);
  final int maxEmojis =
      hasGuildFeature(guild.features, GuildFeatures.unlimitedEmoji)
      ? -1
      : _resolveGuildLimit(
          evaluator: evaluator,
          context: context,
          key: LimitKeys.maxGuildEmojis,
          fallback: kMaxGuildEmojisDefault,
        );
  final int maxStickers =
      hasGuildFeature(guild.features, GuildFeatures.unlimitedStickers)
      ? -1
      : _resolveGuildLimit(
          evaluator: evaluator,
          context: context,
          key: LimitKeys.maxGuildStickers,
          fallback: kMaxGuildStickersDefault,
        );
  final int emojiMaxSizeBytes = _resolveGuildLimit(
    evaluator: evaluator,
    context: context,
    key: LimitKeys.emojiMaxSize,
    fallback: kEmojiMaxSizeBytes,
  );
  final int stickerMaxSizeBytes = _resolveGuildLimit(
    evaluator: evaluator,
    context: context,
    key: LimitKeys.stickerMaxSize,
    fallback: kStickerMaxSizeBytes,
  );
  return GuildExpressionLimits(
    maxEmojis: maxEmojis,
    maxStickers: maxStickers,
    emojiMaxSizeBytes: emojiMaxSizeBytes,
    stickerMaxSizeBytes: stickerMaxSizeBytes,
  );
}

int _resolveGuildLimit({
  required LimitEvaluator evaluator,
  required LimitMatchContext context,
  required String key,
  required int fallback,
}) {
  final int resolved = evaluator.resolveOne(
    context,
    key,
    evaluationContext: LimitEvaluationContext.guild,
    baseLimits: kDefaultFreeLimits,
  );
  if (resolved < 0) {
    return fallback;
  }
  return resolved;
}

String formatExpressionFileSize(int bytes) {
  if (bytes < 1024) {
    return '$bytes B';
  }
  return '${(bytes / 1024).toStringAsFixed(1)} KB';
}

String formatExpressionSlotCount(int count, int maxCount) {
  if (maxCount < 0) {
    return '$count / ∞';
  }
  return '$count / $maxCount';
}
