import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_flow.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_drop_indicator.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_channel_settings_providers.dart';
import 'package:gaimon/gaimon.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kGuildChannelSettingsDragTouchSize = 44;
const double kGuildChannelSettingsRowHorizontalPadding = 8;

typedef GuildChannelDropHoverCallback =
    void Function(
      GuildChannelSettingsEntry entry,
      ChannelReorderIntent? intent,
    );

typedef GuildChannelDropLeaveCallback = void Function(String entryId);

class _HoverNotifierListener extends StatefulWidget {
  const _HoverNotifierListener({
    required this.notifier,
    required this.entryId,
    required this.builder,
  });

  final ValueNotifier<GuildChannelSettingsDropHover?> notifier;
  final String entryId;
  final Widget Function(BuildContext context, ChannelReorderIntent? hover)
  builder;

  @override
  State<_HoverNotifierListener> createState() => _HoverNotifierListenerState();
}

class _HoverNotifierListenerState extends State<_HoverNotifierListener> {
  ChannelReorderIntent? _hover;

  @override
  void initState() {
    super.initState();
    widget.notifier.addListener(_onChanged);
    _onChanged();
  }

  @override
  void didUpdateWidget(_HoverNotifierListener oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.notifier != widget.notifier) {
      oldWidget.notifier.removeListener(_onChanged);
      widget.notifier.addListener(_onChanged);
      _onChanged();
    }
  }

  @override
  void dispose() {
    widget.notifier.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    final GuildChannelSettingsDropHover? value = widget.notifier.value;
    final ChannelReorderIntent? nextHover =
        value?.displayEntryId == widget.entryId ? value?.displayIntent : null;
    if (nextHover == _hover) {
      return;
    }
    setState(() => _hover = nextHover);
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _hover);
  }
}

class GuildChannelSettingsRow extends ConsumerWidget {
  const GuildChannelSettingsRow({
    required this.entry,
    required this.channels,
    required this.hoverNotifier,
    required this.onDropHover,
    required this.onDropLeave,
    required this.onDragStarted,
    required this.onDragEnded,
    this.onDragMove,
    super.key,
  });

  final GuildChannelSettingsEntry entry;
  final List<Channel> channels;
  final ValueNotifier<GuildChannelSettingsDropHover?> hoverNotifier;
  final GuildChannelDropHoverCallback onDropHover;
  final GuildChannelDropLeaveCallback onDropLeave;
  final ValueChanged<ChannelReorderDragItem> onDragStarted;
  final VoidCallback onDragEnded;
  final ValueChanged<Offset>? onDragMove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    return _HoverNotifierListener(
      notifier: hoverNotifier,
      entryId: entry.id,
      builder: (BuildContext context, ChannelReorderIntent? hover) {
        final bool showTopIndicator =
            hover?.indicator.position == ChannelReorderIndicatorPosition.top;
        final bool showBottomIndicator =
            hover?.indicator.position == ChannelReorderIndicatorPosition.bottom;
        final bool indicatorValid = hover?.indicator.isValid ?? false;
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
            onDragMove?.call(details.offset);
            final RenderBox? box = context.findRenderObject() as RenderBox?;
            if (box == null) {
              return;
            }
            final double localY = box.globalToLocal(details.offset).dy;
            final ChannelReorderIndicatorPosition? lastPosition =
                hover?.indicator.position;
            final ChannelReorderIntent? intent = resolveChannelReorderHover(
              item: details.data,
              target: ChannelReorderTarget(
                id: entry.id,
                channelType: entry.channelType,
                parentId: entry.parentId,
                guildId: entry.guildId,
              ),
              localY: localY,
              height: box.size.height,
              lastPosition: lastPosition,
            );
            onDropHover(entry, intent);
          },
          onLeave: (_) => onDropLeave(entry.id),
          onAcceptWithDetails:
              (DragTargetDetails<ChannelReorderDragItem> details) {
                ChannelReorderDropResult? dropResult = hover?.result;
                if (dropResult == null) {
                  final ChannelReorderIndicatorPosition? lastPosition =
                      hover?.indicator.position;
                  final ChannelReorderIntent? intent = _resolveDropIntent(
                    context: context,
                    entry: entry,
                    item: details.data,
                    globalOffset: details.offset,
                    lastPosition: lastPosition,
                  );
                  dropResult = intent?.result;
                }
                onDropLeave(entry.id);
                if (dropResult == null) {
                  return;
                }
                final ChannelMoveComputation? computation = computeChannelMove(
                  channels: channels,
                  dragItem: details.data,
                  dropResult: dropResult,
                );
                if (computation == null) {
                  return;
                }
                unawaited(
                  ref
                      .read(
                        guildChannelSettingsActionsProvider(
                          entry.guildId,
                        ).notifier,
                      )
                      .moveChannel(
                        operation: computation.operation,
                        currentChannels: channels,
                        optimisticChannels: computation.updatedChannels,
                      ),
                );
              },
          builder:
              (
                BuildContext context,
                List<ChannelReorderDragItem?> candidateData,
                List<dynamic> rejectedData,
              ) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    if (showTopIndicator)
                      GuildChannelDropIndicator(
                        isValid: indicatorValid,
                        atTop: true,
                      ),
                    if (showBottomIndicator)
                      GuildChannelDropIndicator(
                        isValid: indicatorValid,
                        atTop: false,
                      ),
                    _GuildChannelSettingsRowContent(
                      entry: entry,
                      dragItem: dragItem,
                      onDragStarted: onDragStarted,
                      onDragEnded: onDragEnded,
                      onTap: () {
                        unawaited(
                          ChannelSettingsFlow.show(
                            context,
                            channelId: entry.id,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
        );
      },
    );
  }
}

ChannelReorderIntent? _resolveDropIntent({
  required BuildContext context,
  required GuildChannelSettingsEntry entry,
  required ChannelReorderDragItem item,
  required Offset globalOffset,
  ChannelReorderIndicatorPosition? lastPosition,
}) {
  final RenderBox? box = context.findRenderObject() as RenderBox?;
  if (box == null) {
    return null;
  }
  final double localY = box.globalToLocal(globalOffset).dy;
  return resolveChannelReorderHover(
    item: item,
    target: ChannelReorderTarget(
      id: entry.id,
      channelType: entry.channelType,
      parentId: entry.parentId,
      guildId: entry.guildId,
    ),
    localY: localY,
    height: box.size.height,
    lastPosition: lastPosition,
  );
}

class _GuildChannelSettingsRowContent extends StatelessWidget {
  const _GuildChannelSettingsRowContent({
    required this.entry,
    required this.dragItem,
    required this.onDragStarted,
    required this.onDragEnded,
    required this.onTap,
  });

