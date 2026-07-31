import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/mute_duration_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_unread_indicator.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/channels/utils/show_channel_debug_sheet.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/dm/domain/create_dm_restriction.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/create_dm_flow.dart';
import 'package:fluxer_app/features/dm/presentation/edit_group_dm_flow.dart';
import 'package:fluxer_app/features/dm/presentation/group_dm_invites_flow.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list_message_preview_row.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_presence_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_list_scroll_store_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/friends/presentation/change_friend_nickname.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/members/domain/group_dm_member_groups.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/quick_switcher/presentation/sheets/quick_switcher_bottom_sheet.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/utils/call_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/sheets/add_friend_sheet.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DMList extends ConsumerStatefulWidget {
  const DMList({super.key});

  @override
  ConsumerState<DMList> createState() => _DMListState();
}

class _DMListState extends ConsumerState<DMList> {
  late final DmListScrollStore _scrollStore;
  late final ScrollController _scrollController;
  bool _needsScrollRestore = true;
  bool _restoringScroll = false;

  @override
  void initState() {
    super.initState();
    _scrollStore = ref.read(dmListScrollStoreProvider);
    _needsScrollRestore = _scrollStore.offset > 0;
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
    // While a restore is pending the position still sits at 0; persisting it
    // would erase the offset we are about to jump back to.
    if (_needsScrollRestore || _restoringScroll) {
      return;
    }
    if (_scrollController.hasClients) {
      _scrollStore.offset = _scrollController.offset;
    }
  }

