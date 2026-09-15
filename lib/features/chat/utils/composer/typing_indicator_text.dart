import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/mention_display_utils.dart';

const String kTypingIndicatorNamePlaceholder = '\uFFFC';

GuildUserDisplay fallbackTypingUserDisplay(String userId) {
  final String fallbackName = shortMentionWireIdFallback(userId);
  return GuildUserDisplay(
    displayName: fallbackName,
    accountDisplayName: fallbackName,
    avatarUrl: null,
    avatarColor: null,
  );
}

String? resolveTypingIndicatorBulkText(FluxerLocalizations l10n, int total) {
  if (total == 4) {
    return l10n.typingIndicatorMultiple;
  }
  if (total >= 5 && total <= 9) {
    return l10n.typingIndicatorHandful;
  }
  if (total >= 10 && total <= 14) {
    return l10n.typingIndicatorSymphony;
  }
  if (total >= 15 && total <= 19) {
    return l10n.typingIndicatorFiesta;
  }
  if (total >= 20) {
    return l10n.typingIndicatorApocalypse;
  }
  return null;
}

String typingIndicatorNamedTemplate(FluxerLocalizations l10n, int total) {
  switch (total) {
    case 1:
      return l10n.typingIndicatorOne(kTypingIndicatorNamePlaceholder);
    case 2:
      return l10n.typingIndicatorTwo(
        kTypingIndicatorNamePlaceholder,
        kTypingIndicatorNamePlaceholder,
      );
    default:
      return l10n.typingIndicatorThree(
        kTypingIndicatorNamePlaceholder,
        kTypingIndicatorNamePlaceholder,
        kTypingIndicatorNamePlaceholder,
      );
  }
}
