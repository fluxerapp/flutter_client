import 'package:fluxer_app/features/threads/data/thread_api_errors.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const String apiErrorCodeCannotSendMessagesToUser =
    'CANNOT_SEND_MESSAGES_TO_USER';
const String apiErrorCodeUnclaimedAccountCannotSendDirectMessages =
    'UNCLAIMED_ACCOUNT_CANNOT_SEND_DIRECT_MESSAGES';
const String apiErrorCodeUnclaimedAccountCannotSendMessages =
    'UNCLAIMED_ACCOUNT_CANNOT_SEND_MESSAGES';
const String apiErrorCodeContentBlocked = 'CONTENT_BLOCKED';
const String apiErrorCodeNsfwEmojiStickerBlocked = 'NSFW_EMOJI_STICKER_BLOCKED';

String formatPrivacyCommunicationSettingsPath(FluxerLocalizations l10n) {
  return '${l10n.quickSwitcherUserSettingsLabel} > '
      '${l10n.userSettingsNavPrivacyDashboard} > '
      '${l10n.privacyDashboardCommunicationSection}';
}

String? clientSystemMessageForSendError({
  required String? apiErrorCode,
  required FluxerLocalizations l10n,
  required bool selfHosted,
}) {
  switch (apiErrorCode) {
    case apiErrorCodeCannotSendMessagesToUser:
      return l10n.chatSendFailureDmRestricted(
        formatPrivacyCommunicationSettingsPath(l10n),
      );
    case apiErrorCodeUnclaimedAccountCannotSendDirectMessages:
      return l10n.chatSendFailureUnclaimedDm;
    case apiErrorCodeUnclaimedAccountCannotSendMessages:
      return l10n.chatSendFailureUnclaimedGeneral;
    case apiErrorCodeContentBlocked:
      return selfHosted
          ? l10n.chatSendFailureContentBlockedSelfHosted
          : l10n.chatSendFailureContentBlocked;
    case apiErrorCodeNsfwEmojiStickerBlocked:
      return l10n.chatSendFailureNsfwEmojiSticker;
    case 'THREAD_LOCKED':
    case 'THREAD_ARCHIVED':
    case 'MAX_ACTIVE_THREADS':
      return threadApiErrorMessage(apiErrorCode: apiErrorCode, l10n: l10n);
    default:
      return null;
  }
}
