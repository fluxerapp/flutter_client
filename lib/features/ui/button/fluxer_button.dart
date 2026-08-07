import 'dart:async';

import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FluxerButton extends StatefulWidget {
  const FluxerButton.primary({
    this.onPressed,
    this.onPressedAsync,
    this.label,
    this.icon,
    this.trailingIcon,
    this.size = FluxerButtonSize.regular,
    this.isSquare = false,
    this.isLoading = false,
    this.fitContent = false,
    this.recording = false,
    this.child,
    this.semanticLabel,
    super.key,
  }) : _variant = FluxerButtonVariant.primary,
       _isCircle = false,
       _isCircleAltStyle = false,
       _isMediaOverlayStyle = false,
       _iconSizeOverride = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  const FluxerButton.secondary({
    this.onPressed,
    this.onPressedAsync,
    this.label,
    this.icon,
    this.trailingIcon,
    this.size = FluxerButtonSize.regular,
    this.isSquare = false,
    this.isLoading = false,
    this.fitContent = false,
    this.recording = false,
    this.child,
    this.semanticLabel,
    super.key,
  }) : _variant = FluxerButtonVariant.secondary,
       _isCircle = false,
       _isCircleAltStyle = false,
       _isMediaOverlayStyle = false,
       _iconSizeOverride = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  const FluxerButton.dangerPrimary({
    this.onPressed,
    this.onPressedAsync,
    this.label,
    this.icon,
    this.trailingIcon,
    this.size = FluxerButtonSize.regular,
    this.isSquare = false,
    this.isLoading = false,
    this.fitContent = false,
    this.recording = false,
    this.child,
    this.semanticLabel,
    super.key,
  }) : _variant = FluxerButtonVariant.dangerPrimary,
       _isCircle = false,
       _isCircleAltStyle = false,
       _isMediaOverlayStyle = false,
       _iconSizeOverride = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  const FluxerButton.dangerSecondary({
    this.onPressed,
    this.onPressedAsync,
    this.label,
    this.icon,
    this.trailingIcon,
    this.size = FluxerButtonSize.regular,
    this.isSquare = false,
    this.isLoading = false,
    this.fitContent = false,
    this.recording = false,
    this.child,
    this.semanticLabel,
    super.key,
  }) : _variant = FluxerButtonVariant.dangerSecondary,
       _isCircle = false,
       _isCircleAltStyle = false,
       _isMediaOverlayStyle = false,
       _iconSizeOverride = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  const FluxerButton.inverted({
    this.onPressed,
    this.onPressedAsync,
    this.label,
    this.icon,
    this.trailingIcon,
    this.size = FluxerButtonSize.regular,
    this.isSquare = false,
    this.isLoading = false,
    this.fitContent = false,
    this.recording = false,
    this.child,
    this.semanticLabel,
    super.key,
  }) : _variant = FluxerButtonVariant.inverted,
       _isCircle = false,
       _isCircleAltStyle = false,
       _isMediaOverlayStyle = false,
       _iconSizeOverride = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  const FluxerButton.invertedOutline({
    this.onPressed,
    this.onPressedAsync,
    this.label,
    this.icon,
    this.trailingIcon,
    this.size = FluxerButtonSize.regular,
    this.isSquare = false,
    this.isLoading = false,
    this.fitContent = false,
    this.recording = false,
    this.child,
    this.semanticLabel,
    super.key,
  }) : _variant = FluxerButtonVariant.invertedOutline,
       _isCircle = false,
       _isCircleAltStyle = false,
       _isMediaOverlayStyle = false,
       _iconSizeOverride = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  const FluxerButton.ghost({
    this.onPressed,
    this.onPressedAsync,
    this.label,
    this.icon,
    this.trailingIcon,
    this.size = FluxerButtonSize.regular,
    this.isSquare = false,
    this.isLoading = false,
    this.fitContent = false,
    this.recording = false,
    this.child,
    this.semanticLabel,
    super.key,
  }) : _variant = FluxerButtonVariant.ghost,
       _isCircle = false,
       _isCircleAltStyle = false,
       _isMediaOverlayStyle = false,
       _iconSizeOverride = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  const FluxerButton.mediaOverlay({
    this.onPressed,
    this.onPressedAsync,
    this.label,
    this.icon,
    this.trailingIcon,
    this.size = FluxerButtonSize.regular,
    this.isSquare = false,
    this.isLoading = false,
    this.fitContent = false,
    this.recording = false,
    this.child,
    this.semanticLabel,
    super.key,
  }) : _variant = FluxerButtonVariant.secondary,
       _isCircle = false,
       _isCircleAltStyle = false,
       _isMediaOverlayStyle = true,
       _iconSizeOverride = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  const FluxerButton.circle({
    required IconData this.icon,
    this.onPressed,
    this.onPressedAsync,
    this._variant = FluxerButtonVariant.primary,
    this.size = FluxerButtonSize.regular,
    double? iconSize,
    this.isLoading = false,
    this.recording = false,
    this.semanticLabel,
    super.key,
  }) : _isCircle = true,
       _isCircleAltStyle = false,
       _isMediaOverlayStyle = false,
       _iconSizeOverride = iconSize,
       isSquare = true,
       label = null,
       trailingIcon = null,
       fitContent = false,
       child = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  const FluxerButton.circleAlt({
    required IconData this.icon,
    this.onPressed,
    this.onPressedAsync,
    this.size = FluxerButtonSize.small,
    double? iconSize = 20,
    this.isLoading = false,
    this.recording = false,
    this.semanticLabel,
    super.key,
  }) : _variant = FluxerButtonVariant.secondary,
       _isCircle = true,
       _isCircleAltStyle = true,
       _isMediaOverlayStyle = false,
       _iconSizeOverride = iconSize,
       isSquare = true,
       label = null,
       trailingIcon = null,
       fitContent = false,
       child = null,
       assert(
         onPressed == null || onPressedAsync == null,
         'Cannot provide both onPressed and onPressedAsync',
       );

  final FluxerButtonVariant _variant;
  final bool _isCircle;
  final bool _isCircleAltStyle;
  final bool _isMediaOverlayStyle;
  final double? _iconSizeOverride;
  final VoidCallback? onPressed;
  final Future<void> Function()? onPressedAsync;
  final String? label;
  final IconData? icon;
  final IconData? trailingIcon;
  final FluxerButtonSize size;
  final bool isSquare;
  final bool isLoading;
  final bool fitContent;
  final bool recording;
  final Widget? child;
  final String? semanticLabel;

  @override
  State<FluxerButton> createState() => _FluxerButtonState();
}

