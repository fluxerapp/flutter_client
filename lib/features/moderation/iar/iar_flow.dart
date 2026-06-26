// In-App Reporting (IAR) flow taxonomy.
//
// Mirrors the web `IARFlowUtils.ts`. The user-facing taxonomy is richer than
// the wire-format enum: the user picks a `IarPrimaryPath` (platform/community/
// preference), then for the `platform` path a high-level `IarRuleCategory`,
// then a specific `IarRuleReason`. At submit time the reason is mapped onto
// the backend wire-format category via [iarReasonToMessageCategory].
//
// NOTE (SDK migration): the in-app report categories now live on the simple
// report request types. `ReportMessageRequestCategoryCategory` is now
// `ReportMessageRequestCategoryCategory` and `ReportUserRequestCategoryCategory` is now
// `ReportUserRequestCategoryCategory` (the `category` field of the
// `ReportMessageRequest` / `ReportUserRequest` bodies submitted by the report
// sheets). These are distinct from the new `DsaReportRequest` discriminated
// union, which backs the separate formal EU DSA reporting flow
// (`createDsaReport`, requiring an email-verification ticket, legal name, and
// country of residence) and is NOT what the IAR in-app report flow uses.
//
// Mobile exposes the `message` and `user` IAR contexts. The `guild` context
// on the web is intentionally deferred until that entry point exists on
// mobile.

import 'package:dio/dio.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_dart/export.dart';

// Stepper position in the IAR flow.
enum IarStep { path, category, reason, guidance, success }

// What the user is trying to do at the top of the flow.
enum IarPrimaryPath { platform, community, preference }

/// Specific platform-rule reasons.
///
/// Source of truth lives in `packages/.../IARFlowUtils.ts`. Order is unstable
/// but value names must match the web exactly so analytics, logs, and
/// regressions can cross-reference both clients.
enum IarRuleReason {
  harassment,
  hate,
  violence,
  terrorismExtremism,
  matureContent,
  childSafety,
  harmfulMisinformation,
  illegalActivity,
  spamScams,
  malware,
  privacy,
  impersonation,
  inappropriateProfile,
  raidCoordination,
  selfHarm,
  other,
}

// High-level category groupings the user picks before drilling into a reason.
enum IarRuleCategory {
  targetedHarm,
  safetyMinors,
  privacyIdentity,
  deception,
  illegalOther,
}

/// Reasons allowed under each category.
///
/// The ordering matches the web list within each category and is what the
/// reason-step radio group renders after [IarRuleCategory] is selected.
const Map<IarRuleCategory, List<IarRuleReason>> ruleReasonsByCategory = {
  IarRuleCategory.targetedHarm: [
    IarRuleReason.harassment,
    IarRuleReason.hate,
    IarRuleReason.violence,
    IarRuleReason.terrorismExtremism,
    IarRuleReason.raidCoordination,
    IarRuleReason.selfHarm,
  ],
  IarRuleCategory.safetyMinors: [
    IarRuleReason.childSafety,
    IarRuleReason.matureContent,
  ],
  IarRuleCategory.privacyIdentity: [
    IarRuleReason.privacy,
    IarRuleReason.impersonation,
    IarRuleReason.inappropriateProfile,
  ],
  IarRuleCategory.deception: [
    IarRuleReason.spamScams,
    IarRuleReason.malware,
    IarRuleReason.harmfulMisinformation,
  ],
  IarRuleCategory.illegalOther: [
    IarRuleReason.illegalActivity,
    IarRuleReason.other,
  ],
};

/// Inverse lookup: which category a reason belongs to.
IarRuleCategory iarCategoryForReason(IarRuleReason reason) {
  for (final entry in ruleReasonsByCategory.entries) {
    if (entry.value.contains(reason)) {
      return entry.key;
    }
  }
  return IarRuleCategory.illegalOther;
}

/// Message-report reasons in the web's `getMessageRuleReasonOptions` display
/// order. Excludes the user/guild-only reasons (`terrorismExtremism`,
/// `inappropriateProfile`, `raidCoordination`), which have no message entry.
///
/// The simple mobile sheet renders this flat list directly; the multi-step
/// flow instead filters [ruleReasonsByCategory] by the chosen category.
const List<IarRuleReason> messageReportReasons = [
  IarRuleReason.harassment,
  IarRuleReason.hate,
  IarRuleReason.violence,
  IarRuleReason.matureContent,
  IarRuleReason.childSafety,
  IarRuleReason.harmfulMisinformation,
  IarRuleReason.spamScams,
  IarRuleReason.malware,
  IarRuleReason.privacy,
  IarRuleReason.impersonation,
  IarRuleReason.illegalActivity,
  IarRuleReason.selfHarm,
  IarRuleReason.other,
];

