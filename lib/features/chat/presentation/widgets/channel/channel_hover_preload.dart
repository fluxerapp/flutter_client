import 'dart:async';

import 'package:flutter/gestures.dart'
    show PointerDeviceKind, PointerDownEvent, PointerEnterEvent;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/material_ui.dart';

const Duration kChannelHoverPreloadDelay = Duration(milliseconds: 220);

class ChannelHoverPreload extends ConsumerStatefulWidget {
  const ChannelHoverPreload({
    required this.child,
    this.channelId,
    this.resolveChannelId,
    this.enabled = true,
    super.key,
  });

  final String? channelId;
  final String? Function(WidgetRef ref)? resolveChannelId;
  final bool enabled;
  final Widget child;

  @override
  ConsumerState<ChannelHoverPreload> createState() =>
      _ChannelHoverPreloadState();
}

class _ChannelHoverPreloadState extends ConsumerState<ChannelHoverPreload> {
  Timer? _hoverTimer;

  @override
  void didUpdateWidget(covariant ChannelHoverPreload oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId || !widget.enabled) {
      _cancel();
    }
  }

  @override
  void dispose() {
    _cancel();
    super.dispose();
  }

  void _cancel() {
    _hoverTimer?.cancel();
    _hoverTimer = null;
  }

  void _preloadNow() {
    _cancel();
    if (!widget.enabled) {
      return;
    }
    final String? channelId =
        widget.resolveChannelId?.call(ref) ?? widget.channelId;
    if (channelId == null || channelId.isEmpty) {
      return;
    }
    unawaited(
      ref.read(chatViewModelProvider.notifier).preloadChannel(channelId),
    );
  }

  void _onPointerDown(PointerDownEvent event) {
    if (event.kind == PointerDeviceKind.mouse) {
      _preloadNow();
    }
  }

  void _onEnter(PointerEnterEvent _) {
    if (!widget.enabled) {
      return;
    }
    _cancel();
    _hoverTimer = Timer(kChannelHoverPreloadDelay, _preloadNow);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _onPointerDown,
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: (_) => _cancel(),
        child: widget.child,
      ),
    );
  }
}
