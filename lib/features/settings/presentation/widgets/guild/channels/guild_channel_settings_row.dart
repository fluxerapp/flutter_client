import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_flow.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_drop_indicator.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_draggable.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';
import 'package:material_ui/material_ui.dart';

typedef GuildChannelDropHoverCallback =
    void Function(
      GuildChannelSettingsEntry entry,
      ChannelReorderIntent? intent,
    );

typedef GuildChannelDropLeaveCallback = void Function(String entryId);

typedef GuildChannelDropCallback =
    void Function(
      ChannelReorderDragItem item,
      ChannelReorderDropResult dropResult,
    );

class GuildChannelSettingsRow extends ConsumerStatefulWidget {
  const GuildChannelSettingsRow({
    required this.entry,
    required this.channels,
    required this.hoverNotifier,
    required this.onDropHover,
    required this.onDropLeave,
    required this.onDrop,
    required this.onDragStarted,
    required this.onDragEnded,
    required this.isMobile,
    this.activeDragItem,
    this.activeHoverEntryId,
    this.onDragMove,
    super.key,
  });

  final GuildChannelSettingsEntry entry;
  final List<Channel> channels;
  final ValueNotifier<GuildChannelSettingsDropHover?> hoverNotifier;
  final GuildChannelDropHoverCallback onDropHover;
  final GuildChannelDropLeaveCallback onDropLeave;
  final GuildChannelDropCallback onDrop;
  final ValueChanged<ChannelReorderDragItem> onDragStarted;
  final VoidCallback onDragEnded;
  final bool isMobile;
  final ChannelReorderDragItem? activeDragItem;
  final String? activeHoverEntryId;
  final ValueChanged<Offset>? onDragMove;

  @override
  ConsumerState<GuildChannelSettingsRow> createState() =>
      _GuildChannelSettingsRowState();
}

