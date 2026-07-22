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
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_entries.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channel_settings_row.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_channel_settings_providers.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:gaimon/gaimon.dart';
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
  final ValueNotifier<GuildChannelSettingsDropHover?> _hoverNotifier =
      ValueNotifier<GuildChannelSettingsDropHover?>(null);
  String? _lastDropHoverKey;
  late final ScrollController _scrollController;
  final GlobalKey _listKey = GlobalKey();
  Timer? _autoScrollTimer;
  double? _lastDragGlobalY;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController.dispose();
    _hoverNotifier.dispose();
    super.dispose();
  }

  void _handleDropHover({
    required List<GuildChannelSettingsEntry> entries,
    required GuildChannelSettingsEntry hovered,
    required ChannelReorderIntent? intent,
  }) {
    if (intent == null || _activeDragItem == null) {
      _clearDropHover();
      return;
    }
    final GuildChannelSettingsDropHover? hover =
        resolveGuildChannelSettingsDropHover(
          entries: entries,
          hovered: hovered,
          intent: intent,
          activeDragItem: _activeDragItem!,
        );
    final String? nextHoverKey = hover == null ? null : _dropHoverKey(hover);
    final bool didChangeDropPreview =
        nextHoverKey != null && nextHoverKey != _lastDropHoverKey;
    if (didChangeDropPreview) {
      Gaimon.selection();
    }
    _hoverNotifier.value = hover;
    _lastDropHoverKey = nextHoverKey;
  }

  void _clearDropHover({String? entryId}) {
    if (_hoverNotifier.value == null && _lastDropHoverKey == null) {
      return;
    }
    if (entryId != null && _hoverNotifier.value?.displayEntryId != entryId) {
      return;
    }
    _hoverNotifier.value = null;
    _lastDropHoverKey = null;
  }

  String _dropHoverKey(GuildChannelSettingsDropHover hover) {
    return '${hover.displayEntryId}:'
        '${hover.displayIntent.indicator.position.name}:'
        '${hover.dropResult.targetId}:'
        '${hover.dropResult.position.name}';
  }

  void _handleTrailingHover({
    required String targetId,
    required ChannelReorderDropPosition position,
  }) {
    final ChannelReorderIndicatorPosition indicatorPosition =
        position == ChannelReorderDropPosition.before
        ? ChannelReorderIndicatorPosition.top
        : ChannelReorderIndicatorPosition.bottom;
    final ChannelReorderIndicator indicator = ChannelReorderIndicator(
      position: indicatorPosition,
      isValid: true,
    );
    final ChannelReorderDropResult result = ChannelReorderDropResult(
      targetId: targetId,
      position: position,
    );
    final ChannelReorderIntent intent = ChannelReorderIntent(
      indicator: indicator,
      result: result,
    );
    final GuildChannelSettingsDropHover hover = GuildChannelSettingsDropHover(
      displayEntryId: targetId,
      displayIntent: intent,
      dropResult: result,
    );
    final String nextHoverKey = _dropHoverKey(hover);
    if (nextHoverKey != _lastDropHoverKey) {
      Gaimon.selection();
    }
    _hoverNotifier.value = hover;
    _lastDropHoverKey = nextHoverKey;
  }

  void _handleTrailingDrop({
    required ChannelReorderDragItem item,
    required List<Channel> channels,
    required ChannelReorderDropResult dropResult,
  }) {
    _clearDropHover();
    final ChannelMoveComputation? computation = computeChannelMove(
      channels: channels,
      dragItem: item,
      dropResult: dropResult,
    );
    if (computation == null) {
      return;
    }
    unawaited(
      ref
          .read(guildChannelSettingsActionsProvider(widget.guildId).notifier)
          .moveChannel(
            operation: computation.operation,
            currentChannels: channels,
            optimisticChannels: computation.updatedChannels,
          ),
    );
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

  Widget _buildTrailingDropTarget({
    required String targetId,
    required ChannelReorderDropPosition position,
    required List<Channel> channels,
  }) {
    final bool isActive = _activeDragItem != null;
    const double activeHeight = 20;
    final double height = isActive ? activeHeight : 0;

    if (height == 0) {
      return const SizedBox.shrink();
    }

    final ChannelReorderDropResult dropResult = ChannelReorderDropResult(
      targetId: targetId,
      position: position,
    );

    return DragTarget<ChannelReorderDragItem>(
      onWillAcceptWithDetails:
          (DragTargetDetails<ChannelReorderDragItem> details) {
            return isActive;
          },
      onMove: (DragTargetDetails<ChannelReorderDragItem> details) {
        _updateDragPosition(details.offset);
        final bool isHovered = _hoverNotifier.value?.displayEntryId == targetId;
        if (!isHovered) {
          _handleTrailingHover(targetId: targetId, position: position);
        }
      },
      onLeave: (_) {
        _clearDropHover(entryId: targetId);
      },
      onAcceptWithDetails: (DragTargetDetails<ChannelReorderDragItem> details) {
        _handleTrailingDrop(
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
                    final bool isHovered = hover?.displayEntryId == targetId;
                    return SizedBox(
                      height: height,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          if (isHovered)
                            GuildChannelDropIndicator(
                              isValid: true,
                              atTop:
                                  position == ChannelReorderDropPosition.before,
                            ),
                        ],
                      ),
                    );
                  },
            );
          },
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
        child: Text(
          error.toString(),
          style: TextStyle(color: context.colors.textPrimaryMuted),
        ),
      ),
      data: (List<ChannelCategory> categories) {
        final List<Channel> channels = channelsAsync.value ?? <Channel>[];
        final List<GuildChannelSettingsEntry> entries =
            flattenGuildChannelSettingsEntries(
              categories: categories,
              guildId: widget.guildId,
            );
        final Widget list = ListView.builder(
          key: _listKey,
          controller: _scrollController,
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            context.layout.s2,
            context.layout.s4,
            widget.showFab ? 88 : context.layout.s4,
          ),
          itemCount: entries.length + 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _buildTrailingDropTarget(
                targetId: kNullSpaceTargetId,
                position: ChannelReorderDropPosition.before,
                channels: channels,
              );
            }
            if (index == entries.length + 1) {
              return _buildTrailingDropTarget(
                targetId: kTrailingSpaceTargetId,
                position: ChannelReorderDropPosition.after,
                channels: channels,
              );
            }
            final GuildChannelSettingsEntry entry = entries[index - 1];
            return GuildChannelSettingsRow(
              key: ValueKey<String>('guild-channel-settings-${entry.id}'),
              entry: entry,
              channels: channels,
              hoverNotifier: _hoverNotifier,
              onDropHover:
                  (
                    GuildChannelSettingsEntry hovered,
                    ChannelReorderIntent? intent,
                  ) {
                    _handleDropHover(
                      entries: entries,
                      hovered: hovered,
                      intent: intent,
                    );
                  },
              onDropLeave: (String id) => _clearDropHover(entryId: id),
              onDragStarted: (ChannelReorderDragItem item) {
                setState(() => _activeDragItem = item);
              },
              onDragEnded: () {
                _stopAutoScroll();
                _hoverNotifier.value = null;
                _lastDropHoverKey = null;
                _lastDragGlobalY = null;
                setState(() => _activeDragItem = null);
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
