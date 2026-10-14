import 'dart:async';
import 'dart:ui' show lerpDouble;

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_gesture_host.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_long_press_menu_host.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/guilds/utils/guild_folder_icon.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_acronym.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildDragData {
  const GuildDragData({required this.itemId, required this.isFolder});

  final String itemId;
  final bool isFolder;
}

const Duration _kTouchReorderSpringDuration = Duration(milliseconds: 320);
const Curve _kTouchReorderSpringCurve = FluxerSpringCurve(
  stiffness: 420,
  damping: 32,
  duration: _kTouchReorderSpringDuration,
);
const double _kGuildIconSize = 48;
const double _kGuildIconInnerSize = 44;

int _guildDragIconMemCache(BuildContext context, double logicalSize) =>
    (logicalSize * MediaQuery.devicePixelRatioOf(context)).round();
const double _kGuildIconBorderRadius = 15;
const double _kGuildNavbarItemSpacing = 8;
const double _kTouchInsertionSlotHeight =
    _kGuildIconSize + _kGuildNavbarItemSpacing;
const double _kTouchDragFeedbackScale = 1.06;

class GuildDragFeedback extends StatelessWidget {
  const GuildDragFeedback({
    required this.label,
    this.iconUrl,
    this.isUnavailable = false,
    super.key,
  });

  final String label;
  final String? iconUrl;
  final bool isUnavailable;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bool hasImage = iconUrl != null && !isUnavailable;
    final Color bgColor = isUnavailable
        ? colors.statusDanger
        : hasImage
        ? Colors.transparent
        : colors.serverIconBackground;
    final Color acronymColor = isUnavailable
        ? colors.textOnBrandPrimary
        : colors.textPrimary;
    return _FloatingDragIcon(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(_kGuildIconBorderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_kGuildIconBorderRadius),
          child: SizedBox(
            width: _kGuildIconInnerSize,
            height: _kGuildIconInnerSize,
            child: isUnavailable
                ? Center(
                    child: PhosphorIcon(
                      PhosphorIconsBold.exclamationMark,
                      color: colors.textOnBrandPrimary,
                      size: 28,
                    ),
                  )
                : iconUrl != null
                ? CachedNetworkImage(
                    imageUrl: iconUrl!,
                    fit: BoxFit.cover,
                    memCacheWidth: _guildDragIconMemCache(
                      context,
                      _kGuildIconInnerSize,
                    ),
                    memCacheHeight: _guildDragIconMemCache(
                      context,
                      _kGuildIconInnerSize,
                    ),
                    errorBuilder: (context, url, error) =>
                        FluxerGuildAcronym(name: label, color: acronymColor),
                  )
                : FluxerGuildAcronym(name: label, color: acronymColor),
          ),
        ),
      ),
    );
  }
}

class GuildFolderDragFeedback extends StatelessWidget {
  const GuildFolderDragFeedback({
    required this.guilds,
    this.folderIcon,
    this.showIconWhenCollapsed = false,
    super.key,
  });

  final List<Guild> guilds;
  final String? folderIcon;
  final bool showIconWhenCollapsed;

  @override
  Widget build(BuildContext context) {
    return _FloatingDragIcon(
      backgroundColor: context.colors.serverIconBackground,
      child: showIconWhenCollapsed && folderIcon != null
          ? Center(
              child: PhosphorIcon(
                guildFolderIconForName(folderIcon),
                color: context.colors.textPrimary,
                size: 24,
              ),
            )
          : _FolderMiniGrid(guilds: guilds),
    );
  }
}

class GuildDragWrapper extends ConsumerStatefulWidget {
  const GuildDragWrapper({
    required this.itemId,
    required this.isFolder,
    required this.dragFeedback,
    required this.child,
    this.enabled = true,
    this.allowCombine = true,
    this.onLongPressMenu,
    this.folderPeekMenu,
    this.onPeekOpened,
    super.key,
  });

