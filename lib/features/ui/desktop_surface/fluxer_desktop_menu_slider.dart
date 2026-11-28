part of 'fluxer_desktop_surface.dart';

String fluxerDesktopMenuSliderPercent(double value) => '${value.round()}%';

class FluxerDesktopMenuSlider extends StatefulWidget {
  const FluxerDesktopMenuSlider({
    required this.label,
    required this.value,
    this.minValue = 0,
    this.maxValue = 100,
    this.step = 1,
    this.factoryDefaultValue = 100,
    this.enabled = true,
    this.onChanged,
    this.onChangeEnd,
    this.formatValue,
    super.key,
  });

  final String label;
  final double value;
  final double minValue;
  final double maxValue;
  final double step;
  final double factoryDefaultValue;
  final bool enabled;
  final ValueChanged<double>? onChanged;
  final ValueChanged<double>? onChangeEnd;
  final String Function(double value)? formatValue;

  @override
  State<FluxerDesktopMenuSlider> createState() =>
      _FluxerDesktopMenuSliderState();
}

class _FluxerDesktopMenuSliderState extends State<FluxerDesktopMenuSlider>
    with _FluxerDesktopMenuEntryState<FluxerDesktopMenuSlider> {
  final FocusNode _node = FocusNode(debugLabel: 'FluxerDesktopMenuSlider');
  late double _value = widget.value;
  bool _hovered = false;
  bool _focused = false;

  @override
  FocusNode get menuFocusNode => _node;

  @override
  String get menuLabel => widget.label;

  @override
  bool get menuEnabled => widget.enabled;

  @override
  void didUpdateWidget(FluxerDesktopMenuSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _value = widget.value;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _node.dispose();
  }

  void _setValue(double next, {bool commit = false}) {
    final double clamped = next.clamp(widget.minValue, widget.maxValue);
    if (clamped != _value) {
      setState(() => _value = clamped);
      widget.onChanged?.call(clamped);
    }
    if (commit) {
      widget.onChangeEnd?.call(clamped);
    }
  }

  KeyEventResult _handleKeyEvent(FocusNode _, KeyEvent event) {
    if (!widget.enabled || event is KeyUpEvent) {
      return KeyEventResult.ignored;
    }
    final bool rtl = Directionality.maybeOf(context) == TextDirection.rtl;
    final double step = widget.step;
    final LogicalKeyboardKey key = event.logicalKey;
    final double? next;
    if (key == LogicalKeyboardKey.arrowRight) {
      next = _value + (rtl ? -step : step);
    } else if (key == LogicalKeyboardKey.arrowLeft) {
      next = _value - (rtl ? -step : step);
    } else if (key == LogicalKeyboardKey.pageUp) {
      next = _value + step * 10;
    } else if (key == LogicalKeyboardKey.pageDown) {
      next = _value - step * 10;
    } else if (key == LogicalKeyboardKey.home) {
      next = widget.minValue;
    } else if (key == LogicalKeyboardKey.end) {
      next = widget.maxValue;
    } else {
      next = null;
    }
    if (next == null) {
      return KeyEventResult.ignored;
    }
    _setValue(next, commit: true);
    return KeyEventResult.handled;
  }

  void _handleHover(bool hovered) {
    setState(() => _hovered = hovered);
    handleMenuHover(hovered: hovered);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final String formatted =
        (widget.formatValue ?? fluxerDesktopMenuSliderPercent)(_value);
    final bool highlighted = widget.enabled && (_hovered || _focused);
    final Color foreground = widget.enabled
        ? colors.textPrimary
        : colors.interactiveMuted;

    return Semantics(
      slider: true,
      label: widget.label,
      value: formatted,
      enabled: widget.enabled,
      child: MouseRegion(
        onEnter: (_) => _handleHover(true),
        onExit: (_) => _handleHover(false),
        cursor: widget.enabled
            ? SystemMouseCursors.basic
            : SystemMouseCursors.forbidden,
        child: Focus(
          focusNode: _node,
          canRequestFocus: widget.enabled,
          includeSemantics: false,
          onKeyEvent: _handleKeyEvent,
          onFocusChange: (bool focused) => setState(() => _focused = focused),
          child: Opacity(
            opacity: widget.enabled ? 1 : 0.5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 7),
              decoration: BoxDecoration(
                color: highlighted
                    ? colors.surfaceInteractiveHoverBg
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              child: ExcludeSemantics(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              widget.label,
                              style: fluxerDesktopMenuLabelStyle(
                                context,
                              ).copyWith(color: foreground),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            formatted,
                            style: fluxerDesktopMenuLabelStyle(context)
                                .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 16 / 12,
                                  color: colors.textTertiaryMuted,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    FluxerDesktopMenuSliderTrack(
                      child: IgnorePointer(
                        ignoring: !widget.enabled,
                        child: FluxerSlider(
                          defaultValue: _value,
                          value: _value,
                          factoryDefaultValue: widget.factoryDefaultValue,
                          minValue: widget.minValue,
                          maxValue: widget.maxValue,
                          step: widget.step,
                          mini: true,
                          asValueChanges: _setValue,
                          onValueChange: (double value) =>
                              _setValue(value, commit: true),
                        ),
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

class FluxerDesktopMenuSliderTrack extends SingleChildRenderObjectWidget {
  const FluxerDesktopMenuSliderTrack({required Widget super.child, super.key});

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderFluxerDesktopMenuSliderTrack();
}

class _RenderFluxerDesktopMenuSliderTrack extends RenderProxyBox {
  @override
  double computeMinIntrinsicWidth(double height) => 0;

  @override
  double computeMaxIntrinsicWidth(double height) => 0;
}
