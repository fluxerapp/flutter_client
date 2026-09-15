import 'dart:math' as math;

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MediaLoadErrorPlaceholder extends StatelessWidget {
  const MediaLoadErrorPlaceholder({this.showLabel, super.key});

  static const double _labelMinSize = 88;

  final bool? showLabel;

  @override
  Widget build(BuildContext context) {
    final String message = FluxerLocalizations.of(
      context,
    ).chatImageCouldNotLoad;
    return Semantics(
      label: message,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double width = constraints.hasBoundedWidth
              ? constraints.maxWidth
              : 160;
          final double height = constraints.hasBoundedHeight
              ? constraints.maxHeight
              : 160;
          final double shortest = math.min(width, height);
          final bool labeled = showLabel ?? shortest >= _labelMinSize;
          final Widget icon = PhosphorIcon(
            PhosphorIconsBold.imageBroken,
            size: labeled
                ? (shortest * 0.28).clamp(28.0, 64.0)
                : (shortest * 0.42).clamp(18.0, 48.0),
            color: context.colors.textSecondary,
          );
          Widget child = ColoredBox(
            color: context.colors.backgroundSecondaryAlt,
            child: Center(
              child: labeled
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            icon,
                            const SizedBox(height: 10),
                            Text(
                              message,
                              textAlign: TextAlign.center,
                              style: context.textStyles.bodyMedium.copyWith(
                                color: context.colors.textSecondary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : icon,
            ),
          );
          if (constraints.hasBoundedWidth || constraints.hasBoundedHeight) {
            child = SizedBox(
              width: constraints.hasBoundedWidth ? constraints.maxWidth : null,
              height: constraints.hasBoundedHeight
                  ? constraints.maxHeight
                  : null,
              child: child,
            );
          }
          return child;
        },
      ),
    );
  }
}
