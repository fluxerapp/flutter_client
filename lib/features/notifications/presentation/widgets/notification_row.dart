import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

const double kNotificationRowLeadingSize = 48;
const double kNotificationRowLeadingGap = 16;
const double kNotificationRowTextInset =
    kNotificationRowLeadingSize + kNotificationRowLeadingGap;
const double kNotificationRowHorizontalPadding = 24;
const double kNotificationRowVerticalPadding = 8;
const double kNotificationRowGap = 4;
const double kNotificationRowPressInset = 5;
const double kNotificationRowPressRadius = 12;
const double kNotificationSectionTopPadding = 19;
const double kNotificationSectionBottomPadding = 8;
const double kNotificationTitleFontSize = 16;
const double kNotificationTitleLineHeight = 20;
const double kNotificationQuoteFontSize = 15;
const double kNotificationQuoteLineHeight = 18;
const double kNotificationQuoteTopGap = 4;
const double kNotificationQuoteBarWidth = 3;
const double kNotificationQuoteBarGap = 7.7;
const double kNotificationTimestampFontSize = 12;
const double kNotificationTimestampGap = 8;
const double kNotificationSectionFontSize = 14;
const double kNotificationButtonHeight = 40;
const double kNotificationButtonRadius = 8;
const double kNotificationButtonTopGap = 8;
const double kNotificationButtonHorizontalPadding = 21;
const Duration kNotificationRowPressHold = Duration(milliseconds: 200);
const Duration kNotificationAvatarFadeIn = Duration(milliseconds: 200);

TextStyle notificationTitleStyle(BuildContext context) {
  return context.textStyles.bodyMedium.copyWith(
    fontSize: kNotificationTitleFontSize,
    height: kNotificationTitleLineHeight / kNotificationTitleFontSize,
  );
}

TextStyle notificationQuoteStyle(BuildContext context, {required bool unread}) {
  final colors = context.colors;
  return context.textStyles.bodyMedium.copyWith(
    fontSize: kNotificationQuoteFontSize,
    height: kNotificationQuoteLineHeight / kNotificationQuoteFontSize,
    color: unread ? colors.textSecondary : colors.textTertiaryMuted,
  );
}

TextStyle notificationTimestampStyle(
  BuildContext context, {
  required bool unread,
}) {
  final colors = context.colors;
  return context.textStyles.bodySmall.copyWith(
    fontSize: kNotificationTimestampFontSize,
    height: kNotificationTitleLineHeight / kNotificationTimestampFontSize,
    color: unread ? colors.textSecondary : colors.textTertiaryMuted,
  );
}

class NotificationRowSurface extends StatefulWidget {
  const NotificationRowSurface({
    required this.child,
    this.onTap,
    this.onLongPress,
    this.semanticLabel,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final String? semanticLabel;

  @override
  State<NotificationRowSurface> createState() => _NotificationRowSurfaceState();
}

class _NotificationRowSurfaceState extends State<NotificationRowSurface> {
  bool _pressed = false;
  Offset _downPosition = Offset.zero;
  Timer? _holdTimer;

  bool get _interactive => widget.onTap != null || widget.onLongPress != null;

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  void _setPressed(bool pressed) {
    _holdTimer?.cancel();
    if (_pressed == pressed) {
      return;
    }
    setState(() => _pressed = pressed);
  }

  void _onPointerDown(PointerDownEvent event) {
    if (!_interactive) {
      return;
    }
    _downPosition = event.position;
    _setPressed(true);
  }

  void _onPointerMove(PointerMoveEvent event) {
    if (_pressed && (event.position - _downPosition).distance > kTouchSlop) {
      _setPressed(false);
    }
  }

  void _onTap() {
    _holdTimer?.cancel();
    if (!_pressed) {
      setState(() => _pressed = true);
    }
    _holdTimer = Timer(kNotificationRowPressHold, () {
      if (mounted) {
        _setPressed(false);
      }
    });
    widget.onTap?.call();
  }

  void _release() {
    if (_holdTimer?.isActive ?? false) {
      return;
    }
    _setPressed(false);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticLabel,
      button: _interactive,
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Listener(
        onPointerDown: _onPointerDown,
        onPointerMove: _onPointerMove,
        onPointerUp: (_) => _release(),
        onPointerCancel: (_) => _release(),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          excludeFromSemantics: true,
          onTap: widget.onTap == null ? null : _onTap,
          onLongPress: widget.onLongPress,
          child: Padding(
            padding: const EdgeInsets.only(
              left: kNotificationRowPressInset,
              right: kNotificationRowPressInset,
              bottom: kNotificationRowGap,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: _pressed
                    ? context.colors.backgroundSecondaryAlt
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(
                  kNotificationRowPressRadius,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal:
                      kNotificationRowHorizontalPadding -
                      kNotificationRowPressInset,
                  vertical: kNotificationRowVerticalPadding,
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationQuote extends StatelessWidget {
  const NotificationQuote({
    required this.child,
    this.barGap = kNotificationQuoteBarGap,
    super.key,
  });

  final Widget child;
  final double barGap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kNotificationQuoteTopGap),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: BorderSide(
              color: context.colors.backgroundTertiary,
              width: kNotificationQuoteBarWidth,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: kNotificationQuoteBarWidth + barGap,
          ),
          child: child,
        ),
      ),
    );
  }
}

class NotificationSectionHeader extends StatelessWidget {
  const NotificationSectionHeader({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      header: true,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          kNotificationRowHorizontalPadding + 1,
          kNotificationSectionTopPadding,
          kNotificationRowHorizontalPadding,
          kNotificationSectionBottomPadding,
        ),
        child: Text(
          label,
          style: context.textStyles.bodySmall.copyWith(
            fontSize: kNotificationSectionFontSize,
            height: 16 / kNotificationSectionFontSize,
            fontWeight: FontWeight.w500,
            color: context.colors.textTertiaryMuted,
          ),
        ),
      ),
    );
  }
}

class NotificationRowButton extends StatelessWidget {
  const NotificationRowButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: const EdgeInsets.only(top: kNotificationButtonTopGap),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            backgroundColor: colors.backgroundTertiary,
            foregroundColor: colors.textPrimary,
            side: BorderSide(color: colors.backgroundHeaderSecondary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNotificationButtonRadius),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: kNotificationButtonHorizontalPadding,
            ),
            minimumSize: const Size(0, kNotificationButtonHeight),
            fixedSize: const Size.fromHeight(kNotificationButtonHeight),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: context.textStyles.bodySmall.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: Text(label),
        ),
      ),
    );
  }
}
