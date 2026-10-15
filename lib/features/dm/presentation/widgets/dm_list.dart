import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/mute_duration_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/channels/utils/show_channel_debug_sheet.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/messages/delete_my_messages_in_channel_action.dart';
import 'package:fluxer_app/features/dm/domain/create_dm_restriction.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/create_dm_flow.dart';
import 'package:fluxer_app/features/dm/presentation/edit_group_dm_flow.dart';
import 'package:fluxer_app/features/dm/presentation/group_dm_invites_flow.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list_message_preview_row.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list_skeleton.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_row_timestamp.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_presence_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_scroll_store_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/dm/providers/sorted_dm_conversations_provider.dart';
import 'package:fluxer_app/features/dm/providers/unread_dm_provider.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/friends/presentation/change_friend_nickname.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/utils/invitable_channel.dart';
import 'package:fluxer_app/features/guilds/utils/invite_people_actions.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/quick_switcher/presentation/sheets/quick_switcher_bottom_sheet.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/utils/call_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/pages/add_friend_page.dart';
import 'package:fluxer_app/shared/utils/api_error_presentation.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/navigation_item_semantics.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DMList extends ConsumerStatefulWidget {
  const DMList({super.key});

  @override
  ConsumerState<DMList> createState() => _DMListState();
}

const double _kMobileRowExtent = 55;
const double _kMobileRowGap = 5;
const double _kMobileAvatarSize = 32;
const double _kDesktopRowExtent = 42;
const double _kDesktopRowGap = 2;
const double _kDesktopAvatarSize = 32;
const String _kPersonalNotesRowKey = 'personal-notes';

class _DMListState extends ConsumerState<DMList> {
  late final DmListScrollStore _scrollStore;
  late final ScrollController _scrollController;
  bool _needsScrollRestore = true;
  bool _restoringScroll = false;
  String? _contextMenuRowId;

  @override
  void initState() {
    super.initState();
    _scrollStore = ref.read(dmListScrollStoreProvider);
    final double? savedOffset = _scrollStore.offset;
    _needsScrollRestore = savedOffset == null || savedOffset > 0;
    _scrollController = ScrollController()..addListener(_persistScroll);
  }

  @override
  void deactivate() {
    _persistScroll();
    super.deactivate();
  }

  @override
  void dispose() {
    _persistScroll();
    _scrollController
      ..removeListener(_persistScroll)
      ..dispose();
    super.dispose();
  }

  void _persistScroll() {
    if (_needsScrollRestore || _restoringScroll) {
      return;
    }
    if (_scrollController.hasClients) {
      _scrollStore.offset = _scrollController.offset;
    }
  }