  final String itemId;
  final bool isFolder;
  final bool enabled;
  final bool allowCombine;
  final Widget dragFeedback;
  final Widget child;
  final Future<void> Function()? onLongPressMenu;
  final SidebarPeekContent? folderPeekMenu;
  final VoidCallback? onPeekOpened;

  @override
  ConsumerState<GuildDragWrapper> createState() => _GuildDragWrapperState();
}

class _GuildDragWrapperState extends ConsumerState<GuildDragWrapper> {
  final GlobalKey _dragTargetKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _registerDragTarget());
  }

  @override
  void didUpdateWidget(GuildDragWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.itemId != widget.itemId ||
        oldWidget.isFolder != widget.isFolder ||
        oldWidget.allowCombine != widget.allowCombine) {
      ref
          .read(guildDragProvider.notifier)
          .unregisterDragTarget(oldWidget.itemId);
      _registerDragTarget();
    }
  }

  @override
  void deactivate() {
    ref.read(guildDragProvider.notifier).unregisterDragTarget(widget.itemId);
    super.deactivate();
  }

  void _registerDragTarget() {
    if (!mounted) {
      return;
    }
    ref
        .read(guildDragProvider.notifier)
        .registerDragTarget(
          RegisteredGuildDragTarget(
            itemId: widget.itemId,
            isFolder: widget.isFolder,
            allowCombine: widget.allowCombine,
            boundsKey: _dragTargetKey,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final bool useTouchDrag = isTouchPrimaryInput(ref);
    final Color brandPrimary = context.colors.brandPrimary;
    final GuildDragItemVisualState dragVisual = ref.watch(
      guildDragProvider.select(
        (DragState state) => guildDragVisualStateForItem(
          state: state,
          itemId: widget.itemId,
          useTouchDrag: useTouchDrag,
        ),
      ),
    );
    final DropPosition? dropPosition = dragVisual.dropPosition;

    final Widget dragTarget = KeyedSubtree(
      key: _dragTargetKey,
      child: DragTarget<GuildDragData>(
        onWillAcceptWithDetails: (details) =>
            details.data.itemId != widget.itemId,
        onMove: (details) => _handleDragMove(
          context: context,
          details: details,
          useTouchDrag: useTouchDrag,
        ),
        onLeave: (_) {
          if (useTouchDrag && ref.read(guildDragProvider).isDragging) {
            return;
          }
          ref.read(guildDragProvider.notifier).clearHover();
        },
        onAcceptWithDetails: (details) {
          if (useTouchDrag) {
            return;
          }
          _handleDrop(sourceId: details.data.itemId);
        },
        builder: (context, candidateData, rejectedData) {
          return _DragTargetContent(
            dropPosition: dropPosition,
            color: brandPrimary,
            useTouchInsertionGaps: useTouchDrag,
            child: widget.child,
          );
        },
      ),
    );

    final bool collapseSource = dragVisual.collapseSource;

    final Widget peekHostChild = !widget.enabled
        ? dragTarget
        : _GuildDraggable(
            useTouchDrag: useTouchDrag,
            data: GuildDragData(
              itemId: widget.itemId,
              isFolder: widget.isFolder,
            ),
            dragFeedback: widget.dragFeedback,
            childWhenDragging: useTouchDrag
                ? collapseSource
                      ? const SizedBox.shrink()
                      : IgnorePointer(child: dragTarget)
                : IgnorePointer(
                    child: Visibility(
                      visible: false,
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      child: widget.child,
                    ),
                  ),
            onDragStarted: (double? anchorGlobalCenterX) {
              final bool hasLongPressOverlayHost =
                  widget.onLongPressMenu != null ||
                  widget.folderPeekMenu != null;
              if (useTouchDrag && !hasLongPressOverlayHost) {
                FluxerHaptics.medium();
              }
              ref
                  .read(guildDragProvider.notifier)
                  .startDrag(
                    widget.itemId,
                    sourceIsFolder: widget.isFolder,
                    anchorGlobalCenterX: anchorGlobalCenterX,
                  );
            },
            onDragUpdate: useTouchDrag
                ? (Offset globalPosition) {
                    final bool didChangeDropPreview = ref
                        .read(guildDragProvider.notifier)
                        .updateDragMovement(globalPosition);
                    if (didChangeDropPreview) {
                      FluxerHaptics.selection();
                    }
                  }
                : null,
            onDragEnded: () {
              if (useTouchDrag) {
                _commitPendingDropIfNeeded();
              }
              ref.read(guildDragProvider.notifier).endDrag();
            },
            child: dragTarget,
          );

    final SidebarPeekContent? folderPeekMenu = widget.folderPeekMenu;
    if (folderPeekMenu != null && useTouchDrag) {
      return GuildIconPeekGestureHost(
        itemId: widget.itemId,
        content: folderPeekMenu,
        onPeekOpened: widget.onPeekOpened,
        child: peekHostChild,
      );
    }
    final Future<void> Function()? onLongPressMenu = widget.onLongPressMenu;
    if (onLongPressMenu != null && useTouchDrag) {
      return GuildLongPressMenuHost(
        itemId: widget.itemId,
        onLongPressMenu: onLongPressMenu,
        child: peekHostChild,
      );
    }
    return peekHostChild;
  }

  void _handleDragMove({
    required BuildContext context,
    required DragTargetDetails<GuildDragData> details,
    required bool useTouchDrag,
  }) {
    if (useTouchDrag) {
      return;
    }
    final RenderBox renderBox = context.findRenderObject()! as RenderBox;
    final double ratio = globalVerticalDropRatio(renderBox, details.offset);
    final DragState dragState = ref.read(guildDragProvider);
    final DropPosition? currentPosition =
        dragState.hoverTargetId == widget.itemId
        ? dragState.dropPosition
        : null;
    final DropPosition position = resolveGuildDropPosition(
      ratio: ratio,
      sourceIsFolder: details.data.isFolder,
      targetIsFolder: widget.isFolder,
      allowCombine: widget.allowCombine,
      currentPosition: currentPosition,
    );
    ref
        .read(guildDragProvider.notifier)
        .updateHover(
          targetId: widget.itemId,
          isFolder: widget.isFolder,
          position: position,
        );
  }

  void _commitPendingDropIfNeeded() {
    final DragState dragState = ref.read(guildDragProvider);
    final String? sourceId = dragState.dragItemId;
    final String? targetId = dragState.hoverTargetId;
    final DropPosition? position = dragState.dropPosition;
    if (sourceId == null || targetId == null || position == null) {
      return;
    }
    _applyDragDrop(
      sourceId: sourceId,
      targetId: targetId,
      targetIsFolder: dragState.hoverTargetIsFolder,
      position: position,
    );
  }

  void _handleDrop({required String sourceId}) {
    final DropPosition? position = ref.read(guildDragProvider).dropPosition;
    if (position == null) {
      return;
    }
    _applyDragDrop(
      sourceId: sourceId,
      targetId: widget.itemId,
      targetIsFolder: widget.isFolder,
      position: position,
    );
  }

  void _applyDragDrop({
    required String sourceId,
    required String targetId,
    required bool targetIsFolder,
    required DropPosition position,
  }) {
    ref
        .read(organizedGuildListProvider.notifier)
        .applyDragDrop(
          sourceId: sourceId,
          targetId: targetId,
          targetIsFolder: targetIsFolder,
          position: position,
        );
  }
}

class _GuildDraggable extends ConsumerStatefulWidget {
  const _GuildDraggable({
    required this.useTouchDrag,
    required this.data,
    required this.dragFeedback,
    required this.childWhenDragging,
    required this.onDragStarted,
    required this.onDragEnded,
    required this.child,
    this.onDragUpdate,
  });

  final bool useTouchDrag;
  final GuildDragData data;
  final Widget dragFeedback;
  final Widget childWhenDragging;
  final void Function(double? anchorGlobalCenterX) onDragStarted;
  final VoidCallback onDragEnded;
  final void Function(Offset globalPosition)? onDragUpdate;
  final Widget child;

  @override
  ConsumerState<_GuildDraggable> createState() => _GuildDraggableState();
}

class _GuildDraggableState extends ConsumerState<_GuildDraggable>
    with TickerProviderStateMixin {
  OverlayEntry? _feedbackOverlay;
  bool _isFeedbackOverlayInserted = false;
  bool _isReleasing = false;
  double? _overlayCenterX;
  double? _overlayGlobalY;
  Offset? _releaseStart;
  Offset? _releaseEnd;
  late final AnimationController _liftController;
  late final AnimationController _releaseController;

  @override
  void initState() {
    super.initState();
    _liftController = AnimationController(
      vsync: this,
      duration: _kTouchReorderSpringDuration,
    );
    _releaseController = AnimationController(
      vsync: this,
      duration: _kTouchReorderSpringDuration,
    );
  }

  @override
  void dispose() {
    _removeFeedbackOverlay();
    _liftController.dispose();
    _releaseController.dispose();
    super.dispose();
  }

  void _removeFeedbackOverlay() {
    _feedbackOverlay?.remove();
    _feedbackOverlay = null;
    _isFeedbackOverlayInserted = false;
    _overlayCenterX = null;
    _overlayGlobalY = null;
    _liftController.reset();
    _releaseController.reset();
  }

  void _syncFeedbackOverlay() {
    if (!widget.useTouchDrag) {
      return;
    }
    final DragState dragState = ref.read(guildDragProvider);
    final bool isActiveDrag =
        dragState.dragItemId == widget.data.itemId &&
        dragState.showTouchDragFeedback;
    if (!isActiveDrag) {
      _removeFeedbackOverlay();
      return;
    }
    final double? centerX = dragState.dragAnchorGlobalCenterX;
    final double? globalY = dragState.dragFeedbackGlobalY;
    if (centerX == null || globalY == null) {
      _removeFeedbackOverlay();
      return;
    }
    _overlayCenterX = centerX;
    _overlayGlobalY = globalY;
    _feedbackOverlay ??= OverlayEntry(builder: (_) => _buildFeedbackOverlay());
    if (!_isFeedbackOverlayInserted) {
      Overlay.of(context, rootOverlay: true).insert(_feedbackOverlay!);
      _isFeedbackOverlayInserted = true;
      _liftController.forward(from: 0);
    }
    _feedbackOverlay!.markNeedsBuild();
  }

  Widget _buildFeedbackOverlay() {
    final Offset? releaseStart = _releaseStart;
    final Offset? releaseEnd = _releaseEnd;
    final bool isReleasing =
        _isReleasing && releaseStart != null && releaseEnd != null;

    if (!isReleasing && (_overlayCenterX == null || _overlayGlobalY == null)) {
      return const SizedBox.shrink();
    }

    return AnimatedBuilder(
      animation: Listenable.merge(<Listenable>[
        _liftController,
        _releaseController,
      ]),
      builder: (context, child) {
        final double liftT = _kTouchReorderSpringCurve.transform(
          _liftController.value,
        );
        final double releaseT = _kTouchReorderSpringCurve.transform(
          _releaseController.value,
        );
        final double centerX;
        final double centerY;
        final double scale;
        if (isReleasing) {
          centerX = lerpDouble(releaseStart.dx, releaseEnd.dx, releaseT)!;
          centerY = lerpDouble(releaseStart.dy, releaseEnd.dy, releaseT)!;
          scale = lerpDouble(_kTouchDragFeedbackScale, 1, releaseT)!;
        } else {
          centerX = _overlayCenterX!;
          centerY = _overlayGlobalY!;
          scale = lerpDouble(1, _kTouchDragFeedbackScale, liftT)!;
        }
        return Positioned(
          left: centerX - _kGuildIconSize / 2,
          top: centerY - _kGuildIconSize / 2,
          child: IgnorePointer(
            child: Transform.scale(scale: scale, child: widget.dragFeedback),
          ),
        );
      },
    );
  }

  double? _anchorGlobalCenterX(BuildContext context) {
    RenderObject? renderObject = context.findRenderObject();
    while (renderObject != null) {
      if (renderObject is RenderBox) {
        if ((renderObject.size.width - kGuildNavbarWidth).abs() < 1) {
          return renderObject
              .localToGlobal(Offset(renderObject.size.width / 2, 0))
              .dx;
        }
      }
      final RenderObject? parent = renderObject.parent;
      renderObject = parent;
    }
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box == null) {
      return null;
    }
    return box.localToGlobal(Offset(box.size.width / 2, 0)).dx;
  }

  void _handleDragEnded() {
    if (!widget.useTouchDrag) {
      _removeFeedbackOverlay();
      widget.onDragEnded();
      return;
    }
    unawaited(_runReleaseAnimation());
  }

  Future<void> _runReleaseAnimation() async {
    if (!mounted) {
      return;
    }
    final GuildDrag notifier = ref.read(guildDragProvider.notifier);
    final DragState dragState = ref.read(guildDragProvider);
    final double? centerX = dragState.dragAnchorGlobalCenterX;
    final double? globalY = dragState.dragFeedbackGlobalY;
    if (centerX == null || globalY == null) {
      _removeFeedbackOverlay();
      widget.onDragEnded();
      return;
    }

    notifier.finalizeHoverForDrop(Offset(centerX, globalY));

    _isReleasing = true;
    _releaseStart = Offset(centerX, globalY);
    _releaseEnd =
        notifier.landingGlobalCenter() ?? notifier.dragSourceGlobalCenter();
    _overlayCenterX = centerX;
    _overlayGlobalY = globalY;
    _feedbackOverlay ??= OverlayEntry(builder: (_) => _buildFeedbackOverlay());
    if (!_isFeedbackOverlayInserted) {
      Overlay.of(context, rootOverlay: true).insert(_feedbackOverlay!);
      _isFeedbackOverlayInserted = true;
    }
    _feedbackOverlay!.markNeedsBuild();

    if (_releaseEnd == null) {
      _isReleasing = false;
      _removeFeedbackOverlay();
      widget.onDragEnded();
      return;
    }

    _releaseController.reset();
    await _releaseController.forward();
    if (!mounted) {
      return;
    }
    _isReleasing = false;
    _releaseStart = null;
    _releaseEnd = null;
    _removeFeedbackOverlay();
    widget.onDragEnded();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.useTouchDrag) {
      return LongPressDraggable<GuildDragData>(
        data: widget.data,
        onDragStarted: () =>
            widget.onDragStarted(_anchorGlobalCenterX(context)),
        onDragUpdate: widget.onDragUpdate == null
            ? null
            : (details) {
                widget.onDragUpdate!(details.globalPosition);
                _syncFeedbackOverlay();
              },
        onDragEnd: (_) => _handleDragEnded(),
        onDraggableCanceled: (_, _) => _handleDragEnded(),
        feedback: const SizedBox.shrink(),
        childWhenDragging: widget.childWhenDragging,
        child: widget.child,
      );
    }
    return Draggable<GuildDragData>(
      data: widget.data,
      dragAnchorStrategy: pointerDragAnchorStrategy,
      onDragStarted: () => widget.onDragStarted(_anchorGlobalCenterX(context)),
      onDragEnd: (_) => widget.onDragEnded(),
      onDraggableCanceled: (_, _) => widget.onDragEnded(),
      feedback: Transform.scale(scale: 0.9, child: widget.dragFeedback),
      childWhenDragging: widget.childWhenDragging,
      child: widget.child,
    );
  }
}

