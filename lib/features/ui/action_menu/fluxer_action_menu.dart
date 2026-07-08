import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart'
    show isMobileLayout;
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart'
    show
        FluxerBottomSheet,
        FluxerBottomSheetDismissDragTarget,
        FluxerBottomSheetGroupColumn,
        FluxerBottomSheetMenuItem,
        FluxerBottomSheetSection,
        FluxerBottomSheetVariant,
        FluxerMenuGroup;
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Builder for action menu items that receives a close callback.
typedef FluxerActionMenuBuilder =
    List<Widget> Function(BuildContext context, VoidCallback close);

/// Context menu shown at a specific screen position.
///
/// Use [FluxerActionMenu.show] to display the menu as an overlay.
class FluxerActionMenu {
  FluxerActionMenu._();

  /// Shows an action menu with items from [builder].
  ///
  /// On mobile, displays a bottom sheet. On tablet/desktop, shows a positioned
  /// overlay at [position]. The menu is dismissed when tapping outside,
  /// pressing Escape, or calling the `close` callback passed to [builder].
  static Future<void> show(
    BuildContext context, {
    required Offset position,
    required FluxerActionMenuBuilder builder,
  }) {
    if (isMobileLayout(context)) {
      return _showAsBottomSheet(context, builder: builder);
    }
    return _showAsOverlay(context, position: position, builder: builder);
  }

