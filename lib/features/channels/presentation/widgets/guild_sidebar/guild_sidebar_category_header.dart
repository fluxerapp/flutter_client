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

  void _toggleCollapsed(WidgetRef ref) {
    unawaited(
      ref
          .read(guildUserSettingsRepositoryProvider)
          .toggleCategoryCollapsed(guildId: guildId, categoryId: category.id),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context, ref);
    }
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
            onTap: () => _toggleCollapsed(ref),
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
              padding: const EdgeInsetsDirectional.only(
                start: 12,
                end: 8,
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

  Widget _buildDesktop(BuildContext context, WidgetRef ref) {
    final Color idle = _desktopSidebarRowTextColor(context, category: true);
    final int? permissionBits = ref.watch(
      channelPermissionCacheProvider(
        watchAccountUserId(ref),
      ).select((ChannelPermissionCaches caches) => caches[category.id]),
    );
    final bool canManageChannels =
        permissionBits != null &&
        hasPermission(permissionBits, Permission.manageChannels);
    return Semantics(
      button: true,
      expanded: !isCollapsed,
      label: category.name,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8, end: 8, top: 4),
        child: FluxerSelectableRow(
          isSelected: false,
          selectedColor: Colors.transparent,
          hoverColor: Colors.transparent,
          pressedColor: Colors.transparent,
          borderRadius: context.layout.radiusMd,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          onTap: () => _toggleCollapsed(ref),
          onContextMenuRequested: (details) =>
              _showCategoryActions(context, ref, details.globalPosition),
          childBuilder: (BuildContext context, Set<WidgetState> states) {
            final bool hovered = states.contains(WidgetState.hovered);
            final bool showCreate =
                canManageChannels &&
                (hovered || states.contains(WidgetState.focused));
            return Row(
              children: <Widget>[
                Expanded(
                  child: ExcludeSemantics(
                    child: Text(
                      category.name,
                      style: context.textStyles.categoryName.copyWith(
                        color: _desktopSidebarRowTextColor(
                          context,
                          hovered: hovered,
                          category: true,
                        ),
                      ),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                if (showCreate) ...<Widget>[
                  const SizedBox(width: 4),
                  FluxerButton.desktop(
                    icon: PhosphorIconsBold.plus,
                    semanticLabel: FluxerLocalizations.of(
                      context,
                    ).guildNavbarCreateChannel,
                    showTooltip: true,
                    extent: 16,
                    color: idle,
                    hoverBackground: Colors.transparent,
                    onPressed: () =>
                        unawaited(_createChannelInCategory(context, ref)),
                  ),
                ],
                const SizedBox(width: 4),
                ExcludeSemantics(
                  child: RotatedBox(
                    quarterTurns: isCollapsed ? 3 : 0,
                    child: PhosphorIcon(
                      PhosphorIconsBold.caretDown,
                      size: 12,
                      color: idle,
                    ),
                  ),
                ),
              ],
            );
          },
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
    final String? mutedHint = isMuted
        ? formatMutedHintText(muteConfig, l10n)
        : null;
    final bool developerMode = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    final bool hasAgreedToMatureContent = ref
        .read(matureContentAgreementsProvider.notifier)
        .hasAgreedToCategory(category.id);
    final int? cachedPermissionBits = ref.read(
      channelPermissionCacheProvider(readAccountUserId(ref)),
    )[category.id];
    final int? permissionBits =
        cachedPermissionBits ??
        await ref.read(
          effectiveGuildChannelPermissionBitsProvider(category.id).future,
        );
    final Set<String> collapsedCategoryIds =
        ref.read(guildCollapsedCategoriesProvider(guildId)).value ??
        const <String>{};
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
    if (!usesDesktopPointerUi(context)) {
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
        _toggleCollapsed(ref);
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
      case CategoryMenuAction.createChannel:
        close();
        unawaited(_createChannelInCategory(parentContext, ref));
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

  Future<void> _createChannelInCategory(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final ChannelCreateRequest? request = await CreateChannelSheet.show(
      context,
      parentId: category.id,
      guildId: guildId,
    );
    if (request == null) {
      return;
    }
    try {
      await ref
          .read(fluxerClientProvider)
          .guilds
          .createGuildChannel(guildId: guildId, body: request);
    } on Object catch (error) {
      await showApiErrorFromRoot(ApiErrorAction.generic, error);
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