class _FluxerButtonState extends State<FluxerButton> {
  bool _asyncLoading = false;

  bool get _effectiveLoading => widget.isLoading || _asyncLoading;
  bool get _enabled =>
      (widget.onPressed != null || widget.onPressedAsync != null) &&
      !_effectiveLoading;

  BorderRadius get _borderRadius {
    if (!widget._isCircle && widget._isMediaOverlayStyle) {
      return BorderRadius.circular(10);
    }
    return BorderRadius.circular(
      widget._isCircle
          ? widget.size.height / 2
          : switch (widget.size) {
              FluxerButtonSize.regular || FluxerButtonSize.small => 8.0,
              FluxerButtonSize.compact || FluxerButtonSize.superCompact => 6.0,
            },
    );
  }

  void _handleTap() {
    if (widget.onPressedAsync != null) {
      setState(() => _asyncLoading = true);
      widget.onPressedAsync!().whenComplete(() {
        if (mounted) {
          setState(() => _asyncLoading = false);
        }
      }).ignore();
    } else {
      widget.onPressed?.call();
    }
  }

  String? _resolveSemanticsLabel(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? base = widget.semanticLabel ?? widget.label;
    if (!_effectiveLoading) {
      return base;
    }
    if (base == null) {
      return l10n.uiLoading;
    }
    return '$base, ${l10n.uiLoading}';
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final motion = context.motion;
    final foreground = widget.recording
        ? colors.brandPrimaryFill
        : _resolveTextColor(colors);

    return FluxerTappable(
      onTap: _enabled ? _handleTap : null,
      enabled: _enabled,
      semanticLabel: _resolveSemanticsLabel(context),
      excludeChildSemantics: _effectiveLoading,
      builder: (context, states) {
        final isHovered = states.contains(WidgetState.hovered);
        final fill = widget.recording
            ? colors.accentSuccess
            : isHovered
            ? _resolveActiveFill(colors)
            : _resolveFill(colors);
        final border = widget.recording
            ? null
            : _resolveBorderColor(colors, hovered: isHovered);

        Widget container = AnimatedContainer(
          duration: motion.fast,
          curve: motion.curve,
          constraints: BoxConstraints(
            minHeight: widget.size.height,
            minWidth: widget.isSquare
                ? widget.size.height
                : (widget.fitContent ? 0 : 96),
          ),
          decoration: BoxDecoration(
            color: fill,
            borderRadius: _borderRadius,
            border: border != null ? Border.all(color: border) : null,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isSquare ? 0 : widget.size.padding,
          ),
          child: _buildContent(foreground),
        );

        if (widget.recording) {
          container = _RecordingPulse(
            color: colors.accentSuccess,
            borderRadius: _borderRadius,
            child: container,
          );
        }

        return container;
      },
    );
  }

  Color _resolveFill(FluxerColorTheme colors) {
    if (widget._isCircleAltStyle) {
      return colors.backgroundTertiary;
    }
    if (widget._isMediaOverlayStyle) {
      return colors.backgroundTextarea;
    }
    return widget._variant.fill(colors);
  }

  Color _resolveActiveFill(FluxerColorTheme colors) {
    if (widget._isCircleAltStyle || widget._isMediaOverlayStyle) {
      return colors.backgroundSecondaryAlt;
    }
    return widget._variant.activeFill(colors);
  }

