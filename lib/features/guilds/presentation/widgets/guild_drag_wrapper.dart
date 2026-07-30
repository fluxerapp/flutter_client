import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_gesture_host.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_icon_peek_menu.dart';
import 'package:fluxer_app/features/guilds/providers/guild_drag_provider.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/guilds/utils/guild_folder_icon.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:gaimon/gaimon.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildDragData {
  const GuildDragData({required this.itemId, required this.isFolder});

  final String itemId;
  final bool isFolder;
}

const Duration _kMobileDropAnimationDuration = Duration(milliseconds: 150);
const double _kGuildIconSize = 48;
const double _kGuildIconInnerSize = 44;
const double _kGuildIconBorderRadius = 15;
const double _kMobileDragFeedbackScale = 0.92;

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
        : colors.brandPrimary;
    final String initials = abbreviateGuildName(label);
    final int initialsLength = guildNameInitialsLength(label);
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
                    errorBuilder: (context, url, error) =>
                        _DragFeedbackInitials(
                          initials: initials,
                          initialsLength: initialsLength,
                          color: colors.textOnBrandPrimary,
                        ),
                  )
                : _DragFeedbackInitials(
                    initials: initials,
                    initialsLength: initialsLength,
                    color: colors.textOnBrandPrimary,
                  ),
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
    this.peekMenu,
    super.key,
  });

  final String itemId;
  final bool isFolder;
  final bool enabled;
  final bool allowCombine;
  final Widget dragFeedback;
  final Widget child;
  final GuildIconPeekMenuConfig? peekMenu;

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
    // Post-frame from initState can outlive the element on same-frame
    // unmounts (guild switch rebuilding the sidebar).
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
    final DragState dragState = ref.watch(guildDragProvider);
    final bool isMobileUi = isMobileLayout(context);
    final bool useLongPressDrag = isTouchPrimaryInput(ref);
    final Color brandPrimary = context.colors.brandPrimary;
    final bool showDropIndicators =
        !useLongPressDrag || dragState.hasMovedFromHoldPoint;
    final DropPosition? dropPosition =
        showDropIndicators && dragState.hoverTargetId == widget.itemId
        ? dragState.dropPosition
        : null;

    final Widget dragTarget = KeyedSubtree(
      key: _dragTargetKey,
      child: DragTarget<GuildDragData>(
        onWillAcceptWithDetails: (details) =>
            details.data.itemId != widget.itemId,
        onMove: (details) => _handleDragMove(
          context: context,
          details: details,
          useLongPressDrag: useLongPressDrag,
        ),
        onLeave: (_) {
          if (useLongPressDrag && ref.read(guildDragProvider).isDragging) {
            return;
          }
          ref.read(guildDragProvider.notifier).clearHover();
        },
        onAcceptWithDetails: (details) {
          if (useLongPressDrag) {
            return;
          }
          _handleDrop(sourceId: details.data.itemId);
        },
        builder: (context, candidateData, rejectedData) {
          return _DragTargetContent(
            dropPosition: dropPosition,
            color: brandPrimary,
            useOutlineIndicators: isMobileUi,
            child: widget.child,
          );
        },
      ),
    );

    final bool collapseSource =
        useLongPressDrag &&
        dragState.dragItemId == widget.itemId &&
        dragState.hasMovedFromHoldPoint;

    final Widget peekHostChild = !widget.enabled
        ? dragTarget
        : _GuildDraggable(
            useLongPressDrag: useLongPressDrag,
            data: GuildDragData(
              itemId: widget.itemId,
              isFolder: widget.isFolder,
            ),
            dragFeedback: widget.dragFeedback,
            childWhenDragging: useLongPressDrag
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
              if (useLongPressDrag) {
                unawaited(HapticFeedback.mediumImpact());
              }
              ref
                  .read(guildDragProvider.notifier)
                  .startDrag(
                    widget.itemId,
                    sourceIsFolder: widget.isFolder,
                    anchorGlobalCenterX: anchorGlobalCenterX,
                  );
            },
            onDragUpdate: useLongPressDrag
                ? (Offset globalPosition) {
                    final bool didChangeDropPreview = ref
                        .read(guildDragProvider.notifier)
                        .updateDragMovement(globalPosition);
                    if (didChangeDropPreview) {
                      Gaimon.selection();
                    }
                  }
                : null,
            onDragEnded: () {
              if (useLongPressDrag) {
                _commitPendingDropIfNeeded();
              }
              ref.read(guildDragProvider.notifier).endDrag();
            },
            child: dragTarget,
          );

    if (widget.peekMenu != null && isMobileUi) {
      return GuildIconPeekGestureHost(
        itemId: widget.itemId,
        peekMenu: widget.peekMenu!,
        child: peekHostChild,
      );
    }
    return peekHostChild;
  }

  void _handleDragMove({
    required BuildContext context,
    required DragTargetDetails<GuildDragData> details,
    required bool useLongPressDrag,
  }) {
    if (useLongPressDrag) {
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
    required this.useLongPressDrag,
    required this.data,
    required this.dragFeedback,
    required this.childWhenDragging,
    required this.onDragStarted,
    required this.onDragEnded,
    required this.child,
    this.onDragUpdate,
  });

  final bool useLongPressDrag;
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

class _GuildDraggableState extends ConsumerState<_GuildDraggable> {
  OverlayEntry? _feedbackOverlay;
  bool _isFeedbackOverlayInserted = false;

