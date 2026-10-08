part of 'guild_sidebar.dart';

class _CategoryHeader extends ConsumerWidget {
  const _CategoryHeader({
    required this.category,
    required this.isCollapsed,
    required this.guildId,
    super.key,
  });

  final ChannelCategory category;
  final bool isCollapsed;
  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      button: true,
      expanded: !isCollapsed,
      label: category.name,
      child: ExcludeSemantics(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            mouseCursor: SystemMouseCursors.click,
            hoverColor: context.colors.backgroundModifierHover,
            onTap: () {
              unawaited(
                ref
                    .read(guildUserSettingsRepositoryProvider)
                    .toggleCategoryCollapsed(
                      guildId: guildId,
                      categoryId: category.id,
                    ),
              );
            },
            onSecondaryTapUp: (details) => unawaited(
              _showCategoryActions(context, ref, details.globalPosition),
            ),
            onLongPress: isTouchPrimaryInput(ref)
                ? () => unawaited(
                    _showCategoryActions(
                      context,
                      ref,
                      contextMenuPositionAtCenter(context),
                    ),
                  )
                : null,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 12,
                right: 8,
                top: 16,
                bottom: 4,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      category.name,
                      style: context.textStyles.categoryName,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 4),
                  PhosphorIcon(
                    isCollapsed
                        ? PhosphorIconsBold.caretRight
                        : PhosphorIconsBold.caretDown,
                    size: 12,
                    color: context.colors.textPrimaryMuted,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showCategoryActions(
    BuildContext context,
    WidgetRef ref,
    Offset position,
  ) async {
    final l10n = FluxerLocalizations.of(context);
    final List<ChannelCategory> allCategories = ref
        .read(channelListViewModelProvider)
        .categories;
    final List<String> allCategoryIds = allCategories
        .where((ChannelCategory category) => !category.isUncategorized)
        .map((ChannelCategory category) => category.id)
        .toList();
    final List<String> channelIds = category.channels
        .where(_canMarkChannelRead)
        .map((Channel channel) => channel.id)
        .toList();
    final bool hasUnread = channelIds.any((String channelId) {
      return ref.read(channelUnreadProvider(channelId)).value?.hasUnread ??
          false;
    });
    final Set<String> mutedIds =
        ref.read(mutedChannelIdsProvider(guildId)).value ?? const <String>{};
    final bool isMuted = mutedIds.contains(category.id);
    final ChannelOverridesMuteConfig? muteConfig = await _loadChannelMuteConfig(
      ref,
      guildId,
      category.id,
    );
    final String? mutedHint = isMuted ? formatMutedHintText(muteConfig) : null;
    final bool developerMode = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    final bool hasAgreedToMatureContent = ref
        .read(matureContentAgreementsProvider.notifier)
        .hasAgreedToCategory(category.id);
    final int? cachedPermissionBits = ref.read(
      channelPermissionCacheProvider,
    )[category.id];
    final int? permissionBits =
        cachedPermissionBits ??
        await ref.read(
          effectiveGuildChannelPermissionBitsProvider(category.id).future,
        );
    final Set<String> collapsedCategoryIds = await ref.read(
      guildCollapsedCategoriesProvider(guildId).future,
    );
    final bool allCategoriesCollapsed =
        allCategoryIds.isNotEmpty &&
        allCategoryIds.every(collapsedCategoryIds.contains);
    if (!context.mounted) {
      return;
    }
    final CategoryMenuState menuState = resolveCategoryMenuState(
      hasUnread: hasUnread,
      isCollapsed: isCollapsed,
      allCategoriesCollapsed: allCategoriesCollapsed,
      isMuted: isMuted,
      canManageChannels:
          permissionBits != null &&
          hasPermission(permissionBits, Permission.manageChannels),
      developerMode: developerMode,
      hasAgreedToMatureContent: hasAgreedToMatureContent,
      mutedHint: mutedHint,
    );
    final List<CategoryMenuGroup> groups = buildCategoryMenuGroups(
      l10n: l10n,
      state: menuState,
    );
    if (isMobileLayout(context)) {
      return FluxerBottomSheet.showScrollable<void>(
        context,
        title: category.name,
        initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
        minChildSize: 0.25,
        builder: (sheetContext, scrollController, close) {
          return categoryMenuGroupsToBottomSheetContent(
            context: sheetContext,
            scrollController: scrollController,
            groups: groups,
            menuState: menuState,
            onAction: (CategoryMenuAction action) => _handleCategoryMenuAction(
              action,
              menuContext: sheetContext,
              parentContext: context,
              ref: ref,
              close: close,
              menuState: menuState,
              channelIds: channelIds,
              allCategoryIds: allCategoryIds,
            ),
          );
        },
      );
    }
    return FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) => categoryMenuGroupsToWidgets(
        context: menuContext,
        groups: groups,
        menuState: menuState,
        onAction: (CategoryMenuAction action) => _handleCategoryMenuAction(
          action,
          menuContext: menuContext,
          parentContext: context,
          ref: ref,
          close: close,
          menuState: menuState,
          channelIds: channelIds,
          allCategoryIds: allCategoryIds,
        ),
      ),
    );
  }

  void _handleCategoryMenuAction(
    CategoryMenuAction action, {
    required BuildContext menuContext,
    required BuildContext parentContext,
    required WidgetRef ref,
    required VoidCallback close,
    required CategoryMenuState menuState,
    required List<String> channelIds,
    required List<String> allCategoryIds,
  }) {
    switch (action) {
      case CategoryMenuAction.markAsRead:
        close();
        unawaited(_readStateRepository(ref).ackLatestBulk(channelIds));
      case CategoryMenuAction.toggleCollapse:
        close();
        unawaited(
          ref
              .read(guildUserSettingsRepositoryProvider)
              .toggleCategoryCollapsed(
                guildId: guildId,
                categoryId: category.id,
              ),
        );
      case CategoryMenuAction.toggleCollapseAll:
        close();
        unawaited(
          ref
              .read(guildUserSettingsRepositoryProvider)
              .toggleAllCategoriesCollapsed(
                guildId: guildId,
                categoryIds: allCategoryIds,
              ),
        );
      case CategoryMenuAction.mute:
        unawaited(
          _openCategoryMuteSheet(
            menuContext,
            ref,
            close: close,
            isMuted: menuState.isMuted,
          ),
        );
      case CategoryMenuAction.editCategory:
        close();
        unawaited(
          ChannelSettingsFlow.show(menuContext, channelId: category.id),
        );
      case CategoryMenuAction.deleteCategory:
        close();
        unawaited(_deleteCategory(parentContext, ref));
      case CategoryMenuAction.copyCategoryId:
        close();
        unawaited(
          copyToClipboard(
            context: menuContext,
            value: category.id,
            message: FluxerLocalizations.of(menuContext).categoryIdCopied,
          ),
        );
      case CategoryMenuAction.debugCategory:
        close();
        unawaited(_showDebugCategorySheet(menuContext, ref));
      case CategoryMenuAction.resetMatureContentAgree:
        close();
        unawaited(
          ref
              .read(matureContentAgreementsProvider.notifier)
              .revokeCategoryAgreement(category.id),
        );
    }
  }

  Future<void> _deleteCategory(BuildContext context, WidgetRef ref) async {
    final Channel? channel = await _loadCategoryChannel(ref);
    if (channel == null) {
      return;
    }
    if (!context.mounted) {
      return;
    }
    await DeleteChannelFlow.confirmAndDelete(context, ref, channel: channel);
  }

  Future<Channel?> _loadCategoryChannel(WidgetRef ref) async {
    final row = await ref
        .read(fluxerDatabaseProvider)
        .channelDao
        .getChannelById(category.id);
    if (row == null) {
      return null;
    }
    return Channel.fromRow(row);
  }

  Future<void> _showDebugCategorySheet(BuildContext context, WidgetRef ref) =>
      showChannelDebugSheet(
        context,
        ref: ref,
        channelId: category.id,
        title: FluxerLocalizations.of(context).dmDebugCategory,
      );

  Future<void> _openCategoryMuteSheet(
    BuildContext context,
    WidgetRef ref, {
    required VoidCallback close,
    required bool isMuted,
  }) async {
    final repository = ref.read(guildUserSettingsRepositoryProvider);
    if (isMuted) {
      close();
      await repository.updateChannelOverride(
        guildId: guildId,
        channelId: category.id,
        muted: false,
      );
      return;
    }
    final selection = await showMuteDurationSheet(
      context,
      muteTitle: 'Mute Category',
      useRootNavigator: isMobileLayout(context),
    );
    if (selection == null) {
      return;
    }
    close();
    await repository.updateChannelOverride(
      guildId: guildId,
      channelId: category.id,
      muted: true,
      durationSeconds: selection.durationSeconds,
      collapsed: true,
    );
  }
}
