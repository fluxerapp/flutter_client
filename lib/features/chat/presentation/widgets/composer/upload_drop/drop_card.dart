import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class UploadDropCard extends StatelessWidget {
  const UploadDropCard({
    required this.destination,
    required this.shiftHeld,
    required this.slowmodeBlocked,
    super.key,
  });

  static const double _kWidth = 352;
  static const double _kSideMargin = 16;
  static const double _kPadding = 20;
  static const double _kRadius = 12;
  static const double _kGap = 12;
  static const double _kIconTile = 48;
  static const double _kIconSize = 24;
  static const double _kTextGap = 5.6;
  static const double _kTitleSize = 16.8;
  static const double _kDescriptionSize = 14;
  static const double _kBannerMinHeight = 36;
  static const double _kBannerRadius = 8;
  static const double _kBannerFontSize = 12;
  static const double _kIndicator = 20;
  static const double _kIndicatorRadius = 5.6;
  static const double _kIndicatorIcon = 12;
  static const List<BoxShadow> _kShadow = <BoxShadow>[
    BoxShadow(color: Color(0x33000000), blurRadius: 28, offset: Offset(0, 12)),
  ];

  final String destination;
  final bool shiftHeld;
  final bool slowmodeBlocked;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool light = Theme.of(context).brightness == Brightness.light;
    final Color activeFill = light
        ? colors.brandPrimary
        : colors.brandPrimaryLight;
    final String description = shiftHeld
        ? l10n.uploadDropDirectDescription
        : slowmodeBlocked
        ? l10n.uploadDropSlowmodeDescription
        : l10n.uploadDropDescription;
    return Container(
      width: _kWidth,
      margin: const EdgeInsets.symmetric(horizontal: _kSideMargin),
      padding: const EdgeInsets.all(_kPadding),
      decoration: BoxDecoration(
        color: colors.backgroundPrimary,
        borderRadius: BorderRadius.circular(_kRadius),
        border: Border.all(color: colors.backgroundHeaderSecondary),
        boxShadow: _kShadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: _kGap,
        children: <Widget>[
          Container(
            width: _kIconTile,
            height: _kIconTile,
            decoration: BoxDecoration(
              color: colors.backgroundSecondary,
              borderRadius: BorderRadius.circular(_kRadius),
              border: Border.all(color: colors.backgroundHeaderSecondary),
            ),
            child: PhosphorIcon(
              PhosphorIconsFill.file,
              size: _kIconSize,
              color: colors.textPrimaryMuted,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: _kTextGap,
            children: <Widget>[
              Text(
                shiftHeld
                    ? l10n.uploadDropDirectTitle(destination)
                    : l10n.uploadDropTitle(destination),
                textAlign: TextAlign.center,
                style: context.textStyles.channelName.copyWith(
                  fontSize: _kTitleSize,
                  fontWeight: FontWeight.w600,
                  color: colors.textPrimary,
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: context.textStyles.bodyMedium.copyWith(
                  fontSize: _kDescriptionSize,
                  height: 1.4,
                  color: colors.textPrimaryMuted,
                ),
              ),
            ],
          ),
          Container(
            constraints: const BoxConstraints(minHeight: _kBannerMinHeight),
            padding: const EdgeInsets.symmetric(
              horizontal: 10.4,
              vertical: 7.2,
            ),
            decoration: BoxDecoration(
              color: colors.backgroundSecondary,
              borderRadius: BorderRadius.circular(_kBannerRadius),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: <Widget>[
                AnimatedContainer(
                  duration: context.motion.fast,
                  width: _kIndicator,
                  height: _kIndicator,
                  decoration: BoxDecoration(
                    color: shiftHeld ? activeFill : colors.backgroundPrimary,
                    borderRadius: BorderRadius.circular(_kIndicatorRadius),
                    border: Border.all(
                      color: shiftHeld
                          ? activeFill
                          : colors.backgroundModifierHover,
                    ),
                  ),
                  child: PhosphorIcon(
                    PhosphorIconsFill.arrowFatUp,
                    size: _kIndicatorIcon,
                    color: shiftHeld
                        ? colors.brandPrimaryFill
                        : colors.textPrimaryMuted,
                  ),
                ),
                Flexible(
                  child: Text(
                    shiftHeld
                        ? l10n.uploadDropDirectActive
                        : l10n.uploadDropHoldHint,
                    style: context.textStyles.smallText.copyWith(
                      fontSize: _kBannerFontSize,
                      color: shiftHeld
                          ? colors.textPrimary
                          : colors.textPrimaryMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
