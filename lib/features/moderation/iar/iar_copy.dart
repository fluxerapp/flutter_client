// Localized copy for the IAR flow, mirroring web `IARModalCopy.ts`.

import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/features/moderation/iar/iar_flow.dart';
import 'package:fluxer_app/features/moderation/iar/iar_resolved_context.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// Step title for header rendering. Returns the empty string for steps that
/// reuse the sheet's own header (path) or render no title (guidance).
String iarStepTitle(FluxerLocalizations l10n, IarStep step) {
  return switch (step) {
    IarStep.path => '',
    IarStep.category => l10n.iarCategoryStepTitle,
    IarStep.reason => l10n.iarReasonStepTitle,
    IarStep.guidance => '',
    IarStep.success => l10n.iarSuccessTitle,
  };
}

String iarCategoryLabel(FluxerLocalizations l10n, IarRuleCategory category) {
  return switch (category) {
    IarRuleCategory.targetedHarm => l10n.iarCategoryTargetedHarmLabel,
    IarRuleCategory.safetyMinors => l10n.iarCategorySafetyMinorsLabel,
    IarRuleCategory.privacyIdentity => l10n.iarCategoryPrivacyIdentityLabel,
    IarRuleCategory.deception => l10n.iarCategoryDeceptionLabel,
    IarRuleCategory.illegalOther => l10n.iarCategoryIllegalOtherLabel,
  };
}

String iarCategoryDescription(
  FluxerLocalizations l10n,
  IarRuleCategory category,
) {
  return switch (category) {
    IarRuleCategory.targetedHarm => l10n.iarCategoryTargetedHarmDescription,
    IarRuleCategory.safetyMinors => l10n.iarCategorySafetyMinorsDescription,
    IarRuleCategory.privacyIdentity =>
      l10n.iarCategoryPrivacyIdentityDescription,
    IarRuleCategory.deception => l10n.iarCategoryDeceptionDescription,
    IarRuleCategory.illegalOther => l10n.iarCategoryIllegalOtherDescription,
  };
}

/// Display name for a rule reason within the message-report flow.
///
/// Returns null when the reason does not surface in the message taxonomy
/// (`inappropriateProfile`, `raidCoordination`, `terrorismExtremism` are
/// exclusive to the web's user/guild flows and have no mobile entry point
/// yet).
String? iarMessageReasonLabel(FluxerLocalizations l10n, IarRuleReason reason) {
  return switch (reason) {
    IarRuleReason.harassment => l10n.iarReasonHarassmentLabel,
    IarRuleReason.hate => l10n.iarReasonHateLabel,
    IarRuleReason.violence => l10n.iarReasonViolenceLabel,
    IarRuleReason.matureContent => l10n.iarReasonMatureContentLabel,
    IarRuleReason.childSafety => l10n.iarReasonChildSafetyLabel,
    IarRuleReason.harmfulMisinformation => l10n.iarReasonHarmfulMisinfoLabel,
    IarRuleReason.spamScams => l10n.iarReasonSpamLabel,
    IarRuleReason.malware => l10n.iarReasonMalwareLabel,
    IarRuleReason.privacy => l10n.iarReasonPrivacyLabel,
    IarRuleReason.impersonation => l10n.iarReasonImpersonationLabel,
    IarRuleReason.illegalActivity => l10n.iarReasonIllegalLabel,
    IarRuleReason.selfHarm => l10n.iarReasonSelfHarmLabel,
    IarRuleReason.other => l10n.iarReasonOtherLabel,
    IarRuleReason.terrorismExtremism => null,
    IarRuleReason.raidCoordination => null,
    IarRuleReason.inappropriateProfile => null,
  };
}

String? iarMessageReasonDescription(
  FluxerLocalizations l10n,
  IarRuleReason reason, {
  String productName = InstanceConstants.defaultProductName,
}) {
  return switch (reason) {
    IarRuleReason.harassment => l10n.iarReasonHarassmentMessageDescription,
    IarRuleReason.hate => l10n.iarReasonHateMessageDescription,
    IarRuleReason.violence => l10n.iarReasonViolenceDescription,
    IarRuleReason.matureContent =>
      l10n.iarReasonMatureContentMessageDescription,
    IarRuleReason.childSafety => l10n.iarReasonChildSafetyMessageDescription,
    IarRuleReason.harmfulMisinformation =>
      l10n.iarReasonHarmfulMisinfoDescription,
    IarRuleReason.spamScams => l10n.iarReasonSpamMessageDescription,
    IarRuleReason.malware => l10n.iarReasonMalwareDescription,
    IarRuleReason.privacy => l10n.iarReasonPrivacyDescription,
    IarRuleReason.impersonation =>
      l10n.iarReasonImpersonationMessageDescription,
    IarRuleReason.illegalActivity => l10n.iarReasonIllegalDescription,
    IarRuleReason.selfHarm => l10n.iarReasonSelfHarmMessageDescription,
    IarRuleReason.other => l10n.iarReasonOtherDescription(productName),
    IarRuleReason.terrorismExtremism => null,
    IarRuleReason.raidCoordination => null,
    IarRuleReason.inappropriateProfile => null,
  };
}

