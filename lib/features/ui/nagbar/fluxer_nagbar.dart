import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerNagbar extends StatelessWidget {
  const FluxerNagbar({
    required this.backgroundColor,
    required this.textColor,
    required this.isMobile,
    required this.child,
    this.onDismiss,
    this.dismissible = false,
    super.key,
  });

  final Color backgroundColor;
  final Color textColor;
  final bool isMobile;
  final Widget child;
  final VoidCallback? onDismiss;
  final bool dismissible;

  @override
  Widget build(BuildContext context) {
    final FluxerLayoutTheme layout = context.layout;
    final bool showDismissButton =
        dismissible && onDismiss != null && !isMobile;
    final double minHeight = isMobile ? 48 : 36;
    final double fontSize = isMobile ? 12 : 14;
    return Semantics(
      container: true,
      liveRegion: true,
      child: ColoredBox(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: layout.s2,
            vertical: isMobile ? layout.s2 : layout.s1,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(minHeight: minHeight),
                child: DefaultTextStyle(
                  style: context.textStyles.bodySmall.copyWith(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: isMobile ? FontWeight.w500 : FontWeight.w600,
                  ),
                  child: IconTheme(
                    data: IconThemeData(color: textColor, size: 16),
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: showDismissButton ? 32 : 0,
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
              if (showDismissButton)
                Positioned(
                  right: 0,
                  child: FluxerFocusRing(
                    focused: false,
                    child: IconButton(
                      onPressed: onDismiss,
                      icon: Icon(PhosphorIconsBold.x, color: textColor),
                      tooltip: MaterialLocalizations.of(
                        context,
                      ).closeButtonTooltip,
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.all(layout.s1),
                      constraints: const BoxConstraints(
                        minWidth: 32,
                        minHeight: 32,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
