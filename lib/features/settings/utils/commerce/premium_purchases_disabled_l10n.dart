import 'package:fluxer_app/core/constants/contact_emails.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String premiumPurchasesDisabledMessage(
  FluxerLocalizations l10n, {
  required bool selfHosted,
}) {
  return selfHosted
      ? l10n.premiumPurchasesDisabledBodySelfHosted
      : l10n.premiumPurchasesDisabledBody(ContactEmails.support);
}

String premiumPlanUnavailableMessage(
  FluxerLocalizations l10n, {
  required bool selfHosted,
}) {
  return selfHosted
      ? l10n.premiumPlanUnavailableSelfHosted
      : l10n.premiumPlanUnavailable;
}
