/// The unified center-anchored chat viewport.
///
/// One `CustomScrollView` for every open/jump/live state; positioning is the
/// pair `(anchorId, anchorFraction)`. The split falls after the anchor item:
/// the anchor is the last child of the leading sliver, so at scroll offset 0
/// its trailing edge sits at `anchorFraction` of the viewport. The leading
/// sliver grows up (prepends scroll-stable), the trailing sliver grows down
/// (appends scroll-stable); `CustomScrollView.center` names the zero-size
/// marker between them. The live tail is `(newestId, 1.0)`; underfilled
/// content hugs the bottom for the same reason.
///
/// `anchorEpoch` keys the subtree: every re-anchor attaches a fresh
/// ScrollPosition whose first layout places the anchor at its fraction -
/// atomic positioning, no wrong-paint frame, no settle loop. A missing or
/// null anchor degrades to the same bottom-anchored layout.
library;

import 'package:flutter/rendering.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_placeholder_specs.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_skeleton.dart';
import 'package:fluxer_app/features/chat/utils/channel_message_stream.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/material_ui.dart';

/// Which side of the anchor's stream item the split boundary falls on.
enum MessageListAnchorEdge {
  /// The split falls BEFORE the anchor item: its LEADING edge sits at the
  /// fraction. Used for unread-divider opens (the divider renders at the
  /// top of its tile - even when the first unread lives inside a collapsed
  /// group item) and for jump targets.
  before,

  /// The split falls AFTER the anchor item: its TRAILING edge sits at the
  /// fraction. Used for the live tail - `(newestId, 1.0, after)` puts the
  /// newest item's bottom at the viewport bottom, and later appends land in
  /// the trailing sliver below the fold (scroll-stable for readers above).
  after,
}

class MessageListViewport extends StatelessWidget {
  const MessageListViewport({
    required this.anchorEpoch,
    required this.stream,
    required this.anchorId,
    required this.anchorFraction,
    required this.anchorEdge,
    required this.controller,
    required this.centerKey,
    required this.itemBuilder,
    required this.childIndexForKey,
    required this.scrollCacheExtentPixels,
    required this.onScrollNotification,
    required this.onScrollMetricsNotification,
    required this.onPointerDown,
    required this.onPointerUp,
    required this.isLoadingMore,
    required this.isLoadingNewer,
    required this.trailingInset,
    this.leadingPad = 0,
    this.startOfChannelHeader,
    this.leadingFillerSpecs,
    this.trailingFillerSpecs,
    super.key,
  });

  /// Bumped on every re-anchor; keys the scrollable subtree so a fresh
  /// ScrollPosition lays out ONCE with the anchor at its fraction.
  final int anchorEpoch;

  final List<ChannelStreamItem> stream;

  /// The stream item the split boundary is measured against. Null or
  /// not-in-stream => bottom-anchored (all content leading).
  final String? anchorId;
  final double anchorFraction;
  final MessageListAnchorEdge anchorEdge;

  final ScrollController controller;

  /// Owned by the host State (a GlobalKey created per-build would remount
  /// the center sliver every frame).
  final Key centerKey;

  /// Builds the tile for a stream data index (keys included).
  final Widget Function(BuildContext context, int dataIndex) itemBuilder;

  /// Maps a tile key back to a sliver child index within [startInclusive,
  /// endExclusive); `reverse` matches the leading sliver's index direction.
  final int? Function(
    Key key,
    int startInclusive,
    int endExclusive, {
    required bool reverse,
  })
  childIndexForKey;

  final double scrollCacheExtentPixels;
  final bool Function(ScrollNotification notification) onScrollNotification;
  final bool Function(ScrollMetricsNotification notification)
  onScrollMetricsNotification;

  /// Pointer bookkeeping lives ABOVE the epoch-keyed subtree so a remount
  /// under a finger cannot lose the count.
  final void Function(PointerDownEvent event) onPointerDown;
  final void Function(PointerEvent event) onPointerUp;
  final bool isLoadingMore;
  final bool isLoadingNewer;

  /// Extent reserved after the trailing sliver for status overlays.
  final double trailingInset;

