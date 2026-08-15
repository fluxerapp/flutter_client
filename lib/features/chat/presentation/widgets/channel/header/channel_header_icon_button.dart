import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Circular toolbar icon used in the wide-layout channel header.
class ChannelHeaderIconButton extends ConsumerWidget {
  const ChannelHeaderIconButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isActive = false,
    this.showIndicator = false,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isActive;
  final bool showIndicator;

  static const double _visualSize = 32;
  static const double _iconSize = 24;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool touchPrimary = isTouchPrimaryInput(ref);
    final double hitSize = touchPrimary
        ? context.layout.touchTargetMin
        : _visualSize;
    final Color color = isActive
        ? context.colors.interactiveActive
        : context.colors.interactiveNormal;

    return Semantics(
      button: true,
      label: label,
      child: Tooltip(
        message: label,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(hitSize / 2),
            child: SizedBox(
              width: hitSize,
              height: hitSize,
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    PhosphorIcon(icon, size: _iconSize, color: color),
                    if (showIndicator)
                      Positioned(
                        right: -2,
                        top: -2,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.colors.statusDanger,
                            shape: BoxShape.circle,
                          ),
                          child: const SizedBox.square(dimension: 8),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