  Color _resolveTextColor(FluxerColorTheme colors) {
    if (widget._isCircleAltStyle || widget._isMediaOverlayStyle) {
      return colors.textPrimary;
    }
    return widget._variant.textColor(colors);
  }

  Color? _resolveBorderColor(FluxerColorTheme colors, {required bool hovered}) {
    if (widget._isMediaOverlayStyle) {
      return colors.backgroundModifierAccent;
    }
    return widget._variant.borderColor(colors, hovered: hovered);
  }

  Widget _buildContent(Color foreground) {
    final effectiveIconSize = widget._iconSizeOverride ?? widget.size.iconSize;

    if (_effectiveLoading) {
      return Center(
        child: ExcludeSemantics(child: FluxerLoadingSpinner(color: foreground)),
      );
    }

    final contentWidgets = <Widget>[];

    if (widget.icon != null) {
      contentWidgets.add(
        PhosphorIcon(widget.icon!, size: effectiveIconSize, color: foreground),
      );
    }

    if (widget.child != null) {
      contentWidgets.add(Flexible(child: widget.child!));
    } else if (widget.label != null) {
      contentWidgets.add(
        Flexible(
          child: Text(
            widget.label!,
            style: context.textStyles.categoryName.copyWith(
              fontSize: widget.size.fontSize,
              color: foreground,
              height: 1.4,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      );
    }

    if (widget.trailingIcon != null) {
      contentWidgets.add(
        PhosphorIcon(
          widget.trailingIcon!,
          size: widget.size.iconSize,
          color: foreground,
        ),
      );
    }

    return Row(
      mainAxisSize: widget.fitContent || widget.isSquare
          ? MainAxisSize.min
          : MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: _addSpacing(contentWidgets),
    );
  }

  List<Widget> _addSpacing(List<Widget> widgets) {
    if (widgets.length <= 1) {
      return widgets;
    }
    final result = <Widget>[];
    for (var i = 0; i < widgets.length; i++) {
      result.add(widgets[i]);
      if (i < widgets.length - 1) {
        result.add(const SizedBox(width: 8));
      }
    }
    return result;
  }
}

class _RecordingPulse extends StatefulWidget {
  const _RecordingPulse({
    required this.color,
    required this.borderRadius,
    required this.child,
  });

  final Color color;
  final BorderRadius borderRadius;
  final Widget child;

  @override
  State<_RecordingPulse> createState() => _RecordingPulseState();
}

class _RecordingPulseState extends State<_RecordingPulse>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    unawaited(_controller.repeat());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        final pulse = t <= 0.5 ? t / 0.5 : (1.0 - t) / 0.5;

        final spread1Opacity = 0.18 + 0.10 * pulse;
        final spread2Opacity = 0.12 * pulse;
        final spread2Radius = 6.0 * pulse;

        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            boxShadow: [
              BoxShadow(color: widget.color.withValues(alpha: spread1Opacity)),
              BoxShadow(
                color: widget.color.withValues(alpha: spread2Opacity),
                spreadRadius: spread2Radius,
              ),
            ],
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

@FluxerWidgetPreview(name: 'Primary', group: 'FluxerButton')
Widget fluxerButtonPrimaryPreview() {
  return FluxerButton.primary(onPressed: () {}, label: 'Continue');
}

@FluxerWidgetPreview(name: 'Secondary', group: 'FluxerButton')
Widget fluxerButtonSecondaryPreview() {
  return FluxerButton.secondary(onPressed: () {}, label: 'Cancel');
}

@FluxerWidgetPreview(name: 'Danger secondary', group: 'FluxerButton')
Widget fluxerButtonDangerSecondaryPreview() {
  return FluxerButton.dangerSecondary(
    onPressed: () {},
    label: 'Delete channel',
  );
}

@FluxerWidgetPreview(name: 'Ghost', group: 'FluxerButton')
Widget fluxerButtonGhostPreview() {
  return FluxerButton.ghost(onPressed: () {}, label: 'Learn more');
}

@FluxerWidgetPreview(name: 'Media overlay', group: 'FluxerButton')
Widget fluxerButtonMediaOverlayPreview() {
  return ColoredBox(
    color: Colors.black.withValues(alpha: 0.55),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: FluxerButton.mediaOverlay(
        onPressed: () {},
        icon: PhosphorIconsBold.x,
        isSquare: true,
      ),
    ),
  );
}

@FluxerWidgetPreview(name: 'Circle icon', group: 'FluxerButton')
Widget fluxerButtonCirclePreview() {
  return FluxerButton.circle(onPressed: () {}, icon: PhosphorIconsBold.plus);
}

@FluxerWidgetPreview(name: 'Circle alt', group: 'FluxerButton')
Widget fluxerButtonCircleAltPreview() {
  return FluxerButton.circleAlt(onPressed: () {}, icon: PhosphorIconsBold.gear);
}
