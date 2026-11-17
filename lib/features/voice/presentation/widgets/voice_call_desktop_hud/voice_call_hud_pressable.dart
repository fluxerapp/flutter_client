import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

typedef VoiceCallHudPressableBuilder =
    Widget Function(BuildContext context, Set<WidgetState> states);

class VoiceCallHudPressable extends StatefulWidget {
  const VoiceCallHudPressable({
    required this.tooltip,
    required this.builder,
    this.onPressed,
    this.onSecondaryPressed,
    this.semanticLabel,
    this.toggled,
    super.key,
  });

  final String tooltip;
  final VoiceCallHudPressableBuilder builder;
  final ValueChanged<BuildContext>? onPressed;
  final ValueChanged<BuildContext>? onSecondaryPressed;
  final String? semanticLabel;
  final bool? toggled;

  @override
  State<VoiceCallHudPressable> createState() => _VoiceCallHudPressableState();
}

class _VoiceCallHudPressableState extends State<VoiceCallHudPressable> {
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

  void _activate() => widget.onPressed?.call(context);

  void _setPressed({required bool value}) {
    if (_pressed != value) {
      setState(() => _pressed = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = _enabled;
    return Semantics(
      button: true,
      label: widget.semanticLabel ?? widget.tooltip,
      toggled: widget.toggled,
      enabled: enabled,
      child: Tooltip(
        message: widget.tooltip,
        excludeFromSemantics: true,
        child: FocusableActionDetector(
          enabled: enabled,
          includeFocusSemantics: false,
          mouseCursor: enabled
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic,
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
            onSecondaryTapUp: widget.onSecondaryPressed == null
                ? null
                : (_) => widget.onSecondaryPressed!(context),
            child: widget.builder(context, _states),
          ),
        ),
      ),
    );
  }
}
