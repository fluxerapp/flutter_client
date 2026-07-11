import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet_drag.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// ---------------------------------------------------------------------------
// FluxerBottomSheet
// ---------------------------------------------------------------------------

/// Builder that receives the sheet's [BuildContext] and a [close] callback.
typedef FluxerBottomSheetBuilder =
    Widget Function(BuildContext context, VoidCallback close);

/// Builder for scrollable sheets — also receives a [ScrollController] that
/// must be attached to the inner scrollable to coordinate scroll-vs-dismiss.
typedef FluxerScrollableBottomSheetBuilder =
    Widget Function(
      BuildContext context,
      ScrollController scrollController,
      VoidCallback close,
    );

enum FluxerBottomSheetVariant { content, menu }

/// Provides bottom scroll inset for lists inside a [FluxerBottomSheet].
class FluxerBottomSheetScope extends InheritedWidget {
  const FluxerBottomSheetScope({
    required this.bottomScrollPadding,
    required super.child,
    super.key,
  });

  final double bottomScrollPadding;

  static FluxerBottomSheetScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FluxerBottomSheetScope>();
  }

  @override
  bool updateShouldNotify(FluxerBottomSheetScope oldWidget) {
    return bottomScrollPadding != oldWidget.bottomScrollPadding;
  }
}

/// Shows a styled modal bottom sheet with the app's standard appearance.
///
/// The sheet builder receives a `close` callback so children can dismiss the
/// sheet without needing their own `Navigator.pop` call.
class FluxerBottomSheet {
  FluxerBottomSheet._();

  /// Bottom inset to append to scrollable content inside a bottom sheet.
  static double scrollBottomPaddingOf(BuildContext context) {
    return FluxerBottomSheetScope.maybeOf(context)?.bottomScrollPadding ?? 0;
  }

  /// Merges [padding] with the bottom sheet scroll bottom inset.
  static EdgeInsets scrollViewPadding(
    BuildContext context, {
    EdgeInsetsGeometry? padding,
  }) {
    final EdgeInsets resolved =
        padding?.resolve(Directionality.of(context)) ?? EdgeInsets.zero;
    final double bottom = scrollBottomPaddingOf(context);
    if (bottom <= 0) {
      return resolved;
    }
    return resolved.copyWith(bottom: resolved.bottom + bottom);
  }

  static Future<T?> _showWithOverlayTracking<T>(
    BuildContext context,
    Future<T?> Function() showSheet,
  ) {
    final ProviderContainer container = ProviderScope.containerOf(context);
    container.read(obscuringOverlayTrackerProvider.notifier).push();
    return showSheet().whenComplete(() {
      container.read(obscuringOverlayTrackerProvider.notifier).pop();
    });
  }