  /// Extra space before the oldest leading item so a short channel can still
  /// park the unread divider at [anchorFraction].
  final double leadingPad;

  final Widget? startOfChannelHeader;

  /// Skeleton standing in for unloaded history at each edge: the leading one
  /// is the outermost sliver above the oldest row (mutually exclusive with
  /// [startOfChannelHeader]); the trailing one sits below the newest row,
  /// before [trailingInset]. Null once that edge is loaded. Every
  /// "distance to the loaded tail" the host derives from
  /// [ScrollMetrics.maxScrollExtent] subtracts [trailingFillerExtent].
  final MessageListPlaceholderSpecs? leadingFillerSpecs;
  final MessageListPlaceholderSpecs? trailingFillerSpecs;

  /// Extent each filler adds beyond the loaded rows.
  double get leadingFillerExtent => leadingFillerSpecs?.totalHeight ?? 0;
  double get trailingFillerExtent => trailingFillerSpecs?.totalHeight ?? 0;

  @override
  Widget build(BuildContext context) {
    final String? anchor = anchorId;
    final int? anchorDataIndex = anchor == null
        ? null
        : findChannelStreamDataIndex(stream, anchor);
    final int splitIndex = anchorDataIndex == null
        ? stream.length
        : (anchorEdge == MessageListAnchorEdge.before
              ? anchorDataIndex
              : anchorDataIndex + 1);
    final double effectiveAnchor = anchorDataIndex == null
        ? 1.0
        : anchorFraction;
    return Stack(
      fit: StackFit.expand,
      children: [
        Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: onPointerDown,
          onPointerUp: onPointerUp,
          onPointerCancel: onPointerUp,
          child: NotificationListener<ScrollNotification>(
            onNotification: onScrollNotification,
            child: NotificationListener<ScrollMetricsNotification>(
              onNotification: onScrollMetricsNotification,
              child: KeyedSubtree(
                key: ValueKey<int>(anchorEpoch),
                child: CustomScrollView(
                  controller: controller,
                  center: centerKey,
                  anchor: effectiveAnchor,
                  scrollCacheExtent: ScrollCacheExtent.pixels(
                    scrollCacheExtentPixels,
                  ),
                  slivers: [
                    if (leadingFillerSpecs != null)
                      SliverToBoxAdapter(
                        child: MessageListEdgeFiller(
                          key: const ValueKey<String>('edge-filler-older'),
                          specs: leadingFillerSpecs!,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),
                    if (startOfChannelHeader != null)
                      SliverToBoxAdapter(child: startOfChannelHeader),
                    if (leadingPad > 0)
                      SliverToBoxAdapter(child: SizedBox(height: leadingPad)),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 8),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) =>
                              itemBuilder(context, splitIndex - 1 - index),
                          childCount: splitIndex,
                          findChildIndexCallback: (Key key) => childIndexForKey(
                            key,
                            0,
                            splitIndex,
                            reverse: true,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      key: centerKey,
                      child: const SizedBox.shrink(),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) =>
                            itemBuilder(context, splitIndex + index),
                        childCount: stream.length - splitIndex,
                        findChildIndexCallback: (Key key) => childIndexForKey(
                          key,
                          splitIndex,
                          stream.length,
                          reverse: false,
                        ),
                      ),
                    ),
                    if (trailingFillerSpecs != null)
                      SliverToBoxAdapter(
                        child: MessageListEdgeFiller(
                          key: const ValueKey<String>('edge-filler-newer'),
                          specs: trailingFillerSpecs!,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    SliverToBoxAdapter(child: SizedBox(height: trailingInset)),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isLoadingMore)
          Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: Center(
              child: ChatLoadingSpinner(
                reason: ChatSpinnerReason.loadingMore,
                color: context.colors.brandPrimary,
              ),
            ),
          ),
        if (isLoadingNewer)
          Positioned(
            bottom: trailingInset,
            left: 0,
            right: 0,
            child: Center(
              child: ChatLoadingSpinner(
                reason: ChatSpinnerReason.loadingNewer,
                color: context.colors.brandPrimary,
              ),
            ),
          ),
      ],
    );
  }
}