/// Inline note that nudges the user toward the `child_safety` reason when
/// they pick an adjacent reason that frequently covers minors. Returns null
/// for reasons that do not need a nudge.
String? iarChildSafetyRoutingNote(
  FluxerLocalizations l10n,
  IarRuleReason? selectedReason,
) {
  if (selectedReason == null) {
    return null;
  }
  return switch (selectedReason) {
    IarRuleReason.illegalActivity ||
    IarRuleReason.matureContent ||
    IarRuleReason.other => l10n.iarUseChildSafetyInstead(
      l10n.iarReasonChildSafetyLabel,
    ),
    _ => null,
  };
}

/// Inline safety note shown for reasons that benefit from emergency-services
/// context. Returns null for reasons that don't need one.
String? iarSpecialSafetyNote(
  FluxerLocalizations l10n,
  IarRuleReason? selectedReason,
) {
  if (selectedReason == null) {
    return null;
  }
  return switch (selectedReason) {
    IarRuleReason.childSafety => l10n.iarSafetyNoteChildSafety,
    IarRuleReason.selfHarm => l10n.iarSafetyNoteSelfHarm,
    IarRuleReason.violence => l10n.iarSafetyNoteViolence,
    IarRuleReason.terrorismExtremism => l10n.iarSafetyNoteTerrorism,
    _ => null,
  };
}

/// Primary-path radio options on step 1.
///
/// The `community` option is only offered when the report has a community
/// context the user is currently part of. The `preference` option uses
/// context-specific copy ("I don't like this content/user/community").
List<FluxerRadioItem<IarPrimaryPath>> iarPrimaryPathOptions(
  FluxerLocalizations l10n,
  IarContext context,
  IarResolvedContext resolved,
) {
  final options = <FluxerRadioItem<IarPrimaryPath>>[
    FluxerRadioItem(
      value: IarPrimaryPath.platform,
      label: l10n.iarPathPlatform,
    ),
  ];
  if (resolved.hasCommunityContext) {
    options.add(
      FluxerRadioItem(
        value: IarPrimaryPath.community,
        label: l10n.iarPathCommunity,
      ),
    );
  }
  options.add(
    FluxerRadioItem(
      value: IarPrimaryPath.preference,
      label: _iarPreferencePathLabel(l10n, context),
    ),
  );
  return options;
}

String _iarPreferencePathLabel(FluxerLocalizations l10n, IarContext context) {
  return switch (context) {
    IarMessageContext() => l10n.iarPathPreferenceMessage,
    IarUserContext() => throw UnsupportedError(
      'User reports use showSimpleIarReportSheet, not the multi-step flow.',
    ),
    IarGuildContext() => throw UnsupportedError(
      'Guild reports use showSimpleIarReportSheet, not the multi-step flow.',
    ),
  };
}

/// Category radio options on step 2. Always returns the full set; the
/// category step does not filter by context.
List<FluxerRadioItem<IarRuleCategory>> iarCategoryOptions(
  FluxerLocalizations l10n,
) {
  return [
    for (final category in IarRuleCategory.values)
      FluxerRadioItem(
        value: category,
        label: iarCategoryLabel(l10n, category),
        description: iarCategoryDescription(l10n, category),
      ),
  ];
}

/// Reason radio options on step 3, filtered to the selected category and the
/// message-report taxonomy.
List<FluxerRadioItem<IarRuleReason>> iarMessageReasonOptions(
  FluxerLocalizations l10n,
  IarRuleCategory? category, {
  String productName = InstanceConstants.defaultProductName,
}) {
  final pool = category == null
      ? IarRuleReason.values
      : ruleReasonsByCategory[category] ?? const <IarRuleReason>[];
  final items = <FluxerRadioItem<IarRuleReason>>[];
  for (final reason in pool) {
    final label = iarMessageReasonLabel(l10n, reason);
    if (label == null) {
      continue;
    }
    items.add(
      FluxerRadioItem(
        value: reason,
        label: label,
        description: iarMessageReasonDescription(
          l10n,
          reason,
          productName: productName,
        ),
      ),
    );
  }
  return items;
}

/// Reason dropdown options for the simple mobile message-report flow: the flat
/// [messageReportReasons] list in web `getMessageRuleReasonOptions` order.
List<FluxerSelectItem<IarRuleReason>> iarFlatMessageReasonSelectOptions(
  FluxerLocalizations l10n, {
  String productName = InstanceConstants.defaultProductName,
}) {
  final items = <FluxerSelectItem<IarRuleReason>>[];
  for (final reason in messageReportReasons) {
    final label = iarMessageReasonLabel(l10n, reason);
    if (label == null) {
      continue;
    }
    items.add(
      FluxerSelectItem(
        value: reason,
        label: label,
        description: iarMessageReasonDescription(
          l10n,
          reason,
          productName: productName,
        ),
      ),
    );
  }
  return items;
}

