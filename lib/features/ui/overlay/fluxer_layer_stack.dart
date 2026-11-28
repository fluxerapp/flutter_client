import 'package:flutter/services.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerLayerHandle {
  FluxerLayerHandle._(this._stack, this.context, this.onClose);

  final FluxerLayerStack _stack;
  final BuildContext context;
  final VoidCallback onClose;

  void remove() => _stack._layers.remove(this);
}

class FluxerLayerStack {
  FluxerLayerStack._();

  static final FluxerLayerStack instance = FluxerLayerStack._();

  final List<FluxerLayerHandle> _layers = <FluxerLayerHandle>[];

  bool get hasLayers {
    _layers.removeWhere((FluxerLayerHandle layer) => !layer.context.mounted);
    return _layers.isNotEmpty;
  }

  FluxerLayerHandle add(BuildContext context, VoidCallback onClose) {
    final FluxerLayerHandle handle = FluxerLayerHandle._(
      this,
      context,
      onClose,
    );
    _layers.add(handle);
    return handle;
  }

  bool closeTop() {
    if (!hasLayers) {
      return false;
    }
    final FluxerLayerHandle top = _layers.last;
    if (!_isTopmost(top.context)) {
      return false;
    }
    _layers.removeLast();
    top.onClose();
    return true;
  }

  bool handleEscape(KeyEvent event) {
    return event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.escape &&
        closeTop();
  }

  static bool _isTopmost(BuildContext context) {
    BuildContext current = context;
    while (true) {
      final ModalRoute<dynamic>? route = ModalRoute.of(current);
      if (route != null && !route.isCurrent) {
        return false;
      }
      final NavigatorState? navigator = current
          .findAncestorStateOfType<NavigatorState>();
      if (navigator == null) {
        return true;
      }
      current = navigator.context;
    }
  }
}