  static Future<T?> show<T>(
    BuildContext context, {
    required FluxerBottomSheetBuilder builder,
    String? title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onBack,
    bool showDragHandle = true,
    bool useRootNavigator = false,
    FluxerBottomSheetVariant variant = FluxerBottomSheetVariant.content,
    ValueNotifier<bool>? canDismissNotifier,
    bool enableDrag = true,
    double? maxHeight,
    bool isDismissible = true,
    bool reserveBottomInset = true,
  }) {
    final layout = context.layout;

    return _showWithOverlayTracking<T>(
      context,
      () => showModalBottomSheet<T>(
        context: context,
        useRootNavigator: useRootNavigator,
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: isDismissible,
        elevation: 0,
        backgroundColor: Colors.transparent,
        useSafeArea: reserveBottomInset,
        builder: (sheetContext) {
          void close() =>
              Navigator.of(sheetContext, rootNavigator: useRootNavigator).pop();

          final mediaQuery = MediaQuery.of(sheetContext);
          final topPadding = mediaQuery.viewPadding.top;
          final bottomInset = mediaQuery.viewInsets.bottom;
          final bottomPadding = _effectiveBottomSheetBottomPadding(
            sheetContext,
            reserveBottomInset,
            keyboardBottomInset: bottomInset,
          );
          final bool useExternalBottomInset =
              variant == FluxerBottomSheetVariant.menu && bottomPadding > 0;
          final double bottomScrollPadding = useExternalBottomInset
              ? 0
              : bottomPadding;
          final hasHeader =
              title != null ||
              subtitle != null ||
              leading != null ||
              trailing != null ||
              onBack != null;

          final content = AnimatedPadding(
            duration: sheetContext.motion.normal,
            curve: sheetContext.motion.curve,
            padding: EdgeInsets.only(bottom: bottomInset),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: maxHeight != null
                    ? (mediaQuery.size.height -
                              topPadding -
                              (useExternalBottomInset ? bottomPadding : 0) -
                              layout.s4) *
                          maxHeight
                    : mediaQuery.size.height -
                          topPadding -
                          (useExternalBottomInset ? bottomPadding : 0) -
                          layout.s4,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showDragHandle)
                    FluxerBottomSheetDragHandle(
                      onDismiss: enableDrag ? close : null,
                    ),
                  if (hasHeader) ...[
                    FluxerBottomSheetHeader(
                      title: title ?? '',
                      subtitle: subtitle,
                      leading: leading,
                      trailing: trailing,
                      onBack: onBack,
                    ),
                    SizedBox(
                      height: variant == FluxerBottomSheetVariant.menu
                          ? layout.s3
                          : layout.s2,
                    ),
                  ],
                  Flexible(
                    child: _FluxerBottomSheetInsetChild(
                      bottomPadding: bottomScrollPadding,
                      child: builder(sheetContext, close),
                    ),
                  ),
                ],
              ),
            ),
          );

          final sheetContent = _wrapBottomSheetSurface(
            context: sheetContext,
            insetBelowSurface: useExternalBottomInset ? bottomPadding : 0,
            child: content,
          );

          if (canDismissNotifier == null) {
            return sheetContent;
          }

