import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class MatureContentGateCopy {
  const MatureContentGateCopy({
    required this.title,
    required this.body,
    required this.primaryButtonLabel,
    required this.canProceed,
  });

  final String title;
  final String body;
  final String? primaryButtonLabel;
  final bool canProceed;
}

MatureContentGateCopy resolveMatureContentGateCopy({
  required FluxerLocalizations l10n,
  required MatureContentGateReason reason,
  required ResolvedMatureGateContext context,
  ChannelType? channelType,
}) {
  final bool hasCustomWarningText =
      context.effectiveWarningText != null &&
      context.effectiveWarningText!.isNotEmpty;
  final String defaultWarningBody = hasCustomWarningText
      ? context.effectiveWarningText!
      : l10n.defaultContentWarningBody;
  if (reason == MatureContentGateReason.minorBlocked) {
    return MatureContentGateCopy(
      title: _minorBlockedTitle(l10n, context.scope),
      body: _minorBlockedBody(l10n, context.scope),
      primaryButtonLabel: null,
      canProceed: false,
    );
  }
  if (!context.effectiveMatureContent) {
    return MatureContentGateCopy(
      title: _contentWarningTitle(l10n, context.scope),
      body: defaultWarningBody,
      primaryButtonLabel: l10n.matureContentUnderstandButton,
      canProceed: true,
    );
  }
  if (hasCustomWarningText) {
    return MatureContentGateCopy(
      title: l10n.matureContentTitle,
      body: defaultWarningBody,
      primaryButtonLabel: _primaryButtonLabel(
        l10n: l10n,
        channelType: channelType,
        isContentWarningOnly: false,
      ),
      canProceed: true,
    );
  }
  return MatureContentGateCopy(
    title: _matureTitle(l10n, context.scope),
    body: _matureBody(l10n, context.scope, channelType),
    primaryButtonLabel: _primaryButtonLabel(
      l10n: l10n,
      channelType: channelType,
      isContentWarningOnly: false,
    ),
    canProceed: true,
  );
}

String _matureTitle(
  FluxerLocalizations l10n,
  MatureContentAgreementScope scope,
) {
  return switch (scope) {
    MatureContentAgreementScope.guild => l10n.matureCommunityTitle,
    MatureContentAgreementScope.category => l10n.matureCategoryTitle,
    MatureContentAgreementScope.channel => l10n.matureChannelTitle,
  };
}

String _contentWarningTitle(
  FluxerLocalizations l10n,
  MatureContentAgreementScope scope,
) {
  return switch (scope) {
    MatureContentAgreementScope.guild => l10n.communityContentWarningTitle,
    MatureContentAgreementScope.category => l10n.categoryContentWarningTitle,
    MatureContentAgreementScope.channel => l10n.channelContentWarningTitle,
  };
}

String _minorBlockedTitle(
  FluxerLocalizations l10n,
  MatureContentAgreementScope scope,
) {
  return _matureTitle(l10n, scope);
}

String _minorBlockedBody(
  FluxerLocalizations l10n,
  MatureContentAgreementScope scope,
) {
  return switch (scope) {
    MatureContentAgreementScope.guild => l10n.matureCommunityUnavailableBody,
    MatureContentAgreementScope.category => l10n.matureCategoryUnavailableBody,
    MatureContentAgreementScope.channel => l10n.matureChannelUnavailableBody,
  };
}

String _matureBody(
  FluxerLocalizations l10n,
  MatureContentAgreementScope scope,
  ChannelType? channelType,
) {
  if (scope == MatureContentAgreementScope.guild) {
    return l10n.matureCommunityBody;
  }
  if (scope == MatureContentAgreementScope.category) {
    return l10n.matureCategoryBody;
  }
  return switch (channelType) {
    ChannelType.voice => l10n.matureVoiceChannelBody,
    ChannelType.link => l10n.matureLinkChannelBody,
    _ => l10n.matureChannelBody,
  };
}

String _primaryButtonLabel({
  required FluxerLocalizations l10n,
  required ChannelType? channelType,
  required bool isContentWarningOnly,
}) {
  if (isContentWarningOnly) {
    return l10n.matureContentUnderstandButton;
  }
  if (channelType == ChannelType.link) {
    return l10n.matureContentOpenLinkButton;
  }
  return l10n.matureContentProceedButton;
}
