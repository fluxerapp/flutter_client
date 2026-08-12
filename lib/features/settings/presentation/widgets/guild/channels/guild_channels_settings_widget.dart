import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_move_operation.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/create_channel_category_picker_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_drop_indicator.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_drop_session.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_move_handler.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_list_layout.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_row.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_channel_settings_providers.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildChannelsSettingsWidget extends ConsumerStatefulWidget {
  const GuildChannelsSettingsWidget({
    required this.guildId,
    this.showFab = false,
    super.key,
  });

  final String guildId;
  final bool showFab;

  @override
  ConsumerState<GuildChannelsSettingsWidget> createState() =>
      _GuildChannelsSettingsWidgetState();
}

class _GuildChannelsSettingsWidgetState
    extends ConsumerState<GuildChannelsSettingsWidget> {
  ChannelReorderDragItem? _activeDragItem;
  final GuildChannelDropSession _dropSession = GuildChannelDropSession();
  final ValueNotifier<GuildChannelSettingsDropHover?> _hoverNotifier =
      ValueNotifier<GuildChannelSettingsDropHover?>(null);
  String? _lastDropHoverKey;
  String? _activeHoverEntryId;
  late final ScrollController _scrollController;
  final GlobalKey _listKey = GlobalKey();
  Timer? _autoScrollTimer;
  Timer? _hoverClearTimer;
  double? _lastDragGlobalY;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _hoverClearTimer?.cancel();
    _scrollController.dispose();
    _hoverNotifier.dispose();
    super.dispose();
  }

  void _commitDropHover(GuildChannelSettingsDropHover? hover) {
    final String? nextHoverKey = hover == null ? null : _dropHoverKey(hover);
    if (nextHoverKey == _lastDropHoverKey) {
      return;
    }
    if (nextHoverKey != null) {
      FluxerHaptics.selection();
    }
    _hoverNotifier.value = hover;
    _lastDropHoverKey = nextHoverKey;
  }

  void _setDropHover(GuildChannelSettingsDropHover? hover) {
    _hoverClearTimer?.cancel();
    _hoverClearTimer = null;

    if (hover == null) {
      _hoverClearTimer = Timer(const Duration(milliseconds: 80), () {
        if (!mounted) {
          return;
        }
        _commitDropHover(null);
      });
      return;
    }

    final String nextHoverKey = _dropHoverKey(hover);
    if (nextHoverKey == _lastDropHoverKey) {
      return;
    }
    _commitDropHover(hover);
  }

  void _handleDropHover({
    required GuildChannelSettingsEntry hovered,
    required ChannelReorderIntent? intent,
  }) {
    if (intent == null || _activeDragItem == null) {
      if (_activeHoverEntryId == hovered.id) {
        setState(() => _activeHoverEntryId = null);
      }
      _setDropHover(null);
      return;
    }
    if (_activeHoverEntryId != hovered.id) {
      setState(() => _activeHoverEntryId = hovered.id);
    }
    final GuildChannelSettingsDropHover hover =
        resolveGuildChannelSettingsDropHover(hovered: hovered, intent: intent);
    _setDropHover(hover);
  }

  String _dropHoverKey(GuildChannelSettingsDropHover hover) {
    return '${hover.sourceEntryId}:'
        '${hover.displayEntryId}:'
        '${hover.displayIntent.indicator.position.name}:'
        '${hover.dropResult.targetId}:'
        '${hover.dropResult.position.name}';
  }

  void _handleTrailingHover({
    required String targetId,
    required ChannelReorderDropResult dropResult,
  }) {
    final ChannelReorderIndicatorPosition indicatorPosition =
        dropResult.position == ChannelReorderDropPosition.before
        ? ChannelReorderIndicatorPosition.top
        : ChannelReorderIndicatorPosition.bottom;
    _commitCategoryTailHover(
      hoverEntryId: targetId,
      dropResult: dropResult,
      indicatorPosition: indicatorPosition,
    );
  }

  void _handleCategoryTailHover({
    required String afterChannelId,
    required String? parentId,
    required bool parentIdSpecified,
  }) {
    final String hoverEntryId = guildChannelSettingsCategoryTailHoverId(
      afterChannelId,
    );
    _commitCategoryTailHover(
      hoverEntryId: hoverEntryId,
      dropResult: ChannelReorderDropResult(
        targetId: afterChannelId,
        position: ChannelReorderDropPosition.after,
        targetParentId: parentId,
        targetParentIdSpecified: parentIdSpecified,
      ),
      indicatorPosition: ChannelReorderIndicatorPosition.top,
    );
  }

  void _commitCategoryTailHover({
    required String hoverEntryId,
    required ChannelReorderDropResult dropResult,
    required ChannelReorderIndicatorPosition indicatorPosition,
  }) {
    final GuildChannelSettingsDropHover hover = GuildChannelSettingsDropHover(
      sourceEntryId: hoverEntryId,
      displayEntryId: hoverEntryId,
      displayIntent: ChannelReorderIntent(
        indicator: ChannelReorderIndicator(
          position: indicatorPosition,
          isValid: true,
        ),
        result: dropResult,
      ),
      dropResult: dropResult,
    );
    _setDropHover(hover);
  }

  void _executeDrop({
    required BuildContext context,
    required ChannelReorderDragItem item,
    required List<Channel> channels,
    required ChannelReorderDropResult dropResult,
  }) {
    final ChannelMoveComputation? computation = _dropSession.tryComplete(
      channels: channels,
      dragItem: item,
      dropResult: dropResult,
    );
    if (computation == null) {
      return;
    }
    _hoverClearTimer?.cancel();
    _commitDropHover(null);
    unawaited(
      performGuildChannelMove(
        ref: ref,
        context: context,
        guildId: widget.guildId,
        computation: computation,
        currentChannels: channels,
      ),
    );
  }

  void _finalizeDrag({
    required BuildContext context,
    required List<Channel> channels,
  }) {
    final ChannelReorderDragItem? dragItem = _activeDragItem;
    final ChannelReorderDropResult? dropResult =
        _hoverNotifier.value?.dropResult;
    if (dragItem != null && dropResult != null) {
      _executeDrop(
        context: context,
        item: dragItem,
        channels: channels,
        dropResult: dropResult,
      );
    }
    _stopAutoScroll();
    _hoverClearTimer?.cancel();
    _hoverNotifier.value = null;
    _lastDropHoverKey = null;
    _lastDragGlobalY = null;
    if (mounted) {
      setState(() {
        _activeDragItem = null;
        _activeHoverEntryId = null;
      });
    }
  }

  void _updateDragPosition(Offset? globalPosition) {
    if (globalPosition == null || _activeDragItem == null) {
      _stopAutoScroll();
      return;
    }
    _lastDragGlobalY = globalPosition.dy;
    _startOrUpdateAutoScroll();
  }

  double _computeAutoScrollSpeed() {
    if (_lastDragGlobalY == null || _activeDragItem == null) {
      return 0;
    }
    final RenderBox? box =
        _listKey.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) {
      return 0;
    }
    final double listTop = box.localToGlobal(Offset.zero).dy;
    final double listBottom = listTop + box.size.height;
    final double distanceFromTop = _lastDragGlobalY! - listTop;
    final double distanceFromBottom = listBottom - _lastDragGlobalY!;

    const double edgeThreshold = 48;
    const double maxSpeed = 24;

    if (distanceFromTop < edgeThreshold && distanceFromTop >= 0) {
      return -((edgeThreshold - distanceFromTop) / edgeThreshold) * maxSpeed;
    }
    if (distanceFromBottom < edgeThreshold && distanceFromBottom >= 0) {
      return ((edgeThreshold - distanceFromBottom) / edgeThreshold) * maxSpeed;
    }
    return 0;
  }

  void _startOrUpdateAutoScroll() {
    if (_computeAutoScrollSpeed() == 0) {
      _stopAutoScroll();
      return;
    }
    if (_autoScrollTimer != null && _autoScrollTimer!.isActive) {
      return;
    }
    _autoScrollTimer = Timer.periodic(
      const Duration(milliseconds: 16),
      (_) => _applyScrollStep(),
    );
  }

  void _applyScrollStep() {
    if (!_scrollController.hasClients) {
      _stopAutoScroll();
      return;
    }
    final double speed = _computeAutoScrollSpeed();
    if (speed == 0) {
      _stopAutoScroll();
      return;
    }
    final double minExtent = _scrollController.position.minScrollExtent;
    final double maxExtent = _scrollController.position.maxScrollExtent;
    final double newOffset = (_scrollController.offset + speed).clamp(
      minExtent,
      maxExtent,
    );
    if (newOffset == _scrollController.offset) {
      _stopAutoScroll();
      return;
    }
    _scrollController.jumpTo(newOffset);
  }

  void _stopAutoScroll() {
    _autoScrollTimer?.cancel();
    _autoScrollTimer = null;
  }

  Widget _buildCategoryTailDropTarget({
    required BuildContext context,
    required String afterChannelId,
    required String? parentId,
    required bool parentIdSpecified,
    required List<Channel> channels,
    required bool isMobile,
  }) {
    final bool isActive = _activeDragItem != null;
    final String hoverEntryId = guildChannelSettingsCategoryTailHoverId(
      afterChannelId,
    );
    final ChannelReorderDropResult dropResult = ChannelReorderDropResult(
      targetId: afterChannelId,
      position: ChannelReorderDropPosition.after,
      targetParentId: parentId,
      targetParentIdSpecified: parentIdSpecified,
    );

    return IgnorePointer(
      ignoring: !isActive,
      child: DragTarget<ChannelReorderDragItem>(
        onWillAcceptWithDetails:
            (DragTargetDetails<ChannelReorderDragItem> details) {
              return isActive;
            },
        onMove: (DragTargetDetails<ChannelReorderDragItem> details) {
          _updateDragPosition(details.offset);
          if (_activeHoverEntryId != hoverEntryId) {
            setState(() => _activeHoverEntryId = hoverEntryId);
          }
          if (_hoverNotifier.value?.displayEntryId != hoverEntryId) {
            _handleCategoryTailHover(
              afterChannelId: afterChannelId,
              parentId: parentId,
              parentIdSpecified: parentIdSpecified,
            );
          }
        },
        onLeave: (_) {},
        onAcceptWithDetails:
            (DragTargetDetails<ChannelReorderDragItem> details) {
              _executeDrop(
                context: context,
                item: details.data,
                channels: channels,
                dropResult: dropResult,
              );
            },
        builder:
            (
              BuildContext context,
              List<ChannelReorderDragItem?> candidateData,
              List<dynamic> rejectedData,
            ) {
              return ValueListenableBuilder<GuildChannelSettingsDropHover?>(
                valueListenable: _hoverNotifier,
                builder:
                    (
                      BuildContext context,
                      GuildChannelSettingsDropHover? hover,
                      Widget? child,
                    ) {
                      final bool isHovered =
                          isActive && hover?.displayEntryId == hoverEntryId;
                      return SizedBox(
                        height: isMobile
                            ? kGuildChannelSettingsCategoryTailMobileHeight
                            : kGuildChannelSettingsCategoryTailHeight,
                        child: isHovered
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: kGuildChannelDropIndicatorHeight,
                                  margin: const EdgeInsets.only(
                                    top: kGuildChannelDropIndicatorEdgeOffset,
                                    left:
                                        kGuildChannelSettingsRowHorizontalPadding,
                                    right:
                                        kGuildChannelSettingsRowHorizontalPadding,
                                  ),
                                  decoration: BoxDecoration(
                                    color: context.colors.brandPrimary,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                ),
                              )
                            : null,
                      );
                    },
              );
            },
      ),
    );
  }

  Widget _buildTrailingDropTarget({
    required BuildContext context,
    required String targetId,
    required ChannelReorderDropPosition position,
    required List<Channel> channels,
    required bool isMobile,
  }) {
    final bool isActive = _activeDragItem != null;
    final ChannelReorderDropResult dropResult = ChannelReorderDropResult(
      targetId: targetId,
      position: position,
    );

    return IgnorePointer(
      ignoring: !isActive,
      child: DragTarget<ChannelReorderDragItem>(
        onWillAcceptWithDetails:
            (DragTargetDetails<ChannelReorderDragItem> details) {
              return isActive;
            },
        onMove: (DragTargetDetails<ChannelReorderDragItem> details) {
          _updateDragPosition(details.offset);
          if (_activeHoverEntryId != targetId) {
            setState(() => _activeHoverEntryId = targetId);
          }
          if (_hoverNotifier.value?.displayEntryId != targetId) {
            _handleTrailingHover(targetId: targetId, dropResult: dropResult);
          }
        },
        onLeave: (_) {},
        onAcceptWithDetails:
            (DragTargetDetails<ChannelReorderDragItem> details) {
              _executeDrop(
                context: context,
                item: details.data,
                channels: channels,
                dropResult: dropResult,
              );
            },
        builder:
            (
              BuildContext context,
              List<ChannelReorderDragItem?> candidateData,
              List<dynamic> rejectedData,
            ) {
              return ValueListenableBuilder<GuildChannelSettingsDropHover?>(
                valueListenable: _hoverNotifier,
                builder:
                    (
                      BuildContext context,
                      GuildChannelSettingsDropHover? hover,
                      Widget? child,
                    ) {
                      final bool isHovered =
                          isActive && hover?.displayEntryId == targetId;
                      return SizedBox(
                        height: isMobile
                            ? kGuildChannelSettingsMobileNullSpaceHeight
                            : kGuildChannelSettingsNullSpaceHeight,
                        child: isHovered
                            ? Center(
                                child: Container(
                                  height: kGuildChannelDropIndicatorHeight,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal:
                                        kGuildChannelSettingsRowHorizontalPadding,
                                  ),
                                  decoration: BoxDecoration(
                                    color: context.colors.brandPrimary,
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                ),
                              )
                            : null,
                      );
                    },
              );
            },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<ChannelCategory>> categoriesAsync = ref.watch(
      guildChannelSettingsCategoriesProvider(widget.guildId),
    );
    final AsyncValue<List<Channel>> channelsAsync = ref.watch(
      guildChannelSettingsChannelsProvider(widget.guildId),
    );
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final bool canManageChannels = hasPermission(
      permissions,
      Permission.manageChannels,
    );
    return categoriesAsync.when(
      loading: () => const Center(child: FluxerLoadingSpinner()),
      error: (Object error, StackTrace stackTrace) => Center(
        child: Text(error.toString(), style: context.textStyles.bodySmall),
      ),
      data: (List<ChannelCategory> categories) {
        final List<Channel> channels = channelsAsync.value ?? <Channel>[];
        final List<GuildChannelSettingsEntry> entries =
            flattenGuildChannelSettingsEntries(
              categories: categories,
              guildId: widget.guildId,
            );
        final bool isMobile = isMobileLayout(context);
        final List<GuildChannelSettingsListItem> listItems =
            buildGuildChannelSettingsListItems(entries: entries);
        final Widget list = ListView.builder(
          key: _listKey,
          controller: _scrollController,
          physics: _activeDragItem != null
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            context.layout.s2,
            context.layout.s4,
            widget.showFab ? 88 : kSettingsScrollBottomPadding,
          ),
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, int index) {
            final GuildChannelSettingsListItem item = listItems[index];
            if (item.isLeading) {
              return _buildTrailingDropTarget(
                context: context,
                targetId: kNullSpaceTargetId,
                position: ChannelReorderDropPosition.before,
                channels: channels,
                isMobile: isMobile,
              );
            }
            if (item.isTrailing) {
              return _buildTrailingDropTarget(
                context: context,
                targetId: kTrailingSpaceTargetId,
                position: ChannelReorderDropPosition.after,
                channels: channels,
                isMobile: isMobile,
              );
            }
            if (item.isCategoryTail) {
              return _buildCategoryTailDropTarget(
                context: context,
                afterChannelId: item.categoryTailAfterChannelId!,
                parentId: item.categoryTailParentId,
                parentIdSpecified: item.categoryTailParentIdSpecified,
                channels: channels,
                isMobile: isMobile,
              );
            }
            final GuildChannelSettingsEntry entry = entries[item.entryIndex!];
            return GuildChannelSettingsRow(
              key: ValueKey<String>('guild-channel-settings-${entry.id}'),
              entry: entry,
              channels: channels,
              hoverNotifier: _hoverNotifier,
              activeDragItem: _activeDragItem,
              activeHoverEntryId: _activeHoverEntryId,
              isMobile: isMobile,
              onDropHover:
                  (
                    GuildChannelSettingsEntry hovered,
                    ChannelReorderIntent? intent,
                  ) {
                    _handleDropHover(hovered: hovered, intent: intent);
                  },
              onDropLeave: (_) {},
              onDrop:
                  (
                    ChannelReorderDragItem item,
                    ChannelReorderDropResult dropResult,
                  ) {
                    _executeDrop(
                      context: context,
                      item: item,
                      channels: channels,
                      dropResult: dropResult,
                    );
                  },
              onDragStarted: (ChannelReorderDragItem item) {
                _dropSession.reset();
                setState(() => _activeDragItem = item);
              },
              onDragEnded: () {
                _finalizeDrag(context: context, channels: channels);
              },
              onDragMove: _updateDragPosition,
            );
          },
        );
        if (!widget.showFab || !canManageChannels) {
          return list;
        }
        return Stack(
          children: <Widget>[
            list,
            Positioned(
              right: context.layout.s4,
              bottom: context.layout.s4,
              child: _buildCreateFab(context),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCreateFab(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: 56,
        height: 56,
        child: FloatingActionButton(
          onPressed: () => CreateChannelCategoryPickerSheet.show(
            context,
            onCreateChannel: (request) => ref
                .read(
                  guildChannelSettingsActionsProvider(widget.guildId).notifier,
                )
                .createChannel(request),
            onCreateCategory: (name) => ref
                .read(
                  guildChannelSettingsActionsProvider(widget.guildId).notifier,
                )
                .createCategory(name),
          ),
          backgroundColor: context.colors.brandPrimary,
          elevation: 4,
          shape: const CircleBorder(),
          child: PhosphorIcon(
            PhosphorIconsBold.plus,
            size: 24,
            color: context.colors.textOnBrandPrimary,
          ),
        ),
      ),
    );
  }
}