class _DragTargetContent extends StatelessWidget {
  const _DragTargetContent({
    required this.dropPosition,
    required this.color,
    required this.useTouchInsertionGaps,
    required this.child,
  });

  final DropPosition? dropPosition;
  final Color color;
  final bool useTouchInsertionGaps;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!useTouchInsertionGaps) {
      return _DesktopDragTargetContent(
        dropPosition: dropPosition,
        color: color,
        child: child,
      );
    }

    return _TouchInsertionDragTargetContent(
      dropPosition: dropPosition,
      child: child,
    );
  }
}

class _TouchInsertionDragTargetContent extends StatelessWidget {
  const _TouchInsertionDragTargetContent({
    required this.dropPosition,
    required this.child,
  });

  final DropPosition? dropPosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool openBefore = dropPosition == DropPosition.before;
    final bool openAfter = dropPosition == DropPosition.after;
    final bool isCombine = dropPosition == DropPosition.combine;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _TouchInsertionGap(isOpen: openBefore),
        AnimatedScale(
          scale: isCombine ? 0.9 : 1,
          duration: _kTouchReorderSpringDuration,
          curve: _kTouchReorderSpringCurve,
          child: child,
        ),
        _TouchInsertionGap(isOpen: openAfter),
      ],
    );
  }
}