  final GuildChannelSettingsEntry entry;
  final ChannelReorderDragItem dragItem;
  final ValueChanged<ChannelReorderDragItem> onDragStarted;
  final VoidCallback onDragEnded;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isCategory =
        entry.kind == GuildChannelSettingsEntryKind.category;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: EdgeInsets.only(
            left: isCategory ? 0 : 8,
            top: isCategory ? 16 : 1,
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
              SizedBox(
                width: kGuildChannelSettingsDragTouchSize,
                height: kGuildChannelSettingsDragTouchSize,
                child: LongPressDraggable<ChannelReorderDragItem>(
                  data: dragItem,
                  dragAnchorStrategy:
                      (
                        Draggable<Object> draggable,
                        BuildContext context,
                        Offset position,
                      ) {
                        return _channelSettingsDragAnchor(
                          rowWidth: constraints.maxWidth,
                          globalPosition: position,
                          context: context,
                        );
                      },
                  onDragStarted: () {
                    Gaimon.medium();
                    onDragStarted(dragItem);
                  },
                  onDragEnd: (_) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      onDragEnded();
                    });
                  },
                  onDraggableCanceled: (_, _) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      onDragEnded();
                    });
                  },
                  feedback: SizedBox(
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
                  ),
                  childWhenDragging: Opacity(
                    opacity: 0.35,
                    child: Center(
                      child: PhosphorIcon(
                        PhosphorIconsRegular.dotsSixVertical,
                        size: 18,
                        color: context.colors.textTertiaryMuted,
                      ),
                    ),
                  ),
                  child: Center(
                    child: PhosphorIcon(
                      PhosphorIconsRegular.dotsSixVertical,
                      size: 18,
                      color: context.colors.textPrimaryMuted,
                    ),
                  ),
                ),
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
        top: isCategory ? 16 : 1,
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
          SizedBox(
            width: kGuildChannelSettingsDragTouchSize,
            height: kGuildChannelSettingsDragTouchSize,
            child: Center(
              child: PhosphorIcon(
                PhosphorIconsRegular.dotsSixVertical,
                size: 18,
                color: handleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Offset _channelSettingsDragAnchor({
  required double rowWidth,
  required Offset globalPosition,
  required BuildContext context,
}) {
  final RenderBox? box = context.findRenderObject() as RenderBox?;
  if (box == null) {
    return Offset(
      rowWidth - (kGuildChannelSettingsDragTouchSize / 2),
      kGuildChannelSettingsDragTouchSize / 2,
    );
  }
  final Offset localPress = box.globalToLocal(globalPosition);
  return Offset(
    rowWidth - kGuildChannelSettingsDragTouchSize + localPress.dx,
    localPress.dy,
  );
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
