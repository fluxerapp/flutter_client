import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/rendering.dart'
    show SliverConstraints, SliverGridLayout, SliverGridRegularTileLayout;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_display_utils.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_state.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/expression_upload_source_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/guild_sticker_form_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/desktop_settings_status_slate.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_clone_allowed_toggle.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_expression_search_field.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_sticker_grid_item.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_upload_drop_zone.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_upload_slot_info.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_expression_limits_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_sticker_settings_provider.dart';
import 'package:fluxer_app/features/settings/utils/guild/guild_expression_limits.dart';
import 'package:fluxer_app/features/settings/utils/guild/guild_expression_permissions.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_segmented_tabs.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_tabs.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';

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
    if (usesDesktopPointerUi(context)) {
      return _buildDesktopPointer(
        context,
        l10n,
        state: state,
        permissions: permissions,
        currentUserId: currentUserId,
        canCreate: canCreate,
        limits: limitsAsync.value,
      );
    }
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

  Widget _buildDesktopPointer(
    BuildContext context,
    FluxerLocalizations l10n, {
    required GuildStickerSettingsState state,
    required int permissions,
    required String? currentUserId,
    required bool canCreate,
    required GuildExpressionLimits? limits,
  }) {
    final List<GuildStickerSettingsEntry> visibleStickers = state
        .filteredIndices
        .map(state.stickerAtFilteredIndex)
        .toList(growable: false);
    final bool compact = state.density == GuildStickerDensity.compact;
    final bool failed =
        state.loadStatus == GuildStickerSettingsLoadStatus.error;
    final Widget? status = failed
        ? DesktopSettingsStatusSlate(
            icon: PhosphorIconsRegular.warningCircle,
            title: l10n.guildSettingsStickersLoadFailedTitle,
            description: l10n.guildSettingsStickersLoadFailedBody,
            fullHeight: true,
            actions: <Widget>[
              FluxerButton.primary(
                label: l10n.guildSettingsInvitesTryAgain,
                fitContent: true,
                onPressed: () => unawaited(
                  ref
                      .read(
                        guildStickerSettingsProvider(widget.guildId).notifier,
                      )
                      .reload(),
                ),
              ),
            ],
          )
        : state.debouncedSearchQuery.isNotEmpty && visibleStickers.isEmpty
        ? DesktopSettingsStatusSlate(
            icon: PhosphorIconsRegular.magnifyingGlass,
            title: l10n.guildSettingsStickersSearchEmpty,
            fullHeight: true,
          )
        : null;
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GuildExpressionSearchField(
                    controller: _searchController,
                    hintText: l10n.guildSettingsStickersSearchHint,
                    padding: EdgeInsets.zero,
                    onChanged: ref
                        .read(
                          guildStickerSettingsProvider(widget.guildId).notifier,
                        )
                        .setSearchQuery,
                  ),
                ),
                const SizedBox(width: 12),
                _GuildStickerDensityToggle(
                  compact: compact,
                  cozyLabel: l10n.guildSettingsStickerDensityCozy,
                  compactLabel: l10n.guildSettingsStickerDensityCompact,
                  onChanged: (GuildStickerDensity density) => ref
                      .read(
                        guildStickerSettingsProvider(widget.guildId).notifier,
                      )
                      .setDensity(density),
                ),
              ],
            ),
          ),
        ),
        if (canCreate && limits != null) ...<Widget>[
          SliverToBoxAdapter(
            child: GuildUploadSlotInfo(
              title: l10n.guildSettingsStickerSlotsTitle,
              slotLabel: formatExpressionSlotCount(
                state.stickers.length,
                limits.maxStickers,
              ),
              description: l10n.guildSettingsStickerUploadRequirements(
                formatExpressionFileSize(limits.stickerMaxSizeBytes),
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
        if (status != null)
          SliverToBoxAdapter(child: status)
        else
          SliverGrid(
            gridDelegate: _GuildStickerGridDelegate(
              minCrossAxisExtent: compact ? 150 : 190,
              mainAxisExtent: compact ? 220 : 260,
              spacing: 16,
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
        const SliverToBoxAdapter(
          child: SizedBox(height: kDesktopSettingsScrollBottomPadding),
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
      await showErrorDialog(
        context,
        title: l10n.stickerSlotsFullTitle,
        body: l10n.guildSettingsStickerSlotsFull,
      );
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
    } on Object catch (error) {
      if (!mounted) {
        return;
      }
      await showApiError(
        context,
        ApiErrorAction.createSticker,
        error,
        details: ApiErrorDetails(
          subject: formatAttachmentByteSize(limits.stickerMaxSizeBytes),
        ),
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
    } on Object catch (error) {
      if (!mounted) {
        return;
      }
      await showApiError(context, ApiErrorAction.updateSticker, error);
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
    final String title = l10n.guildSettingsStickerDeleteTitle;
    final String description = l10n.guildSettingsStickerDeleteBody(entry.name);
    final Widget? purgeToggle = canPurge
        ? StatefulBuilder(
            builder: (BuildContext context, StateSetter setToggleState) {
              return FluxerCheckbox(
                value: purge,
                label: l10n.guildSettingsStickerPurgeLabel,
                onChanged: (bool? value) {
                  setToggleState(() => purge = value ?? false);
                },
              );
            },
          )
        : null;
    final bool? confirmed = isMobileLayout(context)
        ? await FluxerConfirmSheet.show(
            context,
            title: title,
            description: description,
            body: purgeToggle,
            confirmLabel: title,
            isDanger: true,
          )
        : await FluxerConfirmModal.show(
            context,
            title: title,
            description: description,
            body: purgeToggle,
            confirmLabel: title,
            isDanger: true,
            onConfirm: () {},
          );
    if (confirmed != true || !mounted) {
      return;
    }
    try {
      await ref
          .read(guildStickerSettingsProvider(widget.guildId).notifier)
          .deleteSticker(stickerId: entry.id, purge: purge);
    } on Object catch (error) {
      if (!mounted) {
        return;
      }
      await showApiError(context, ApiErrorAction.deleteSticker, error);
    }
  }
}

class _GuildStickerGridDelegate extends SliverGridDelegate {
  const _GuildStickerGridDelegate({
    required this.minCrossAxisExtent,
    required this.mainAxisExtent,
    required this.spacing,
  });

  final double minCrossAxisExtent;
  final double mainAxisExtent;
  final double spacing;

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    final double width = constraints.crossAxisExtent;
    final int count = math.max(
      1,
      ((width + spacing) / (minCrossAxisExtent + spacing)).floor(),
    );
    final double childWidth = (width - spacing * (count - 1)) / count;
    return SliverGridRegularTileLayout(
      crossAxisCount: count,
      mainAxisStride: mainAxisExtent + spacing,
      crossAxisStride: childWidth + spacing,
      childMainAxisExtent: mainAxisExtent,
      childCrossAxisExtent: childWidth,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(_GuildStickerGridDelegate oldDelegate) =>
      oldDelegate.minCrossAxisExtent != minCrossAxisExtent ||
      oldDelegate.mainAxisExtent != mainAxisExtent ||
      oldDelegate.spacing != spacing;
}

class _GuildStickerDensityToggle extends StatelessWidget {
  const _GuildStickerDensityToggle({
    required this.compact,
    required this.cozyLabel,
    required this.compactLabel,
    required this.onChanged,
  });

  final bool compact;
  final String cozyLabel;
  final String compactLabel;
  final ValueChanged<GuildStickerDensity> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    Widget button(
      String label, {
      required bool active,
      required VoidCallback onTap,
    }) {
      return Semantics(
        button: true,
        selected: active,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: AnimatedContainer(
              duration: MediaQuery.disableAnimationsOf(context)
                  ? Duration.zero
                  : const Duration(milliseconds: 120),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 7.2,
              ),
              color: active ? colors.backgroundTertiary : Colors.transparent,
              child: Text(
                label,
                style: context.textStyles.bodyMedium.copyWith(
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                  color: active ? colors.textPrimary : colors.textPrimaryMuted,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: context.layout.radiusLg,
        border: Border.all(color: colors.backgroundHeaderSecondary),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            button(
              cozyLabel,
              active: !compact,
              onTap: () => onChanged(GuildStickerDensity.cozy),
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              color: colors.backgroundHeaderSecondary,
            ),
            button(
              compactLabel,
              active: compact,
              onTap: () => onChanged(GuildStickerDensity.compact),
            ),
          ],
        ),
      ),
    );
  }
}