class _TouchInsertionGap extends StatelessWidget {
  const _TouchInsertionGap({required this.isOpen});

  final bool isOpen;

  static const Widget _closedGap = SizedBox(width: double.infinity, height: 0);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: _kTouchReorderSpringDuration,
      curve: _kTouchReorderSpringCurve,
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      child: isOpen
          ? const SizedBox(
              width: double.infinity,
              height: _kTouchInsertionSlotHeight,
            )
          : _closedGap,
    );
  }
}

class _DesktopDragTargetContent extends StatelessWidget {
  const _DesktopDragTargetContent({
    required this.dropPosition,
    required this.color,
    required this.child,
  });

  final DropPosition? dropPosition;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool isCombine = dropPosition == DropPosition.combine;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (dropPosition == DropPosition.before)
          _DropIndicatorLine(color: color),
        if (isCombine)
          DecoratedBox(
            decoration: _combineTargetDecoration(color),
            child: child,
          )
        else
          child,
        if (dropPosition == DropPosition.after)
          _DropIndicatorLine(color: color),
      ],
    );
  }
}

class _FloatingDragIcon extends StatelessWidget {
  const _FloatingDragIcon({required this.child, this.backgroundColor});

  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8,
      shadowColor: Colors.black.withValues(alpha: 0.35),
      borderRadius: BorderRadius.circular(_kGuildIconBorderRadius),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(_kGuildIconBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SizedBox(
          width: _kGuildIconSize,
          height: _kGuildIconSize,
          child: child,
        ),
      ),
    );
  }
}

