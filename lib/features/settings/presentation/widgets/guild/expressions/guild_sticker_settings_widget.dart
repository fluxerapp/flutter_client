import 'dart:async';
import 'dart:typed_data';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_state.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/expression_upload_source_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/guild_sticker_form_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_clone_allowed_toggle.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_expression_search_field.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_sticker_grid_item.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_upload_drop_zone.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_upload_slot_info.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_expression_limits_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_sticker_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_limits.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_permissions.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_segmented_tabs.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_tabs.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildStickerSettingsWidget extends ConsumerStatefulWidget {
  const GuildStickerSettingsWidget({
    required this.guildId,
    required this.state,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final GuildStickerSettingsState state;
  final ScrollController? scrollController;

  @override
  ConsumerState<GuildStickerSettingsWidget> createState() =>
      _GuildStickerSettingsWidgetState();
}

class _GuildStickerSettingsWidgetState
    extends ConsumerState<GuildStickerSettingsWidget> {
  late final TextEditingController _searchController;
  ScrollController? _ownedScrollController;

  ScrollController get _scrollController =>
      widget.scrollController ?? _ownedScrollController!;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.state.searchQuery);
    if (widget.scrollController == null) {
      _ownedScrollController = ScrollController();
    }
  }

  @override
  void didUpdateWidget(covariant GuildStickerSettingsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state.searchQuery != _searchController.text) {
      _searchController.text = widget.state.searchQuery;
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _ownedScrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final GuildStickerSettingsState state = widget.state;
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final bool canCreate = canCreateGuildExpressions(permissions);
    final AsyncValue<GuildExpressionLimits?> limitsAsync = ref.watch(
      guildExpressionLimitsProvider(widget.guildId),
    );
    if (state.loadStatus == GuildStickerSettingsLoadStatus.error) {
      return _buildErrorState(context, l10n);
    }
    final List<GuildStickerSettingsEntry> visibleStickers = state
        .filteredIndices
        .map(state.stickerAtFilteredIndex)
        .toList(growable: false);
    final GuildExpressionLimits? limits = limitsAsync.value;
    final String maxSizeLabel = limits == null
        ? ''
        : formatExpressionFileSize(limits.stickerMaxSizeBytes);
    final String slotLabel = limits == null
        ? ''
        : formatExpressionSlotCount(state.stickers.length, limits.maxStickers);
    final int crossAxisCount = state.density == GuildStickerDensity.cozy
        ? 3
        : 4;
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: GuildCloneAllowedToggle(
            guildId: widget.guildId,
            kind: GuildCloneAllowedKind.sticker,
          ),
        ),
        SliverToBoxAdapter(
          child: GuildExpressionSearchField(
            controller: _searchController,
            hintText: l10n.guildSettingsStickersSearchHint,
            onChanged: ref
                .read(guildStickerSettingsProvider(widget.guildId).notifier)
                .setSearchQuery,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              context.layout.s4,
              context.layout.s3,
              context.layout.s4,
              0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  l10n.guildSettingsStickerDensity,
                  style: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textPrimaryMuted,
                  ),
                ),
                SizedBox(height: context.layout.s2),
                FluxerSegmentedTabs(
                  selectedIndex: state.density == GuildStickerDensity.cozy
                      ? 0
                      : 1,
                  onChanged: (int index) {
                    ref
                        .read(
                          guildStickerSettingsProvider(widget.guildId).notifier,
                        )
                        .setDensity(
                          index == 0
                              ? GuildStickerDensity.cozy
                              : GuildStickerDensity.compact,
                        );
                  },
                  tabs: <FluxerTab>[
                    FluxerTab(label: l10n.guildSettingsStickerDensityCozy),
                    FluxerTab(label: l10n.guildSettingsStickerDensityCompact),
                  ],
                ),
              ],
            ),
          ),
        ),
        if (canCreate && limits != null) ...<Widget>[
          SliverToBoxAdapter(
            child: GuildUploadSlotInfo(
              title: l10n.guildSettingsStickerSlotsTitle,
              slotLabel: slotLabel,
              description: l10n.guildSettingsStickerUploadRequirements(
                maxSizeLabel,
              ),
              uploadLabel: l10n.guildSettingsStickerUploadTitle,
              onUpload: () => unawaited(_pickAndUpload(limits)),
            ),
          ),
          SliverToBoxAdapter(
            child: GuildUploadDropZone(
              description: l10n.guildSettingsStickerDropZone,
              onFilesDropped: (List<DropItem> files) =>
                  unawaited(_uploadDroppedFiles(files, limits)),
            ),
          ),
        ],
        if (state.debouncedSearchQuery.isNotEmpty && visibleStickers.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(context.layout.s4),
              child: Text(
                l10n.guildSettingsStickersSearchEmpty,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textPrimaryMuted,
                ),
              ),
            ),
          ),
        if (visibleStickers.isEmpty && state.debouncedSearchQuery.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(context.layout.s4),
              child: Text(
                l10n.guildSettingsStickersEmpty,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textPrimaryMuted,
                ),
              ),
            ),
          ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            context.layout.s4,
            context.layout.s4,
            kSettingsScrollBottomPadding,
          ),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: context.layout.s3,
              crossAxisSpacing: context.layout.s3,
              childAspectRatio: 0.72,
            ),
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final GuildStickerSettingsEntry entry = visibleStickers[index];
              return GuildStickerGridItem(
                key: ValueKey<String>(entry.id),
                entry: entry,
                density: state.density,
                canModify: canModifyGuildSticker(
                  sticker: entry,
                  permissions: permissions,
                  currentUserId: currentUserId,
                ),
                onEdit: () => _editSticker(entry, l10n),
                onDelete: () => _confirmDelete(entry, l10n),
              );
            }, childCount: visibleStickers.length),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, FluxerLocalizations l10n) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PhosphorIcon(
              PhosphorIconsFill.warningCircle,
              size: 40,
              color: context.colors.textPrimaryMuted,
            ),
            SizedBox(height: context.layout.s3),
            Text(
              l10n.guildSettingsStickersLoadFailedTitle,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textChat,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: context.layout.s1),
            Text(
              l10n.guildSettingsStickersLoadFailedBody,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
            SizedBox(height: context.layout.s4),
            FluxerButton.primary(
              label: l10n.guildSettingsInvitesTryAgain,
              onPressed: () => unawaited(
                ref
                    .read(guildStickerSettingsProvider(widget.guildId).notifier)
                    .reload(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickAndUpload(GuildExpressionLimits limits) async {
    final files = await pickGuildExpressionSticker(context);
    if (files.isEmpty) {
      return;
    }
    await _startCreateFlow(files.first.bytes, limits);
  }

  Future<void> _uploadDroppedFiles(
    List<DropItem> files,
    GuildExpressionLimits limits,
  ) async {
    if (files.isEmpty) {
      return;
    }
    final Uint8List bytes = await files.first.readAsBytes();
    await _startCreateFlow(bytes, limits);
  }

  Future<void> _startCreateFlow(
    Uint8List bytes,
    GuildExpressionLimits limits,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (!limits.hasUnlimitedStickers &&
        widget.state.stickers.length >= limits.maxStickers) {
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.guildSettingsStickerSlotsFull));
      return;
    }
    final ({String name, String description, List<String> tags})? form =
        await showGuildStickerFormSheet(
          context: context,
          title: l10n.guildSettingsStickerAddTitle,
          submitLabel: l10n.guildSettingsStickerAddTitle,
        );
    if (form == null || !mounted) {
      return;
    }
    try {
      await ref
          .read(guildStickerSettingsProvider(widget.guildId).notifier)
          .createSticker(
            name: form.name,
            description: form.description,
            tags: form.tags,
            imageBytes: bytes,
            maxSizeBytes: limits.stickerMaxSizeBytes,
          );
    } on Object {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(message: l10n.guildSettingsStickerCreateFailedTitle),
          );
    }
  }

  Future<void> _editSticker(
    GuildStickerSettingsEntry entry,
    FluxerLocalizations l10n,
  ) async {
    final ({String name, String description, List<String> tags})? form =
        await showGuildStickerFormSheet(
          context: context,
          title: l10n.guildSettingsStickerEditTitle,
          submitLabel: l10n.save,
          initial: entry,
        );
    if (form == null || !mounted) {
      return;
    }
    try {
      await ref
          .read(guildStickerSettingsProvider(widget.guildId).notifier)
          .updateSticker(
            stickerId: entry.id,
            name: form.name,
            description: form.description,
            tags: form.tags,
          );
    } on Object {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(message: l10n.guildSettingsStickerCreateFailedTitle),
          );
    }
  }

  Future<void> _confirmDelete(
    GuildStickerSettingsEntry entry,
    FluxerLocalizations l10n,
  ) async {
    final Guild? guild = ref.read(guildByIdProvider(widget.guildId)).value;
    bool purge = false;
    final bool canPurge =
        guild != null && canPurgeGuildExpressions(guild.features);
    await FluxerModal.show<void>(
      context,
      title: l10n.guildSettingsStickerDeleteTitle,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  l10n.guildSettingsStickerDeleteBody(entry.name),
                  style: context.textStyles.bodySmall,
                ),
                if (canPurge) ...<Widget>[
                  SizedBox(height: context.layout.s3),
                  FluxerCheckbox(
                    value: purge,
                    label: l10n.guildSettingsStickerPurgeLabel,
                    onChanged: (bool? value) {
                      setModalState(() => purge = value ?? false);
                    },
                  ),
                ],
              ],
            );
          },
        );
      },
      actionsBuilder: (VoidCallback pop) => <Widget>[
        FluxerButton.dangerPrimary(
          label: l10n.guildSettingsStickerDeleteTitle,
          onPressed: () async {
            pop();
            try {
              await ref
                  .read(guildStickerSettingsProvider(widget.guildId).notifier)
                  .deleteSticker(stickerId: entry.id, purge: purge);
            } on Object {
              if (!mounted) {
                return;
              }
              ref
                  .read(toastProvider.notifier)
                  .show(
                    FluxerToast(
                      message: l10n.guildSettingsStickerDeleteFailedTitle,
                    ),
                  );
            }
          },
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(onPressed: pop, label: l10n.cancel),
      ],
    );
  }
}
