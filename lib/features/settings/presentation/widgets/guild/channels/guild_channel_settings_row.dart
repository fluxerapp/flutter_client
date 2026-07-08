import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_channel_settings_providers.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:gaimon/gaimon.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kGuildChannelSettingsDragTouchSize = 44;
const double kGuildChannelSettingsRowHorizontalPadding = 8;

typedef GuildChannelDropHoverCallback =
    void Function(
      GuildChannelSettingsEntry entry,
      ChannelReorderIntent? intent,
    );

class GuildChannelSettingsRow extends ConsumerWidget {
  const GuildChannelSettingsRow({
    required this.entry,
    required this.channels,
    required this.hoverEntryId,
    required this.hoverIntent,
    required this.pendingDropResult,
    required this.onDropHover,
    required this.onDropLeave,
    required this.onDragStarted,
    required this.onDragEnded,
    super.key,
  });

  final GuildChannelSettingsEntry entry;
  final List<Channel> channels;
  final String? hoverEntryId;
  final ChannelReorderIntent? hoverIntent;
  final ChannelReorderDropResult? pendingDropResult;
  final GuildChannelDropHoverCallback onDropHover;
  final VoidCallback onDropLeave;
  final ValueChanged<ChannelReorderDragItem> onDragStarted;
  final VoidCallback onDragEnded;

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
    final bool showTopIndicator =
        hoverEntryId == entry.id &&
        hoverIntent?.indicator.position == ChannelReorderIndicatorPosition.top;
    final bool showBottomIndicator =
        hoverEntryId == entry.id &&
        hoverIntent?.indicator.position ==
            ChannelReorderIndicatorPosition.bottom;
    final bool indicatorValid = hoverIntent?.indicator.isValid ?? false;
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
        final RenderBox? box = context.findRenderObject() as RenderBox?;
        if (box == null) {
          return;
        }
        final double localY = box.globalToLocal(details.offset).dy;
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
        );
        onDropHover(entry, intent);
      },
      onLeave: (_) => onDropLeave(),
      onAcceptWithDetails: (DragTargetDetails<ChannelReorderDragItem> details) {
        ChannelReorderDropResult? dropResult = pendingDropResult;
        if (dropResult == null) {
          final ChannelReorderIntent? intent =
              hoverEntryId == entry.id && hoverIntent != null
              ? hoverIntent
              : _resolveDropIntent(
                  context: context,
                  entry: entry,
                  item: details.data,
                  globalOffset: details.offset,
                );
          dropResult = intent?.result;
        }
        onDropLeave();
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
              .read(guildChannelSettingsActionsProvider(entry.guildId).notifier)
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
                  _DropIndicator(isValid: indicatorValid, atTop: true),
                if (showBottomIndicator)
                  _DropIndicator(isValid: indicatorValid, atTop: false),
                _GuildChannelSettingsRowContent(
                  entry: entry,
                  dragItem: dragItem,
                  onDragStarted: onDragStarted,
                  onDragEnded: onDragEnded,
                  onTap: () {
                    ref
                        .read(toastProvider.notifier)
                        .show(
                          FluxerToast(
                            message: FluxerLocalizations.of(context).comingSoon,
                          ),
                        );
                  },
                ),
              ],
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
  );
}

class _DropIndicator extends StatelessWidget {
  const _DropIndicator({required this.isValid, required this.atTop});

  final bool isValid;
  final bool atTop;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: atTop ? 0 : null,
      bottom: atTop ? null : 0,
      left: 8,
      right: 8,
      child: Container(
        height: 2,
        decoration: BoxDecoration(
          color: isValid
              ? context.colors.brandPrimary
              : context.colors.statusDanger,
          borderRadius: BorderRadius.circular(1),
        ),
      ),
    );
  }
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
                      color: Colors.transparent,
                      child: Opacity(
                        opacity: 0.9,
                        child: _DragFeedbackRow(
                          entry: entry,
                          isCategory: isCategory,
                          textStyle: context.textStyles.channelName.copyWith(
                            color: context.colors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                          categoryTextStyle: context.textStyles.categoryName,
                          handleColor: context.colors.textPrimaryMuted,
                        ),
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
  });

  final GuildChannelSettingsEntry entry;
  final bool isCategory;
  final TextStyle textStyle;
  final TextStyle categoryTextStyle;
  final Color handleColor;

  @override
  Widget build(BuildContext context) {
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

Offset _channelSettingsDragAnchor({required double rowWidth}) {
  const double rowVerticalCenter = 22;
  return Offset(
    rowWidth - (kGuildChannelSettingsDragTouchSize / 2),
    rowVerticalCenter,
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
