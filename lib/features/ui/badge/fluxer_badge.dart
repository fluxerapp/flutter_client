import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerBadge extends StatelessWidget {
  const FluxerBadge.count({required this.count, this.cutoutColor, super.key})
    : text = null,
      size = 20,
      isDot = false,
      isCompact = false;

  const FluxerBadge.compactCount({
    required this.count,
    this.cutoutColor,
    super.key,
  }) : text = null,
       size = 14,
       isDot = false,
       isCompact = true;

  const FluxerBadge.dot({this.size = 8, super.key})
    : count = null,
      text = null,
      cutoutColor = null,
      isDot = true,
      isCompact = false;

  const FluxerBadge.label({required this.text, this.cutoutColor, super.key})
    : count = null,
      size = 20,
      isDot = false,
      isCompact = false;

  final int? count;
  final String? text;
  final double size;
  final bool isDot;
  final bool isCompact;

  /// Renders a hard 3px ring outside the badge in this color, creating a
  /// "cutout" notch when the badge is overlaid on an avatar or icon. Set to
  /// the surface color the badge sits on (e.g. the sidebar background).
  final Color? cutoutColor;

  @override
  Widget build(BuildContext context) {
    if (isDot) {
      return _buildDot(context);
    }
    if (isCompact) {
      return _buildCompactCount(context);
    }
    return _buildPill(context);
  }

  Widget _buildDot(BuildContext context) => ExcludeSemantics(
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.textPrimary,
        shape: BoxShape.circle,
      ),
      child: SizedBox(width: size, height: size),
    ),
  );

  Widget _buildPill(BuildContext context) {
    final label = text ?? _formattedCount;
    return Container(
      height: 20,
      constraints: const BoxConstraints(minWidth: 20),
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: context.colors.statusDanger,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: cutoutColor ?? context.colors.backgroundSecondary,
          width: 3,
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: context.textStyles.smallText.copyWith(
            color: context.colors.textOnBrandPrimary,
            fontSize: 11,
            height: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildCompactCount(BuildContext context) {
    final String label = _formattedCount;
    final double diameter = switch (label.length) {
      1 => 16,
      2 => 18,
      _ => 20,
    };
    final double fontSize = switch (label.length) {
      1 => 10,
      2 => 8,
      _ => 7,
    };
    return ExcludeSemantics(
      child: Container(
        width: diameter,
        height: diameter,
        decoration: BoxDecoration(
          color: context.colors.statusDanger,
          shape: BoxShape.circle,
          border: Border.all(
            color: cutoutColor ?? context.colors.backgroundSecondary,
            width: 2,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
        ),
        alignment: Alignment.center,
        child: Padding(
          // IBM Plex Sans numerals sit slightly low.
          padding: const EdgeInsets.only(bottom: 1),
          child: Text(
            label,
            style: context.textStyles.smallText.copyWith(
              color: context.colors.textOnBrandPrimary,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
        ),
      ),
    );
  }

  String get _formattedCount {
    final c = count ?? 0;
    return c > 99 ? '99+' : '$c';
  }
}

@FluxerWidgetPreview(name: 'Compact Count', group: 'FluxerBadge')
Widget fluxerBadgeCompactCountPreview() {
  return const FluxerBadge.compactCount(count: 3);
}

@FluxerWidgetPreview(name: 'Dot', group: 'FluxerBadge')
Widget fluxerBadgeDotPreview() {
  return const FluxerBadge.dot();
}

@FluxerWidgetPreview(name: 'Count', group: 'FluxerBadge')
Widget fluxerBadgeCountPreview() {
  return const FluxerBadge.count(count: 12);
}

@FluxerWidgetPreview(name: 'Label', group: 'FluxerBadge')
Widget fluxerBadgeLabelPreview() {
  return const FluxerBadge.label(text: 'NEW');
}
