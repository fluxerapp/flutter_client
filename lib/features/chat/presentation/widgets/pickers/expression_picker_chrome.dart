import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_segmented_tabs.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

export 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_segmented_tabs.dart';

const double kExpressionRailHeight = 40;
const double kExpressionRailPitch = 40;
const double kExpressionRailSidePadding = 8;
const double kExpressionRailBubbleSize = 32;
const double kExpressionRailGlyphSize = 22;
const double kExpressionRailGuildIconSize = 24;

Color expressionRailIdleIconColor(BuildContext context) =>
    context.colors.textTertiarySecondary.withValues(alpha: 0.55);

class ExpressionRail extends StatelessWidget {
  const ExpressionRail({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: expressionTabsTrackColor(context)),
        ),
      ),
      child: SizedBox(height: kExpressionRailHeight, child: child),
    );
  }
}

class ExpressionRailButton extends StatelessWidget {
  const ExpressionRailButton({
    required this.label,
    required this.onTap,
    this.icon,
    this.image,
    this.isActive = false,
    super.key,
  });

  final String label;
  final IconData? icon;
  final Widget? image;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final Widget glyph =
        image ??
        PhosphorIcon(
          icon!,
          size: kExpressionRailGlyphSize,
          color: isActive
              ? context.colors.textTertiary
              : expressionRailIdleIconColor(context),
        );
    return Semantics(
      button: true,
      label: label,
      selected: isActive,
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: SizedBox(
          width: kExpressionRailPitch,
          child: Center(
            child: Container(
              width: kExpressionRailBubbleSize,
              height: kExpressionRailBubbleSize,
              alignment: Alignment.center,
              decoration: isActive
                  ? BoxDecoration(
                      color: expressionTabsTrackColor(context),
                      shape: BoxShape.circle,
                    )
                  : null,
              child: ExcludeSemantics(child: glyph),
            ),
          ),
        ),
      ),
    );
  }
}

class ExpressionSectionHeader extends StatelessWidget {
  const ExpressionSectionHeader({
    required this.label,
    required this.height,
    required this.textTop,
    required this.horizontalInset,
    super.key,
  });

  final String label;
  final double height;
  final double textTop;
  final double horizontalInset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          horizontalInset,
          textTop,
          horizontalInset,
          0,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.categoryName.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              height: 1.15,
              color: context.colors.textTertiary,
            ),
          ),
        ),
      ),
    );
  }
}
