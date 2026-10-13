import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/chat_loading_spinner.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_list_skeleton.dart';
import 'package:fluxer_app/features/chat/utils/chat_spinner_debug.dart';
import 'package:fluxer_app/features/chat/utils/messages/channel_message_stream.dart';
import 'package:fluxer_app/material_ui.dart';

enum MessageListAnchorEdge { before, after }

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
    this.withheldLeadingCount = 0,
    this.leadingPad = 0,
    this.liveLeadingPad,
    this.startOfChannelHeader,
    this.leadingFiller,
    this.trailingFiller,
    super.key,
  });

  final int anchorEpoch;

  final List<ChannelStreamItem> stream;

  final String? anchorId;
  final double anchorFraction;
  final MessageListAnchorEdge anchorEdge;

  final ScrollController controller;

  final Key centerKey;

  final Widget Function(BuildContext context, int dataIndex) itemBuilder;

  final int? Function(
    Key key,
    int startInclusive,
    int endExclusive, {
    required bool reverse,
  })
  childIndexForKey;

  final double scrollCacheExtentPixels;

  final int withheldLeadingCount;

  final bool Function(ScrollNotification notification) onScrollNotification;
  final bool Function(ScrollMetricsNotification notification)
  onScrollMetricsNotification;

  final void Function(PointerDownEvent event) onPointerDown;
  final void Function(PointerEvent event) onPointerUp;
  final bool isLoadingMore;
  final bool isLoadingNewer;

  final double trailingInset;

  final double leadingPad;

  final ValueListenable<double>? liveLeadingPad;

  final Widget? startOfChannelHeader;

  final MessageListEdgeFiller? leadingFiller;
  final MessageListEdgeFiller? trailingFiller;

  int? get _anchorDataIndex {
    final String? anchor = anchorId;
    return anchor == null ? null : findChannelStreamDataIndex(stream, anchor);
  }

  int _splitIndexFor(int? anchorDataIndex) => anchorDataIndex == null
      ? stream.length
      : (anchorEdge == MessageListAnchorEdge.before
            ? anchorDataIndex
            : anchorDataIndex + 1);

  void visitLaidOutRows(
    RenderViewport viewport,
    void Function(int dataIndex, RenderBox row) visit,
  ) {
    final int splitIndex = _splitIndexFor(_anchorDataIndex);
    bool leading = true;
    for (
      RenderSliver? sliver = viewport.firstChild;
      sliver != null;
      sliver = viewport.childAfter(sliver)
    ) {
      if (sliver == viewport.center) {
        leading = false;
        continue;
      }
      final RenderSliver? rows = sliver is RenderSliverPadding
          ? sliver.child
          : sliver;
      if (rows is! RenderSliverMultiBoxAdaptor) {
        continue;
      }
      for (
        RenderBox? row = rows.firstChild;
        row != null;
        row = rows.childAfter(row)
      ) {
        final int index = rows.indexOf(row);
        final int dataIndex = leading
            ? splitIndex - 1 - index
            : splitIndex + index;
        if (row.hasSize && dataIndex >= 0 && dataIndex < stream.length) {
          visit(dataIndex, row);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final int? anchorDataIndex = _anchorDataIndex;
    final int splitIndex = _splitIndexFor(anchorDataIndex);
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
                child: _scrollView(
                  splitIndex: splitIndex,
                  effectiveAnchor: anchorDataIndex == null
                      ? 1.0
                      : anchorFraction,
                ),
              ),
            ),
          ),
        ),
        if (isLoadingMore)
          const Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: Center(
              child: ChatLoadingSpinner(reason: ChatSpinnerReason.loadingMore),
            ),
          ),
        if (isLoadingNewer)
          Positioned(
            bottom: trailingInset,
            left: 0,
            right: 0,
            child: const Center(
              child: ChatLoadingSpinner(reason: ChatSpinnerReason.loadingNewer),
            ),
          ),
      ],
    );
  }

  Widget _scrollView({
    required int splitIndex,
    required double effectiveAnchor,
  }) {
    final int leadingCount = withheldLeadingCount >= splitIndex
        ? 0
        : splitIndex - withheldLeadingCount;
    return CustomScrollView(
      key: const ValueKey<String>('message-list'),
      controller: controller,
      center: centerKey,
      anchor: effectiveAnchor,
      dragStartBehavior: DragStartBehavior.down,
      scrollCacheExtent: ScrollCacheExtent.pixels(scrollCacheExtentPixels),
      slivers: [
        if (leadingFiller != null) SliverToBoxAdapter(child: leadingFiller),
        if (startOfChannelHeader != null)
          SliverToBoxAdapter(child: startOfChannelHeader),
        if (liveLeadingPad != null)
          SliverToBoxAdapter(
            child: ValueListenableBuilder<double>(
              valueListenable: liveLeadingPad!,
              builder: (BuildContext context, double pad, Widget? _) {
                return SizedBox(height: pad);
              },
            ),
          )
        else if (leadingPad > 0)
          SliverToBoxAdapter(child: SizedBox(height: leadingPad)),
        SliverPadding(
          padding: const EdgeInsets.only(top: 8),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  itemBuilder(context, splitIndex - 1 - index),
              childCount: leadingCount,
              findChildIndexCallback: (Key key) => childIndexForKey(
                key,
                splitIndex - leadingCount,
                splitIndex,
                reverse: true,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(key: centerKey, child: const SizedBox.shrink()),
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
        if (trailingFiller != null) SliverToBoxAdapter(child: trailingFiller),
        SliverToBoxAdapter(child: SizedBox(height: trailingInset)),
      ],
    );
  }
}