class _GuildChannelSettingsRowState
    extends ConsumerState<GuildChannelSettingsRow> {
  final GlobalKey _dropTargetKey = GlobalKey();
  ChannelReorderIntent? _localDropIntent;

  ChannelReorderIntent? _resolveVisibleDropIntent() {
    if (widget.activeHoverEntryId != widget.entry.id) {
      return null;
    }
    return _localDropIntent;
  }

  @override
  Widget build(BuildContext context) {
    final GuildChannelSettingsEntry entry = widget.entry;
    final ChannelReorderDragItem dragItem = switch (entry.kind) {
      GuildChannelSettingsEntryKind.category => ChannelReorderDragItem(
        id: entry.id,
        kind: ChannelReorderDragKind.category,
        channelType: entry.channelType,
        parentId: entry.parentId,
        guildId: entry.guildId,
      ),
      GuildChannelSettingsEntryKind.channel =>
        ChannelReorderDragItem.fromChannel(entry.channel!),
    };
    final ChannelReorderIntent? visibleIntent = _resolveVisibleDropIntent();
    final bool isCategory =
        entry.kind == GuildChannelSettingsEntryKind.category;
    final bool showTopIndicator =
        visibleIntent?.indicator.position ==
        ChannelReorderIndicatorPosition.top;
    final bool showBottomIndicator =
        visibleIntent?.indicator.position ==
        ChannelReorderIndicatorPosition.bottom;
    final bool indicatorValid = visibleIntent?.indicator.isValid ?? false;
    final bool isBeingDragged = widget.activeDragItem?.id == entry.id;
    return DragTarget<ChannelReorderDragItem>(
      onWillAcceptWithDetails:
          (DragTargetDetails<ChannelReorderDragItem> details) {
            return canChannelDropOnTarget(
              item: details.data,
              target: ChannelReorderTarget(
                id: entry.id,
                channelType: entry.channelType,
                parentId: entry.parentId,
                guildId: entry.guildId,
              ),
            );
          },
      onMove: (DragTargetDetails<ChannelReorderDragItem> details) {
        if (details.data.id == entry.id) {
          return;
        }
        widget.onDragMove?.call(details.offset);
        final ChannelReorderIntent? intent = _resolveRowDropIntent(
          item: details.data,
          entry: entry,
          globalOffset: details.offset,
        );
        if (!_isSameDropIntent(_localDropIntent, intent)) {
          setState(() => _localDropIntent = intent);
        }
        widget.onDropHover(entry, intent);
      },
      onLeave: (_) => widget.onDropLeave(entry.id),
      onAcceptWithDetails: (DragTargetDetails<ChannelReorderDragItem> details) {
        ChannelReorderDropResult? dropResult =
            widget.hoverNotifier.value?.dropResult;
        dropResult ??= visibleIntent?.result;
        if (dropResult == null) {
          final ChannelReorderIntent? intent = _resolveRowDropIntent(
            item: details.data,
            entry: entry,
            globalOffset: details.offset,
          );
          dropResult = intent?.result;
        }
        if (dropResult == null) {
          return;
        }
        widget.onDrop(details.data, dropResult);
      },
      builder:
          (
            BuildContext context,
            List<ChannelReorderDragItem?> candidateData,
            List<dynamic> rejectedData,
          ) {
            return Opacity(
              opacity: isBeingDragged
                  ? kGuildChannelSettingsDraggedRowOpacity
                  : 1,
              child: Stack(
                key: _dropTargetKey,
                clipBehavior: Clip.none,
                children: <Widget>[
                  _GuildChannelSettingsRowContent(
                    entry: entry,
                    dragItem: dragItem,
                    isMobile: widget.isMobile,
                    onDragStarted: () => widget.onDragStarted(dragItem),
                    onDragEnded: widget.onDragEnded,
                    onDragMove: widget.onDragMove ?? (_) {},
                    onTap: () {
                      ChannelSettingsFlow.show(context, channelId: entry.id);
                    },
                  ),
                  if (!isBeingDragged && showTopIndicator)
                    GuildChannelDropIndicator(
                      position: ChannelReorderIndicatorPosition.top,
                      isValid: indicatorValid,
                      isIndented: !isCategory,
                    ),
                  if (!isBeingDragged && showBottomIndicator)
                    GuildChannelDropIndicator(
                      position: ChannelReorderIndicatorPosition.bottom,
                      isValid: indicatorValid,
                      isIndented: !isCategory,
                    ),
                ],
              ),
            );
          },
    );
  }

  bool _isSameDropIntent(
    ChannelReorderIntent? current,
    ChannelReorderIntent? next,
  ) {
    if (current == null && next == null) {
      return true;
    }
    if (current == null || next == null) {
      return false;
    }
    return current.indicator.position == next.indicator.position &&
        current.indicator.isValid == next.indicator.isValid &&
        current.result.targetId == next.result.targetId &&
        current.result.position == next.result.position;
  }

  ChannelReorderIntent? _resolveRowDropIntent({
    required ChannelReorderDragItem item,
    required GuildChannelSettingsEntry entry,
    required Offset globalOffset,
  }) {
    final RenderBox? dropTargetBox =
        _dropTargetKey.currentContext?.findRenderObject() as RenderBox?;
    if (dropTargetBox == null) {
      return null;
    }
    final double localY = dropTargetBox.globalToLocal(globalOffset).dy;
    final double height = dropTargetBox.size.height;
    final double resolvedY = localY < 0
        ? 0
        : localY > height
        ? height
        : localY;
    return resolveChannelReorderHover(
      item: item,
      target: ChannelReorderTarget(
        id: entry.id,
        channelType: entry.channelType,
        parentId: entry.parentId,
        guildId: entry.guildId,
      ),
      localY: resolvedY,
      height: height,
    );
  }
}

class _GuildChannelSettingsRowContent extends StatelessWidget {
  const _GuildChannelSettingsRowContent({
    required this.entry,
    required this.dragItem,
    required this.isMobile,
    required this.onDragStarted,
    required this.onDragEnded,
    required this.onDragMove,
    required this.onTap,
  });

