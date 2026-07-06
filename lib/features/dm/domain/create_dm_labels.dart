import 'package:fluxer_app/features/dm/domain/create_dm_restriction.dart';
import 'package:fluxer_app/features/dm/utils/create_dm_api_errors.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String createDmButtonLabel(FluxerLocalizations l10n, int selectedCount) {
  if (selectedCount == 1) {
    return l10n.createDm;
  }
  return l10n.createGroupDm;
}

String createDmRestrictionTitle(
  FluxerLocalizations l10n,
  CreateDmRestriction restriction,
) {
  return switch (restriction) {
    CreateDmRestriction.unclaimed => l10n.claimAccountTitle,
    CreateDmRestriction.unverified => l10n.createDmVerifyYourEmail,
  };
}

String createDmRestrictionDescription(
  FluxerLocalizations l10n,
  CreateDmRestriction restriction,
) {
  return switch (restriction) {
    CreateDmRestriction.unclaimed => l10n.createDmClaimToStartDms,
    CreateDmRestriction.unverified => l10n.createDmVerifyToStartDms,
  };
}

String createDmRestrictionActionLabel(
  FluxerLocalizations l10n,
  CreateDmRestriction restriction,
) {
  return switch (restriction) {
    CreateDmRestriction.unclaimed => l10n.claimAccount,
    CreateDmRestriction.unverified => l10n.channelComposerBarrierVerifyEmail,
  };
}

String unaddableRecipientReasonLabel(
  FluxerLocalizations l10n,
  UnaddableRecipientReason reason,
) {
  return switch (reason) {
    UnaddableRecipientReason.unknownUser => l10n.createDmUnaddableUserNotFound,
    UnaddableRecipientReason.blocked => l10n.createDmUnaddableBlocked,
    UnaddableRecipientReason.notFriends => l10n.createDmUnaddableNotFriends,
    UnaddableRecipientReason.groupDmAddDisabled =>
      l10n.createDmUnaddableGroupDisabled,
  };
}
