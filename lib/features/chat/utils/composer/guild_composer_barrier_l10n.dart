import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String guildComposerBarrierMessage(
  FluxerLocalizations l10n,
  GuildComposerBlockReason reason,
) {
  return switch (reason) {
    GuildComposerBlockReason.guildSendDisabled =>
      l10n.channelComposerBarrierGuildSendDisabled,
    GuildComposerBlockReason.timedOut => l10n.channelComposerBarrierTimedOut,
    GuildComposerBlockReason.unclaimedAccount =>
      l10n.channelComposerBarrierUnclaimedAccount,
    GuildComposerBlockReason.unverifiedEmail =>
      l10n.channelComposerBarrierUnverifiedEmail,
    GuildComposerBlockReason.accountTooNew =>
      l10n.channelComposerBarrierAccountTooNew,
    GuildComposerBlockReason.notMemberLongEnough =>
      l10n.channelComposerBarrierNotMemberLongEnough,
    GuildComposerBlockReason.noPhoneNumber =>
      l10n.channelComposerBarrierNoPhoneNumber,
  };
}

String formatComposerBarrierCountdown(Duration remaining) {
  final int totalSeconds = remaining.inSeconds <= 0
      ? 0
      : (remaining.inMilliseconds + 999) ~/ 1000;
  final int minutes = totalSeconds ~/ 60;
  final int seconds = totalSeconds % 60;
  return '$minutes:${seconds.toString().padLeft(2, '0')}';
}