  static Future<void> _showAsBottomSheet(
    BuildContext context, {
    required FluxerActionMenuBuilder builder,
  }) async {
    await FluxerBottomSheet.show<void>(
      context,
      variant: FluxerBottomSheetVariant.menu,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        final sections = _buildMobileSections(builder(sheetContext, close));

        return FluxerBottomSheetDismissDragTarget(
          onDismiss: close,
          child: ListView(
            shrinkWrap: true,
            // Clamping physics lets the list scroll when needed; at the top,
            // downward drags are handled by [FluxerBottomSheetDismissDragTarget].
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(bottom: sheetContext.layout.s2),
            children: [
              FluxerBottomSheetGroupColumn(
                children: [
                  for (final section in sections)
                    FluxerBottomSheetSection(
                      title: section.title,
                      child: FluxerMenuGroup(
                        children: [
                          for (final item in section.items)
                            FluxerBottomSheetMenuItem(
                              label: item.label,
                              hint: item.hint,
                              icon: item.icon,
                              isDanger: item.isDanger,
                              enabled: item.enabled,
                              onTap: item.onPressed,
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> _showAsOverlay(
    BuildContext context, {
    required Offset position,
    required FluxerActionMenuBuilder builder,
  }) {
    final completer = Completer<void>();
    final overlay = Overlay.of(context);
    late final OverlayEntry entry;
    late final AnimationController animationController;

    animationController = AnimationController(
      vsync: overlay,
      duration: const Duration(milliseconds: 150),
    );

    final fadeAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );

    void close() {
      unawaited(
        animationController.reverse().then((_) {
          entry.remove();
          animationController.dispose();
          if (!completer.isCompleted) {
            completer.complete();
          }
        }),
      );
    }

    entry = OverlayEntry(
      builder: (overlayContext) => _ActionMenuOverlay(
        position: position,
        fadeAnimation: fadeAnimation,
        onDismiss: close,
        builder: builder,
      ),
    );

    overlay.insert(entry);
    unawaited(animationController.forward());

    return completer.future;
  }
}

class _ActionMenuOverlay extends StatelessWidget {
  const _ActionMenuOverlay({
    required this.position,
    required this.fadeAnimation,
    required this.onDismiss,
    required this.builder,
  });

  final Offset position;
  final Animation<double> fadeAnimation;
  final VoidCallback onDismiss;
  final FluxerActionMenuBuilder builder;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return KeyboardListener(
      focusNode: FocusNode()..requestFocus(),
      autofocus: true,
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.escape) {
          onDismiss();
        }
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: onDismiss,
              behavior: HitTestBehavior.opaque,
              child: const ColoredBox(color: Colors.transparent),
            ),
          ),
          CustomSingleChildLayout(
            delegate: _MenuPositionDelegate(position),
            child: FadeTransition(
              opacity: fadeAnimation,
              child: IntrinsicWidth(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.backgroundFloating,
                    borderRadius: layout.radiusSm,
                    border: Border.all(color: colors.backgroundModifierAccent),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: layout.s1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: builder(context, onDismiss),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuPositionDelegate extends SingleChildLayoutDelegate {
  _MenuPositionDelegate(this.position);

  final Offset position;
  static const _edgePadding = 12.0;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final dx = position.dx.clamp(
      _edgePadding,
      size.width - childSize.width - _edgePadding,
    );
    final dy = position.dy.clamp(
      _edgePadding,
      size.height - childSize.height - _edgePadding,
    );
    return Offset(dx, dy);
  }

  @override
  bool shouldRelayout(_MenuPositionDelegate oldDelegate) {
    return position != oldDelegate.position;
  }
}

class _FluxerMenuSectionData {
  final String? title;
  final List<FluxerMenuItem> items;

  const _FluxerMenuSectionData({required this.title, required this.items});
}

List<_FluxerMenuSectionData> _buildMobileSections(List<Widget> widgets) {
  final sections = <_FluxerMenuSectionData>[];
  final currentItems = <FluxerMenuItem>[];
  String? currentTitle;

  void flush() {
    if (currentItems.isEmpty) {
      return;
    }

    sections.add(
      _FluxerMenuSectionData(
        title: currentTitle,
        items: List<FluxerMenuItem>.from(currentItems),
      ),
    );
    currentItems.clear();
    currentTitle = null;
  }

  for (final widget in widgets) {
    if (widget is FluxerMenuSectionHeader) {
      flush();
      currentTitle = widget.label;
      continue;
    }

    if (widget is FluxerMenuDivider) {
      flush();
      continue;
    }

    if (widget is FluxerMenuItem) {
      currentItems.add(widget);
    }
  }

  flush();

  return sections;
}

class FluxerMenuSectionHeader extends StatelessWidget {
  final String label;

  const FluxerMenuSectionHeader({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s3,
        context.layout.s1,
        context.layout.s3,
        context.layout.s1_5,
      ),
      child: Text(
        label,
        style: context.textStyles.label.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}

/// A single item in a [FluxerActionMenu].
///
/// Uses [FluxerTappable] for consistent hover behaviour.
class FluxerMenuItem extends StatelessWidget {
  const FluxerMenuItem({
    required this.label,
    required this.onPressed,
    this.icon,
    this.hint,
    this.enabled = true,
    this.isDanger = false,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;
  final PhosphorIconData? icon;
  final String? hint;
  final bool enabled;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    final foreground = isDanger ? colors.statusDanger : colors.textPrimary;
    final String semanticsLabel = hint != null ? '$label. $hint' : label;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s1),
      child: FluxerTappable(
        enabled: enabled,
        onTap: onPressed,
        semanticLabel: semanticsLabel,
        excludeChildSemantics: true,
        builder: (context, states) {
          final isHovered = states.contains(WidgetState.hovered);

          return AnimatedContainer(
            duration: context.motion.fast,
            curve: context.motion.curve,
            decoration: BoxDecoration(
              color: isHovered
                  ? colors.backgroundModifierHover
                  : Colors.transparent,
              borderRadius: layout.radiusSm,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: layout.s3,
              vertical: layout.s2,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (icon != null) ...[
                  PhosphorIcon(icon!, size: 20, color: foreground),
                  SizedBox(width: layout.s3),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        label,
                        style: textStyles.bodyMedium.copyWith(
                          color: enabled ? foreground : colors.textTertiary,
                        ),
                      ),
                      if (hint != null)
                        Text(
                          hint!,
                          style: textStyles.timestamp.copyWith(
                            color: colors.textTertiary,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// A thin horizontal divider for use inside [FluxerActionMenu].
class FluxerMenuDivider extends StatelessWidget {
  const FluxerMenuDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: layout.s1),
      child: ColoredBox(
        color: colors.backgroundModifierAccent,
        child: const SizedBox(height: 1, width: double.infinity),
      ),
    );
  }
}

@FluxerWidgetPreview(name: 'Section header', group: 'FluxerActionMenu')
Widget fluxerMenuSectionHeaderPreview() {
  return const FluxerMenuSectionHeader(label: 'Message actions');
}

@FluxerWidgetPreview(name: 'Menu item', group: 'FluxerActionMenu')
Widget fluxerMenuItemPreview() {
  return FluxerMenuItem(
    label: 'Copy text',
    hint: 'Copy the selected message',
    icon: PhosphorIconsBold.copy,
    onPressed: () {},
  );
}

@FluxerWidgetPreview(name: 'Danger item', group: 'FluxerActionMenu')
Widget fluxerMenuItemDangerPreview() {
  return FluxerMenuItem(
    label: 'Delete message',
    icon: PhosphorIconsBold.trash,
    isDanger: true,
    onPressed: () {},
  );
}

@FluxerWidgetPreview(name: 'Divider', group: 'FluxerActionMenu')
Widget fluxerMenuDividerPreview() {
  return const FluxerMenuDivider();
}