class _FolderMiniGrid extends StatelessWidget {
  const _FolderMiniGrid({required this.guilds});

  final List<Guild> guilds;

  @override
  Widget build(BuildContext context) {
    final List<Guild> gridGuilds = guilds.take(4).toList();
    const double gridPadding = 4;
    const double gridGap = 2;
    return Padding(
      padding: const EdgeInsets.all(gridPadding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double cellSize = (constraints.maxWidth - gridGap) / 2;
          return Wrap(
            spacing: gridGap,
            runSpacing: gridGap,
            children: [
              for (final Guild guild in gridGuilds)
                SizedBox.square(
                  dimension: cellSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(cellSize * 0.3),
                    child: guild.iconUrl != null
                        ? CachedNetworkImage(
                            imageUrl: guild.iconUrl!,
                            fit: BoxFit.cover,
                            memCacheWidth: _guildDragIconMemCache(
                              context,
                              cellSize,
                            ),
                            memCacheHeight: _guildDragIconMemCache(
                              context,
                              cellSize,
                            ),
                          )
                        : ColoredBox(
                            color: context.colors.serverIconBackground,
                            child: FluxerGuildAcronym(name: guild.name),
                          ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _DropIndicatorLine extends StatelessWidget {
  const _DropIndicatorLine({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
}

BoxDecoration _combineTargetDecoration(Color color) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: color.withValues(alpha: 0.6),
        blurRadius: 8,
        spreadRadius: 1,
      ),
    ],
  );
}
