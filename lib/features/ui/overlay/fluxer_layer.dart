import 'dart:async';

import 'package:flutter/services.dart';

import 'package:fluxer_app/features/ui/overlay/fluxer_layer_stack.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerLayer extends StatefulWidget {
  const FluxerLayer({
    required this.onClose,
    required this.child,
    this.trapFocus = false,
    this.active = true,
    super.key,
  });

  final VoidCallback onClose;
  final Widget child;
  final bool trapFocus;
  final bool active;

  @override
  State<FluxerLayer> createState() => _FluxerLayerState();
}

class _FluxerLayerState extends State<FluxerLayer> {
  FluxerLayerHandle? _handle;
  FocusScopeNode? _scope;
  FocusNode? _returnFocus;
  bool _hadFocus = false;

  @override
  void initState() {
    super.initState();
    if (widget.active) {
      _handle = FluxerLayerStack.instance.add(context, _close);
    }
    if (widget.trapFocus) {
      _scope = FocusScopeNode(debugLabel: 'FluxerLayer');
      _returnFocus = FocusManager.instance.primaryFocus;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final FocusScopeNode? scope = _scope;
        if (mounted && scope != null && !scope.hasFocus) {
          scope.requestFocus();
        }
      });
    }
  }

  @override
  void didUpdateWidget(FluxerLayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.active == oldWidget.active) {
      return;
    }
    _handle?.remove();
    _handle = widget.active
        ? FluxerLayerStack.instance.add(context, _close)
        : null;
  }

  void _close() {
    _handle = null;
    widget.onClose();
  }

  @override
  void deactivate() {
    _hadFocus = _scope?.hasFocus ?? false;
    super.deactivate();
  }

  @override
  void dispose() {
    _handle?.remove();
    _handle = null;
    _scope?.dispose();
    final FocusNode? target = _returnFocus;
    _returnFocus = null;
    if (target != null && _hadFocus) {
      scheduleMicrotask(() {
        if (target.context != null && target.canRequestFocus) {
          target.requestFocus();
        }
      });
    }
    super.dispose();
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyUpEvent || event.logicalKey != LogicalKeyboardKey.escape) {
      return KeyEventResult.ignored;
    }
    if (event is KeyDownEvent && _handle != null) {
      FluxerLayerStack.instance.closeTop();
    }
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode? scope = _scope;
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: _handleKeyEvent,
      child: scope == null
          ? widget.child
          : FocusScope(node: scope, child: widget.child),
    );
  }
}
