import 'dart:async';
import 'dart:typed_data';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_entry.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_emoji_settings_state.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/expression_upload_source_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_clone_allowed_toggle.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_emoji_list_item.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_expression_search_field.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_upload_drop_zone.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/expressions/guild_upload_slot_info.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_emoji_settings_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_expression_limits_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/utils/expression_file_picker.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_limits.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_name_validation.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_permissions.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildEmojiSettingsWidget extends ConsumerStatefulWidget {
  const GuildEmojiSettingsWidget({
    required this.guildId,
    required this.state,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final GuildEmojiSettingsState state;
  final ScrollController? scrollController;

  @override
  ConsumerState<GuildEmojiSettingsWidget> createState() =>
      _GuildEmojiSettingsWidgetState();
}

class _GuildEmojiSettingsWidgetState
    extends ConsumerState<GuildEmojiSettingsWidget> {
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
  void didUpdateWidget(covariant GuildEmojiSettingsWidget oldWidget) {
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
    final GuildEmojiSettingsState state = widget.state;
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final bool canCreate = canCreateGuildExpressions(permissions);
    final AsyncValue<GuildExpressionLimits?> limitsAsync = ref.watch(
      guildExpressionLimitsProvider(widget.guildId),
    );
    final Guild? guild = ref.watch(guildByIdProvider(widget.guildId)).value;
    if (state.loadStatus == GuildEmojiSettingsLoadStatus.error) {
      return _buildErrorState(context, l10n);
    }
    final List<GuildEmojiSettingsEntry> visibleEmojis = state.filteredIndices
        .map(state.emojiAtFilteredIndex)
        .toList(growable: false);
    final List<GuildEmojiSettingsEntry> staticEmojis = visibleEmojis
        .where((GuildEmojiSettingsEntry entry) => !entry.animated)
        .toList(growable: false);
    final List<GuildEmojiSettingsEntry> animatedEmojis = visibleEmojis
        .where((GuildEmojiSettingsEntry entry) => entry.animated)
        .toList(growable: false);
    final GuildExpressionLimits? limits = limitsAsync.value;
    final String maxSizeLabel = limits == null
        ? ''
        : formatExpressionFileSize(limits.emojiMaxSizeBytes);
    final String slotLabel = limits == null
        ? ''
        : formatExpressionSlotCount(state.emojis.length, limits.maxEmojis);
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: GuildCloneAllowedToggle(
            guildId: widget.guildId,
            kind: GuildCloneAllowedKind.emoji,
          ),
        ),
        SliverToBoxAdapter(
          child: GuildExpressionSearchField(
            controller: _searchController,
            hintText: l10n.guildSettingsEmojiSearchHint,
            onChanged: ref
                .read(guildEmojiSettingsProvider(widget.guildId).notifier)
                .setSearchQuery,
          ),
        ),
        if (canCreate && limits != null) ...<Widget>[
          SliverToBoxAdapter(
            child: GuildUploadSlotInfo(
              title: l10n.guildSettingsEmojiSlotsTitle,
              slotLabel: slotLabel,
              description: l10n.guildSettingsEmojiUploadRequirements(
                maxSizeLabel,
              ),
              uploadLabel: l10n.guildSettingsEmojiUploadTitle,
              onUpload: () => unawaited(_pickAndUpload(limits)),
            ),
          ),
          SliverToBoxAdapter(
            child: GuildUploadDropZone(
              description: l10n.guildSettingsEmojiDropZone,
              onFilesDropped: (List<DropItem> files) =>
                  unawaited(_uploadDroppedFiles(files, limits)),
            ),
          ),
        ],
        if (state.uploadingCount != null)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: FluxerLoadingSpinner()),
            ),
          ),
        if (state.debouncedSearchQuery.isNotEmpty && visibleEmojis.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(context.layout.s4),
              child: Text(
                l10n.guildSettingsEmojiSearchEmpty,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textPrimaryMuted,
                ),
              ),
            ),
          ),
        if (staticEmojis.isNotEmpty) ...<Widget>[
          SliverToBoxAdapter(
            child: _SectionTitle(
              label: l10n.guildSettingsNonAnimatedEmoji(staticEmojis.length),
            ),
          ),
          const SliverToBoxAdapter(child: GuildEmojiListHeader()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => GuildEmojiListItem(
                key: ValueKey<String>(staticEmojis[index].id),
                entry: staticEmojis[index],
                canModify: canModifyGuildEmoji(
                  emoji: staticEmojis[index],
                  permissions: permissions,
                  currentUserId: currentUserId,
                ),
                onRename: (String name) =>
                    _renameEmoji(staticEmojis[index], name, l10n),
                onDelete: () =>
                    _confirmDelete(staticEmojis[index], guild, l10n),
              ),
              childCount: staticEmojis.length,
            ),
          ),
        ],
        if (animatedEmojis.isNotEmpty) ...<Widget>[
          SliverToBoxAdapter(
            child: _SectionTitle(
              label: l10n.guildSettingsAnimatedEmoji(animatedEmojis.length),
            ),
          ),
          const SliverToBoxAdapter(child: GuildEmojiListHeader()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => GuildEmojiListItem(
                key: ValueKey<String>(animatedEmojis[index].id),
                entry: animatedEmojis[index],
                canModify: canModifyGuildEmoji(
                  emoji: animatedEmojis[index],
                  permissions: permissions,
                  currentUserId: currentUserId,
                ),
                onRename: (String name) =>
                    _renameEmoji(animatedEmojis[index], name, l10n),
                onDelete: () =>
                    _confirmDelete(animatedEmojis[index], guild, l10n),
              ),
              childCount: animatedEmojis.length,
            ),
          ),
        ],
        if (visibleEmojis.isEmpty &&
            state.debouncedSearchQuery.isEmpty &&
            state.loadStatus == GuildEmojiSettingsLoadStatus.success)
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(context.layout.s4),
              child: Text(
                l10n.guildSettingsEmojiEmpty,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textPrimaryMuted,
                ),
              ),
            ),
          ),
        const SliverToBoxAdapter(
          child: SizedBox(height: kSettingsScrollBottomPadding),
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
              l10n.guildSettingsEmojiLoadFailed,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textChat,
              ),
            ),
            SizedBox(height: context.layout.s4),
            FluxerButton.primary(
              label: l10n.guildSettingsInvitesTryAgain,
              onPressed: () => unawaited(
                ref
                    .read(guildEmojiSettingsProvider(widget.guildId).notifier)
                    .reload(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickAndUpload(GuildExpressionLimits limits) async {
    final List<ExpressionPickResult> files = await pickGuildExpressionEmojis(
      context,
    );
    if (files.isEmpty) {
      return;
    }
    await _uploadFiles(files, limits);
  }

  Future<void> _uploadDroppedFiles(
    List<DropItem> files,
    GuildExpressionLimits limits,
  ) async {
    final List<ExpressionPickResult> picked = <ExpressionPickResult>[];
    for (final DropItem file in files) {
      final Uint8List bytes = await file.readAsBytes();
      picked.add(ExpressionPickResult(name: file.name, bytes: bytes));
    }
    await _uploadFiles(picked, limits);
  }

  Future<void> _uploadFiles(
    List<ExpressionPickResult> files,
    GuildExpressionLimits limits,
  ) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (!limits.hasUnlimitedEmojis &&
        widget.state.emojis.length >= limits.maxEmojis) {
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.guildSettingsEmojiSlotsFull));
      return;
    }
    final GuildEmojiUploadResult result = await ref
        .read(guildEmojiSettingsProvider(widget.guildId).notifier)
        .uploadFiles(
          files: files
              .map(
                (ExpressionPickResult file) =>
                    (name: file.name, bytes: file.bytes),
              )
              .toList(growable: false),
          maxSizeBytes: limits.emojiMaxSizeBytes,
          maxEmojis: limits.maxEmojis,
        );
    if (!mounted) {
      return;
    }
    if (result.failures.isNotEmpty) {
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.guildSettingsEmojiSomeFailedTitle));
    }
  }

  Future<void> _renameEmoji(
    GuildEmojiSettingsEntry entry,
    String name,
    FluxerLocalizations l10n,
  ) async {
    final GuildExpressionNameValidationError? validation =
        validateGuildEmojiName(name);
    if (validation != null) {
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.guildSettingsEmojiInvalidNameTitle));
      return;
    }
    try {
      await ref
          .read(guildEmojiSettingsProvider(widget.guildId).notifier)
          .renameEmoji(emojiId: entry.id, name: name);
    } on Object {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(FluxerToast(message: l10n.guildSettingsEmojiRenameFailedTitle));
    }
  }

  Future<void> _confirmDelete(
    GuildEmojiSettingsEntry entry,
    Guild? guild,
    FluxerLocalizations l10n,
  ) async {
    bool purge = false;
    final bool canPurge =
        guild != null && canPurgeGuildExpressions(guild.features);
    await FluxerModal.show<void>(
      context,
      title: l10n.guildSettingsEmojiDeleteTitle,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  l10n.guildSettingsEmojiDeleteBody(entry.name),
                  style: context.textStyles.bodySmall,
                ),
                if (canPurge) ...<Widget>[
                  SizedBox(height: context.layout.s3),
                  FluxerCheckbox(
                    value: purge,
                    label: l10n.guildSettingsEmojiPurgeLabel,
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
          label: l10n.guildSettingsEmojiDeleteTitle,
          onPressed: () async {
            pop();
            try {
              await ref
                  .read(guildEmojiSettingsProvider(widget.guildId).notifier)
                  .deleteEmoji(emojiId: entry.id, purge: purge);
            } on Object {
              if (!mounted) {
                return;
              }
              ref
                  .read(toastProvider.notifier)
                  .show(
                    FluxerToast(
                      message: l10n.guildSettingsEmojiDeleteFailedTitle,
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        context.layout.s4,
        context.layout.s4,
        context.layout.s2,
      ),
      child: Text(
        label,
        style: context.textStyles.channelName.copyWith(
          color: context.colors.textChat,
        ),
      ),
    );
  }
}
