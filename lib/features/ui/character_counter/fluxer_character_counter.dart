import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class FluxerCharacterCounter extends StatelessWidget {
  const FluxerCharacterCounter({
    required this.current,
    required this.max,
    this.canUpgrade = false,
    this.premiumMaxLength,
    this.onUpgradePressed,
    this.showTooltip = true,
    super.key,
  });

  final int current;
  final int max;
  final bool canUpgrade;
  final int? premiumMaxLength;
  final VoidCallback? onUpgradePressed;
  final bool showTooltip;

  static const int _kNearingThreshold = 50;

  @override
  Widget build(BuildContext context) {
    final int remaining = max - current;
    final bool isOverLimit = remaining < 0;
    final bool isNearingLimit = remaining < _kNearingThreshold;
    final Color color = isOverLimit || isNearingLimit
        ? context.colors.statusDanger
        : context.colors.textTertiary;
    final TextStyle textStyle = context.textStyles.smallText.copyWith(
      color: color,
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool needsPremium =
        canUpgrade &&
        premiumMaxLength != null &&
        onUpgradePressed != null &&
        (isNearingLimit || isOverLimit);
    final String tooltipText = needsPremium
        ? l10n.characterCounterRemainingPlutoniumUpsell(
            remaining,
            l10n.getPlutonium,
            premiumMaxLength!,
          )
        : isOverLimit
        ? l10n.characterCounterTooLong
        : l10n.characterCounterRemaining(remaining);
    final Widget counterLabel = ExcludeSemantics(
      child: Text('$remaining', style: textStyle, textAlign: TextAlign.right),
    );
    final Widget counterChild = needsPremium
        ? TextButton(
            onPressed: onUpgradePressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor: color,
            ),
            child: counterLabel,
          )
        : counterLabel;
    final Widget semanticsChild = Semantics(
      label: tooltipText,
      liveRegion: true,
      child: counterChild,
    );
    if (!showTooltip) {
      return semanticsChild;
    }
    return FluxerTooltip(message: tooltipText, child: semanticsChild);
  }
}

@FluxerWidgetPreview(name: 'Normal', group: 'FluxerCharacterCounter')
Widget fluxerCharacterCounterNormalPreview() {
  return const FluxerCharacterCounter(current: 24, max: 100);
}

@FluxerWidgetPreview(name: 'Near limit', group: 'FluxerCharacterCounter')
Widget fluxerCharacterCounterWarnPreview() {
  return const FluxerCharacterCounter(current: 85, max: 100);
}

@FluxerWidgetPreview(name: 'Over limit', group: 'FluxerCharacterCounter')
Widget fluxerCharacterCounterOverPreview() {
  return const FluxerCharacterCounter(current: 120, max: 100);
}
