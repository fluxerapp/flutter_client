import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/providers/focus_members_row_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/focus_desktop_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceDesktopMembersDivider extends ConsumerStatefulWidget {
  const VoiceDesktopMembersDivider({
    required this.rowHeight,
    required this.maxRowHeight,
    required this.horizontalPadding,
    super.key,
  });

  final double rowHeight;
  final double maxRowHeight;
  final double horizontalPadding;

  @override
  ConsumerState<VoiceDesktopMembersDivider> createState() =>
      _VoiceDesktopMembersDividerState();
}

class _VoiceDesktopMembersDividerState
    extends ConsumerState<VoiceDesktopMembersDivider> {
  static const double _kStep = 16;
  static const double _kLargeStep = 64;
  static const double _kLineHeight = 2;

  final FocusNode _focusNode = FocusNode();
  bool _hovering = false;
  bool _dragging = false;
  double? _dragHeight;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  double _clamp(double height) {
    return height.clamp(voiceFocusMembersRowMinHeightPx, widget.maxRowHeight);
  }

  void _setHeight(double height, {required bool persist}) {
    ref
        .read(focusMembersRowProvider.notifier)
        .setHeight(_clamp(height), persist: persist);
  }

  void _nudge(double delta) {
    _setHeight(widget.rowHeight + delta, persist: true);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final double height = (_dragHeight ?? widget.rowHeight) - details.delta.dy;
    _dragHeight = height;
    _setHeight(height, persist: false);
  }

  void _endDrag() {
    final double? height = _dragHeight;
    setState(() {
      _dragging = false;
      _dragHeight = null;
    });
    if (height != null) {
      _setHeight(height, persist: true);
    }
  }

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (event is KeyUpEvent) {
      return KeyEventResult.ignored;
    }
    final double step = HardwareKeyboard.instance.isShiftPressed
        ? _kLargeStep
        : _kStep;
    switch (event.logicalKey) {
      case LogicalKeyboardKey.arrowUp:
        _nudge(step);
      case LogicalKeyboardKey.arrowDown:
        _nudge(-step);
      case LogicalKeyboardKey.home:
        _setHeight(voiceFocusMembersRowMinHeightPx, persist: true);
      case LogicalKeyboardKey.end:
        _setHeight(widget.maxRowHeight, persist: true);
      case LogicalKeyboardKey.enter:
        ref.read(focusMembersRowProvider.notifier).resetHeight();
      default:
        return KeyEventResult.ignored;
    }
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final double opacity;
    if (_dragging) {
      opacity = 0.8;
    } else if (_hovering || _focusNode.hasPrimaryFocus) {
      opacity = 0.5;
    } else {
      opacity = 0;
    }
    return MouseRegion(
      cursor: SystemMouseCursors.resizeRow,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Semantics(
        label: FluxerLocalizations.of(context).voiceFocusResizeMembersRow,
        value: widget.rowHeight.round().toString(),
        increasedValue: _clamp(widget.rowHeight + _kStep).round().toString(),
        decreasedValue: _clamp(widget.rowHeight - _kStep).round().toString(),
        onIncrease: () => _nudge(_kStep),
        onDecrease: () => _nudge(-_kStep),
        child: Focus(
          focusNode: _focusNode,
          onKeyEvent: _handleKey,
          onFocusChange: (_) => setState(() {}),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragStart: (_) => setState(() => _dragging = true),
            onVerticalDragUpdate: _onDragUpdate,
            onVerticalDragEnd: (_) => _endDrag(),
            onVerticalDragCancel: _endDrag,
            onDoubleTap: () =>
                ref.read(focusMembersRowProvider.notifier).resetHeight(),
            child: Center(
              child: AnimatedOpacity(
                duration: context.motion.fast,
                opacity: opacity,
                child: Container(
                  height: _kLineHeight,
                  margin: EdgeInsets.symmetric(
                    horizontal: widget.horizontalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(_kLineHeight / 2),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