/// Display name for a rule reason within the user-report flow. Delegates to
/// [iarMessageReasonLabel] and adds the `inappropriateProfile` label, which is
/// surfaced only in the user/guild taxonomy.
String? iarUserReasonLabel(FluxerLocalizations l10n, IarRuleReason reason) {
  if (reason == IarRuleReason.inappropriateProfile) {
    return l10n.iarReasonInappropriateProfile;
  }
  return iarMessageReasonLabel(l10n, reason);
}

/// Reason dropdown options for the simple mobile user-report flow: the flat
/// [userReportReasons] list in web `getUserRuleReasonOptions` order.
List<FluxerSelectItem<IarRuleReason>> iarFlatUserReasonSelectOptions(
  FluxerLocalizations l10n, {
  String productName = InstanceConstants.defaultProductName,
}) {
  final items = <FluxerSelectItem<IarRuleReason>>[];
  for (final reason in userReportReasons) {
    final label = iarUserReasonLabel(l10n, reason);
    if (label == null) {
      continue;
    }
    items.add(
      FluxerSelectItem(
        value: reason,
        label: label,
        description: reason == IarRuleReason.inappropriateProfile
            ? l10n.iarReasonInappropriateProfileDescription
            : iarMessageReasonDescription(
                l10n,
                reason,
                productName: productName,
              ),
      ),
    );
  }
  return items;
}

/// Display name for a rule reason within the guild-report flow.
String? iarGuildReasonLabel(FluxerLocalizations l10n, IarRuleReason reason) {
  return switch (reason) {
    IarRuleReason.harassment => l10n.iarReasonHarassmentGuildLabel,
    IarRuleReason.hate => l10n.iarReasonHateLabel,
    IarRuleReason.terrorismExtremism => l10n.iarReasonTerrorismLabel,
    IarRuleReason.matureContent => l10n.iarReasonMatureContentGuildLabel,
    IarRuleReason.childSafety => l10n.iarReasonChildSafetyLabel,
    IarRuleReason.harmfulMisinformation => l10n.iarReasonHarmfulMisinfoLabel,
    IarRuleReason.raidCoordination => l10n.iarReasonRaidLabel,
    IarRuleReason.spamScams => l10n.iarReasonSpamLabel,
    IarRuleReason.malware => l10n.iarReasonMalwareGuildLabel,
    IarRuleReason.privacy => l10n.iarReasonPrivacyGuildLabel,
    IarRuleReason.illegalActivity => l10n.iarReasonIllegalLabel,
    IarRuleReason.selfHarm => l10n.iarReasonSelfHarmGuildLabel,
    IarRuleReason.other => l10n.iarReasonOtherLabel,
    IarRuleReason.violence => null,
    IarRuleReason.impersonation => null,
    IarRuleReason.inappropriateProfile => null,
  };
}

String? iarGuildReasonDescription(
  FluxerLocalizations l10n,
  IarRuleReason reason, {
  String productName = InstanceConstants.defaultProductName,
}) {
  return switch (reason) {
    IarRuleReason.harassment => l10n.iarReasonHarassmentGuildDescription,
    IarRuleReason.hate => l10n.iarReasonHateGuildDescription,
    IarRuleReason.terrorismExtremism => l10n.iarReasonTerrorismDescription,
    IarRuleReason.matureContent => l10n.iarReasonMatureContentGuildDescription,
    IarRuleReason.childSafety => l10n.iarReasonChildSafetyGuildDescription,
    IarRuleReason.harmfulMisinformation =>
      l10n.iarReasonHarmfulMisinfoDescription,
    IarRuleReason.raidCoordination => l10n.iarReasonRaidDescription,
    IarRuleReason.spamScams => l10n.iarReasonSpamGuildDescription,
    IarRuleReason.malware => l10n.iarReasonMalwareGuildDescription,
    IarRuleReason.privacy => l10n.iarReasonPrivacyGuildDescription,
    IarRuleReason.illegalActivity => l10n.iarReasonIllegalDescription,
    IarRuleReason.selfHarm => l10n.iarReasonSelfHarmGuildDescription,
    IarRuleReason.other => l10n.iarReasonOtherDescription(productName),
    IarRuleReason.violence => null,
    IarRuleReason.impersonation => null,
    IarRuleReason.inappropriateProfile => null,
  };
}

List<FluxerSelectItem<IarRuleReason>> iarFlatGuildReasonSelectOptions(
  FluxerLocalizations l10n, {
  String productName = InstanceConstants.defaultProductName,
}) {
  final items = <FluxerSelectItem<IarRuleReason>>[];
  for (final reason in guildReportReasons) {
    final label = iarGuildReasonLabel(l10n, reason);
    if (label == null) {
      continue;
    }
    items.add(
      FluxerSelectItem(
        value: reason,
        label: label,
        description: iarGuildReasonDescription(
          l10n,
          reason,
          productName: productName,
        ),
      ),
    );
  }
  return items;
}