  void _scheduleScrollRestore({
    required int? selectedRowIndex,
    required double rowExtent,
    required double topPadding,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_needsScrollRestore) {
        return;
      }
      _needsScrollRestore = false;
      if (!_scrollController.hasClients) {
        return;
      }
      final ScrollPosition position = _scrollController.position;
      final double maxExtent = position.maxScrollExtent;
      if (maxExtent <= 0) {
        return;
      }
      final double? savedOffset = _scrollStore.offset;
      final double target;
      if (savedOffset != null) {
        target = savedOffset;
      } else if (selectedRowIndex != null) {
        target =
            topPadding +
            (selectedRowIndex + 0.5) * rowExtent -
            position.viewportDimension / 2;
      } else {
        return;
      }
      _restoringScroll = true;
      _scrollController.jumpTo(target.clamp(0.0, maxExtent));
      _restoringScroll = false;
    });
  }

  Future<void> _holdContextMenuHighlight(
    String rowId,
    Future<void> Function() showMenu,
  ) async {
    setState(() => _contextMenuRowId = rowId);
    try {
      await showMenu();
    } finally {
      if (mounted && _contextMenuRowId == rowId) {
        setState(() => _contextMenuRowId = null);
      }
    }
  }

  Future<void> _navigateToDmChannel(String channelId) async {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId != null && channelId == userId) {
      await ref.read(dmRepositoryProvider).ensurePersonalNotesChannel(userId);
    }
    if (!mounted) {
      return;
    }
    await navigateToDmChannelContent(
      context: context,
      ref: ref,
      channelId: channelId,
    );
  }

  Future<void> _showPersonalNotesContextMenu(
    BuildContext context, {
    required String channelId,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Object? result = await FluxerBottomSheet.show<Object>(
      context,
      variant: FluxerBottomSheetVariant.menu,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return FluxerBottomSheetContent(
          scrollable: false,
          child: FluxerBottomSheetGroupColumn(
            children: <Widget>[
              FluxerMenuGroup(
                children: <Widget>[
                  FluxerBottomSheetMenuItem(
                    icon: PhosphorIconsFill.trash,
                    label: l10n.purgePersonalNotes,
                    isDanger: true,
                    onTap: () => Navigator.of(sheetContext).pop('purge'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
    if (result == 'purge' && mounted && context.mounted) {
      await _requestPurgePersonalNotes(context, channelId: channelId);
    }
  }

  Future<void> _requestPurgePersonalNotes(
    BuildContext context, {
    required String channelId,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool? confirmed = await FluxerConfirmModal.show(
      context,
      title: l10n.purgePersonalNotes,
      description: l10n.purgePersonalNotesConfirmDescription,
      confirmLabel: l10n.purgePersonalNotesConfirmButton,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true || !mounted || !context.mounted) {
      return;
    }
    try {
      final int deletedCount = await ref
          .read(messageRepositoryProvider)
          .purgePersonalNotesMessages(channelId);
      if (!mounted || !context.mounted) {
        return;
      }
      if (ref.read(chatViewModelProvider).channelId == channelId) {
        await ref.read(chatViewModelProvider.notifier).reloadCurrentChannel();
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: deletedCount > 0
                  ? l10n.purgePersonalNotesSuccess(deletedCount)
                  : l10n.purgePersonalNotesAlreadyEmpty,
              variant: FluxerToastVariant.success,
            ),
          );
    } on Exception {
      if (!mounted || !context.mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.purgePersonalNotesFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<DmConversation> convos = ref.watch(
      sortedDmConversationsProvider,
    );
    final String? selectedId = ref.watch(activeChannelIdProvider);
    final bool hasReceivedInitialConversations = ref.watch(
      dmViewModelProvider.select(
        (DmViewState state) => state.hasReceivedInitialConversations,
      ),
    );

    final isMobile = isMobileLayout(context);
    final pinnedIds = ref.watch(pinnedDmChannelIdsProvider).value ?? {};
    final mutedIds = ref.watch(mutedDmChannelIdsProvider).value ?? {};

    final userId = ref.watch(currentUserIdProvider);
    final visibleConvos = convos
        .where(
          (DmConversation c) => !shouldExcludeFromDmConversationList(
            type: c.type,
            channelId: c.id,
            currentUserId: userId,
          ),
        )
        .toList();
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
      color: context.colors.channelSidebarBackground,
      child: Stack(
        children: [
          Column(
            children: [
              if (isMobile) ...[
                _buildMobileHeader(context),
                Divider(color: context.colors.borderColor, height: 1),
              ] else ...[
                Builder(
                  builder: (context) {
                    final location = ref.watch(currentLocationProvider);
                    final userId = ref.watch(currentUserIdProvider);
                    final isFriends = location == RoutePaths.me;
                    final isNotes =
                        userId != null &&
                        location == RoutePaths.dmChannel(userId);

                    return Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Column(
                        children: [
                          _buildNavButton(
                            context,
                            icon: PhosphorIconsFill.users,
                            label: 'Friends',
                            isSelected: isFriends,
                            badgeCount:
                                ref
                                    .watch(pendingFriendRequestCountProvider)
                                    .value ??
                                0,
                            onTap: () => navigateToDmFriendsContent(context),
                          ),
                          _buildNavButton(
                            context,
                            icon: PhosphorIconsFill.notePencil,
                            label: FluxerLocalizations.of(
                              context,
                            ).personalNotesTitle,
                            isSelected: isNotes,
                            onTap: () {
                              if (userId != null) {
                                unawaited(_navigateToDmChannel(userId));
                              }
                            },
                            onLongPress: userId != null
                                ? () => _showPersonalNotesContextMenu(
                                    context,
                                    channelId: userId,
                                  )
                                : null,
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Divider(color: context.colors.borderColor, height: 1),
                _buildDmHeader(context),
              ],
              Expanded(
                child: hasReceivedInitialConversations
                    ? _buildConvoList(
                        context,
                        visibleConvos,
                        selectedId,
                        isMobile: isMobile,
                        pinnedIds: pinnedIds,
                        mutedIds: mutedIds,
                      )
                    : const DmListSkeleton(),
              ),
            ],
          ),
          if (isMobile)
            Positioned(right: 16, bottom: 16, child: _buildComposeFab(context)),
        ],
      ),
    );
  }

  Widget _buildComposeFab(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerCircleFab(
      icon: PhosphorIconsFill.paperPlane,
      semanticLabel: l10n.createDmNewMessage,
      onTap: () => unawaited(CreateDmFlow.show(context)),
    );
  }

  Widget _selectableRow(
    BuildContext context, {
    required bool isSelected,
    required EdgeInsetsGeometry margin,
    required EdgeInsetsGeometry padding,
    required Widget child,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    GestureTapUpCallback? onSecondaryTapUp,
    double? height,
    String? semanticLabel,
    bool isActive = false,
  }) => FluxerSelectableRow(
    isSelected: isSelected,
    isActive: isActive,
    selectedColor: context.colors.listItemSelectedBg,
    selectedBorderColor: context.colors.listItemSelectedBorder,
    hoverColor: context.colors.surfaceInteractiveHoverBg,
    borderRadius: isMobileLayout(context)
        ? context.layout.radiusXl
        : context.layout.radiusMd,
    margin: margin,
    padding: padding,
    height: height,
    semanticLabel: semanticLabel,
    onTap: onTap,
    onLongPress: onLongPress,
    onSecondaryTapUp: onSecondaryTapUp,
    child: child,
  );

  Widget _buildNavButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isSelected = false,
    VoidCallback? onLongPress,
    int badgeCount = 0,
  }) => _selectableRow(
    context,
    isSelected: isSelected,
    margin: EdgeInsets.symmetric(horizontal: context.layout.s2, vertical: 1),
    padding: EdgeInsets.symmetric(horizontal: context.layout.s2),
    height: 42,
    onTap: onTap,
    onLongPress: onLongPress,
    child: Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isSelected
                ? context.colors.brandPrimary
                : context.colors.backgroundModifierAccent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: PhosphorIcon(
              icon,
              size: 18,
              color: isSelected
                  ? context.colors.textOnBrandPrimary
                  : context.colors.interactiveNormal,
            ),
          ),
        ),
        SizedBox(width: context.layout.s3),
        Expanded(
          child: Text(
            label,
            style: context.textStyles.username.copyWith(
              color: isSelected
                  ? context.colors.surfaceInteractiveSelectedColor
                  : context.colors.textPrimaryMuted,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (badgeCount > 0)
          ExcludeSemantics(
            child: FluxerBadgeEntrance(
              child: FluxerBadge.count(count: badgeCount),
            ),
          ),
      ],
    ),
  );

  Widget _buildDmListSurfaceButton(
    BuildContext context, {
    required VoidCallback onTap,
    required Widget child,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(999)),
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    String? semanticLabel,
  }) {
    return FluxerTappable(
      onTap: onTap,
      semanticLabel: semanticLabel,
      builder: (context, states) {
        final colors = context.colors;
        final motion = context.motion;
        final isHovered = states.contains(WidgetState.hovered);

        return AnimatedContainer(
          duration: motion.fast,
          curve: motion.curve,
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: isHovered
                ? colors.backgroundSecondaryAlt
                : colors.guildListForeground,
            borderRadius: borderRadius,
            border: FluxerButtonVariant.secondary.border(
              colors,
              hovered: isHovered,
            ),
          ),
          alignment: width != null || height != null ? Alignment.center : null,
          child: child,
        );
      },
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final pendingCount =
        ref.watch(pendingFriendRequestCountProvider).value ?? 0;
    final bool iconOnlyTitle =
        isCompactWideMobileLayout(context) &&
        !isSidebarDrawerLockedForLocation(ref.watch(shellLocationProvider));

    return FluxerConstrainedUiTextScale(
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 56),
        child: Container(
          padding: EdgeInsets.fromLTRB(iconOnlyTitle ? 12 : 16, 8, 8, 8),
          child: Row(
            children: [
              if (iconOnlyTitle) ...[
                _buildMobileHeaderTitle(context, l10n: l10n, iconOnly: true),
                const Spacer(),
              ] else
                Expanded(
                  child: _buildMobileHeaderTitle(
                    context,
                    l10n: l10n,
                    iconOnly: false,
                  ),
                ),
              _buildDmListSurfaceButton(
                context,
                onTap: () =>
                    unawaited(QuickSwitcherBottomSheet.show(context, ref)),
                padding: const EdgeInsets.all(8),
                child: PhosphorIcon(
                  PhosphorIconsBold.magnifyingGlass,
                  size: 20,
                  color: context.colors.textPrimary,
                ),
              ),
              const SizedBox(width: 8),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  _buildDmListSurfaceButton(
                    context,
                    onTap: () => AddFriendPage.show(context),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PhosphorIcon(
                          PhosphorIconsFill.userPlus,
                          size: 16,
                          color: context.colors.textPrimary,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          l10n.dmAddFriends,
                          style: context.textStyles.label.copyWith(
                            height: 20 / 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (pendingCount > 0)
                    Positioned(
                      top: -6,
                      right: -6,
                      child: FluxerBadgeEntrance(
                        child: FluxerBadge.count(
                          count: pendingCount,
                          cutoutColor: context.colors.channelSidebarBackground,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileHeaderTitle(
    BuildContext context, {
    required FluxerLocalizations l10n,
    required bool iconOnly,
  }) {
    final TextStyle titleStyle = context.textStyles.channelName;
    if (!iconOnly) {
      return Text(l10n.dmListMessagesTitle, style: titleStyle);
    }
    return Semantics(
      label: l10n.dmListMessagesTitle,
      child: Icon(
        PhosphorIconsFill.chatCircle,
        size: 20,
        color: titleStyle.color,
      ),
    );
  }

  Widget _buildConvoList(
    BuildContext context,
    List<DmConversation> convos,
    String? selectedId, {
    required bool isMobile,
    required Set<String> pinnedIds,
    required Set<String> mutedIds,
  }) {
    final userId = ref.watch(currentUserIdProvider);
    final listPadding = isMobile
        ? EdgeInsets.only(top: context.layout.s1, bottom: 96)
        : EdgeInsets.zero;
    final int leadingRows = isMobile ? 1 : 0;
    if (_needsScrollRestore && convos.isNotEmpty) {
      final int selectedConvoIndex = convos.indexWhere(
        (DmConversation c) => c.id == selectedId,
      );
      _scheduleScrollRestore(
        selectedRowIndex: selectedConvoIndex >= 0
            ? selectedConvoIndex + leadingRows
            : null,
        rowExtent: isMobile ? _kMobileRowExtent : _kDesktopRowExtent,
        topPadding: listPadding.top,
      );
    }

    return ListView.builder(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      scrollCacheExtent: const ScrollCacheExtent.pixels(600),
      padding: listPadding,
      itemExtent: isMobile ? _kMobileRowExtent : _kDesktopRowExtent,
      itemCount: convos.length + leadingRows,
      findChildIndexCallback: (Key key) {
        if (key is! ValueKey<String>) {
          return null;
        }
        if (key.value == _kPersonalNotesRowKey) {
          return isMobile ? 0 : null;
        }
        final int convoIndex = convos.indexWhere(
          (DmConversation c) => c.id == key.value,
        );
        return convoIndex < 0 ? null : convoIndex + leadingRows;
      },
      itemBuilder: (context, index) {
        if (isMobile && index == 0) {
          return KeyedSubtree(
            key: const ValueKey<String>(_kPersonalNotesRowKey),
            child: _buildMobilePersonalNotes(
              context,
              userId,
              isSelected: selectedId == userId,
            ),
          );
        }

        final convo = convos[index - leadingRows];
        final isSelected = convo.id == selectedId;

        return _buildConvoTile(
          context,
          key: ValueKey<String>(convo.id),
          convo: convo,
          isSelected: isSelected,
          isMobile: isMobile,
          isPinned: pinnedIds.contains(convo.id),
          isMuted: mutedIds.contains(convo.id),
        );
      },
    );
  }

  Widget _buildMobilePersonalNotes(
    BuildContext context,
    String? userId, {
    required bool isSelected,
  }) => _selectableRow(
    context,
    isSelected: isSelected,
    isActive: _contextMenuRowId == _kPersonalNotesRowKey,
    height: _kMobileRowExtent - _kMobileRowGap,
    margin: EdgeInsets.symmetric(
      horizontal: context.layout.s2,
      vertical: _kMobileRowGap / 2,
    ),
    padding: EdgeInsets.only(left: context.layout.s2, right: context.layout.s3),
    onTap: () {
      if (userId != null) {
        unawaited(_navigateToDmChannel(userId));
      }
    },
    onLongPress: userId != null
        ? () => _holdContextMenuHighlight(
            _kPersonalNotesRowKey,
            () => _showPersonalNotesContextMenu(context, channelId: userId),
          )
        : null,
    child: Row(
      children: [
        Container(
          width: _kMobileAvatarSize,
          height: _kMobileAvatarSize,
          decoration: BoxDecoration(
            color: context.colors.backgroundModifierAccent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: PhosphorIcon(
              PhosphorIconsFill.notePencil,
              size: 16,
              color: isSelected
                  ? context.colors.textPrimary
                  : context.colors.interactiveNormal,
            ),
          ),
        ),
        SizedBox(width: context.layout.s3),
        Expanded(
          child: Text(
            FluxerLocalizations.of(context).personalNotesTitle,
            style: _dmRowTitleStyle(
              context,
              color: isSelected
                  ? context.colors.textPrimary
                  : context.colors.textTertiary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );

  TextStyle _dmRowTitleStyle(
    BuildContext context, {
    required Color color,
    bool emphasized = false,
    bool isMobile = true,
  }) => context.textStyles.username.copyWith(
    color: color,
    fontSize: isMobile ? 16 : 13,
    fontWeight: emphasized ? FontWeight.w600 : FontWeight.w500,
    height: isMobile ? 20 / 16 : 16 / 13,
  );

  Widget _buildDmHeader(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
    final bool isRestricted = getCreateDmRestriction(settings) != null;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s2, vertical: layout.s2),
      child: Row(
        children: [
          Expanded(
            child: Text(
              l10n.dmListDirectMessagesTitle,
              style: context.textStyles.label.copyWith(
                color: context.colors.textPrimaryMuted,
                fontSize: 13,
              ),
            ),
          ),
          Semantics(
            label: l10n.createDm,
            button: true,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: isRestricted
                    ? null
                    : () => unawaited(CreateDmFlow.show(context)),
                borderRadius: BorderRadius.circular(4),
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: PhosphorIcon(
                    PhosphorIconsBold.plus,
                    size: 16,
                    color: isRestricted
                        ? context.colors.textPrimaryMuted.withValues(alpha: 0.4)
                        : context.colors.textPrimaryMuted,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConvoTile(
    BuildContext context, {
    required DmConversation convo,
    required bool isSelected,
    Key? key,
    bool isMobile = false,
    bool isPinned = false,
    bool isMuted = false,
  }) {
    final c = convo;
    final avatarSize = isMobile ? _kMobileAvatarSize : _kDesktopAvatarSize;
    final rowGap = isMobile ? _kMobileRowGap : _kDesktopRowGap;
    final tileHeight =
        (isMobile ? _kMobileRowExtent : _kDesktopRowExtent) - rowGap;
    final layout = context.layout;
    final hasUnread = c.unreadCount > 0;
    final currentUserId = ref.watch(currentUserIdProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String displayName = c.displayNameWith(
      c.isGroup ? null : ref.watch(friendNicknameProvider(c.recipientId)).value,
      l10n: l10n,
      currentUserId: currentUserId,
    );
    final bool emphasized = isSelected || hasUnread;
    final Color mutedTextColor = context.colors.textTertiary;
    final titleStyle = _dmRowTitleStyle(
      context,
      color: emphasized ? context.colors.textPrimary : mutedTextColor,
      emphasized: hasUnread && !isMuted,
      isMobile: isMobile,
    );
    final secondaryStyle = context.textStyles.timestamp.copyWith(
      color: mutedTextColor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 16 / 12,
    );
    final String? lastMessageId = c.lastMessageId;

    return Stack(
      key: key,
      clipBehavior: Clip.none,
      children: [
        if (hasUnread) ChannelUnreadIndicator.positioned(faded: isMuted),
        Opacity(
          opacity: isMuted && !isSelected ? 0.5 : 1,
          child: _selectableRow(
            context,
            isSelected: isSelected,
            isActive: _contextMenuRowId == c.id,
            height: tileHeight,
            margin: EdgeInsets.symmetric(
              horizontal: layout.s2,
              vertical: rowGap / 2,
            ),
            padding: EdgeInsets.only(left: layout.s2, right: layout.s3),
            semanticLabel: navigationItemSemanticLabel(
              l10n: l10n,
              name: displayName,
              isSelected: isSelected,
              hasUnread: hasUnread,
              isMuted: isMuted,
            ),
            onTap: () {
              unawaited(_navigateToDmChannel(c.id));
            },
            onLongPress: isMobile
                ? () => _holdContextMenuHighlight(
                    c.id,
                    () => _showDmContextMenu(context, c),
                  )
                : null,
            onSecondaryTapUp: isMobile
                ? null
                : (_) => unawaited(_showDmContextMenu(context, c)),
            child: Row(
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    final bool isTyping = ref.watch(
                      dmAvatarIsTypingProvider(c),
                    );
                    if (c.isGroup) {
                      return GroupDmAvatar.conversation(
                        c,
                        size: avatarSize,
                        isTyping: isTyping,
                      );
                    }
                    final bool showPresence = shouldShowDmRecipientPresence(c);
                    return FluxerAvatar.userPresence(
                      fallbackText: displayName,
                      userId: c.recipientId,
                      imageUrl: FluxerMediaUrl.userAvatar(
                        userId: c.recipientId,
                        hash: c.recipientAvatar,
                      ),
                      showStatus: showPresence || isTyping,
                      isTyping: isTyping,
                      size: avatarSize,
                    );
                  },
                ),
                SizedBox(width: layout.s3),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (isPinned)
                            Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: PhosphorIcon(
                                PhosphorIconsFill.pushPin,
                                size: 12,
                                color: mutedTextColor,
                              ),
                            ),
                          Flexible(
                            child: Text(
                              displayName,
                              style: titleStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (!c.isGroup && isBotOrSystemDmRecipient(c))
                            Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: FluxerUserTag(isSystem: c.isSystem),
                            ),
                        ],
                      ),
                      DmListTileSubtext(
                        conversation: c,
                        style: secondaryStyle,
                        hasUnread: hasUnread,
                        currentUserId: currentUserId,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (lastMessageId != null)
                        DmRowTimestamp(
                          time: c.lastMessageTime,
                          style: secondaryStyle.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      if (!isMuted) _DmListMentionBadge(channelId: c.id),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<List<_InviteCandidate>> _inviteCandidatesFor(String userId) async {
    final FluxerDatabase db = ref.read(fluxerDatabaseProvider);
    final List<Guild> guilds = ref.read(guildListViewModelProvider).guilds;
    final List<_InviteCandidate?> resolved = await Future.wait(
      guilds.map((Guild guild) async {
        if (await db.memberDao.getMemberByUserId(userId, guild.id) != null) {
          return null;
        }
        final InvitableChannelMatch? match = await resolveGuildInvitableChannel(
          ref: ref,
          guildId: guild.id,
          preferSelectedChannel: false,
        );
        return match == null
            ? null
            : _InviteCandidate(guildName: guild.name, match: match);
      }),
    );
    return resolved.nonNulls.toList()..sort(
      (_InviteCandidate a, _InviteCandidate b) =>
          a.guildName.toLowerCase().compareTo(b.guildName.toLowerCase()),
    );
  }

  Future<void> _runRelationshipAction(
    ApiErrorAction errorAction,
    Future<void> Function() call,
  ) async {
    try {
      await call();
    } on Object catch (e) {
      if (!mounted) {
        return;
      }
      await showApiError(context, errorAction, e);
    }
  }

  Future<void> _sendCommunityInvite(
    DmConversation convo,
    _InviteCandidate candidate,
    FluxerLocalizations l10n,
  ) async {
    final Toast toasts = ref.read(toastProvider.notifier);
    try {
      final String url = await communityInviteUrlFor(
        ref: ref,
        match: candidate.match,
      );
      await sendInviteLinkMessage(
        ref: ref,
        channelId: convo.id,
        recipientId: null,
        url: url,
      );
      toasts.show(
        FluxerToast(
          message: l10n.dmInviteSentFor(candidate.guildName),
          variant: FluxerToastVariant.success,
        ),
      );
    } on Object catch (error, stackTrace) {
      talker.error('[DMList] community invite failed', error, stackTrace);
      toasts.show(
        FluxerToast(
          message: l10n.dmInviteSendFailed,
          variant: FluxerToastVariant.danger,
        ),
      );
    }
  }

  Future<void> _showDmContextMenu(
    BuildContext context,
    DmConversation convo,
  ) async {
    if (convo.isPersonalNotes) {
      await _showPersonalNotesContextMenu(context, channelId: convo.id);
      return;
    }
    final pinnedIds = ref.read(pinnedDmChannelIdsProvider).value ?? {};
    final mutedIds = ref.read(mutedDmChannelIdsProvider).value ?? {};
    final isPinned = pinnedIds.contains(convo.id);
    final isMuted = mutedIds.contains(convo.id);
    final db = ref.read(fluxerDatabaseProvider);
    final rels = await db.relationshipDao.getRelationships();
    final rel = rels.where((r) => r.userId == convo.recipientId).firstOrNull;
    final devMode = ref.read(userSettingsViewModelProvider).developerMode;
    final showFavorites = ref.read(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    );
    final isFavorite =
        showFavorites &&
        await ref.read(favoriteChannelsRepositoryProvider).isFavorite(convo.id);
    final List<_InviteCandidate> inviteCandidates =
        convo.isGroup || convo.isBot || convo.isSystem
        ? const <_InviteCandidate>[]
        : await _inviteCandidatesFor(convo.recipientId);
    if (!mounted || !context.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? currentUserId = ref.read(currentUserIdProvider);
    final String displayName = convo.displayNameWith(
      convo.isGroup ? null : rel?.nickname,
      l10n: l10n,
      currentUserId: currentUserId,
    );
    final result = await FluxerBottomSheet.showScrollable<Object>(
      context,
      title: displayName,
      leading: _DmContextMenuLeading(convo: convo, displayName: displayName),
      subtitle: convo.isGroup ? _DmContextMenuSubtitle(convo: convo) : null,
      initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
      builder: (sheetContext, scrollController, _) => _DmBottomSheet(
        convo: convo,
        scrollController: scrollController,
        isMuted: isMuted,
        isPinned: isPinned,
        isFavorite: isFavorite,
        showFavorites: showFavorites,
        relationshipType: rel?.type,
        developerMode: devMode,
        inviteCandidates: inviteCandidates,
      ),
    );

    if (result == null || !mounted || !context.mounted) {
      return;
    }

    if (result is _InviteCandidate) {
      unawaited(_sendCommunityInvite(convo, result, l10n));
      return;
    }

    final action = result as _DmAction;
    switch (action) {
      case _DmAction.markAsRead:
        unawaited(ref.read(dmViewModelProvider.notifier).markAsRead(convo.id));
      case _DmAction.viewProfile:
        if (!convo.isGroup) {
          unawaited(
            FluxerUserProfileSheet.show(context, userId: convo.recipientId),
          );
        }
      case _DmAction.voiceCall:
        unawaited(() async {
          final String? selfId = ref.read(currentUserIdProvider);
          final List<String> ringTargets = convo.remoteRecipientIds
              .where((String id) => selfId == null || id != selfId)
              .toList();
          final StartDirectVoiceCallResult r = await startDirectVoiceCall(
            ref,
            context,
            convo.id,
            outboundRingRecipients: ringTargets.isEmpty ? null : ringTargets,
          );
          if (!context.mounted) {
            return;
          }
          await explainDirectCallFailure(context, r);
        }());
      case _DmAction.addNote:
        unawaited(
          FluxerUserProfileSheet.show(
            context,
            userId: convo.recipientId,
            autoFocusNote: true,
          ),
        );
      case _DmAction.changeFriendNickname:
        unawaited(
          showChangeFriendNicknameSheet(
            context,
            ref,
            userId: convo.recipientId,
            username: convo.recipientUsername ?? convo.recipientName,
            currentNick: rel?.nickname,
          ),
        );
      case _DmAction.favoriteDm:
        final repository = ref.read(favoriteChannelsRepositoryProvider);
        if (await repository.isFavorite(convo.id)) {
          await repository.removeChannel(convo.id);
        } else {
          await repository.addChannel(
            channelId: convo.id,
            guildId: favoriteDmGuildId,
            nickname: convo.displayName,
          );
        }
      case _DmAction.mute15Min:
        unawaited(
          ref.read(dmRepositoryProvider).muteDm(convo.id, durationSeconds: 900),
        );
      case _DmAction.mute30Min:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 1800),
        );
      case _DmAction.mute1Hour:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 3600),
        );
      case _DmAction.mute3Hours:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 10800),
        );
      case _DmAction.mute4Hours:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 14400),
        );
      case _DmAction.mute8Hours:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 28800),
        );
      case _DmAction.mute24Hours:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 86400),
        );
      case _DmAction.mute3Days:
        unawaited(
          ref
              .read(dmRepositoryProvider)
              .muteDm(convo.id, durationSeconds: 259200),
        );
      case _DmAction.muteForever:
        unawaited(ref.read(dmRepositoryProvider).muteDm(convo.id));
      case _DmAction.unmute:
        unawaited(ref.read(dmRepositoryProvider).unmuteDm(convo.id));
      case _DmAction.pinToggle:
        if (pinnedIds.contains(convo.id)) {
          unawaited(ref.read(dmRepositoryProvider).unpinDm(convo.id));
        } else {
          unawaited(ref.read(dmRepositoryProvider).pinDm(convo.id));
        }
      case _DmAction.editGroup:
        unawaited(EditGroupDmFlow.show(context, dm: convo));
      case _DmAction.showGroupInvites:
        unawaited(GroupDmInvitesFlow.show(context, dm: convo));
      case _DmAction.removeFriend:
        if (!mounted) {
          break;
        }
        final l10n = FluxerLocalizations.of(context);
        await FluxerConfirmModal.show(
          context,
          title: l10n.dmRemoveFriendConfirmTitle,
          description: l10n.dmRemoveFriendConfirmDescription(
            convo.displayNameWith(rel?.nickname),
          ),
          confirmLabel: l10n.dmRemoveFriend,
          isDanger: true,
          onConfirm: () {
            unawaited(
              _runRelationshipAction(
                ApiErrorAction.removeFriend,
                () => ref
                    .read(friendRepositoryProvider)
                    .removeRelationship(convo.recipientId),
              ),
            );
          },
        );
      case _DmAction.addFriend:
        final l10n = FluxerLocalizations.of(context);
        try {
          await ref
              .read(friendRepositoryProvider)
              .sendFriendRequest(convo.recipientId);
          if (!mounted) {
            break;
          }
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmFriendRequestSentToast,
                  variant: FluxerToastVariant.success,
                ),
              );
        } on Object catch (e) {
          if (!mounted) {
            break;
          }
          await showApiError(this.context, ApiErrorAction.sendFriendRequest, e);
        }
      case _DmAction.acceptFriendRequest:
        await _runRelationshipAction(
          ApiErrorAction.acceptFriendRequest,
          () => ref
              .read(friendRepositoryProvider)
              .acceptFriendRequest(convo.recipientId),
        );
      case _DmAction.ignoreFriendRequest:
        await _runRelationshipAction(
          ApiErrorAction.ignoreFriendRequest,
          () => ref
              .read(friendRepositoryProvider)
              .removeRelationship(convo.recipientId),
        );
      case _DmAction.block:
        if (!mounted) {
          break;
        }
        final l10n = FluxerLocalizations.of(context);
        await FluxerConfirmModal.show(
          context,
          title: l10n.dmBlockConfirmTitle,
          description: l10n.dmBlockConfirmDescription(
            convo.displayNameWith(rel?.nickname),
          ),
          confirmLabel: l10n.dmBlock,
          isDanger: true,
          onConfirm: () {
            unawaited(
              _runRelationshipAction(
                ApiErrorAction.blockUser,
                () => ref
                    .read(friendRepositoryProvider)
                    .blockUser(convo.recipientId),
              ),
            );
          },
        );
      case _DmAction.unblock:
        if (!mounted) {
          break;
        }
        final l10n = FluxerLocalizations.of(context);
        await FluxerConfirmModal.show(
          context,
          title: l10n.userProfileUnblockConfirmTitle,
          description: l10n.userProfileUnblockConfirmDescription(
            convo.displayNameWith(rel?.nickname),
          ),
          confirmLabel: l10n.dmUnblock,
          onConfirm: () {
            unawaited(
              _runRelationshipAction(
                ApiErrorAction.unblockUser,
                () => ref
                    .read(friendRepositoryProvider)
                    .removeRelationship(convo.recipientId),
              ),
            );
          },
        );
      case _DmAction.deleteMyMessages:
        unawaited(
          confirmAndDeleteMyMessagesInChannel(
            context,
            ref,
            channelId: convo.id,
            isPrivateConversation: true,
          ),
        );
      case _DmAction.closeDm:
        if (!mounted) {
          break;
        }
        final l10n = FluxerLocalizations.of(context);
        final String closeName = convo.displayNameWith(rel?.nickname);
        final confirmed = await FluxerConfirmModal.show(
          context,
          title: convo.isGroup ? l10n.dmLeaveGroup : l10n.dmCloseDmConfirmTitle,
          description: convo.isGroup
              ? l10n.channelDetailsLeaveGroupDescription(closeName)
              : l10n.dmCloseDmConfirmDescription(closeName),
          confirmLabel: convo.isGroup ? l10n.dmLeaveGroup : l10n.dmCloseDm,
          isDanger: true,
          onConfirm: () {
            unawaited(
              ref
                  .read(dmViewModelProvider.notifier)
                  .closeDmChannel(convo.id, isGroup: convo.isGroup),
            );
          },
        );
        if (confirmed != true && mounted) {
          break;
        }
      case _DmAction.debugUser:
        try {
          final client = ref.read(fluxerClientProvider);
          final user = await client.users.getUserById(
            userId: convo.recipientId,
          );
          if (!mounted || !context.mounted) {
            break;
          }
          await showDebugBottomSheet(
            context,
            title: FluxerLocalizations.of(context).dmDebugUser,
            data: user.toJson(),
          );
        } on Exception catch (_) {
          // API fetch failed — ignore silently.
        }
      case _DmAction.debugChannel:
        await showChannelDebugSheet(
          context,
          ref: ref,
          channelId: convo.id,
          title: FluxerLocalizations.of(context).dmDebugChannel,
        );
      case _DmAction.copyUserId:
        await copyToClipboard(
          context: context,
          value: convo.recipientId,
          message: FluxerLocalizations.of(context).dmUserIdCopied,
        );
      case _DmAction.copyChannelId:
        await copyToClipboard(
          context: context,
          value: convo.id,
          message: FluxerLocalizations.of(context).dmChannelIdCopied,
        );
    }
  }
}

enum _DmAction {
  markAsRead,
  viewProfile,
  voiceCall,
  addNote,
  changeFriendNickname,
  favoriteDm,
  mute15Min,
  mute30Min,
  mute1Hour,
  mute3Hours,
  mute4Hours,
  mute8Hours,
  mute24Hours,
  mute3Days,
  muteForever,
  unmute,
  pinToggle,
  editGroup,
  showGroupInvites,
  removeFriend,
  addFriend,
  acceptFriendRequest,
  ignoreFriendRequest,
  block,
  unblock,
  deleteMyMessages,
  closeDm,
  debugUser,
  debugChannel,
  copyUserId,
  copyChannelId,
}

class _InviteCandidate {
  const _InviteCandidate({required this.guildName, required this.match});

  final String guildName;
  final InvitableChannelMatch match;
}

class _DmBottomSheet extends ConsumerWidget {
  final DmConversation convo;
  final ScrollController scrollController;
  final bool isMuted;
  final bool isPinned;
  final bool isFavorite;
  final bool showFavorites;
  final int? relationshipType;
  final bool developerMode;
  final List<_InviteCandidate> inviteCandidates;

  const _DmBottomSheet({
    required this.convo,
    required this.scrollController,
    required this.isMuted,
    required this.isPinned,
    required this.isFavorite,
    required this.showFavorites,
    required this.relationshipType,
    required this.developerMode,
    required this.inviteCandidates,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final hasUnread = convo.unreadCount > 0;

    final String? currentUserId = ref.watch(currentUserIdProvider);
    final bool isGroupOwner =
        convo.isGroup &&
        convo.ownerId != null &&
        currentUserId != null &&
        convo.ownerId == currentUserId;

    void pop(Object action) => Navigator.of(context).pop(action);

    final groups = <Widget>[];

    const relFriend = 1;
    const relBlocked = 2;
    const relIncoming = 3;
    const relOutgoing = 4;

    groups.add(
      FluxerMenuGroup(
        children: [
          if (hasUnread)
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.eye,
              label: l10n.dmMarkAsRead,
              onTap: () => pop(_DmAction.markAsRead),
            ),
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.pushPin,
            label: convo.isGroup
                ? (isPinned ? l10n.dmUnpinGroupDm : l10n.dmPinGroupDm)
                : (isPinned ? l10n.dmUnpinDm : l10n.dmPinDm),
            onTap: () => pop(_DmAction.pinToggle),
          ),
          if (showFavorites)
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.star,
              label: convo.isGroup
                  ? (isFavorite
                        ? l10n.dmUnfavoriteGroupDm
                        : l10n.dmFavoriteGroupDm)
                  : (isFavorite ? l10n.dmUnfavoriteDm : l10n.dmFavoriteDm),
              onTap: () => pop(_DmAction.favoriteDm),
            ),
        ],
      ),
    );

    {
      final children = <Widget>[];
      if (convo.isGroup) {
        children.add(
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.pencilSimple,
            label: l10n.dmEditGroup,
            onTap: () => pop(_DmAction.editGroup),
          ),
        );
        if (isGroupOwner) {
          children.add(
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.envelope,
              label: l10n.dmGroupInvites,
              onTap: () => pop(_DmAction.showGroupInvites),
            ),
          );
        }
      } else {
        children.addAll([
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.user,
            label: l10n.dmViewProfile,
            onTap: () => pop(_DmAction.viewProfile),
          ),
          if (canStartDmCall(convo))
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.phone,
              label: l10n.dmVoiceCall,
              onTap: () => pop(_DmAction.voiceCall),
            ),
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.notePencil,
            label: l10n.dmAddNote,
            onTap: () => pop(_DmAction.addNote),
          ),
          if (relationshipType == relFriend)
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.pencilSimple,
              label: l10n.dmChangeFriendNickname,
              onTap: () => pop(_DmAction.changeFriendNickname),
            ),
        ]);
      }
      children
        ..add(
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.trash,
            label: l10n.channelMenuDeleteMyMessagesConfirm,
            isDanger: true,
            onTap: () => pop(_DmAction.deleteMyMessages),
          ),
        )
        ..add(
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.xCircle,
            label: convo.isGroup ? l10n.dmLeaveGroup : l10n.dmCloseDm,
            isDanger: true,
            onTap: () => pop(_DmAction.closeDm),
          ),
        );
      groups.add(FluxerMenuGroup(children: children));
    }

    if (!convo.isGroup) {
      final relChildren = <Widget>[
        if (inviteCandidates.isNotEmpty)
          FluxerBottomSheetSubmenuItem(
            label: l10n.dmInviteToCommunity,
            onTap: () => _openInviteSheet(context),
          ),
      ];

      switch (relationshipType) {
        case relFriend:
          relChildren.add(
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userMinus,
              label: l10n.dmRemoveFriend,
              isDanger: true,
              onTap: () => pop(_DmAction.removeFriend),
            ),
          );
        case relIncoming:
          relChildren.addAll([
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userPlus,
              label: l10n.dmAcceptFriendRequest,
              onTap: () => pop(_DmAction.acceptFriendRequest),
            ),
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userMinus,
              label: l10n.dmIgnoreFriendRequest,
              onTap: () => pop(_DmAction.ignoreFriendRequest),
            ),
          ]);
        case relOutgoing:
          relChildren.add(
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userPlus,
              label: l10n.dmFriendRequestSent,
              onTap: () {},
            ),
          );
        default:
          relChildren.add(
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.userPlus,
              label: l10n.dmAddFriend,
              onTap: () => pop(_DmAction.addFriend),
            ),
          );
      }

      if (relationshipType == relBlocked) {
        relChildren.add(
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.prohibit,
            label: l10n.dmUnblock,
            onTap: () => pop(_DmAction.unblock),
          ),
        );
      } else {
        relChildren.add(
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsFill.prohibit,
            label: l10n.dmBlock,
            isDanger: true,
            onTap: () => pop(_DmAction.block),
          ),
        );
      }

      groups.add(FluxerMenuGroup(children: relChildren));
    }

    groups.add(
      FluxerMenuGroup(
        children: [
          if (isMuted)
            FluxerBottomSheetMenuItem(
              label: l10n.dmUnmuteConversation,
              onTap: () => pop(_DmAction.unmute),
            )
          else
            FluxerBottomSheetSubmenuItem(
              label: l10n.dmMuteConversation,
              onTap: () => _openMuteSheet(context),
            ),
        ],
      ),
    );

    if (developerMode) {
      groups.add(
        FluxerMenuGroup(
          children: [
            if (!convo.isGroup)
              FluxerBottomSheetMenuItem(
                icon: PhosphorIconsFill.bugBeetle,
                label: l10n.dmDebugUser,
                onTap: () => pop(_DmAction.debugUser),
              ),
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsFill.bugBeetle,
              label: l10n.dmDebugChannel,
              onTap: () => pop(_DmAction.debugChannel),
            ),
          ],
        ),
      );
    }

    groups.add(
      FluxerMenuGroup(
        children: [
          if (!convo.isGroup)
            FluxerBottomSheetMenuItem(
              icon: PhosphorIconsBold.snowflake,
              label: l10n.dmCopyUserId,
              onTap: () => pop(_DmAction.copyUserId),
            ),
          FluxerBottomSheetMenuItem(
            icon: PhosphorIconsBold.snowflake,
            label: l10n.dmCopyChannelId,
            onTap: () => pop(_DmAction.copyChannelId),
          ),
        ],
      ),
    );

    return ListView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.fromLTRB(
          layout.s4,
          0,
          layout.s4,
          FluxerBottomSheet.bottomGapOf(context),
        ),
      ),
      children: [FluxerBottomSheetGroupColumn(children: groups)],
    );
  }

  void _openMuteSheet(BuildContext context) {
    final nav = Navigator.of(context);
    final l10n = FluxerLocalizations.of(context);
    unawaited(
      FluxerBottomSheet.showScrollable<MuteSelection>(
        context,
        title: l10n.dmMuteConversation,
        onBack: () => Navigator.of(context).pop(),
        initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
        builder: (sheetContext, scrollController, _) {
          final layout = sheetContext.layout;
          return ListView(
            controller: scrollController,
            padding: FluxerBottomSheet.scrollViewPadding(
              sheetContext,
              padding: EdgeInsets.fromLTRB(
                layout.s4,
                0,
                layout.s4,
                FluxerBottomSheet.bottomGapOf(sheetContext),
              ),
            ),
            children: [
              MuteDurationSheetBody(
                onSelected: (selection) =>
                    Navigator.of(sheetContext).pop(selection),
              ),
            ],
          );
        },
      ).then((selection) {
        if (selection == null) {
          return;
        }
        nav.pop(_dmActionForMuteSelection(selection));
      }),
    );
  }

  void _openInviteSheet(BuildContext context) {
    final nav = Navigator.of(context);
    final l10n = FluxerLocalizations.of(context);
    unawaited(
      FluxerBottomSheet.showScrollable<_InviteCandidate>(
        context,
        title: l10n.dmInviteToCommunity,
        onBack: () => Navigator.of(context).pop(),
        initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
        builder: (sheetContext, scrollController, _) => _DmInviteSheet(
          scrollController: scrollController,
          candidates: inviteCandidates,
        ),
      ).then((result) {
        if (result != null) {
          nav.pop(result);
        }
      }),
    );
  }
}

_DmAction _dmActionForMuteSelection(MuteSelection selection) {
  return switch (selection.durationSeconds) {
    900 => _DmAction.mute15Min,
    1800 => _DmAction.mute30Min,
    3600 => _DmAction.mute1Hour,
    10800 => _DmAction.mute3Hours,
    14400 => _DmAction.mute4Hours,
    28800 => _DmAction.mute8Hours,
    86400 => _DmAction.mute24Hours,
    259200 => _DmAction.mute3Days,
    _ => _DmAction.muteForever,
  };
}

class _DmContextMenuLeading extends ConsumerWidget {
  final DmConversation convo;
  final String displayName;

  const _DmContextMenuLeading({required this.convo, required this.displayName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isTyping = ref.watch(dmAvatarIsTypingProvider(convo));
    if (convo.isGroup) {
      return GroupDmAvatar.conversation(convo, size: 48, isTyping: isTyping);
    }
    ref.watch(dmListRecipientRowDataProvider);

    return FluxerAvatar.userPresence(
      fallbackText: displayName,
      userId: convo.recipientId,
      imageUrl: FluxerMediaUrl.userAvatar(
        userId: convo.recipientId,
        hash: convo.recipientAvatar,
      ),
      showStatus: shouldShowDmRecipientPresence(convo) || isTyping,
      isTyping: isTyping,
      size: 48,
    );
  }
}

class _DmContextMenuSubtitle extends StatelessWidget {
  final DmConversation convo;

  const _DmContextMenuSubtitle({required this.convo});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Text(
      l10n.dmGroupMemberCount(convo.memberCount),
      style: context.textStyles.timestamp.copyWith(
        color: context.colors.textTertiary,
      ),
    );
  }
}

class _DmInviteSheet extends StatelessWidget {
  final ScrollController scrollController;
  final List<_InviteCandidate> candidates;

  const _DmInviteSheet({
    required this.scrollController,
    required this.candidates,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return ListView(
      controller: scrollController,
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.fromLTRB(
          layout.s4,
          0,
          layout.s4,
          FluxerBottomSheet.bottomGapOf(context),
        ),
      ),
      children: [
        FluxerBottomSheetGroupColumn(
          children: [
            FluxerMenuGroup(
              children: [
                for (final _InviteCandidate candidate in candidates)
                  FluxerBottomSheetMenuItem(
                    icon: PhosphorIconsFill.paperPlaneRight,
                    label: candidate.guildName,
                    onTap: () => Navigator.of(context).pop(candidate),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _DmListMentionBadge extends ConsumerWidget {
  const _DmListMentionBadge({required this.channelId});

  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int mentionCount = ref.watch(
      unreadDmChannelsProvider.select(
        (UnreadDmState state) => state.mentionCountFor(channelId),
      ),
    );
    if (mentionCount <= 0) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: ExcludeSemantics(
        child: FluxerBadgeEntrance(
          child: FluxerBadge.count(count: mentionCount),
        ),
      ),
    );
  }
}
