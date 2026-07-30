import 'dart:async';
import 'dart:math' as math;
import 'dart:ui';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/media_options_launch_context.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/mobile_media_options_sheet.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_media_overlay.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AttachmentMediaViewerItem {
  const AttachmentMediaViewerItem({
    required this.url,
    required this.filename,
    this.width,
    this.height,
    this.isMatureMedia = false,
    this.attachmentId,
    this.embedIndex,
    this.proxyUrl,
    this.isExpired = false,
  });

  final String url;
  final String filename;
  final int? width;
  final int? height;
  final bool isMatureMedia;
  final String? attachmentId;
  final int? embedIndex;
  final String? proxyUrl;
  final bool isExpired;
}

Future<void> showAttachmentMediaViewer(
  BuildContext context, {
  required List<AttachmentMediaViewerItem> items,
  int initialIndex = 0,
  String? channelId,
  void Function(int index)? onForward,
  MessageMediaActionScope? actionScope,
}) async {
  if (items.isEmpty) {
    return;
  }
  final int clampedInitialIndex = initialIndex.clamp(0, items.length - 1);
  await showGeneralDialog<void>(
    context: context,
    barrierLabel: FluxerLocalizations.of(context).mediaViewerImagePreview,
    barrierColor: Colors.transparent,
    pageBuilder: (_, _, _) {
      return AttachmentMediaViewerShell(
        items: items,
        initialIndex: clampedInitialIndex,
        channelId: channelId,
        onForward: onForward,
        actionScope: actionScope,
      );
    },
    transitionBuilder: (_, animation, _, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}

class AttachmentMediaViewerShell extends ConsumerStatefulWidget {
  const AttachmentMediaViewerShell({
    required this.items,
    required this.initialIndex,
    this.channelId,
    this.onForward,
    this.actionScope,
    super.key,
  });

  final List<AttachmentMediaViewerItem> items;
  final int initialIndex;
  final String? channelId;

  /// When non-null, the action bar shows a Forward button; invoked with the
  /// index of the item on screen when tapped (after the viewer closes).
  final void Function(int index)? onForward;

  /// When non-null, the mobile overflow menu can show message-level actions
  /// (reply, delete, etc.) in addition to media actions.
  final MessageMediaActionScope? actionScope;

  @override
  ConsumerState<AttachmentMediaViewerShell> createState() =>
      _AttachmentMediaViewerShellState();
}

class _AttachmentMediaViewerShellState
    extends ConsumerState<AttachmentMediaViewerShell> {
  static const double _desktopZoomScale = 2.5;
  static const double _mobileMaxScale = 5;
  late final PageController _pageController;
  late final List<TransformationController> _mobileControllers;
  late int _currentIndex;
  bool _isDesktopZoomed = false;
  Offset _desktopPanOffset = Offset.zero;
  Offset? _desktopDragOrigin;
  bool _isPointerDownInsideContent = false;
  bool _desktopMediaHovered = false;
  bool _isDesktopDragging = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
    _mobileControllers = widget.items
        .map((AttachmentMediaViewerItem _) => TransformationController())
        .toList();
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (final TransformationController controller in _mobileControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _executeClose() {
    Navigator.of(context).pop();
  }

  void _executeOpenInBrowser() {
    final AttachmentMediaViewerItem item = widget.items[_currentIndex];
    if (item.url.isEmpty) {
      return;
    }
    unawaited(handleExternalLinkTap(context, item.url));
  }

  void _executeForward() {
    final void Function(int index)? onForward = widget.onForward;
    if (onForward == null) {
      return;
    }
    final int index = _currentIndex;
    Navigator.of(context).pop();
    onForward(index);
  }

  void _executeSelectIndex(int index) {
    if (index == _currentIndex) {
      return;
    }
    _resetZoomState();
    unawaited(
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
      ),
    );
  }

  void _executeNext() {
    if (_currentIndex >= widget.items.length - 1) {
      return;
    }
    _executeSelectIndex(_currentIndex + 1);
  }

  void _executePrevious() {
    if (_currentIndex <= 0) {
      return;
    }
    _executeSelectIndex(_currentIndex - 1);
  }

  void _resetZoomState() {
    if (!_isDesktopZoomed && _desktopPanOffset == Offset.zero) {
      for (final TransformationController controller in _mobileControllers) {
        controller.value = Matrix4.identity();
      }
      return;
    }
    setState(() {
      _isDesktopZoomed = false;
      _desktopPanOffset = Offset.zero;
      _isDesktopDragging = false;
      for (final TransformationController controller in _mobileControllers) {
        controller.value = Matrix4.identity();
      }
    });
  }

  double _readCurrentMobileScale() {
    final Matrix4 matrix = _mobileControllers[_currentIndex].value;
    return matrix.getMaxScaleOnAxis();
  }

  bool _canDismissBackdrop(bool isMobile) {
    if (isMobile) {
      return (_readCurrentMobileScale() - 1).abs() < 0.01;
    }
    if (_isDesktopZoomed) {
      return false;
    }
    return _desktopPanOffset.distance < 0.5;
  }

  void _executeDesktopToggleZoom() {
    setState(() {
      _isDesktopZoomed = !_isDesktopZoomed;
      if (!_isDesktopZoomed) {
        _desktopPanOffset = Offset.zero;
      }
    });
  }

  Future<void> _openOptions() async {
    final AttachmentMediaViewerItem currentItem = widget.items[_currentIndex];
    await showMobileMediaOptionsSheet(
      context: context,
      ref: ref,
      launchContext: MediaOptionsLaunchContext.fromImageViewerItem(
        currentItem,
        actionScope: widget.actionScope,
      ),
      onCloseViewer: _executeClose,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final AttachmentMediaViewerItem currentItem = widget.items[_currentIndex];
    final String indexLabel = l10n.mediaViewerAttachmentIndex(
      _currentIndex + 1,
      widget.items.length,
    );
    final bool canGoPrevious = _currentIndex > 0;
    final bool canGoNext = _currentIndex < widget.items.length - 1;
    final MediaOptionsLaunchContext optionsContext =
        MediaOptionsLaunchContext.fromImageViewerItem(
          currentItem,
          actionScope: widget.actionScope,
        );
    final bool showOptionsButton = isMobile && optionsContext.hasOptionsMenu;
    return Focus(
      autofocus: true,
      onKeyEvent: (_, KeyEvent event) {
        if (event is! KeyDownEvent) {
          return KeyEventResult.ignored;
        }
        if (event.logicalKey == LogicalKeyboardKey.escape) {
          _executeClose();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          _executePrevious();
          return KeyEventResult.handled;
        }
        if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          _executeNext();
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: Material(
        color: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            GestureDetector(
              onTap: () {
                if (_canDismissBackdrop(isMobile) &&
                    !_isPointerDownInsideContent) {
                  _executeClose();
                }
              },
              child: ColoredBox(
                color: isMobile
                    ? Colors.black.withValues(alpha: 0.85)
                    : Colors.black.withValues(alpha: 0.6),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: isMobile ? 8 : 4,
                    sigmaY: isMobile ? 8 : 4,
                  ),
                  child: const SizedBox.expand(),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        if (!isMobile && !_isDesktopZoomed) ...[
                          Flexible(
                            child: _MediaViewerInfoPill(
                              filename: currentItem.filename,
                              dimensions: _buildDimensionsLabel(currentItem),
                              indexLabel: indexLabel,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        if (isMobile)
                          Tooltip(
                            message: l10n.mediaViewerClose,
                            child: FluxerButton.mediaOverlay(
                              onPressed: _executeClose,
                              icon: PhosphorIconsBold.x,
                              isSquare: true,
                            ),
                          ),
                        const Spacer(),
                        if (!isMobile && widget.onForward != null) ...[
                          Tooltip(
                            message: l10n.mediaViewerForward,
                            child: FluxerButton.mediaOverlay(
                              onPressed: _executeForward,
                              icon: PhosphorIconsBold.arrowBendUpRight,
                              isSquare: true,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        if (!isMobile) ...[
                          Tooltip(
                            message: l10n.mediaViewerOpenInBrowser,
                            child: FluxerButton.mediaOverlay(
                              onPressed: _executeOpenInBrowser,
                              icon: PhosphorIconsBold.arrowSquareOut,
                              isSquare: true,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Tooltip(
                            message: _isDesktopZoomed
                                ? l10n.mediaViewerZoomOut
                                : l10n.mediaViewerZoomIn,
                            child: FluxerButton.mediaOverlay(
                              onPressed: _executeDesktopToggleZoom,
                              icon: _isDesktopZoomed
                                  ? PhosphorIconsBold.magnifyingGlassMinus
                                  : PhosphorIconsBold.magnifyingGlassPlus,
                              isSquare: true,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Tooltip(
                            message: l10n.mediaViewerClose,
                            child: FluxerButton.mediaOverlay(
                              onPressed: _executeClose,
                              icon: PhosphorIconsBold.x,
                              isSquare: true,
                            ),
                          ),
                        ],
                        if (showOptionsButton)
                          Tooltip(
                            message: l10n.mediaViewerOptions,
                            child: FluxerButton.mediaOverlay(
                              onPressed: _openOptions,
                              icon: PhosphorIconsBold.dotsThree,
                              isSquare: true,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        isMobile ? 0 : 12,
                        isMobile ? 0 : 8,
                        isMobile ? 0 : 12,
                        isMobile ? 0 : 12,
                      ),
                      child: Listener(
                        onPointerDown: (_) =>
                            _isPointerDownInsideContent = true,
                        onPointerUp: (_) => _isPointerDownInsideContent = false,
                        onPointerCancel: (_) =>
                            _isPointerDownInsideContent = false,
                        child: PageView.builder(
                          controller: _pageController,
                          physics: isMobile
                              ? const ClampingScrollPhysics()
                              : (_isDesktopZoomed
                                    ? const NeverScrollableScrollPhysics()
                                    : const ClampingScrollPhysics()),
                          onPageChanged: (int index) {
                            setState(() {
                              _currentIndex = index;
                              _desktopMediaHovered = false;
                              _isDesktopDragging = false;
                            });
                            _resetZoomState();
                          },
                          itemCount: widget.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildMediaPage(
                              context: context,
                              item: widget.items[index],
                              isMobile: isMobile,
                              index: index,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  if (widget.items.length > 1 &&
                      (!_isDesktopZoomed || isMobile))
                    _MediaViewerThumbnailStrip(
                      items: widget.items,
                      currentIndex: _currentIndex,
                      channelId: widget.channelId,
                      onSelectIndex: _executeSelectIndex,
                    ),
                  if (widget.items.length > 1)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: canGoPrevious ? _executePrevious : null,
                            tooltip: l10n.mediaViewerPreviousAttachment,
                            icon: const Icon(PhosphorIconsBold.caretLeft),
                          ),
                          Text(
                            indexLabel,
                            style: context.textStyles.smallText.copyWith(
                              color: context.colors.textPrimaryMuted,
                            ),
                          ),
                          IconButton(
                            onPressed: canGoNext ? _executeNext : null,
                            tooltip: l10n.mediaViewerNextAttachment,
                            icon: const Icon(PhosphorIconsBold.caretRight),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _buildDimensionsLabel(AttachmentMediaViewerItem item) {
    final int? width = item.width;
    final int? height = item.height;
    if (width == null || height == null || width <= 0 || height <= 0) {
      return null;
    }
    return '${width}x$height';
  }

  Widget _buildMediaPage({
    required BuildContext context,
    required AttachmentMediaViewerItem item,
    required bool isMobile,
    required int index,
  }) {
    final Widget image = CachedNetworkImage(
      imageUrl: item.url,
      fit: BoxFit.contain,
      errorBuilder: (_, _, _) => ColoredBox(
        color: context.colors.backgroundSecondaryAlt,
        child: const Center(child: Icon(PhosphorIconsBold.image)),
      ),
    );
    final Widget media = MatureMediaOverlay(
      channelId: widget.channelId,
      isMatureMedia: item.isMatureMedia,
      child: image,
    );
    if (isMobile) {
      return InteractiveViewer(
        transformationController: _mobileControllers[index],
        minScale: 1,
        maxScale: _mobileMaxScale,
        clipBehavior: Clip.none,
        child: Center(child: media),
      );
    }
    return MouseRegion(
      cursor: _resolveDesktopMediaCursor(index),
      onEnter: index == _currentIndex
          ? (_) {
              setState(() {
                _desktopMediaHovered = true;
              });
            }
          : null,
      onExit: index == _currentIndex
          ? (_) {
              setState(() {
                _desktopMediaHovered = false;
              });
            }
          : null,
      child: GestureDetector(
        onDoubleTap: _executeDesktopToggleZoom,
        onPanStart: _isDesktopZoomed
            ? (DragStartDetails details) {
                setState(() {
                  _isDesktopDragging = true;
                  _desktopDragOrigin =
                      details.localPosition - _desktopPanOffset;
                });
              }
            : null,
        onPanUpdate: _isDesktopZoomed
            ? (DragUpdateDetails details) {
                final Offset? dragOrigin = _desktopDragOrigin;
                if (dragOrigin == null) {
                  return;
                }
                final Size viewportSize = MediaQuery.sizeOf(context);
                final double maxPanX = math.max(0, viewportSize.width * 0.4);
                final double maxPanY = math.max(0, viewportSize.height * 0.35);
                final Offset nextOffset = details.localPosition - dragOrigin;
                setState(() {
                  _desktopPanOffset = Offset(
                    nextOffset.dx.clamp(-maxPanX, maxPanX),
                    nextOffset.dy.clamp(-maxPanY, maxPanY),
                  );
                });
              }
            : null,
        onPanEnd: _isDesktopZoomed
            ? (_) {
                setState(() {
                  _isDesktopDragging = false;
                  _desktopDragOrigin = null;
                });
              }
            : null,
        onPanCancel: _isDesktopZoomed
            ? () {
                setState(() {
                  _isDesktopDragging = false;
                  _desktopDragOrigin = null;
                });
              }
            : null,
        child: Center(
          child: Transform.translate(
            offset: _desktopPanOffset,
            child: Transform.scale(
              scale: _isDesktopZoomed ? _desktopZoomScale : 1,
              child: media,
            ),
          ),
        ),
      ),
    );
  }

  MouseCursor _resolveDesktopMediaCursor(int index) {
    if (index != _currentIndex) {
      return MouseCursor.defer;
    }
    if (_isDesktopZoomed && _isDesktopDragging) {
      return SystemMouseCursors.grabbing;
    }
    if (_desktopMediaHovered) {
      return _isDesktopZoomed
          ? SystemMouseCursors.zoomOut
          : SystemMouseCursors.zoomIn;
    }
    return MouseCursor.defer;
  }
}

class _MediaViewerInfoPill extends StatelessWidget {
  const _MediaViewerInfoPill({
    required this.filename,
    required this.dimensions,
    required this.indexLabel,
  });

  final String filename;
  final String? dimensions;
  final String indexLabel;

  @override
  Widget build(BuildContext context) {
    final List<String> metaChunks = <String>[indexLabel];
    if (dimensions != null && dimensions!.isNotEmpty) {
      metaChunks.add(dimensions!);
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundTextarea,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: context.colors.backgroundModifierAccent),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              filename,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              metaChunks.join(' • '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.smallText.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MediaViewerThumbnailStrip extends StatelessWidget {
  const _MediaViewerThumbnailStrip({
    required this.items,
    required this.currentIndex,
    required this.onSelectIndex,
    this.channelId,
  });

  final List<AttachmentMediaViewerItem> items;
  final int currentIndex;
  final String? channelId;
  final ValueChanged<int> onSelectIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemBuilder: (BuildContext context, int index) {
          final bool isSelected = index == currentIndex;
          final AttachmentMediaViewerItem item = items[index];
          final bool hideMatureThumbnail =
              item.isMatureMedia && channelId != null;
          return Semantics(
            button: true,
            selected: isSelected,
            label: 'Attachment ${index + 1}',
            child: ExcludeSemantics(
              child: GestureDetector(
                onTap: () => onSelectIndex(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  width: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? context.colors.brandPrimary
                          : context.colors.backgroundModifierAccent,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: hideMatureThumbnail
                        ? ColoredBox(
                            color: context.colors.spoilerBackground,
                            child: const SizedBox.expand(),
                          )
                        : CachedNetworkImage(
                            imageUrl: item.url,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemCount: items.length,
      ),
    );
  }
}
