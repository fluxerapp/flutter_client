import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/material_ui.dart';

typedef NativeDownloadsPressableBuilder =
    Widget Function(BuildContext context, Set<WidgetState> states);

class NativeDownloadsPressable extends StatefulWidget {
  const NativeDownloadsPressable({
    required this.semanticLabel,
    required this.builder,
    this.onPressed,
    this.borderRadius,
    this.focusRingInset = -2,
    this.expanded,
    super.key,
  });

  final String semanticLabel;
  final NativeDownloadsPressableBuilder builder;
  final VoidCallback? onPressed;
  final BorderRadius? borderRadius;
  final double focusRingInset;
  final bool? expanded;

  @override
  State<NativeDownloadsPressable> createState() =>
      _NativeDownloadsPressableState();
}

class _NativeDownloadsPressableState extends State<NativeDownloadsPressable> {
  static const double _kFocusRingWidth = 4;

  bool _hovered = false;
  bool _pressed = false;
  bool _focused = false;

  bool get _enabled => widget.onPressed != null;

  Set<WidgetState> get _states => <WidgetState>{
    if (!_enabled) WidgetState.disabled,
    if (_hovered && _enabled) WidgetState.hovered,
    if (_pressed && _enabled) WidgetState.pressed,
    if (_focused && _enabled) WidgetState.focused,
  };

  void _activate() => widget.onPressed?.call();

  void _setPressed({required bool value}) {
    if (_pressed != value) {
      setState(() => _pressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = _enabled;
    final Set<WidgetState> states = _states;
    return Semantics(
      container: true,
      button: true,
      enabled: enabled,
      expanded: widget.expanded,
      label: widget.semanticLabel,
      excludeSemantics: true,
      onTap: enabled ? _activate : null,
      child: FocusableActionDetector(
        enabled: enabled,
        includeFocusSemantics: false,
        onShowFocusHighlight: (bool value) {
          if (_focused != value) {
            setState(() => _focused = value);
          }
        },
        onShowHoverHighlight: (bool value) {
          if (_hovered != value) {
            setState(() => _hovered = value);
          }
        },
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (ActivateIntent intent) {
              _activate();
              return null;
            },
          ),
        },
        child: FluxerGestureDetector(
          behavior: HitTestBehavior.opaque,
          excludeFromSemantics: true,
          onTapDown: enabled ? (_) => _setPressed(value: true) : null,
          onTapUp: enabled ? (_) => _setPressed(value: false) : null,
          onTapCancel: enabled ? () => _setPressed(value: false) : null,
          onTap: enabled ? _activate : null,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.passthrough,
            children: [
              widget.builder(context, states),
              if (states.contains(WidgetState.focused))
                Positioned.fill(
                  left: widget.focusRingInset,
                  top: widget.focusRingInset,
                  right: widget.focusRingInset,
                  bottom: widget.focusRingInset,
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius:
                            widget.borderRadius ?? context.layout.radiusSm,
                        border: Border.all(
                          color: context.colors.focusPrimary,
                          width: _kFocusRingWidth,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
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
