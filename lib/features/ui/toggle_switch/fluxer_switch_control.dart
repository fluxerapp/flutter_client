import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:material_ui/material_ui.dart';

class FluxerSwitchControl extends StatelessWidget {
  const FluxerSwitchControl({
    required this.value,
    this.enabled = true,
    super.key,
  });

  final bool value;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final motion = context.motion;
    final trackWidth = layout.switchTrackWidth;
    final trackHeight = layout.switchTrackHeight;
    final thumbSize = layout.switchThumbSize;
    final thumbInset = layout.switchThumbInset;
    final iconSize = layout.switchIconSize;
    final thumbOffset = value
        ? trackWidth - thumbSize - thumbInset
        : thumbInset;
    final trackColor = value ? colors.brandPrimary : colors.switchTrackInactive;

    return ExcludeSemantics(
      child: AnimatedOpacity(
        duration: motion.fast,
        curve: motion.curve,
        opacity: enabled ? 1 : 0.5,
        child: SizedBox(
          width: trackWidth,
          height: trackHeight,
          child: AnimatedContainer(
            duration: motion.fast,
            curve: motion.curve,
            decoration: BoxDecoration(
              color: trackColor,
              borderRadius: layout.radiusFull,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: value ? 0.10 : 0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                  spreadRadius: -1,
                ),
              ],
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: motion.fast,
                  curve: motion.curve,
                  left: thumbOffset,
                  top: thumbInset,
                  child: Container(
                    width: thumbSize,
                    height: thumbSize,
                    decoration: BoxDecoration(
                      color: colors.switchThumb,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.20),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: AnimatedSwitcher(
                      duration: motion.fast,
                      switchInCurve: motion.curve,
                      switchOutCurve: motion.curve,
                      child: Icon(
                        value ? Icons.check_rounded : Icons.close_rounded,
                        key: ValueKey(value),
                        size: value ? iconSize : iconSize - 2,
                        color: value
                            ? colors.switchThumbCheckedIcon
                            : colors.switchThumbUncheckedIcon,
                      ),
                    ),
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

@FluxerWidgetPreview(name: 'Off', group: 'FluxerSwitchControl')
Widget fluxerSwitchControlOffPreview() {
  return const FluxerSwitchControl(value: false);
}

@FluxerWidgetPreview(name: 'On', group: 'FluxerSwitchControl')
Widget fluxerSwitchControlOnPreview() {
  return const FluxerSwitchControl(value: true);
}
