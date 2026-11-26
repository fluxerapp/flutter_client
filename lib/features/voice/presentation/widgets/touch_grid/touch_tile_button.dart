import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceTouchTileButton extends StatelessWidget {
  const VoiceTouchTileButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
    this.label,
    super.key,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;
  final String? label;

  static const double extent = _kIconSize + _kPadding * 2;

  static const double _kIconSize = 18;
  static const double _kPadding = 8;
  static const double _kLabelHorizontalPadding = 12;
  static const double _kLabelVerticalPadding = 6;
  static const double _kLabelGap = 6;

  @override
  Widget build(BuildContext context) {
    final String? label = this.label;
    return Tooltip(
      message: tooltip,
      child: Material(
        color: context.colors.backgroundSecondary,
        borderRadius: context.layout.radiusFull,
        child: InkWell(
          onTap: onPressed,
          borderRadius: context.layout.radiusFull,
          child: Padding(
            padding: label == null
                ? const EdgeInsets.all(_kPadding)
                : const EdgeInsets.symmetric(
                    horizontal: _kLabelHorizontalPadding,
                    vertical: _kLabelVerticalPadding,
                  ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: _kLabelGap,
              children: <Widget>[
                Icon(icon, size: _kIconSize, color: context.colors.textPrimary),
                if (label != null)
                  Text(
                    label,
                    style: context.textStyles.smallText.copyWith(
                      color: context.colors.textPrimary,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