  /// Conversations arrive asynchronously, so the offset can only be restored
  /// once the list has laid out content to scroll over.
  void _scheduleScrollRestore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || !_needsScrollRestore) {
        return;
      }
      _needsScrollRestore = false;
      if (!_scrollController.hasClients) {
        return;
      }
      final double maxExtent = _scrollController.position.maxScrollExtent;
      if (maxExtent <= 0) {
        return;
      }
      _restoringScroll = true;
      _scrollController.jumpTo(_scrollStore.offset.clamp(0.0, maxExtent));
      _restoringScroll = false;
    });
  }

  void personalNote() {
    final userId = ref.read(currentUserIdProvider);
    if (userId != null) {
      unawaited(_navigateToDmChannel(userId));
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
      dmViewModelProvider.select((DmViewState state) => state.conversations),
    );
    final String? selectedId = ref.watch(activeChannelIdProvider);

    final isMobile = isMobileLayout(context);
    final pinnedIds = ref.watch(pinnedDmChannelIdsProvider).value ?? {};
    final pinnedOrder = ref.watch(pinnedDmChannelOrderProvider).value ?? [];
    final mutedIds = ref.watch(mutedDmChannelIdsProvider).value ?? {};

    // Sort pinned DMs first (by pin position), then unpinned by recency.
    final sortedConvos = _sortDmChannels(convos, pinnedIds, pinnedOrder);
    final userId = ref.watch(currentUserIdProvider);
    final visibleConvos = sortedConvos
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
                // TODO(deuss): fully setup quick switcher
                // _buildQuickSwitcher(context),
                // Divider(color: context.colors.borderColor, height: 1),
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
                          // _buildNavButton(
                          //   context,
                          //   icon: PhosphorIconsFill.skull,
                          //   label: 'Plutonium',
                          //   onTap: () {},
                          // ),
                        ],
                      ),
                    );
                  },
                ),
                Divider(color: context.colors.borderColor, height: 1),
                _buildDmHeader(context),
              ],
              Expanded(
                child: _buildConvoList(
                  context,
                  visibleConvos,
                  selectedId,
                  isMobile: isMobile,
                  pinnedIds: pinnedIds,
                  mutedIds: mutedIds,
                ),
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
    return FluxerTappable(
      onTap: () => unawaited(CreateDmFlow.show(context)),
      semanticLabel: l10n.createDmNewMessage,
      builder: (context, states) {
        final colors = context.colors;
        final motion = context.motion;
        final isHovered = states.contains(WidgetState.hovered);

        return AnimatedContainer(
          duration: motion.fast,
          curve: motion.curve,
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: isHovered ? colors.brandSecondary : colors.brandPrimary,
            shape: BoxShape.circle,
            border: Border.all(
              color: FluxerButtonVariant.primary.borderColor(
                colors,
                hovered: isHovered,
              )!,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: PhosphorIcon(
            PhosphorIconsFill.paperPlane,
            size: 24,
            color: colors.textOnBrandPrimary,
          ),
        );
      },
    );
  }

  // Reserved for planned quick-switcher UI.
  // ignore: unused_element
  Widget _buildQuickSwitcher(BuildContext context) => Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {},
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: context.layout.s2),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Quick Switcher',
                style: TextStyle(
                  color: context.colors.textPrimaryMuted,
                  fontSize: 13,
                ),
              ),
            ),
            _buildKbdBadge(context, 'CTRL'),
            const SizedBox(width: 3),
            _buildKbdBadge(context, 'K'),
          ],
        ),
      ),
    ),
  );

  Widget _buildKbdBadge(BuildContext context, String label) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
    decoration: BoxDecoration(
      color: context.colors.backgroundModifierSelected,
      borderRadius: BorderRadius.circular(3),
    ),
    child: Text(
      label,
      style: TextStyle(
        color: context.colors.textPrimaryMuted,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _selectableRow(
    BuildContext context, {
    required bool isSelected,
    required EdgeInsetsGeometry margin,
    required EdgeInsetsGeometry padding,
    required Widget child,
    VoidCallback? onTap,
    VoidCallback? onLongPress,
    double? height,
  }) => FluxerSelectableRow(
    isSelected: isSelected,
    selectedColor: context.colors.surfaceInteractiveSelectedBg.withValues(
      alpha: 0.35,
    ),
    hoverColor: context.colors.surfaceInteractiveHoverBg,
    borderRadius: context.layout.radiusMd,
    margin: margin,
    padding: padding,
    height: height,
    onTap: onTap,
    onLongPress: onLongPress,
    child: child,
  );

  Widget _buildNavButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool isSelected = false,
    VoidCallback? onLongPress,
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
        Text(
          label,
          style: context.textStyles.username.copyWith(
            color: isSelected
                ? context.colors.surfaceInteractiveSelectedColor
                : context.colors.textPrimaryMuted,
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
            border: Border.all(
              color: FluxerButtonVariant.secondary.borderColor(
                colors,
                hovered: isHovered,
              )!,
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

    return Container(
      height: 56,
      padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              l10n.dmListMessagesTitle,
              style: TextStyle(
                color: context.colors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                height: 28 / 18,
              ),
            ),
          ),
          _buildDmListSurfaceButton(
            context,
            onTap: () => unawaited(QuickSwitcherBottomSheet.show(context, ref)),
            width: 32,
            height: 32,
            borderRadius: BorderRadius.circular(16),
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
                onTap: () => AddFriendSheet.show(context),
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
                      style: TextStyle(
                        color: context.colors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 20 / 14,
                      ),
                    ),
                  ],
                ),
              ),
              if (pendingCount > 0)
                Positioned(
                  top: -4,
                  right: -4,
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 20,
                      minHeight: 20,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: context.colors.statusDanger,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$pendingCount',
                      style: TextStyle(
                        color: context.colors.textPrimary,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        height: 16 / 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
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
    if (_needsScrollRestore && convos.isNotEmpty) {
      _scheduleScrollRestore();
    }

    return ListView.builder(
      controller: _scrollController,
      scrollCacheExtent: const ScrollCacheExtent.pixels(600),
      padding: listPadding,
      itemExtent: isMobile ? 52 : 42,
      itemCount: convos.length + (isMobile ? 1 : 0),
      itemBuilder: (context, index) {
        if (isMobile && index == 0) {
          return _buildMobilePersonalNotes(
            context,
            userId,
            isSelected: selectedId == userId,
          );
        }

        final convoIndex = isMobile ? index - 1 : index;
        final convo = convos[convoIndex];
        final isSelected = convo.id == selectedId;

        return _buildConvoTile(
          context,
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
    margin: EdgeInsets.symmetric(horizontal: context.layout.s2, vertical: 2),
    padding: EdgeInsets.symmetric(horizontal: context.layout.s2, vertical: 6),
    onTap: () {
      if (userId != null) {
        unawaited(_navigateToDmChannel(userId));
      }
    },
    onLongPress: userId != null
        ? () => _showPersonalNotesContextMenu(context, channelId: userId)
        : null,
    child: Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isSelected
                ? context.colors.brandPrimary
                : context.colors.backgroundModifierAccent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: PhosphorIcon(
              PhosphorIconsFill.notePencil,
              size: 20,
              color: isSelected
                  ? context.colors.textOnBrandPrimary
                  : context.colors.interactiveNormal,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          FluxerLocalizations.of(context).personalNotesTitle,
          style: TextStyle(
            color: isSelected
                ? context.colors.surfaceInteractiveSelectedColor
                : context.colors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
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
              style: TextStyle(
                color: context.colors.textPrimaryMuted,
                fontSize: 13,
                fontWeight: FontWeight.w500,
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
    required bool isSelected,
    bool isMobile = false,
    bool isPinned = false,
    bool isMuted = false,
    DmConversation? convo,
    IconData? leadingIcon,
    String? leadingLabel,
    VoidCallback? onCustomTap,
  }) {
    final avatarSize = isMobile ? 40.0 : 32.0;
    final tileHeight = isMobile ? 52.0 : 42.0;

    final isIconTile =
        leadingIcon != null && leadingLabel != null && onCustomTap != null;
    if (isIconTile) {
      return _buildConvoStyleTile(
        context: context,
        leading: _buildCircleIcon(
          context,
          leadingIcon,
          isSelected,
          size: avatarSize,
        ),
        label: leadingLabel,
        isSelected: isSelected,
        onTap: onCustomTap,
      );
    }
    final c = convo!;
    final layout = context.layout;
    final hasUnread = c.unreadCount > 0;
    final currentUserId = ref.watch(currentUserIdProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String displayName = c.displayNameWith(
      c.isGroup ? null : ref.watch(friendNicknameProvider(c.recipientId)).value,
      l10n: l10n,
      currentUserId: currentUserId,
    );
    final titleColor = isSelected
        ? context.colors.surfaceInteractiveSelectedColor
        : hasUnread
        ? context.colors.textChat
        : context.colors.textPrimaryMuted;
    final secondaryColor = isSelected
        ? context.colors.surfaceInteractiveSelectedColor
        : context.colors.textPrimaryMuted.withValues(alpha: 0.85);
    final timestampColor = isSelected
        ? context.colors.surfaceInteractiveSelectedColor
        : context.colors.textTertiary;
    final titleStyle = context.textStyles.username.copyWith(
      color: titleColor,
      fontSize: isMobile ? 16 : 13,
      height: isMobile ? null : 16 / 13,
    );
    final secondaryStyle = TextStyle(
      color: secondaryColor,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 16 / 11,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (hasUnread && !isSelected)
          ChannelUnreadIndicator.positioned(faded: isMuted),
        Opacity(
          opacity: isMuted && !isSelected ? 0.5 : 1.0,
          child: _selectableRow(
            context,
            isSelected: isSelected,
            height: tileHeight,
            margin: EdgeInsets.symmetric(
              horizontal: layout.s2,
              vertical: isMobile ? 2 : 1,
            ),
            padding: EdgeInsets.symmetric(horizontal: layout.s2),
            onTap: () {
              unawaited(_navigateToDmChannel(c.id));
            },
            onLongPress: isMobile ? () => _showDmContextMenu(context, c) : null,
            child: Row(
              children: [
                Consumer(
                  builder: (context, ref, _) {
                    final bool isTyping = ref.watch(
                      dmAvatarIsTypingProvider(c),
                    );
                    if (c.isGroup) {
                      final String? status = ref.watch(
                        dmListRecipientRowDataProvider.select(
                          (AsyncValue<Map<String, DmListRecipientRowData>> p) =>
                              groupDmAggregateStatus(
                                participantIds: c.remoteRecipientIds,
                                resolveStatus: (String id) =>
                                    p.value?[id]?.status ?? 'offline',
                              ),
                        ),
                      );
                      return groupDmAvatarCluster(
                        dm: c,
                        size: avatarSize,
                        status: status,
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
                        animated: isSelected,
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
                                color: timestampColor,
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
                Text(
                  _formatRelativeTime(c.lastMessageTime),
                  style: TextStyle(
                    color: timestampColor,
                    fontSize: 12,
                    height: 16 / 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
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
    if (!mounted || !context.mounted) {
      return;
    }
    final result = await FluxerBottomSheet.show<Object>(
      context,
      builder: (context, _) => _DmBottomSheet(
        convo: convo,
        isMuted: isMuted,
        isPinned: isPinned,
        isFavorite: isFavorite,
        showFavorites: showFavorites,
        relationshipType: rel?.type,
        developerMode: devMode,
      ),
    );

    if (result == null || !mounted || !context.mounted) {
      return;
    }

    if (result is _InviteToGuildAction) {
      // TODO(Elias): send invite for guild ${result.guildId} in DM
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
          if (!r.ok && !r.microphoneDenied && !r.cameraDenied) {
            final FluxerLocalizations l10n = FluxerLocalizations.of(context);
            final String? snackMessage = r.notEligible
                ? l10n.directVoiceCallNotEligible
                : r.joinAttemptFailed
                ? l10n.voiceJoinCallFailed
                : null;
            if (snackMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(snackMessage)));
            }
          }
        }());
      case _DmAction.addNote:
        // TODO(Elias): open add note sheet
        break;
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
              ref
                  .read(friendRepositoryProvider)
                  .removeRelationship(convo.recipientId)
                  .catchError((_) {
                    if (mounted) {
                      ref
                          .read(toastProvider.notifier)
                          .show(
                            FluxerToast(
                              message: l10n.dmRemoveFriendFailed,
                              variant: FluxerToastVariant.danger,
                            ),
                          );
                    }
                  }),
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
        } on Object catch (_) {
          if (!mounted) {
            break;
          }
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmFriendRequestFailed,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      case _DmAction.acceptFriendRequest:
        final l10n = FluxerLocalizations.of(context);
        try {
          await ref
              .read(friendRepositoryProvider)
              .acceptFriendRequest(convo.recipientId);
        } on Object catch (_) {
          if (!mounted) {
            break;
          }
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmAcceptFriendRequestFailed,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      case _DmAction.ignoreFriendRequest:
        final l10n = FluxerLocalizations.of(context);
        try {
          await ref
              .read(friendRepositoryProvider)
              .removeRelationship(convo.recipientId);
        } on Object catch (_) {
          if (!mounted) {
            break;
          }
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmIgnoreFriendRequestFailed,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
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
              ref
                  .read(friendRepositoryProvider)
                  .blockUser(convo.recipientId)
                  .catchError((_) {
                    if (mounted) {
                      ref
                          .read(toastProvider.notifier)
                          .show(
                            FluxerToast(
                              message: l10n.dmBlockFailed,
                              variant: FluxerToastVariant.danger,
                            ),
                          );
                    }
                  }),
            );
          },
        );
      case _DmAction.unblock:
        final l10n = FluxerLocalizations.of(context);
        try {
          await ref
              .read(friendRepositoryProvider)
              .removeRelationship(convo.recipientId);
        } on Object catch (_) {
          if (!mounted) {
            break;
          }
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.dmUnblockFailed,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      case _DmAction.closeDm:
        if (!mounted) {
          break;
        }
        final l10n = FluxerLocalizations.of(context);
        final confirmed = await FluxerConfirmModal.show(
          context,
          title: l10n.dmCloseDmConfirmTitle,
          description: l10n.dmCloseDmConfirmDescription(
            convo.displayNameWith(rel?.nickname),
          ),
          confirmLabel: l10n.dmCloseDm,
          isDanger: true,
          onConfirm: () {
            unawaited(
              ref.read(dmViewModelProvider.notifier).closeDmChannel(convo.id),
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
            onCopied: (message) => ref
                .read(toastProvider.notifier)
                .show(
                  FluxerToast(
                    message: message,
                    variant: FluxerToastVariant.success,
                  ),
                ),
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

  static List<DmConversation> _sortDmChannels(
    List<DmConversation> convos,
    Set<String> pinnedIds,
    List<String> pinnedOrder,
  ) {
    final pinIndex = {
      for (var i = 0; i < pinnedOrder.length; i++) pinnedOrder[i]: i,
    };
    return [...convos]..sort((a, b) {
      final aPin = pinIndex[a.id];
      final bPin = pinIndex[b.id];
      final aIsPinned = aPin != null;
      final bIsPinned = bPin != null;

      if (aIsPinned && bIsPinned) {
        return aPin.compareTo(bPin);
      }
      if (aIsPinned != bIsPinned) {
        return aIsPinned ? -1 : 1;
      }
      return b.lastMessageTime.compareTo(a.lastMessageTime);
    });
  }

  static String _formatRelativeTime(DateTime time) {
    final diff = DateTime.now().difference(time);
    if (diff.inSeconds < 60) {
      return 'Now';
    }
    if (diff.inMinutes < 60) {
      return '${diff.inMinutes}m';
    }
    if (diff.inHours < 24) {
      return '${diff.inHours}h';
    }
    if (diff.inDays < 7) {
      return '${diff.inDays}d';
    }
    if (diff.inDays < 30) {
      return '${diff.inDays ~/ 7}w';
    }
    if (diff.inDays < 365) {
      return '${diff.inDays ~/ 30}mo';
    }
    return '${diff.inDays ~/ 365}y';
  }

  Widget _buildCircleIcon(
    BuildContext context,
    IconData icon,
    bool isSelected, {
    double size = 32,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? context.colors.brandPrimary
            : context.colors.backgroundTertiary,
      ),
      alignment: Alignment.center,
      child: PhosphorIcon(
        icon,
        size: size * 0.55,
        color: isSelected
            ? context.colors.textOnBrandPrimary
            : context.colors.interactiveNormal,
      ),
    );
  }

  Widget _buildConvoStyleTile({
    required BuildContext context,
    required Widget leading,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) => _selectableRow(
    context,
    isSelected: isSelected,
    height: 42,
    margin: EdgeInsets.symmetric(horizontal: context.layout.s2, vertical: 1),
    padding: EdgeInsets.symmetric(horizontal: context.layout.s2),
    onTap: onTap,
    child: Row(
      children: [
        leading,
        SizedBox(width: context.layout.s3),
        Expanded(
          child: Text(
            label,
            style: context.textStyles.username.copyWith(
              color: isSelected
                  ? context.colors.surfaceInteractiveSelectedColor
                  : context.colors.textPrimaryMuted,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
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
  closeDm,
  debugUser,
  debugChannel,
  copyUserId,
  copyChannelId,
}

class _InviteToGuildAction {
  final String guildId;
  const _InviteToGuildAction(this.guildId);
}

class _DmBottomSheet extends ConsumerWidget {
  final DmConversation convo;
  final bool isMuted;
  final bool isPinned;
  final bool isFavorite;
  final bool showFavorites;
  final int? relationshipType;
  final bool developerMode;

  const _DmBottomSheet({
    required this.convo,
    required this.isMuted,
    required this.isPinned,
    required this.isFavorite,
    required this.showFavorites,
    required this.relationshipType,
    required this.developerMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final hasUnread = convo.unreadCount > 0;
    final String displayName = convo.displayNameWith(
      convo.isGroup
          ? null
          : ref.watch(friendNicknameProvider(convo.recipientId)).value,
      l10n: l10n,
      currentUserId: ref.watch(currentUserIdProvider),
    );

    final String? currentUserId = ref.watch(currentUserIdProvider);
    final bool isGroupOwner =
        convo.isGroup &&
        convo.ownerId != null &&
        currentUserId != null &&
        convo.ownerId == currentUserId;

    void pop(Object action) => Navigator.of(context).pop(action);

    final groups = <Widget>[];

    // Relationship constants (match SDK RelationshipTypes values).
    const relFriend = 1;
    const relBlocked = 2;
    const relIncoming = 3;
    const relOutgoing = 4;

    // Group 1: Mark as Read + Pin/Unpin
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

    // Group 2: Profile actions + Close/Leave
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
      children.add(
        FluxerBottomSheetMenuItem(
          icon: PhosphorIconsFill.xCircle,
          label: convo.isGroup ? l10n.dmLeaveGroup : l10n.dmCloseDm,
          isDanger: true,
          onTap: () => pop(_DmAction.closeDm),
        ),
      );
      groups.add(FluxerMenuGroup(children: children));
    }

    // Group 3: Relationship actions (1-on-1 DMs only)
    if (!convo.isGroup) {
      final relChildren = <Widget>[
        FluxerBottomSheetSubmenuItem(
          label: l10n.dmInviteToCommunity,
          onTap: () => _openInviteSheet(context),
        ),
      ];

      // Friend actions based on relationship state.
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

      // Block / Unblock.
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

    // Group 4: Mute/Unmute
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

    // Group 5: Debug (developer mode only)
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

    // Group 6: Copy IDs
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

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: convo.isGroup ? 0.45 : 0.7,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        ref.watch(dmListRecipientRowDataProvider);
        final bool isTyping = ref.watch(dmAvatarIsTypingProvider(convo));
        return SafeArea(
          bottom: Platform.isAndroid,
          child: Column(
            children: [
              FluxerBottomSheetHeader(
                leading: convo.isGroup
                    ? Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.colors.backgroundSecondaryAlt,
                        ),
                        alignment: Alignment.center,
                        child: PhosphorIcon(
                          PhosphorIconsFill.usersThree,
                          size: 26,
                          color: context.colors.interactiveNormal,
                        ),
                      )
                    : FluxerAvatar.userPresence(
                        fallbackText: displayName,
                        userId: convo.recipientId,
                        imageUrl: FluxerMediaUrl.userAvatar(
                          userId: convo.recipientId,
                          hash: convo.recipientAvatar,
                        ),
                        showStatus:
                            shouldShowDmRecipientPresence(convo) || isTyping,
                        isTyping: isTyping,
                        size: 48,
                      ),
                title: displayName,
                subtitle: convo.isGroup
                    ? Text(
                        l10n.dmGroupMemberCount(convo.memberCount),
                        style: context.textStyles.timestamp.copyWith(
                          color: context.colors.textTertiary,
                        ),
                      )
                    : null,
              ),
              SizedBox(height: layout.s3),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    layout.s4,
                    0,
                    layout.s4,
                    layout.s4,
                  ),
                  children: [FluxerBottomSheetGroupColumn(children: groups)],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openMuteSheet(BuildContext context) {
    final nav = Navigator.of(context);
    unawaited(
      FluxerBottomSheet.show<MuteSelection>(
        context,
        builder: (_, _) => const _DmMuteSheet(),
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
    unawaited(
      FluxerBottomSheet.show<_InviteToGuildAction>(
        context,
        builder: (_, _) => const _DmInviteSheet(),
      ).then((result) {
        if (result != null) {
          nav.pop(result);
        }
      }),
    );
  }
}

class _DmMuteSheet extends StatelessWidget {
  const _DmMuteSheet();

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return SafeArea(
          bottom: Platform.isAndroid,
          child: Column(
            children: [
              FluxerBottomSheetSubmenuHeader(
                title: l10n.dmMuteConversation,
                onBack: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: layout.s3),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    layout.s4,
                    0,
                    layout.s4,
                    layout.s4,
                  ),
                  child: MuteDurationSheetBody(
                    onSelected: (selection) =>
                        Navigator.of(context).pop(selection),
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

class _DmInviteSheet extends ConsumerWidget {
  const _DmInviteSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final colors = context.colors;
    final l10n = FluxerLocalizations.of(context);
    final guilds = ref.watch(guildListViewModelProvider).guilds;

    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.85,
      builder: (context, scrollController) {
        return SafeArea(
          bottom: Platform.isAndroid,
          child: Column(
            children: [
              FluxerBottomSheetSubmenuHeader(
                title: l10n.dmInviteToCommunity,
                onBack: () => Navigator.of(context).pop(),
              ),
              SizedBox(height: layout.s3),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.fromLTRB(
                    layout.s4,
                    0,
                    layout.s4,
                    layout.s4,
                  ),
                  children: [
                    FluxerBottomSheetGroupColumn(
                      children: [
                        FluxerMenuGroup(
                          children: guilds.isEmpty
                              ? [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      l10n.dmNoCommunitiesAvailable,
                                      style: context.textStyles.username
                                          .copyWith(color: colors.textTertiary),
                                    ),
                                  ),
                                ]
                              : [
                                  for (final guild in guilds)
                                    FluxerBottomSheetMenuItem(
                                      label: guild.name,
                                      onTap: () => Navigator.of(
                                        context,
                                      ).pop(_InviteToGuildAction(guild.id)),
                                    ),
                                ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
