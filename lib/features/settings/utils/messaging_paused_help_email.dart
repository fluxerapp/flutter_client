import 'package:fluxer_app/core/constants/contact_emails.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

typedef MessagingPausedHelpEmail = ({String body, String mailto});

MessagingPausedHelpEmail buildMessagingPausedHelpEmail({
  required FluxerLocalizations l10n,
  required String accountId,
  required String userTag,
  required DateTime createdAt,
  required String country,
}) {
  final String subject = l10n.messagingPausedTextDidNotGoThrough;
  final String body = <String>[
    subject,
    '',
    l10n.messagingPausedHelpAccountIdLine(accountId),
    l10n.messagingPausedHelpUsernameLine(userTag),
    l10n.messagingPausedHelpAccountCreatedLine(
      createdAt.toUtc().toIso8601String(),
    ),
    l10n.messagingPausedHelpCountryLine(country.trim()),
  ].join('\n');
  final String mailto =
      'mailto:${ContactEmails.support}'
      '?subject=${Uri.encodeComponent(subject)}'
      '&body=${Uri.encodeComponent(body)}';
  return (body: body, mailto: mailto);
}