          return ValueListenableBuilder<bool>(
            valueListenable: canDismissNotifier,
            builder: (context, canDismiss, child) =>
                PopScope(canPop: canDismiss, child: child!),
            child: sheetContent,
          );
        },
      ),
    );
  }

  /// Shows a bottom sheet whose content is scrollable with coordinated
  /// drag-to-dismiss (only dismisses when the scrollable is at the top).
  ///
  /// The [builder] receives a [ScrollController] that **must** be attached to
  /// the inner scrollable widget for the coordination to work.
  static Future<T?> showScrollable<T>(
    BuildContext context, {
    required FluxerScrollableBottomSheetBuilder builder,
    String? title,
    Widget? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onBack,
    bool showDragHandle = true,
    bool useRootNavigator = false,
    double initialChildSize = 0.9,
    double minChildSize = 0.4,
    double maxChildSize = 0.95,
    ValueNotifier<bool>? canDismissNotifier,
    double? maxHeight,
    bool disableTopPadding = false,
    bool isDismissible = true,
    bool reserveBottomInset = true,
  }) {
    final layout = context.layout;

    return _showWithOverlayTracking<T>(
      context,
      () => showModalBottomSheet<T>(
        context: context,
        useRootNavigator: useRootNavigator,
        isScrollControlled: true,
        enableDrag: false,
        isDismissible: isDismissible,
        elevation: 0,
        backgroundColor: Colors.transparent,
        useSafeArea: reserveBottomInset,
        builder: (sheetContext) {
          void close() =>
              Navigator.of(sheetContext, rootNavigator: useRootNavigator).pop();

          final mediaQuery = MediaQuery.of(sheetContext);
          final bottomInset = mediaQuery.viewInsets.bottom;
          final bottomPadding = _effectiveBottomSheetBottomPadding(
            sheetContext,
            reserveBottomInset,
            keyboardBottomInset: bottomInset,
          );
          final double bottomScrollPadding = bottomPadding;
          final hasHeader =
              title != null ||
              subtitle != null ||
              leading != null ||
              trailing != null ||
              onBack != null;

          final sheet = _FluxerDraggableScrollableSheet(
            minChildSize: minChildSize,
            maxChildSize: maxChildSize,
            initialChildSize: initialChildSize,
            maxHeight: maxHeight != null
                ? (mediaQuery.size.height -
                          mediaQuery.viewPadding.top -
                          layout.s4) *
                      maxHeight
                : mediaQuery.size.height -
                      mediaQuery.viewPadding.top -
                      layout.s4,
            showDragHandle: showDragHandle,
            disableTopPadding: disableTopPadding,
            hasHeader: hasHeader,
            onDismiss: close,
            title: title,
            subtitle: subtitle,
            leading: leading,
            trailing: trailing,
            onBack: onBack,
            bottomInset: bottomInset,
            bottomScrollPadding: bottomScrollPadding,
            sheetContext: sheetContext,
            builder: builder,
          );

          if (canDismissNotifier == null) {
            return sheet;
          }

          return ValueListenableBuilder<bool>(
            valueListenable: canDismissNotifier,
            builder: (context, canDismiss, child) =>
                PopScope(canPop: canDismiss, child: child!),
            child: sheet,
          );
        },
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Structural widgets
// ---------------------------------------------------------------------------

double _effectiveBottomSheetBottomPadding(
  BuildContext context,
  bool reserveBottomInset, {
  required double keyboardBottomInset,
}) {
  if (!reserveBottomInset || keyboardBottomInset > 0) {
    return 0;
  }
  return MediaQuery.viewPaddingOf(context).bottom;
}

Widget _wrapBottomSheetSurface({
  required BuildContext context,
  required Widget child,
  double insetBelowSurface = 0,
}) {
  final BottomSheetThemeData bottomSheetTheme = Theme.of(
    context,
  ).bottomSheetTheme;
  final Widget sheetBody = Material(
    color:
        bottomSheetTheme.modalBackgroundColor ??
        bottomSheetTheme.backgroundColor,
    surfaceTintColor: Colors.transparent,
    shape: bottomSheetTheme.shape,
    clipBehavior: bottomSheetTheme.clipBehavior ?? Clip.antiAlias,
    child: child,
  );
  if (insetBelowSurface <= 0) {
    return sheetBody;
  }
  return Padding(
    padding: EdgeInsets.only(bottom: insetBelowSurface),
    child: sheetBody,
  );
}

class _FluxerBottomSheetInsetChild extends StatelessWidget {
  const _FluxerBottomSheetInsetChild({
    required this.bottomPadding,
    required this.child,
  });

  final double bottomPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (bottomPadding <= 0) {
      return child;
    }
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: child,
    );
  }
}

const double _kDragHandleHitHeight = 28;

/// Captures downward vertical drags on sheet body content to dismiss the sheet.
///
/// Pair with [NeverScrollableScrollPhysics] (or a scroll view already at the top)
/// so inner scrollables do not claim the drag.
class FluxerBottomSheetDismissDragTarget extends StatefulWidget {
  const FluxerBottomSheetDismissDragTarget({
    required this.onDismiss,
    required this.child,
    super.key,
  });

  final VoidCallback onDismiss;
  final Widget child;

  @override
  State<FluxerBottomSheetDismissDragTarget> createState() =>
      _FluxerBottomSheetDismissDragTargetState();
}

class _FluxerBottomSheetDismissDragTargetState
    extends State<FluxerBottomSheetDismissDragTarget> {
  double _dragDistance = 0;

  void _handleVerticalDragStart(DragStartDetails details) {
    _dragDistance = 0;
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    _dragDistance += details.delta.dy;
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    if (fluxerBottomSheetShouldDismissAfterDrag(
      dragDistance: _dragDistance,
      velocity: details.primaryVelocity ?? 0,
    )) {
      widget.onDismiss();
    }
    _dragDistance = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragStart: _handleVerticalDragStart,
      onVerticalDragUpdate: _handleVerticalDragUpdate,
      onVerticalDragEnd: _handleVerticalDragEnd,
      child: widget.child,
    );
  }
}

class _FluxerDraggableScrollableSheet extends StatefulWidget {
  const _FluxerDraggableScrollableSheet({
    required this.minChildSize,
    required this.maxChildSize,
    required this.initialChildSize,
    required this.maxHeight,
    required this.showDragHandle,
    required this.disableTopPadding,
    required this.hasHeader,
    required this.onDismiss,
    required this.title,
    required this.subtitle,
    required this.leading,
    required this.trailing,
    required this.onBack,
    required this.bottomInset,
    required this.bottomScrollPadding,
    required this.sheetContext,
    required this.builder,
  });

