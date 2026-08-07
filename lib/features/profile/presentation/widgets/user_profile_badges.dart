import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';

const int _kFlagStaff = 1 << 0;
const int _kFlagCtp = 1 << 1;
const int _kFlagPartner = 1 << 2;
const int _kFlagBugHunter = 1 << 3;
const double _kBadgeSize = 20;
const double _kVisionaryIdFontSize = 17;
const double _kVisionaryIdLineHeight = 20;
const String _kStaffBadgeAsset = 'assets/images/badges/staff.svg';
const String _kCtpBadgeAsset = 'assets/images/badges/ctp.svg';
const String _kPartnerBadgeAsset = 'assets/images/badges/partner.svg';
const String _kBugHunterBadgeAsset = 'assets/images/badges/bug-hunter.svg';
const String _kPlutoniumBadgeAsset = 'assets/images/badges/plutonium.svg';

const _kFlagBadgeSpecs = <_FlagBadgeSpec>[
  _FlagBadgeSpec(
    flag: _kFlagStaff,
    asset: _kStaffBadgeAsset,
    tooltip: _FlagBadgeTooltip.staff,
  ),
  _FlagBadgeSpec(
    flag: _kFlagCtp,
    asset: _kCtpBadgeAsset,
    tooltip: _FlagBadgeTooltip.ctp,
  ),
  _FlagBadgeSpec(
    flag: _kFlagPartner,
    asset: _kPartnerBadgeAsset,
    tooltip: _FlagBadgeTooltip.partner,
  ),
  _FlagBadgeSpec(
    flag: _kFlagBugHunter,
    asset: _kBugHunterBadgeAsset,
    tooltip: _FlagBadgeTooltip.bugHunter,
  ),
];

enum _FlagBadgeTooltip { staff, ctp, partner, bugHunter }

class _FlagBadgeSpec {
  const _FlagBadgeSpec({
    required this.flag,
    required this.asset,
    required this.tooltip,
  });

  final int flag;
  final String asset;
  final _FlagBadgeTooltip tooltip;

  bool isSet(int flags) => flags & flag != 0;

  String tooltipText(FluxerLocalizations l10n) {
    return switch (tooltip) {
      _FlagBadgeTooltip.staff => l10n.userProfileStaffBadgeTooltip,
      _FlagBadgeTooltip.ctp => l10n.userProfileCtpBadgeTooltip,
      _FlagBadgeTooltip.partner => l10n.userProfilePartnerBadgeTooltip,
      _FlagBadgeTooltip.bugHunter => l10n.userProfileBugHunterBadgeTooltip,
    };
  }
}

TextStyle visionaryIdBadgeTextStyle(BuildContext context) {
  final FluxerColorTheme colors = context.colors;
  final Brightness brightness = Theme.of(context).brightness;
  return context.textStyles.channelName.copyWith(
    color: brightness == Brightness.light
        ? colors.brandPrimary
        : colors.brandPrimaryLight,
    fontSize: _kVisionaryIdFontSize,
    fontWeight: FontWeight.w700,
    height: _kVisionaryIdLineHeight / _kVisionaryIdFontSize,
    fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
  );
}

class UserProfileBadges extends StatelessWidget {
  const UserProfileBadges({
    required this.flags,
    this.hasPlutonium = false,
    this.isLifetimePlutonium = false,
    this.premiumSince,
    this.premiumLifetimeSequence,
    super.key,
  });

  final int flags;
  final bool hasPlutonium;
  final bool isLifetimePlutonium;
  final String? premiumSince;
  final int? premiumLifetimeSequence;

  static bool hasBadges({required int flags, bool hasPlutonium = false}) {
    return hasPlutonium || _kFlagBadgeSpecs.any((badge) => badge.isSet(flags));
  }

  Widget _wrapBadge(
    BuildContext context, {
    required String tooltip,
    required Widget child,
  }) {
    final content = FluxerTappable(
      onTap: () => ProviderScope.containerOf(
        context,
        listen: false,
      ).read(toastProvider.notifier).show(FluxerToast(message: tooltip)),
      button: true,
      semanticLabel: tooltip,
      excludeChildSemantics: true,
      builder: (context, states) => child,
    );

    return Tooltip(message: tooltip, preferBelow: false, child: content);
  }

  Widget _buildBadge(
    BuildContext context, {
    required String asset,
    required String tooltip,
  }) {
    return _wrapBadge(
      context,
      tooltip: tooltip,
      child: SvgPicture.asset(
        asset,
        width: _kBadgeSize,
        height: _kBadgeSize,
        semanticsLabel: tooltip,
      ),
    );
  }

  String _premiumTooltip(FluxerLocalizations l10n) {
    final String? since = _formatPremiumSince(premiumSince, l10n.localeName);
    if (isLifetimePlutonium) {
      return since == null
          ? l10n.userProfileVisionaryBadgeTooltip
          : l10n.userProfileVisionaryBadgeSinceTooltip(since);
    }
    return since == null
        ? l10n.userProfilePlutoniumBadgeTooltip
        : l10n.userProfilePlutoniumSubscriberSinceTooltip(since);
  }

  static String? _formatPremiumSince(String? premiumSince, String localeName) {
    if (premiumSince == null) {
      return null;
    }
    final DateTime? date = DateTime.tryParse(premiumSince);
    if (date == null) {
      return null;
    }
    return formatUserMediumDate(date.toLocal(), localeName);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<Widget> children = <Widget>[];

    for (final badge in _kFlagBadgeSpecs) {
      if (!badge.isSet(flags)) {
        continue;
      }
      children.add(
        _buildBadge(
          context,
          asset: badge.asset,
          tooltip: badge.tooltipText(l10n),
        ),
      );
    }

    if (hasPlutonium) {
      children.add(
        _buildBadge(
          context,
          asset: _kPlutoniumBadgeAsset,
          tooltip: _premiumTooltip(l10n),
        ),
      );
    }
    if (hasPlutonium && premiumLifetimeSequence != null) {
      final tooltip = l10n.userProfileVisionaryIdTooltip(
        premiumLifetimeSequence!,
      );
      children.add(
        _wrapBadge(
          context,
          tooltip: tooltip,
          child: Text(
            '#$premiumLifetimeSequence',
            style: visionaryIdBadgeTextStyle(context),
          ),
        ),
      );
    }
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }
    return Wrap(spacing: 4, runSpacing: 4, children: children);
  }
}
