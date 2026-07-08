import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/create_channel_category_picker_sheet.dart';
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
  String? _hoverEntryId;
  ChannelReorderIntent? _hoverIntent;
  ChannelReorderDropResult? _pendingDropResult;
  String? _lastDropHoverKey;

  void _handleDropHover({
    required List<GuildChannelSettingsEntry> entries,
    required GuildChannelSettingsEntry hovered,
    required ChannelReorderIntent? intent,
  }) {
    if (intent == null || _activeDragItem == null) {
      setState(() {
        _hoverEntryId = null;
        _hoverIntent = null;
        _pendingDropResult = null;
        _lastDropHoverKey = null;
      });
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
    setState(() {
      _hoverEntryId = hover?.displayEntryId;
      _hoverIntent = hover?.displayIntent;
      _pendingDropResult = hover?.dropResult;
      _lastDropHoverKey = nextHoverKey;
    });
  }

  void _clearDropHover() {
    if (_hoverEntryId == null &&
        _hoverIntent == null &&
        _pendingDropResult == null &&
        _lastDropHoverKey == null) {
      return;
    }
    setState(() {
      _hoverEntryId = null;
      _hoverIntent = null;
      _pendingDropResult = null;
      _lastDropHoverKey = null;
    });
  }

  String _dropHoverKey(GuildChannelSettingsDropHover hover) {
    return '${hover.displayEntryId}:'
        '${hover.displayIntent.indicator.position.name}:'
        '${hover.dropResult.targetId}:'
        '${hover.dropResult.position.name}';
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
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            context.layout.s2,
            context.layout.s4,
            widget.showFab ? 88 : context.layout.s4,
          ),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            final GuildChannelSettingsEntry entry = entries[index];
            return GuildChannelSettingsRow(
              key: ValueKey<String>('guild-channel-settings-${entry.id}'),
              entry: entry,
              channels: channels,
              hoverEntryId: _hoverEntryId,
              hoverIntent: _hoverIntent,
              pendingDropResult: _pendingDropResult,
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
              onDropLeave: _clearDropHover,
              onDragStarted: (ChannelReorderDragItem item) {
                setState(() => _activeDragItem = item);
              },
              onDragEnded: () {
                setState(() {
                  _activeDragItem = null;
                  _hoverEntryId = null;
                  _hoverIntent = null;
                  _pendingDropResult = null;
                  _lastDropHoverKey = null;
                });
              },
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
