import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerSettingsConfigureRow extends StatelessWidget {
  const FluxerSettingsConfigureRow({
    required this.title,
    required this.configureLabel,
    required this.onConfigure,
    super.key,
    this.description,
  });

  final String title;
  final String? description;
  final String configureLabel;
  final VoidCallback onConfigure;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final minHeight = layout.settingsSwitchRowMinHeight;

    return FluxerTappable(
      minSize: Size(layout.touchTargetMin, minHeight),
      onTap: onConfigure,
      semanticLabel: description != null ? '$title. $description' : title,
      excludeChildSemantics: true,
      builder: (context, states) {
        final isPressed = states.contains(WidgetState.pressed);

        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          color: isPressed
              ? colors.backgroundModifierHover.withValues(alpha: 0.45)
              : Colors.transparent,
          constraints: BoxConstraints(minHeight: minHeight),
          padding: EdgeInsets.symmetric(vertical: layout.s1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: textStyles.bodySmall.copyWith(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w500,
                        height: 1.4,
                      ),
                    ),
                    if (description != null) ...[
                      SizedBox(height: layout.s1),
                      Text(
                        description!,
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textPrimaryMuted,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: layout.s4),
              FluxerButton.secondary(
                size: FluxerButtonSize.compact,
                fitContent: true,
                onPressed: onConfigure,
                label: configureLabel,
                icon: PhosphorIconsBold.gear,
              ),
            ],
          ),
        );
      },
    );
  }
}