/// Maps a chosen reason onto the backend wire-format
/// [ReportMessageRequestCategoryCategory]. Mirrors `REPORT_CATEGORY_BY_REASON.message`
/// from the web.
ReportMessageRequestCategoryCategory iarReasonToMessageCategory(IarRuleReason reason) {
  return switch (reason) {
    IarRuleReason.harassment => ReportMessageRequestCategoryCategory.harassment,
    IarRuleReason.hate => ReportMessageRequestCategoryCategory.hateSpeech,
    IarRuleReason.violence => ReportMessageRequestCategoryCategory.violentContent,
    IarRuleReason.terrorismExtremism =>
      ReportMessageRequestCategoryCategory.violentContent,
    IarRuleReason.matureContent => ReportMessageRequestCategoryCategory.nsfwViolation,
    IarRuleReason.childSafety => ReportMessageRequestCategoryCategory.childSafety,
    IarRuleReason.harmfulMisinformation => ReportMessageRequestCategoryCategory.other,
    IarRuleReason.illegalActivity => ReportMessageRequestCategoryCategory.illegalActivity,
    IarRuleReason.spamScams => ReportMessageRequestCategoryCategory.spam,
    IarRuleReason.malware => ReportMessageRequestCategoryCategory.maliciousLinks,
    IarRuleReason.privacy => ReportMessageRequestCategoryCategory.doxxing,
    IarRuleReason.impersonation => ReportMessageRequestCategoryCategory.impersonation,
    IarRuleReason.inappropriateProfile => ReportMessageRequestCategoryCategory.other,
    IarRuleReason.raidCoordination => ReportMessageRequestCategoryCategory.harassment,
    IarRuleReason.selfHarm => ReportMessageRequestCategoryCategory.selfHarm,
    IarRuleReason.other => ReportMessageRequestCategoryCategory.other,
  };
}

/// Classification of a failed report submission so the UI can surface
/// targeted, non-alarming feedback instead of a single generic error.
///
/// The backend returns HTTP 409 when a reporter submits a second report for a
/// message they have already reported (the report is keyed on reporter +
/// channel + message, independent of category), and HTTP 429 when the reporter
/// trips the report rate limit.
enum IarReportFailure {
  /// The reporter has already reported this message (HTTP 409). The earlier
  /// report still exists and is under review, so the sheet treats this as a
  /// terminal, informative state rather than an error.
  alreadyReported,

  /// The reporter is being rate limited (HTTP 429) and should retry later.
  rateLimited,

  /// Any other failure (transport error, server error, unexpected status).
  generic,
}

/// Classifies a thrown report-submission [error] into an [IarReportFailure].
IarReportFailure classifyIarReportFailure(Object error) {
  if (error is DioException) {
    switch (error.response?.statusCode) {
      case 409:
        return IarReportFailure.alreadyReported;
      case 429:
        return IarReportFailure.rateLimited;
    }
  }
  return IarReportFailure.generic;
}

/// Discriminated input to the IAR flow. The message and user variants are
/// wired up; the guild variant will be added when that entry point lands.
sealed class IarContext {
  const IarContext();
}

class IarMessageContext extends IarContext {
  const IarMessageContext({required this.message, required this.guildId});
  final Message message;

  /// Guild owning the channel, or null for DMs and group DMs.
  final String? guildId;
}

class IarUserContext extends IarContext {
  const IarUserContext({
    required this.userId,
    required this.username,
    required this.displayName,
    required this.avatarUrl,
    this.avatarColor,
    this.guildId,
  });

  final String userId;
  final String username;
  final String displayName;
  final String? avatarUrl;
  final int? avatarColor;

  /// Community the report is scoped to, or null for a global (DM/friends)
  /// report.
  final String? guildId;
}

/// User-report reasons in the web's `getUserRuleReasonOptions` display order:
/// the message list plus `inappropriateProfile` (which has no message entry),
/// minus `terrorismExtremism`/`raidCoordination` (guild-only).
const List<IarRuleReason> userReportReasons = [
  IarRuleReason.harassment,
  IarRuleReason.hate,
  IarRuleReason.violence,
  IarRuleReason.matureContent,
  IarRuleReason.childSafety,
  IarRuleReason.harmfulMisinformation,
  IarRuleReason.spamScams,
  IarRuleReason.malware,
  IarRuleReason.privacy,
  IarRuleReason.impersonation,
  IarRuleReason.inappropriateProfile,
  IarRuleReason.illegalActivity,
  IarRuleReason.selfHarm,
  IarRuleReason.other,
];

/// Maps a chosen reason onto the backend wire-format [ReportUserRequestCategoryCategory].
/// Mirrors `REPORT_CATEGORY_BY_REASON.user` from the web.
ReportUserRequestCategoryCategory iarReasonToUserCategory(IarRuleReason reason) {
  return switch (reason) {
    IarRuleReason.harassment => ReportUserRequestCategoryCategory.harassment,
    IarRuleReason.hate => ReportUserRequestCategoryCategory.hateSpeech,
    IarRuleReason.violence => ReportUserRequestCategoryCategory.harassment,
    IarRuleReason.terrorismExtremism => ReportUserRequestCategoryCategory.other,
    IarRuleReason.matureContent => ReportUserRequestCategoryCategory.harassment,
    IarRuleReason.childSafety => ReportUserRequestCategoryCategory.underageUser,
    IarRuleReason.harmfulMisinformation => ReportUserRequestCategoryCategory.other,
    IarRuleReason.illegalActivity => ReportUserRequestCategoryCategory.other,
    IarRuleReason.spamScams => ReportUserRequestCategoryCategory.spamAccount,
    IarRuleReason.malware => ReportUserRequestCategoryCategory.spamAccount,
    IarRuleReason.privacy => ReportUserRequestCategoryCategory.harassment,
    IarRuleReason.impersonation => ReportUserRequestCategoryCategory.impersonation,
    IarRuleReason.inappropriateProfile =>
      ReportUserRequestCategoryCategory.inappropriateProfile,
    IarRuleReason.raidCoordination => ReportUserRequestCategoryCategory.other,
    IarRuleReason.selfHarm => ReportUserRequestCategoryCategory.other,
    IarRuleReason.other => ReportUserRequestCategoryCategory.other,
  };
}
