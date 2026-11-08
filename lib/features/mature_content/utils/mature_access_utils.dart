import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';

enum MatureGeoStatus { none, restricted, blocked }

MatureAccess resolveMatureAccess({
  required bool serverAllowsMature,
  required bool deviceDeclaredMinor,
  required MatureGeoStatus geo,
  required bool matureContentUnlocked,
  required bool appStorePolicy,
  required bool iosOptIn,
}) {
  if (!serverAllowsMature || deviceDeclaredMinor) {
    return MatureAccess.minor;
  }
  if (geo == MatureGeoStatus.blocked) {
    return MatureAccess.regionLocked;
  }
  if (geo == MatureGeoStatus.restricted && !matureContentUnlocked) {
    return MatureAccess.regionLocked;
  }
  if (appStorePolicy && !iosOptIn) {
    return MatureAccess.appLocked;
  }
  return MatureAccess.allowed;
}

bool resolveInAppShowLocked({
  required bool appStorePolicy,
  required bool serverAllowsMature,
  required bool deviceDeclaredMinor,
  required bool iosOptIn,
}) {
  return appStorePolicy &&
      !(serverAllowsMature && !deviceDeclaredMinor && iosOptIn);
}

ResolvedMatureGateContext groupDmMatureGateContext(String channelId) {
  return ResolvedMatureGateContext(
    channelId: channelId,
    categoryId: null,
    guildId: null,
    effectiveMatureContent: true,
    effectiveWarningLevel: contentWarningLevelInherit,
    effectiveWarningText: null,
    scope: MatureContentAgreementScope.channel,
    scopeId: channelId,
  );
}

MatureContentGateReason matureGateReasonForAccess(MatureAccess access) {
  return switch (access) {
    MatureAccess.allowed => MatureContentGateReason.none,
    MatureAccess.minor => MatureContentGateReason.minorBlocked,
    MatureAccess.regionLocked => MatureContentGateReason.regionLocked,
    MatureAccess.appLocked => MatureContentGateReason.appLocked,
  };
}