  @override
  void dispose() {
    _removeFeedbackOverlay();
    super.dispose();
  }

  void _removeFeedbackOverlay() {
    _feedbackOverlay?.remove();
    _feedbackOverlay = null;
    _isFeedbackOverlayInserted = false;
  }

  void _syncFeedbackOverlay() {
    if (!widget.useLongPressDrag) {
      return;
    }
    final DragState dragState = ref.read(guildDragProvider);
    final bool isActiveDrag =
        dragState.dragItemId == widget.data.itemId &&
        dragState.showMobileDragFeedback;
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
    _feedbackOverlay ??= OverlayEntry(
      builder: (context) {
        final DragState state = ref.watch(guildDragProvider);
        if (!state.showMobileDragFeedback ||
            state.dragItemId != widget.data.itemId) {
          return const SizedBox.shrink();
        }
        final double? overlayCenterX = state.dragAnchorGlobalCenterX;
        final double? overlayGlobalY = state.dragFeedbackGlobalY;
        if (overlayCenterX == null || overlayGlobalY == null) {
          return const SizedBox.shrink();
        }
        return Positioned(
          left: overlayCenterX - _kGuildIconSize / 2,
          top: overlayGlobalY - _kGuildIconSize / 2,
          child: IgnorePointer(
            child: Transform.scale(
              scale: _kMobileDragFeedbackScale,
              child: widget.dragFeedback,
            ),
          ),
        );
      },
    );
    if (!_isFeedbackOverlayInserted) {
      Overlay.of(context, rootOverlay: true).insert(_feedbackOverlay!);
      _isFeedbackOverlayInserted = true;
    }
    _feedbackOverlay!.markNeedsBuild();
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
    _removeFeedbackOverlay();
    widget.onDragEnded();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<DragState>(guildDragProvider, (_, _) => _syncFeedbackOverlay());

    if (widget.useLongPressDrag) {
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
    required this.useOutlineIndicators,
    required this.child,
  });

  final DropPosition? dropPosition;
  final Color color;
  final bool useOutlineIndicators;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!useOutlineIndicators) {
      return _DesktopDragTargetContent(
        dropPosition: dropPosition,
        color: color,
        child: child,
      );
    }

    final bool isCombine = dropPosition == DropPosition.combine;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _AnimatedEdgeSlot(
          isActive: dropPosition == DropPosition.before,
          child: const _DropIndicatorOutlineSlot(),
        ),
        AnimatedScale(
          scale: isCombine ? 0.98 : 1,
          duration: _kMobileDropAnimationDuration,
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: _kMobileDropAnimationDuration,
            curve: Curves.easeOut,
            decoration: isCombine
                ? _combineTargetDecoration(color, true)
                : const BoxDecoration(),
            child: child,
          ),
        ),
        _AnimatedEdgeSlot(
          isActive: dropPosition == DropPosition.after,
          child: const _DropIndicatorOutlineSlot(),
        ),
      ],
    );
  }
}

class _AnimatedEdgeSlot extends StatelessWidget {
  const _AnimatedEdgeSlot({required this.isActive, required this.child});

  final bool isActive;
  final Widget child;

  static const Widget _collapsedSlot = SizedBox(
    width: double.infinity,
    height: 0,
  );

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: _kMobileDropAnimationDuration,
      curve: Curves.easeOut,
      alignment: Alignment.topCenter,
      child: isActive ? child : _collapsedSlot,
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
            decoration: _combineTargetDecoration(color, false),
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

class _DragFeedbackInitials extends StatelessWidget {
  const _DragFeedbackInitials({
    required this.initials,
    required this.initialsLength,
    required this.color,
  });

  final String initials;
  final int initialsLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        initials,
        style: TextStyle(
          color: color,
          fontSize: _dragFeedbackInitialsFontSize(initialsLength),
          fontWeight: FontWeight.w600,
          height: 1,
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
                          )
                        : ColoredBox(
                            color: context.colors.serverIconBackground,
                            child: Center(
                              child: Text(
                                abbreviateGuildName(guild.name, maxLength: 2),
                                style: const TextStyle(
                                  fontSize: 8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
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

class _DropIndicatorOutlineSlot extends StatelessWidget {
  const _DropIndicatorOutlineSlot();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Center(
        child: _DropIndicatorOutline(color: context.colors.brandPrimary),
      ),
    );
  }
}

class _DropIndicatorOutline extends StatelessWidget {
  const _DropIndicatorOutline({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _kMobileDropAnimationDuration,
      curve: Curves.easeOut,
      width: _kGuildIconSize,
      height: _kGuildIconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_kGuildIconBorderRadius),
        border: Border.all(color: color.withValues(alpha: 0.85), width: 2),
        color: color.withValues(alpha: 0.08),
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

BoxDecoration _combineTargetDecoration(Color color, bool isMobile) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(16),
    border: isMobile
        ? Border.all(color: color.withValues(alpha: 0.9), width: 2)
        : null,
    boxShadow: [
      BoxShadow(
        color: color.withValues(alpha: isMobile ? 0.45 : 0.6),
        blurRadius: isMobile ? 12 : 8,
        spreadRadius: isMobile ? 2 : 1,
      ),
    ],
  );
}

double _dragFeedbackInitialsFontSize(int initialsLength) {
  if (initialsLength <= 2) {
    return 18;
  }
  if (initialsLength <= kGuildIconInitialsMaxLength) {
    return 14;
  }
  return 12;
}
