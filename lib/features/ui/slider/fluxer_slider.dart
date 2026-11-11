import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

enum FluxerSliderMarkerPosition { above, below }

class FluxerSlider extends StatefulWidget {
  const FluxerSlider({
    required this.defaultValue,
    this.value,
    this.factoryDefaultValue,
    this.minValue = 0,
    this.maxValue = 100,
    this.disabled = false,
    this.equidistant = false,
    this.markers,
    this.stickToMarkers = false,
    this.mini = false,
    this.markerPosition = FluxerSliderMarkerPosition.above,
    this.onValueChange,
    this.onValueRender,
    this.onMarkerRender,
    this.markerVisible,
    this.showMarkerDash = true,
    this.asValueChanges,
    this.step,
    this.semanticLabel,
    this.semanticValue,
    this.markerLabelWidth = 24,
    this.markerAreaHeight = 24,
    this.shrinkMarkerLabels = true,
    super.key,
  });

  final double defaultValue;
  final double? value;
  final double? factoryDefaultValue;
  final double minValue;
  final double maxValue;
  final bool disabled;
  final bool equidistant;
  final List<double>? markers;
  final bool stickToMarkers;
  final bool mini;
  final FluxerSliderMarkerPosition markerPosition;
  final ValueChanged<double>? onValueChange;
  final Widget Function(double value)? onValueRender;
  final Widget Function(double value)? onMarkerRender;
  final bool Function(double value)? markerVisible;
  final bool showMarkerDash;
  final ValueChanged<double>? asValueChanges;
  final double? step;
  final String? semanticLabel;
  final String Function(double value)? semanticValue;
  final double markerLabelWidth;
  final double markerAreaHeight;
  final bool shrinkMarkerLabels;

  @override
  State<FluxerSlider> createState() => _FluxerSliderState();
}

class _FluxerSliderState extends State<FluxerSlider> {
  final LayerLink _thumbLayerLink = LayerLink();
  final OverlayPortalController _tooltipController = OverlayPortalController();

  late double _value;
  bool _isDragging = false;
  bool _isHovering = false;
  bool _hasFocus = false;
  int? _stickToMarkerIndex;

  static const double _kTrackPadding = 5;
  static const double _kBarHeight = 4;
  static const double _kBarHeightMini = 6;
  static const double _kThumbSize = 16;
  static const double _kThumbSizeMini = 12;
  static const double _kMarkerDashWidth = 2;
  static const double _kMarkerDashHeight = 24;
  static const double _kTooltipGap = 8;
  static const double _kMarkerGapBelow = 2;

  @override
  void initState() {
    super.initState();
    _value = widget.defaultValue;
  }

