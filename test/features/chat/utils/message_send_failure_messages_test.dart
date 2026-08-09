import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/message_send_failure_messages.dart';
import '../../../helpers/test_l10n.dart';

void main() {
  final FluxerLocalizations l10n = testL10n;

  test('maps DM restriction error to localized message', () {
    final String? message = clientSystemMessageForSendError(
      apiErrorCode: apiErrorCodeCannotSendMessagesToUser,
      l10n: l10n,
    );
    expect(message, isNotNull);
    expect(message, contains('could not be delivered'));
    expect(message, contains(l10n.privacyDashboardCommunicationSection));
  });

  test('maps unclaimed account DM error', () {
    final String? message = clientSystemMessageForSendError(
      apiErrorCode: apiErrorCodeUnclaimedAccountCannotSendDirectMessages,
      l10n: l10n,
    );
    expect(message, l10n.chatSendFailureUnclaimedDm);
  });

  test('maps unclaimed account general error', () {
    final String? message = clientSystemMessageForSendError(
      apiErrorCode: apiErrorCodeUnclaimedAccountCannotSendMessages,
      l10n: l10n,
    );
    expect(message, l10n.chatSendFailureUnclaimedGeneral);
  });

  test('maps content blocked error', () {
    final String? message = clientSystemMessageForSendError(
      apiErrorCode: apiErrorCodeContentBlocked,
      l10n: l10n,
    );
    expect(message, l10n.chatSendFailureContentBlocked);
  });

  test('maps NSFW emoji sticker error', () {
    final String? message = clientSystemMessageForSendError(
      apiErrorCode: apiErrorCodeNsfwEmojiStickerBlocked,
      l10n: l10n,
    );
    expect(message, l10n.chatSendFailureNsfwEmojiSticker);
  });

  test('returns null for unknown error codes', () {
    expect(
      clientSystemMessageForSendError(
        apiErrorCode: 'SOME_OTHER_ERROR',
        l10n: l10n,
      ),
      isNull,
    );
    expect(
      clientSystemMessageForSendError(apiErrorCode: null, l10n: l10n),
      isNull,
    );
  });
}
