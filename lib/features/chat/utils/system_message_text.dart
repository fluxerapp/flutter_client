import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';

const String kGuildJoinMessageUsernamePlaceholder = '__USERNAME__';

typedef GuildJoinMessageBuilder = String Function(String username);

List<GuildJoinMessageBuilder> guildJoinMessageBuilders(
  FluxerLocalizations l10n,
) => <GuildJoinMessageBuilder>[
  l10n.systemJoinGladYoureHere,
  l10n.systemJoinWelcomeMakeYourselfAtHome,
  l10n.systemJoinHelloNiceToHaveYouHere,
  l10n.systemJoinHelloJumpInWheneverYoureReady,
  l10n.systemJoinHeyGreatToSeeYouHere,
  l10n.systemJoinHeyThereHopeYouEnjoyYourStay,
  l10n.systemJoinHeyWelcomeAboard,
  l10n.systemJoinGladYouMadeIt,
  l10n.systemJoinWelcomeIn,
  l10n.systemJoinWelcome,
  l10n.systemJoinWelcomeWereGladYoureHere,
  l10n.systemJoinWelcomeHopeYouEnjoyYourTimeHere,
  l10n.systemJoinWelcomeYourNextConversationStartsHere,
  l10n.systemJoinWelcomeWereHappyToHaveYouHere,
  l10n.systemJoinGreatToSeeYouWelcomeIn,
  l10n.systemJoinYoureHereGoodToHaveYouWithUs,
  l10n.systemJoinYouveArrivedLetsGetStarted,
];

int guildJoinMessageIndex({
  required String messageId,
  required int messageCount,
}) {
  if (messageCount <= 0) {
    return 0;
  }
  final int? parsed = int.tryParse(messageId);
  if (parsed == null) {
    return 0;
  }
  final int timestampMs = (parsed >> 22) + kSnowflakeEpochMs;
  return timestampMs % messageCount;
}

String resolveGuildJoinMessageTemplate(
  FluxerLocalizations l10n, {
  required String messageId,
}) {
  final builders = guildJoinMessageBuilders(l10n);
  final index = guildJoinMessageIndex(
    messageId: messageId,
    messageCount: builders.length,
  );
  return builders[index](kGuildJoinMessageUsernamePlaceholder);
}

String resolveGuildJoinMessage(
  FluxerLocalizations l10n, {
  required String messageId,
  required String username,
}) {
  final builders = guildJoinMessageBuilders(l10n);
  final index = guildJoinMessageIndex(
    messageId: messageId,
    messageCount: builders.length,
  );
  return builders[index](username);
}