  @override
  void didUpdateWidget(FluxerSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_isDragging) {
      return;
    }
    final double? nextValue = widget.value;
    if (nextValue != null && nextValue != oldWidget.value) {
      _value = nextValue;
      return;
    }
    if (oldWidget.defaultValue != widget.defaultValue) {
      _value = widget.defaultValue;
    }
  }

  double get _effectiveValue => _isDragging ? _value : (widget.value ?? _value);

  double get _thumbSize => widget.mini ? _kThumbSizeMini : _kThumbSize;

  double get _barHeight => widget.mini ? _kBarHeightMini : _kBarHeight;

  bool get _hasMarkers => widget.markers != null && widget.markers!.isNotEmpty;

  List<double> get _sortedMarkers {
    if (!_hasMarkers) {
      return const [];
    }
    return List<double>.from(widget.markers!)..sort();
  }

  double get _markerMin => _hasMarkers ? _sortedMarkers.first : widget.minValue;

  double get _markerMax => _hasMarkers ? _sortedMarkers.last : widget.maxValue;

  double get _markerRange => _markerMax - _markerMin;

  List<double> _markerPositions(List<double> sorted) {
    if (sorted.isEmpty) {
      return const [];
    }
    if (widget.equidistant) {
      final interval = 100.0 / (sorted.length - 1);
      return List<double>.generate(sorted.length, (i) => i * interval);
    }
    if (_markerRange == 0) {
      return List<double>.filled(sorted.length, 0);
    }
    return sorted.map((v) => 100.0 * (v - _markerMin) / _markerRange).toList();
  }

  double _scaleValue(double val) {
    if (_markerRange == 0) {
      return 0;
    }
    return 100.0 * (val - _markerMin) / _markerRange;
  }

  double _unscaleValue(double percent) {
    if (_markerRange == 0) {
      return _markerMin;
    }
    return percent * _markerRange / 100.0 + _markerMin;
  }

  double _applyStep(double val) {
    if (widget.step == null || widget.step == 0) {
      return val;
    }
    return (val / widget.step!).roundToDouble() * widget.step!;
  }

  int _findClosestMarkerIndex(double val, List<double> arr) {
    if (arr.isEmpty) {
      return 0;
    }
    double diff = 0;
    for (int i = 0; i < arr.length; i++) {
      if (val == arr[i]) {
        return i;
      }
      if (val < arr[i]) {
        if (diff == 0) {
          return i;
        }
        if (arr[i] - val < diff) {
          return i;
        }
        return i - 1;
      }
      diff = val - arr[i];
    }
    return arr.length - 1;
  }

  double get _valuePercent {
    final sorted = _sortedMarkers;
    final positions = _markerPositions(sorted);

    if (!widget.stickToMarkers) {
      return _scaleValue(_effectiveValue);
    }
    if (positions.isEmpty) {
      return 0;
    }
    if (_stickToMarkerIndex != null) {
      return positions[_stickToMarkerIndex!];
    }
    final closestIndex = _findClosestMarkerIndex(_effectiveValue, sorted);
    return positions[closestIndex];
  }

  bool get _marksBelow =>
      widget.markerPosition == FluxerSliderMarkerPosition.below;

  bool get _canStepMarkers =>
      widget.stickToMarkers && _hasMarkers && !widget.disabled;

  int get _currentMarkerIndex =>
      _findClosestMarkerIndex(_effectiveValue, _sortedMarkers);

  void _selectMarker(int index) {
    final List<double> sorted = _sortedMarkers;
    final double next = sorted[index.clamp(0, sorted.length - 1)];
    if (next == _effectiveValue) {
      return;
    }
    setState(() => _value = next);
    widget.onValueChange?.call(next);
  }

  String _semanticValueFor(double value) =>
      widget.semanticValue?.call(value) ?? value.toStringAsFixed(1);

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (!_canStepMarkers || event is KeyUpEvent) {
      return KeyEventResult.ignored;
    }
    final LogicalKeyboardKey key = event.logicalKey;
    final bool rtl = Directionality.of(context) == TextDirection.rtl;
    final int index = _currentMarkerIndex;
    final int? target;
    if (key == LogicalKeyboardKey.arrowUp) {
      target = index + 1;
    } else if (key == LogicalKeyboardKey.arrowDown) {
      target = index - 1;
    } else if (key == LogicalKeyboardKey.arrowRight) {
      target = rtl ? index - 1 : index + 1;
    } else if (key == LogicalKeyboardKey.arrowLeft) {
      target = rtl ? index + 1 : index - 1;
    } else if (key == LogicalKeyboardKey.home) {
      target = 0;
    } else if (key == LogicalKeyboardKey.end) {
      target = _sortedMarkers.length - 1;
    } else {
      target = null;
    }
    if (target == null) {
      return KeyEventResult.ignored;
    }
    _selectMarker(target);
    return KeyEventResult.handled;
  }

  void _showTooltip() {
    if (widget.onValueRender != null &&
        !widget.stickToMarkers &&
        !_tooltipController.isShowing) {
      _tooltipController.show();
    }
  }

  void _hideTooltip() {
    if (_tooltipController.isShowing) {
      _tooltipController.hide();
    }
  }

  void _handleDragStart(DragStartDetails details) {
    if (widget.disabled) {
      return;
    }
    setState(() {
      _value = _effectiveValue;
      _isDragging = true;
    });
    _showTooltip();
    if (widget.stickToMarkers) {
      _stickToMarkerIndex = _findClosestMarkerIndex(
        _effectiveValue,
        _sortedMarkers,
      );
    }
  }

  void _handleDragUpdate(
    DragUpdateDetails details,
    BoxConstraints constraints,
  ) {
    if (widget.disabled) {
      return;
    }

    final trackWidth = constraints.maxWidth - _kTrackPadding * 2;
    if (trackWidth <= 0) {
      return;
    }

    final renderBox = context.findRenderObject()! as RenderBox;
    final localX = renderBox.globalToLocal(details.globalPosition).dx;
    final clampedX = (localX - _kTrackPadding).clamp(0.0, trackWidth);
    final logicalX = Directionality.of(context) == TextDirection.rtl
        ? trackWidth - clampedX
        : clampedX;
    final percent = (logicalX / trackWidth) * 100.0;

    if (widget.stickToMarkers) {
      final sorted = _sortedMarkers;
      final positions = _markerPositions(sorted);
      if (positions.isEmpty) {
        return;
      }

      int closestIndex;
      if (widget.equidistant) {
        closestIndex = _findClosestMarkerIndex(percent, positions);
      } else {
        final rawValue = _unscaleValue(percent);
        closestIndex = _findClosestMarkerIndex(rawValue, sorted);
      }
      setState(() => _stickToMarkerIndex = closestIndex);
    } else {
      final rawValue = _unscaleValue(percent);
      final newValue = _applyStep(
        rawValue,
      ).clamp(widget.minValue, widget.maxValue);
      setState(() => _value = newValue);
      widget.asValueChanges?.call(newValue);
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    _commitDragValue();
  }

  void _handleDragCancel() {
    _commitDragValue();
  }

  void _commitDragValue() {
    if (widget.disabled) {
      return;
    }

    final double draggedValue = _value;
    setState(() => _isDragging = false);
    if (!_isHovering) {
      _hideTooltip();
    }

    if (widget.stickToMarkers && _stickToMarkerIndex != null) {
      final sorted = _sortedMarkers;
      final newValue = sorted[_stickToMarkerIndex!];
      setState(() {
        _value = newValue;
        _stickToMarkerIndex = null;
      });
      widget.onValueChange?.call(newValue);
    } else {
      widget.onValueChange?.call(draggedValue);
    }
  }

  void _handleTrackTap(TapUpDetails details, BoxConstraints constraints) {
    if (widget.disabled) {
      return;
    }

    final trackWidth = constraints.maxWidth - _kTrackPadding * 2;
    if (trackWidth <= 0) {
      return;
    }

    final renderBox = context.findRenderObject()! as RenderBox;
    final localX = renderBox.globalToLocal(details.globalPosition).dx;
    final clampedX = (localX - _kTrackPadding).clamp(0.0, trackWidth);
    final logicalX = Directionality.of(context) == TextDirection.rtl
        ? trackWidth - clampedX
        : clampedX;
    final percent = (logicalX / trackWidth) * 100.0;

    if (widget.stickToMarkers) {
      final sorted = _sortedMarkers;
      final positions = _markerPositions(sorted);
      if (positions.isEmpty) {
        return;
      }
      final closestIndex = _findClosestMarkerIndex(percent, positions);
      final newValue = sorted[closestIndex];
      setState(() => _value = newValue);
      widget.onValueChange?.call(newValue);
    } else {
      final rawValue = _unscaleValue(percent);
      final newValue = _applyStep(
        rawValue,
      ).clamp(widget.minValue, widget.maxValue);
      setState(() => _value = newValue);
      widget.onValueChange?.call(newValue);
    }
  }

  Widget _buildTooltipOverlay(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return CompositedTransformFollower(
      link: _thumbLayerLink,
      targetAnchor: Alignment.topCenter,
      followerAnchor: Alignment.bottomCenter,
      offset: const Offset(0, -_kTooltipGap),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: IntrinsicWidth(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: layout.s3,
              vertical: layout.s2,
            ),
            decoration: BoxDecoration(
              color: colors.backgroundFloating,
              borderRadius: layout.radiusLg,
              border: Border.all(color: colors.backgroundModifierAccent),
            ),
            child: widget.onValueRender!(_effectiveValue),
          ),
        ),
      ),
    );
  }

  Widget _buildMarkers(
    List<double> sorted,
    List<double> positions,
    FluxerColorTheme colors,
    FluxerTextTheme textStyles,
  ) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        for (int i = 0; i < sorted.length; i++)
          if (widget.markerVisible == null || widget.markerVisible!(sorted[i]))
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final trackWidth = constraints.maxWidth;
                  final markerX =
                      (positions[i] / 100.0) * trackWidth -
                      widget.markerLabelWidth / 2;
                  final isFactoryDefault =
                      widget.factoryDefaultValue != null &&
                      sorted[i] == widget.factoryDefaultValue;
                  final labelColor = isFactoryDefault
                      ? colors.textPositive
                      : colors.textSecondary;

                  final markerLabel = widget.onMarkerRender != null
                      ? widget.onMarkerRender!(sorted[i])
                      : Text(
                          _formatMarkerValue(sorted[i]),
                          style: textStyles.smallText.copyWith(
                            color: labelColor,
                          ),
                          textAlign: TextAlign.center,
                        );

                  final Widget? dash = widget.showMarkerDash
                      ? Container(
                          width: _kMarkerDashWidth,
                          height: _kMarkerDashHeight / 4,
                          decoration: BoxDecoration(
                            color: isFactoryDefault
                                ? colors.textPositive
                                : colors.interactiveMuted,
                            borderRadius: BorderRadius.circular(1),
                          ),
                        )
                      : null;

                  final Widget markerLabelWidget = widget.shrinkMarkerLabels
                      ? Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: markerLabel,
                          ),
                        )
                      : markerLabel;

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      PositionedDirectional(
                        start: markerX,
                        top: 0,
                        child: SizedBox(
                          width: widget.markerLabelWidth,
                          height: widget.markerAreaHeight,
                          child: Column(
                            children:
                                widget.markerPosition ==
                                    FluxerSliderMarkerPosition.above
                                ? <Widget>[markerLabelWidget, ?dash]
                                : <Widget>[?dash, markerLabelWidget],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
      ],
    );
  }

  String _formatMarkerValue(double value) {
    return value == value.roundToDouble()
        ? value.toInt().toString()
        : value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final sorted = _sortedMarkers;
    final positions = _markerPositions(sorted);
    final valuePct = _valuePercent.clamp(0.0, 100.0);
    final bool marksAbove = _hasMarkers && !_marksBelow;
    final bool marksBelow = _hasMarkers && _marksBelow;
    final double totalHeight = marksBelow
        ? _kThumbSize + _kMarkerGapBelow + widget.markerAreaHeight
        : widget.markerAreaHeight + (_hasMarkers ? widget.markerAreaHeight : 0);
    final bool canStep = _canStepMarkers;
    final int markerIndex = canStep ? _currentMarkerIndex : 0;
    final bool canIncrease = canStep && markerIndex < sorted.length - 1;
    final bool canDecrease = canStep && markerIndex > 0;
    final bool showFocusRing =
        _hasFocus &&
        FocusManager.instance.highlightMode == FocusHighlightMode.traditional;
    final bool desktop = usesDesktopPointerUi(context);

    return OverlayPortal(
      controller: _tooltipController,
      overlayChildBuilder: _buildTooltipOverlay,
      child: Semantics(
        slider: true,
        label: widget.semanticLabel,
        value: _semanticValueFor(_effectiveValue),
        increasedValue: canIncrease
            ? _semanticValueFor(sorted[markerIndex + 1])
            : null,
        decreasedValue: canDecrease
            ? _semanticValueFor(sorted[markerIndex - 1])
            : null,
        onIncrease: canIncrease ? () => _selectMarker(markerIndex + 1) : null,
        onDecrease: canDecrease ? () => _selectMarker(markerIndex - 1) : null,
        enabled: !widget.disabled,
        child: Focus(
          canRequestFocus: canStep,
          skipTraversal: !canStep,
          onKeyEvent: _handleKeyEvent,
          onFocusChange: (bool focused) => setState(() => _hasFocus = focused),
          child: Opacity(
            opacity: widget.disabled ? (desktop ? 0.55 : 0.6) : 1.0,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final trackWidth = constraints.maxWidth - _kTrackPadding * 2;

                return FluxerGestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onHorizontalDragStart: _handleDragStart,
                  onHorizontalDragUpdate: (details) =>
                      _handleDragUpdate(details, constraints),
                  onHorizontalDragEnd: _handleDragEnd,
                  onHorizontalDragCancel: _handleDragCancel,
                  onTapUp: (details) => _handleTrackTap(details, constraints),
                  child: SizedBox(
                    height: totalHeight,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        if (_hasMarkers)
                          Positioned(
                            left: _kTrackPadding,
                            right: _kTrackPadding,
                            top: marksBelow
                                ? _kThumbSize + _kMarkerGapBelow
                                : 0,
                            height: widget.markerAreaHeight,
                            child: ExcludeSemantics(
                              child: _buildMarkers(
                                sorted,
                                positions,
                                colors,
                                textStyles,
                              ),
                            ),
                          ),

                        Positioned(
                          left: 0,
                          right: 0,
                          top: marksAbove
                              ? widget.markerAreaHeight +
                                    (_kThumbSize - _barHeight) / 2
                              : marksBelow
                              ? (_kThumbSize - _barHeight) / 2
                              : (totalHeight - _barHeight) / 2,
                          height: _barHeight,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: Color.lerp(
                                colors.interactiveMuted,
                                colors.backgroundTertiary,
                                0.18,
                              ),
                              borderRadius: desktop
                                  ? BorderRadius.circular(999)
                                  : layout.radiusSm,
                              boxShadow: [
                                BoxShadow(
                                  color: colors.backgroundPrimary.withValues(
                                    alpha: 0.2,
                                  ),
                                  spreadRadius: 0.5,
                                ),
                              ],
                            ),
                            child: FractionallySizedBox(
                              alignment: AlignmentDirectional.centerStart,
                              widthFactor: valuePct / 100.0,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: AlignmentDirectional.centerStart,
                                    end: AlignmentDirectional.centerEnd,
                                    colors: <Color>[
                                      colors.brandPrimary,
                                      Color.lerp(
                                            colors.brandPrimaryLight,
                                            Colors.white,
                                            0.16,
                                          ) ??
                                          colors.brandPrimaryLight,
                                    ],
                                  ),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.12),
                                  ),
                                  borderRadius: desktop
                                      ? BorderRadius.circular(999)
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ),

                        PositionedDirectional(
                          start:
                              _kTrackPadding +
                              (valuePct / 100.0) * trackWidth -
                              _thumbSize / 2,
                          top: marksAbove
                              ? widget.markerAreaHeight +
                                    (_kThumbSize - _thumbSize) / 2
                              : marksBelow
                              ? (_kThumbSize - _thumbSize) / 2
                              : (totalHeight - _thumbSize) / 2,
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() => _isHovering = true);
                              _showTooltip();
                            },
                            onExit: (_) {
                              setState(() => _isHovering = false);
                              if (!_isDragging) {
                                _hideTooltip();
                              }
                            },
                            child: CompositedTransformTarget(
                              link: _thumbLayerLink,
                              child: FluxerFocusRing(
                                focused: showFocusRing,
                                borderRadius: BorderRadius.circular(
                                  _thumbSize / 2,
                                ),
                                child: desktop
                                    ? _buildDesktopThumb(colors)
                                    : Container(
                                        width: _thumbSize,
                                        height: _thumbSize,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withValues(
                                            alpha: 0.95,
                                          ),
                                          border: Border.all(
                                            color: colors.borderColor
                                                .withValues(alpha: 0.6),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(
                                                alpha: 0.1,
                                              ),
                                              blurRadius: 3,
                                              offset: const Offset(0, 1),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopThumb(FluxerColorTheme colors) {
    final bool hovered = _isHovering && !widget.disabled;
    final Duration duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : const Duration(milliseconds: 120);
    return AnimatedScale(
      scale: _isDragging ? 1.06 : 1,
      duration: duration,
      curve: Curves.fastOutSlowIn,
      child: AnimatedContainer(
        duration: duration,
        curve: Curves.fastOutSlowIn,
        width: _thumbSize,
        height: _thumbSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Color(0xF5FFFFFF), Color(0xEBF5F6F8)],
          ),
          border: Border.all(
            color: hovered
                ? Color.lerp(
                    colors.backgroundPrimary,
                    colors.brandPrimary,
                    0.62,
                  )!
                : Color.lerp(
                    colors.backgroundPrimary,
                    colors.brandPrimary,
                    0.2,
                  )!,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.22),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: hovered ? 0.22 : 0.18),
              blurRadius: hovered ? 16 : 14,
              offset: Offset(0, hovered ? 8 : 6),
            ),
          ],
        ),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerSlider')
Widget fluxerSliderPreview() {
  return const SizedBox(width: 280, child: FluxerSlider(defaultValue: 40));
}

@FluxerWidgetPreview(name: 'Mini', group: 'FluxerSlider')
Widget fluxerSliderMiniPreview() {
  return const SizedBox(
    width: 200,
    child: FluxerSlider(defaultValue: 60, mini: true),
  );
}