  final GuildChannelSettingsEntry entry;
  final ChannelReorderDragItem dragItem;
  final bool isMobile;
  final VoidCallback onDragStarted;
  final VoidCallback onDragEnded;
  final ValueChanged<Offset> onDragMove;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isCategory =
        entry.kind == GuildChannelSettingsEntryKind.category;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Widget dragHandle = buildGuildChannelSettingsDragHandle(
          color: context.colors.textPrimaryMuted,
        );
        final Widget rowBody = Padding(
          padding: EdgeInsets.only(
            left: isCategory ? 0 : 8,
            top: isCategory ? kGuildChannelSettingsCategoryTopPadding : 1,
            bottom: isCategory ? 4 : 1,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kGuildChannelSettingsRowHorizontalPadding,
                      vertical: 6,
                    ),
                    child: _RowBody(
                      entry: entry,
                      isCategory: isCategory,
                      textStyle: context.textStyles.channelName.copyWith(
                        color: context.colors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                      categoryTextStyle: context.textStyles.categoryName,
                    ),
                  ),
                ),
              ),
              dragHandle,
            ],
          ),
        );
        final Widget feedback = SizedBox(
          width: constraints.maxWidth,
          child: Material(
            color: context.colors.backgroundPrimary,
            borderRadius: BorderRadius.circular(8),
            elevation: 4,
            child: _DragFeedbackRow(
              entry: entry,
              isCategory: isCategory,
              textStyle: context.textStyles.channelName.copyWith(
                color: context.colors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              categoryTextStyle: context.textStyles.categoryName,
              handleColor: context.colors.textPrimaryMuted,
              showCategoryCount: true,
            ),
          ),
        );
        if (isMobile) {
          return GuildChannelSettingsDraggable(
            dragItem: dragItem,
            isMobile: true,
            rowWidth: constraints.maxWidth,
            feedback: feedback,
            onDragStarted: onDragStarted,
            onDragEnded: onDragEnded,
            onDragMove: onDragMove,
            child: rowBody,
          );
        }
        return Padding(
          padding: EdgeInsets.only(
            left: isCategory ? 0 : 8,
            top: isCategory ? kGuildChannelSettingsCategoryTopPadding : 1,
            bottom: isCategory ? 4 : 1,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kGuildChannelSettingsRowHorizontalPadding,
                      vertical: 6,
                    ),
                    child: _RowBody(
                      entry: entry,
                      isCategory: isCategory,
                      textStyle: context.textStyles.channelName.copyWith(
                        color: context.colors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                      categoryTextStyle: context.textStyles.categoryName,
                    ),
                  ),
                ),
              ),
              GuildChannelSettingsDraggable(
                dragItem: dragItem,
                isMobile: false,
                rowWidth: constraints.maxWidth,
                feedback: feedback,
                onDragStarted: onDragStarted,
                onDragEnded: onDragEnded,
                onDragMove: onDragMove,
                child: dragHandle,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DragFeedbackRow extends StatelessWidget {
  const _DragFeedbackRow({
    required this.entry,
    required this.isCategory,
    required this.textStyle,
    required this.categoryTextStyle,
    required this.handleColor,
    this.showCategoryCount = false,
  });

  final GuildChannelSettingsEntry entry;
  final bool isCategory;
  final TextStyle textStyle;
  final TextStyle categoryTextStyle;
  final Color handleColor;
  final bool showCategoryCount;

  @override
  Widget build(BuildContext context) {
    final int? categoryCount = showCategoryCount && isCategory
        ? entry.category?.channels.length
        : null;
    return Padding(
      padding: EdgeInsets.only(
        left: isCategory ? 0 : 8,
        top: isCategory ? kGuildChannelSettingsCategoryTopPadding : 1,
        bottom: isCategory ? 4 : 1,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kGuildChannelSettingsRowHorizontalPadding,
                vertical: 6,
              ),
              child: _RowBody(
                entry: entry,
                isCategory: isCategory,
                textStyle: textStyle,
                categoryTextStyle: categoryTextStyle,
              ),
            ),
          ),
          if (categoryCount != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                '$categoryCount',
                style: context.textStyles.channelName.copyWith(
                  color: context.colors.textTertiaryMuted,
                  fontSize: 12,
                ),
              ),
            ),
          buildGuildChannelSettingsDragHandle(color: handleColor),
        ],
      ),
    );
  }
}

class _RowBody extends StatelessWidget {
  const _RowBody({
    required this.entry,
    required this.isCategory,
    required this.textStyle,
    required this.categoryTextStyle,
  });

  final GuildChannelSettingsEntry entry;
  final bool isCategory;
  final TextStyle textStyle;
  final TextStyle categoryTextStyle;

  @override
  Widget build(BuildContext context) {
    if (isCategory) {
      return Text(
        entry.label,
        style: categoryTextStyle,
        overflow: TextOverflow.ellipsis,
      );
    }
    return Row(
      children: <Widget>[
        ChannelIcon(
          type: entry.channel!.type,
          channel: entry.channel,
          color: context.colors.textSecondary,
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            entry.label,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