  final double minChildSize;
  final double maxChildSize;
  final double initialChildSize;
  final double maxHeight;
  final bool showDragHandle;
  final bool disableTopPadding;
  final bool hasHeader;
  final VoidCallback onDismiss;
  final String? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onBack;
  final double bottomInset;
  final double bottomScrollPadding;
  final BuildContext sheetContext;
  final FluxerScrollableBottomSheetBuilder builder;

  @override
  State<_FluxerDraggableScrollableSheet> createState() =>
      _FluxerDraggableScrollableSheetState();
}

class _FluxerDraggableScrollableSheetState
    extends State<_FluxerDraggableScrollableSheet> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layout = widget.sheetContext.layout;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: widget.maxHeight),
      child: DraggableScrollableSheet(
        expand: false,
        controller: _sheetController,
        initialChildSize: widget.initialChildSize,
        minChildSize: widget.minChildSize,
        maxChildSize: widget.maxChildSize,
        builder: (context, scrollController) {
          return _wrapBottomSheetSurface(
            context: widget.sheetContext,
            child: AnimatedPadding(
              duration: widget.sheetContext.motion.normal,
              curve: widget.sheetContext.motion.curve,
              padding: EdgeInsets.only(bottom: widget.bottomInset),
              child: Column(
                children: [
                  if (widget.showDragHandle)
                    FluxerBottomSheetDragHandle(
                      sheetController: _sheetController,
                      minChildSize: widget.minChildSize,
                      maxChildSize: widget.maxChildSize,
                      includeTopPadding: !widget.disableTopPadding,
                    ),
                  if (widget.hasHeader) ...[
                    FluxerBottomSheetHeader(
                      title: widget.title ?? '',
                      subtitle: widget.subtitle,
                      leading: widget.leading,
                      trailing: widget.trailing,
                      onBack: widget.onBack,
                    ),
                    SizedBox(height: layout.s2),
                  ],
                  Expanded(
                    child: FluxerBottomSheetScope(
                      bottomScrollPadding: widget.bottomScrollPadding,
                      child: widget.builder(
                        widget.sheetContext,
                        scrollController,
                        widget.onDismiss,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FluxerBottomSheetDragHandle extends StatefulWidget {
  const FluxerBottomSheetDragHandle({
    super.key,
    this.sheetController,
    this.minChildSize = 0,
    this.maxChildSize = 1,
    this.onDismiss,
    this.onVerticalDragUpdate,
    this.onVerticalDragEnd,
    this.includeTopPadding = true,
  });

  final DraggableScrollableController? sheetController;
  final double minChildSize;
  final double maxChildSize;
  final VoidCallback? onDismiss;
  final GestureDragUpdateCallback? onVerticalDragUpdate;
  final GestureDragEndCallback? onVerticalDragEnd;
  final bool includeTopPadding;

  @override
  State<FluxerBottomSheetDragHandle> createState() =>
      _FluxerBottomSheetDragHandleState();
}

class _FluxerBottomSheetDragHandleState
    extends State<FluxerBottomSheetDragHandle> {
  double _dragDistance = 0;

  bool get _hasDragHandlers =>
      widget.sheetController != null ||
      widget.onDismiss != null ||
      widget.onVerticalDragUpdate != null ||
      widget.onVerticalDragEnd != null;

  void _handleVerticalDragStart(DragStartDetails details) {
    _dragDistance = 0;
  }

  void _handleVerticalDragUpdate(DragUpdateDetails details) {
    if (widget.onVerticalDragUpdate != null) {
      widget.onVerticalDragUpdate!(details);
      return;
    }
    final DraggableScrollableController? controller = widget.sheetController;
    if (controller != null && controller.isAttached) {
      final double currentSize = controller.size;
      if (currentSize <= 0) {
        return;
      }
      final double availablePixels = controller.pixels / currentSize;
      controller.jumpTo(
        fluxerBottomSheetSizeAfterDrag(
          currentSize: currentSize,
          deltaDy: details.delta.dy,
          availablePixels: availablePixels,
          minChildSize: widget.minChildSize,
          maxChildSize: widget.maxChildSize,
        ),
      );
      return;
    }
    if (widget.onDismiss != null) {
      _dragDistance += details.delta.dy;
    }
  }

  void _handleVerticalDragEnd(DragEndDetails details) {
    if (widget.onVerticalDragEnd != null) {
      widget.onVerticalDragEnd!(details);
      return;
    }
    if (widget.sheetController != null) {
      // Scrollable sheets close via DraggableScrollableNotification when the
      // sheet reaches min extent. Calling Navigator.pop here would double-pop.
      _dragDistance = 0;
      return;
    }
    final double velocity = details.primaryVelocity ?? 0;
    if (widget.onDismiss != null &&
        fluxerBottomSheetShouldDismissAfterDrag(
          dragDistance: _dragDistance,
          velocity: velocity,
        )) {
      widget.onDismiss!();
    }
    _dragDistance = 0;
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final double topPadding = widget.includeTopPadding ? layout.s2 : 0;
    final Widget pill = Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        color: context.colors.backgroundModifierAccent,
        borderRadius: BorderRadius.circular(2),
      ),
    );
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onVerticalDragStart: _hasDragHandlers ? _handleVerticalDragStart : null,
      onVerticalDragUpdate: _hasDragHandlers ? _handleVerticalDragUpdate : null,
      onVerticalDragEnd: _hasDragHandlers ? _handleVerticalDragEnd : null,
      child: SizedBox(
        height: topPadding + _kDragHandleHitHeight + layout.s2,
        child: Padding(
          padding: EdgeInsets.only(top: topPadding, bottom: layout.s2),
          child: Center(child: pill),
        ),
      ),
    );
  }
}

class FluxerBottomSheetHeader extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onBack;
  final Widget? after;

  const FluxerBottomSheetHeader({
    required this.title,
    super.key,
    this.leading,
    this.subtitle,
    this.trailing,
    this.onBack,
    this.after,
  });

  bool _leadingOccupiesSpace(Widget? widget) {
    if (widget == null) {
      return false;
    }
    if (widget is SizedBox) {
      final double? width = widget.width;
      final double? height = widget.height;
      if (widget.child == null &&
          (width == null || width == 0) &&
          (height == null || height == 0)) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Widget? effectiveLeading = onBack != null
        ? IconButton(
            onPressed: onBack,
            tooltip: l10n.back,
            icon: PhosphorIcon(
              PhosphorIconsBold.caretLeft,
              size: 20,
              color: colors.textPrimary,
            ),
          )
        : _leadingOccupiesSpace(leading)
        ? leading
        : null;

    final bool alignStart = effectiveLeading != null || trailing != null;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (effectiveLeading != null) ...[
                effectiveLeading,
                SizedBox(width: layout.s3),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: alignStart
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: context.textStyles.channelName.copyWith(
                        color: colors.textPrimary,
                      ),
                      textAlign: alignStart
                          ? TextAlign.start
                          : TextAlign.center,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      DefaultTextStyle.merge(
                        textAlign: alignStart
                            ? TextAlign.start
                            : TextAlign.center,
                        child: subtitle!,
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[SizedBox(width: layout.s3), trailing!],
            ],
          ),
          if (after != null) ...[SizedBox(height: layout.s3), after!],
        ],
      ),
    );
  }
}

class FluxerBottomSheetSubmenuHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;

  const FluxerBottomSheetSubmenuHeader({
    required this.title,
    required this.onBack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetHeader(title: title, onBack: onBack);
  }
}

class FluxerBottomSheetContent extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool scrollable;

  const FluxerBottomSheetContent({
    required this.child,
    super.key,
    this.padding,
    this.scrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final EdgeInsets resolvedPadding = FluxerBottomSheet.scrollViewPadding(
      context,
      padding: padding ?? EdgeInsets.symmetric(horizontal: layout.s4),
    );

    if (!scrollable) {
      return Padding(padding: resolvedPadding, child: child);
    }

    return SingleChildScrollView(padding: resolvedPadding, child: child);
  }
}

class FluxerBottomSheetSection extends StatelessWidget {
  final String? title;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const FluxerBottomSheetSection({
    required this.child,
    super.key,
    this.title,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Padding(
              padding: EdgeInsets.only(bottom: layout.s2),
              child: Text(
                title!,
                style: context.textStyles.label.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ),
          ],
          child,
        ],
      ),
    );
  }
}

class FluxerBottomSheetFooter extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showTopBorder;

  const FluxerBottomSheetFooter({
    required this.child,
    super.key,
    this.padding,
    this.showTopBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return DecoratedBox(
      decoration: BoxDecoration(
        border: showTopBorder
            ? Border(
                top: BorderSide(
                  color: colors.backgroundModifierAccent.withValues(alpha: 0.5),
                ),
              )
            : null,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(layout.s4),
        child: child,
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Menu group
// ---------------------------------------------------------------------------

class FluxerMenuGroup extends StatelessWidget {
  final List<Widget> children;

  const FluxerMenuGroup({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    if (children.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = context.colors;
    final layout = context.layout;

    return Material(
      color: colors.backgroundSecondaryAlt,
      surfaceTintColor: Colors.transparent,
      borderRadius: layout.radiusXl,
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _intersperseDividers(children, colors),
      ),
    );
  }
}

List<Widget> _intersperseDividers(List<Widget> items, FluxerColorTheme colors) {
  final result = <Widget>[];
  for (var i = 0; i < items.length; i++) {
    result.add(items[i]);
    if (i < items.length - 1) {
      result.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            height: 1,
            thickness: 1,
            color: colors.backgroundHeaderSecondary.withValues(alpha: 0.3),
          ),
        ),
      );
    }
  }
  return result;
}

// ---------------------------------------------------------------------------
// Menu items
// ---------------------------------------------------------------------------

class FluxerBottomSheetMenuItem extends StatelessWidget {
  final String label;
  final String? hint;
  final VoidCallback onTap;
  final Widget? leading;
  final IconData? icon;
  final bool isDanger;
  final bool isSelected;
  final bool enabled;
  final Widget? trailing;

  const FluxerBottomSheetMenuItem({
    required this.label,
    required this.onTap,
    super.key,
    this.hint,
    this.leading,
    this.icon,
    this.isDanger = false,
    this.isSelected = false,
    this.enabled = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final baseColor = isDanger
        ? colors.menuDangerText
        : isSelected
        ? colors.brandPrimary
        : colors.textPrimary;

    return FluxerTappable(
      enabled: enabled,
      onTap: onTap,
      selected: isSelected,
      semanticLabel: hint != null ? '$label. $hint' : label,
      excludeChildSemantics: true,
      builder: (context, states) {
        final isPressed = states.contains(WidgetState.pressed);

        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          color: isSelected
              ? colors.brandPrimary.withValues(alpha: 0.12)
              : isPressed
              ? colors.backgroundModifierHover.withValues(alpha: 0.6)
              : Colors.transparent,
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 56),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  if (leading case final leading?) ...[
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(child: leading),
                    ),
                    const SizedBox(width: 12),
                  ] else if (icon != null) ...[
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: Center(
                        child: PhosphorIcon(icon!, color: baseColor, size: 20),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          label,
                          style: context.textStyles.username.copyWith(
                            color: enabled ? baseColor : colors.textTertiary,
                          ),
                        ),
                        if (hint != null)
                          Text(
                            hint!,
                            style: context.textStyles.timestamp.copyWith(
                              color: colors.textTertiary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    const SizedBox(width: 12),
                    trailing!,
                  ] else if (isSelected) ...[
                    const SizedBox(width: 12),
                    PhosphorIcon(
                      PhosphorIconsBold.check,
                      size: 18,
                      color: colors.brandPrimary,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class FluxerBottomSheetSubmenuItem extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final VoidCallback onTap;

  const FluxerBottomSheetSubmenuItem({
    required this.label,
    required this.onTap,
    this.hint,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FluxerBottomSheetMenuItem(
      label: label,
      hint: hint,
      icon: icon,
      onTap: onTap,
      trailing: PhosphorIcon(
        PhosphorIconsBold.caretRight,
        size: 20,
        color: context.colors.textPrimaryMuted,
      ),
    );
  }
}

class FluxerBottomSheetGroupColumn extends StatelessWidget {
  final List<Widget> children;

  const FluxerBottomSheetGroupColumn({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          children[i],
          if (i < children.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }
}

class FluxerBottomSheetCheckboxItem extends StatelessWidget {
  final String label;
  final bool isChecked;
  final VoidCallback onTap;

  const FluxerBottomSheetCheckboxItem({
    required this.label,
    required this.isChecked,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return FluxerTappable(
      onTap: onTap,
      semanticLabel: label,
      checked: isChecked,
      excludeChildSemantics: true,
      builder: (context, states) {
        return ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 56),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    label,
                    style: context.textStyles.username.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isChecked
                          ? colors.brandPrimary
                          : colors.backgroundHeaderSecondary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(3),
                    color: isChecked ? colors.brandPrimary : Colors.transparent,
                  ),
                  child: isChecked
                      ? Center(
                          child: PhosphorIcon(
                            PhosphorIconsBold.check,
                            size: 12,
                            color: colors.textOnBrandPrimary,
                          ),
                        )
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

@FluxerWidgetPreview(name: 'Drag handle', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetDragHandlePreview() {
  return const FluxerBottomSheetDragHandle();
}

@FluxerWidgetPreview(name: 'Header', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetHeaderPreview() {
  return const FluxerBottomSheetHeader(
    title: 'Invite friends',
    subtitle: Text('Share this server with people you trust.'),
  );
}

@FluxerWidgetPreview(name: 'Submenu header', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetSubmenuHeaderPreview() {
  return FluxerBottomSheetSubmenuHeader(
    title: 'Notification settings',
    onBack: () {},
  );
}

@FluxerWidgetPreview(name: 'Content', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetContentPreview() {
  return const FluxerBottomSheetContent(
    scrollable: false,
    child: Text('Sheet body content goes here.'),
  );
}

@FluxerWidgetPreview(name: 'Section', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetSectionPreview() {
  return const FluxerBottomSheetSection(
    title: 'Privacy',
    child: Text('Section children'),
  );
}

@FluxerWidgetPreview(name: 'Footer', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetFooterPreview() {
  return FluxerBottomSheetFooter(
    showTopBorder: true,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(onPressed: () {}, child: const Text('Cancel')),
        const SizedBox(width: 8),
        FilledButton(onPressed: () {}, child: const Text('Save')),
      ],
    ),
  );
}

@FluxerWidgetPreview(name: 'Menu group', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetMenuGroupPreview() {
  return FluxerMenuGroup(
    children: [
      FluxerBottomSheetMenuItem(
        label: 'Edit channel',
        icon: PhosphorIconsBold.pencilSimple,
        onTap: () {},
      ),
      FluxerBottomSheetMenuItem(
        label: 'Delete channel',
        hint: 'Cannot be undone',
        icon: PhosphorIconsBold.trash,
        isDanger: true,
        onTap: () {},
      ),
    ],
  );
}

@FluxerWidgetPreview(name: 'Menu item selected', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetMenuItemSelectedPreview() {
  return FluxerBottomSheetMenuItem(
    label: 'Dark',
    isSelected: true,
    onTap: () {},
  );
}

@FluxerWidgetPreview(name: 'Submenu item', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetSubmenuItemPreview() {
  return FluxerBottomSheetSubmenuItem(
    label: 'Change nickname',
    onTap: () {},
    icon: PhosphorIconsBold.user,
  );
}

@FluxerWidgetPreview(name: 'Checkbox item', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetCheckboxItemPreview() {
  return FluxerBottomSheetCheckboxItem(
    label: 'Mute @mentions',
    isChecked: true,
    onTap: () {},
  );
}

@FluxerWidgetPreview(name: 'Group column', group: 'FluxerBottomSheet')
Widget fluxerBottomSheetGroupColumnPreview() {
  return FluxerBottomSheetGroupColumn(
    children: [
      FluxerBottomSheetMenuItem(label: 'First', onTap: () {}),
      FluxerBottomSheetMenuItem(label: 'Second', onTap: () {}),
    ],
  );
}
