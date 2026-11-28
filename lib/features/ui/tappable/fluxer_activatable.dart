import 'package:flutter/services.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerActivatable extends StatefulWidget {
  const FluxerActivatable({
    required this.child,
    this.onActivate,
    this.enabled = true,
    this.focusable,
    this.showFocusRing = true,
    this.focusRingRadius,
    this.focusRingOutset = 0,
    this.onFocusChange,
    super.key,
  });

  final Widget child;
  final VoidCallback? onActivate;
  final bool enabled;
  final bool? focusable;
  final bool showFocusRing;
  final BorderRadius? focusRingRadius;
  final double focusRingOutset;
  final ValueChanged<bool>? onFocusChange;

  static const Map<ShortcutActivator, Intent> _kShortcuts =
      <ShortcutActivator, Intent>{
        SingleActivator(LogicalKeyboardKey.enter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.numpadEnter): ActivateIntent(),
        SingleActivator(LogicalKeyboardKey.space): ActivateIntent(),
      };

  @override
  State<FluxerActivatable> createState() => _FluxerActivatableState();
}

class _FluxerActivatableState extends State<FluxerActivatable> {
  bool _focused = false;

  void _handleFocusChange(bool focused) {
    setState(() => _focused = focused);
    widget.onFocusChange?.call(focused);
  }

  Object? _handleActivate(ActivateIntent _) {
    widget.onActivate?.call();
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final bool canActivate = widget.enabled && widget.onActivate != null;
    return Shortcuts(
      shortcuts: FluxerActivatable._kShortcuts,
      child: Actions(
        actions: <Type, Action<Intent>>{
          if (canActivate)
            ActivateIntent: CallbackAction<ActivateIntent>(
              onInvoke: _handleActivate,
            ),
        },
        child: Focus(
          includeSemantics: false,
          canRequestFocus: widget.enabled && (widget.focusable ?? canActivate),
          onFocusChange: _handleFocusChange,
          child: FluxerFocusRing(
            focused: widget.showFocusRing && _focused && widget.enabled,
            borderRadius: widget.focusRingRadius,
            outset: widget.focusRingOutset,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
