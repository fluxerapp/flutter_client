import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/shell_sidebar_width.dart';
import 'package:fluxer_app/features/shell/providers/layout/shell_sidebar_width_provider.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

const double _kHandleHitWidth = 44;
const double _kIndicatorWidth = 4;
const double _kIndicatorHeight = 40;
const double _kDesktopHandleWidth = 6;

class ShellSidebarResizeHandle extends ConsumerStatefulWidget {
  const ShellSidebarResizeHandle({
    required this.channelSidebarWidth,
    required this.userAreaHeight,
    super.key,
  });

  final double channelSidebarWidth;
  final double userAreaHeight;

  @override
  ConsumerState<ShellSidebarResizeHandle> createState() =>
      _ShellSidebarResizeHandleState();
}

class _ShellSidebarResizeHandleState
    extends ConsumerState<ShellSidebarResizeHandle> {
  final FocusNode _focusNode = FocusNode();
  bool _hovering = false;
  bool _dragging = false;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool touchPrimary = switch (Theme.of(context).platform) {
      TargetPlatform.iOS || TargetPlatform.android => true,
      _ => false,
    };
    final bool showIndicator =
        touchPrimary || _hovering || _dragging || _focusNode.hasFocus;
    final bool desktop = usesDesktopPointerUi(context);
    final Color indicatorColor = desktop
        ? fluxerCssColorMix(
            context.colors.backgroundSecondaryLighter,
            context.colors.textPrimary,
            0.65,
          )
        : Color.alphaBlend(
            context.colors.textPrimary.withValues(alpha: 0.35),
            context.colors.backgroundSecondaryLighter.withValues(alpha: 0.65),
          );
    final double hitWidth = desktop ? _kDesktopHandleWidth : _kHandleHitWidth;
    final double indicatorWidth = desktop
        ? _kDesktopHandleWidth *
              (_dragging
                  ? 1
                  : _hovering || _focusNode.hasFocus
                  ? 2 / 3
                  : 1 / 3)
        : _dragging || _hovering
        ? _kIndicatorWidth * 1.5
        : _kIndicatorWidth;

    return PositionedDirectional(
      start: -hitWidth / 2,
      top: 0,
      bottom: widget.userAreaHeight,
      width: hitWidth,
      child: MouseRegion(
        cursor: SystemMouseCursors.resizeColumn,
        onEnter: (_) => setState(() => _hovering = true),
        onExit: (_) => setState(() => _hovering = false),
        child: Semantics(
          label: l10n.shellResizeSidebar,
          value: widget.channelSidebarWidth.round().toString(),
          increasedValue: (widget.channelSidebarWidth + 12).round().toString(),
          decreasedValue: (widget.channelSidebarWidth - 12).round().toString(),
          onIncrease: () => _nudge(12),
          onDecrease: () => _nudge(-12),
          child: Focus(
            focusNode: _focusNode,
            onKeyEvent: _handleKey,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onHorizontalDragStart: _onDragStart,
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: (_) => _onDragEnd(persist: true),
              onHorizontalDragCancel: () => _onDragEnd(persist: true),
              onDoubleTap: () {
                unawaited(ref.read(shellSidebarWidthProvider.notifier).reset());
              },
              child: Align(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 160),
                  opacity: showIndicator ? (_dragging ? 1 : 0.92) : 0,
                  child: AnimatedContainer(
                    key: ValueKey<bool>(desktop),
                    duration: const Duration(milliseconds: 160),
                    width: indicatorWidth,
                    height: desktop ? double.infinity : _kIndicatorHeight,
                    decoration: BoxDecoration(
                      color: indicatorColor,
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _currentSidebarWidth() {
    final Size size = MediaQuery.sizeOf(context);
    final FluxerLayoutTheme layout = context.layout;
    final double? preference = ref.read(shellSidebarWidthProvider);
    return resolveShellSidebarWidth(
      context: context,
      windowSize: size,
      layout: layout,
      userPreference: preference,
    );
  }

  void _nudge(double delta) {
    _applySidebarWidth(_currentSidebarWidth() + delta, persist: true);
  }

  void _applySidebarWidth(double width, {required bool persist}) {
    final double resolved = resolveShellSidebarWidthForPreference(
      windowSize: MediaQuery.sizeOf(context),
      layout: context.layout,
      userPreference: width,
      resizeEnabled: true,
    );
    ref
        .read(shellSidebarWidthProvider.notifier)
        .setWidth(resolved, persist: persist);
  }

  KeyEventResult _handleKey(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) {
      return KeyEventResult.ignored;
    }
    final bool largeStep = HardwareKeyboard.instance.isShiftPressed;
    if (event.logicalKey == LogicalKeyboardKey.enter ||
        event.logicalKey == LogicalKeyboardKey.delete ||
        event.logicalKey == LogicalKeyboardKey.backspace) {
      unawaited(ref.read(shellSidebarWidthProvider.notifier).reset());
      return KeyEventResult.handled;
    }
    final double step = (largeStep ? 48 : 12) * _widthGrowthSign();
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      _nudge(-step);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      _nudge(step);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.home) {
      _applySidebarWidth(kShellSidebarWidthMin, persist: true);
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.end) {
      _applySidebarWidth(kShellSidebarWidthMax, persist: true);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  double _widthGrowthSign() =>
      Directionality.of(context) == TextDirection.rtl ? -1 : 1;

  double? _dragStartWidth;
  double _dragDelta = 0;

  void _onDragStart(DragStartDetails details) {
    setState(() => _dragging = true);
    _dragStartWidth = _currentSidebarWidth();
    _dragDelta = 0;
    _focusNode.requestFocus();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final double? start = _dragStartWidth;
    if (start == null) {
      return;
    }
    _dragDelta += details.delta.dx * _widthGrowthSign();
    _applySidebarWidth(start + _dragDelta, persist: false);
  }

  void _onDragEnd({required bool persist}) {
    setState(() => _dragging = false);
    _dragStartWidth = null;
    if (persist) {
      _applySidebarWidth(_currentSidebarWidth(), persist: true);
    }
  }
}
