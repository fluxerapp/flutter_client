import 'dart:math' as math;

import 'package:flutter/gestures.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/focus_desktop_layout.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_layout_config.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceDesktopMembersRow extends StatefulWidget {
  const VoiceDesktopMembersRow({
    required this.itemCount,
    required this.itemBuilder,
    required this.size,
    required this.horizontalPadding,
    super.key,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Size size;
  final double horizontalPadding;

  @override
  State<VoiceDesktopMembersRow> createState() => _VoiceDesktopMembersRowState();
}

class _VoiceDesktopMembersRowState extends State<VoiceDesktopMembersRow> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent || !_controller.hasClients) {
      return;
    }
    if (event.scrollDelta.dx.abs() > event.scrollDelta.dy.abs()) {
      return;
    }
    GestureBinding.instance.pointerSignalResolver.register(event, (_) {
      if (!_controller.hasClients) {
        return;
      }
      _controller.jumpTo(
        (_controller.offset + event.scrollDelta.dy).clamp(
          0,
          _controller.position.maxScrollExtent,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final double tileHeight = math.max(
      0,
      widget.size.height - voiceFocusMembersRowVerticalPaddingPx * 2,
    );
    final double tileWidth = tileHeight * voiceGridTileAspectRatio;
    final double contentWidth =
        widget.itemCount * tileWidth +
        math.max(0, widget.itemCount - 1) * voiceFocusMembersRowGapPx;
    final double sidePadding = math.max(
      widget.horizontalPadding,
      (widget.size.width - contentWidth) / 2,
    );
    return Listener(
      onPointerSignal: _onPointerSignal,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView.separated(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(
            horizontal: sidePadding,
            vertical: voiceFocusMembersRowVerticalPaddingPx,
          ),
          itemCount: widget.itemCount,
          separatorBuilder: (BuildContext _, int _) =>
              const SizedBox(width: voiceFocusMembersRowGapPx),
          itemBuilder: (BuildContext context, int index) => SizedBox(
            width: tileWidth,
            child: widget.itemBuilder(context, index),
          ),
        ),
      ),
    );
  }
}
