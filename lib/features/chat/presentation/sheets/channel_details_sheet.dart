import 'dart:async';

import 'package:cupertino_ui/cupertino_ui.dart'
    hide RichText, SelectableText, Text;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_reads.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/obscuring_overlay_tracker_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_flow.dart';
import 'package:fluxer_app/features/channels/presentation/delete_channel_flow.dart';
import 'package:fluxer_app/features/channels/presentation/modals/show_channel_invite_modal.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/channel_notification_settings_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/mute_duration_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_mute_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/channels/utils/show_channel_debug_sheet.dart';
import 'package:fluxer_app/features/chat/data/channel_pins_repository.dart';
import 'package:fluxer_app/features/chat/data/channel_search_history_repository.dart';
import 'package:fluxer_app/features/chat/data/channel_search_query_parser.dart';
import 'package:fluxer_app/features/chat/data/message_search_repository.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_mobile_state.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_search_mobile_sheets.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_option_card.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/chat/utils/channel_search_utils.dart';
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/chat/utils/delete_my_messages_in_channel_action.dart';
import 'package:fluxer_app/features/chat/utils/message_link.dart';
import 'package:fluxer_app/features/dm/data/dm_conversation_mapper.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/group_dm_utils.dart';
import 'package:fluxer_app/features/dm/presentation/add_friends_to_group_flow.dart';
import 'package:fluxer_app/features/dm/presentation/create_dm_flow.dart';
import 'package:fluxer_app/features/dm/presentation/edit_group_dm_flow.dart';
import 'package:fluxer_app/features/dm/presentation/group_dm_invites_flow.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/create_dm_view_model.dart';
import 'package:fluxer_app/features/dm/providers/dm_mute_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_pinned_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/members/data/guild_mention_member_search.dart';
import 'package:fluxer_app/features/members/domain/group_dm_member_groups.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/presentation/widgets/guild_members_tab_content.dart';
import 'package:fluxer_app/features/members/providers/member_list_desired_ranges_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part '../pages/channel_search_page.dart';
part 'channel_details_identity.dart';
part 'channel_details_tabs.dart';
part 'channel_details_dm_members.dart';
part 'channel_details_filters.dart';
part 'channel_details_sheet_states.dart';
part 'channel_details_more_sheet.dart';

const _kSheetLoadMoreThreshold = 160.0;

Widget _scrollableSheetPlaceholder(
  BuildContext context,
  ScrollController scrollController,
  Widget child,
) {
  return ListView(
    controller: scrollController,
    physics: const AlwaysScrollableScrollPhysics(),
    padding: FluxerBottomSheet.scrollViewPadding(context),
    children: [
      ConstrainedBox(
        // A floor, not a fixed height: placeholder content taller than a
        // quarter screen (small viewports, long localizations) grows the item
        // and scrolls instead of overflowing the flex.
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height * 0.25,
        ),
        child: child,
      ),
    ],
  );
}

enum ChannelDetailsInitialTab { members, pins }

/// Opens the details sheet and performs any jump it returns.
///
/// The jump runs only after this future completes, so both the details sheet
/// and the search sheet nested inside it are off the navigator stack before
/// any gate UI or route change appears.
///
/// Precisely: the sheet futures resolve on `Route.popped`, which fires when a
/// route leaves the stack, not when its reverse animation finishes. That is
/// enough to guarantee ordering between the routes, so a pop always targets
/// the intended route, but it does not guarantee the previous sheet has
/// finished animating out.
Future<void> showChannelDetailsSheetAndJump(
  BuildContext context, {
  required ProviderContainer container,
  required Channel? channel,
  required DmConversation? dm,
  ChannelDetailsInitialTab initialTab = ChannelDetailsInitialTab.members,
  bool openSearchImmediately = false,
}) async {
  final ChannelDetailsJumpRequest? request = await showChannelDetailsSheet(
    context,
    channel: channel,
    dm: dm,
    initialTab: initialTab,
    openSearchImmediately: openSearchImmediately,
  );
  if (request == null) {
    return;
  }
  await _jumpFromChannelDetailsRequest(container: container, request: request);
}

Future<void> _jumpFromChannelDetailsRequest({
  required ProviderContainer container,
  required ChannelDetailsJumpRequest request,
}) async {
  // Resolved here rather than in the sheet: doing it before the sheet pops
  // would leave two awaits between the picked message and the pop, and a
  // dismissal in that window would lose the jump with no route left to
  // carry it out.
  final db.FluxerDatabase database = container.read(fluxerDatabaseProvider);
  await database.messageDao.upsertMessage(request.message.toCompanion());
  final String? resolvedGuildId =
      request.guildId ??
      (await database.channelDao.getChannelById(
        request.message.channelId,
      ))?.guildId;
  await navigateToChannelJumpLink(
    container: container,
    link: MessageJumpLink(
      scope: resolvedGuildId ?? '@me',
      channelId: request.message.channelId,
      messageId: request.message.id,
    ),
  );
}

/// Returns the message the user picked, if any. Callers must not navigate
/// before this future completes; prefer [showChannelDetailsSheetAndJump].
Future<ChannelDetailsJumpRequest?> showChannelDetailsSheet(
  BuildContext context, {
  required Channel? channel,
  required DmConversation? dm,
  ChannelDetailsInitialTab initialTab = ChannelDetailsInitialTab.members,
  bool openSearchImmediately = false,
}) {
  return FluxerBottomSheet.showScrollable<ChannelDetailsJumpRequest>(
    context,
    maxChildSize: 0.94,
    builder: (sheetContext, scrollController, close) => ChannelDetailsSheet(
      channel: channel,
      dm: dm,
      initialTab: initialTab,
      openSearchImmediately: openSearchImmediately,
      scrollController: scrollController,
      close: close,
    ),
  );
}

/// A message the user picked inside the details sheet, from search or pins.
///
/// The sheet returns this instead of navigating itself: each route pops
/// itself, and the opener sequences the dismissal and the jump off the awaited
/// result rather than off assumptions about pop ordering.
class ChannelDetailsJumpRequest {
  const ChannelDetailsJumpRequest({
    required this.message,
    required this.guildId,
  });

  final Message message;
  final String? guildId;
}

class ChannelDetailsSheet extends ConsumerStatefulWidget {
  const ChannelDetailsSheet({
    required this.channel,
    required this.dm,
    required this.initialTab,
    required this.openSearchImmediately,
    required this.scrollController,
    required this.close,
    super.key,
  });

  final Channel? channel;
  final DmConversation? dm;
  final ChannelDetailsInitialTab initialTab;
  final bool openSearchImmediately;
  final ScrollController scrollController;
  final VoidCallback close;

  @override
  ConsumerState<ChannelDetailsSheet> createState() =>
      _ChannelDetailsSheetState();
}

class _ChannelDetailsSheetState extends ConsumerState<ChannelDetailsSheet> {
  late int _selectedIndex;
  bool _topicExpanded = false;
  bool _searchOpened = false;
  MemberListViewport? _memberListViewport;
  MemberListDesiredRanges? _memberListDesiredRanges;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTab == ChannelDetailsInitialTab.pins ? 1 : 0;
    widget.scrollController.addListener(_onScroll);
    if (_targetGuildId != null && _targetChannelId != null) {
      _memberListViewport = ref.read(memberListViewportProvider.notifier);
      _memberListDesiredRanges = ref.read(
        memberListDesiredRangesProvider.notifier,
      );
    }
    if (_selectedIndex == 1) {
      _ackPins();
    }
    if (widget.openSearchImmediately && _targetChannelId != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !_searchOpened) {
          _openSearch();
        }
      });
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    final MemberListViewport? viewport = _memberListViewport;
    final MemberListDesiredRanges? desiredRanges = _memberListDesiredRanges;
    final String? guildId = _targetGuildId;
    final String? channelId = _targetChannelId;
    if (viewport != null &&
        desiredRanges != null &&
        guildId != null &&
        channelId != null) {
      // Provider mutations are illegal in dispose; defer to a microtask.
      scheduleMicrotask(() {
        viewport.clearChannel(guildId: guildId, channelId: channelId);
        desiredRanges.clearChannel(guildId: guildId, channelId: channelId);
      });
    }
    super.dispose();
  }

  String? get _targetChannelId => widget.channel?.id ?? widget.dm?.id;
  String? get _targetGuildId => widget.channel?.guildId;

  void _onScroll() {
    final channelId = _targetChannelId;
    if (_selectedIndex != 1 || channelId == null) {
      return;
    }
    final position = widget.scrollController.position;
    if (position.pixels >=
        position.maxScrollExtent - _kSheetLoadMoreThreshold) {
      unawaited(ref.read(channelPinsProvider(channelId).notifier).loadMore());
    }
  }

  void _ackPins() {
    final channelId = _targetChannelId;
    if (channelId == null) {
      return;
    }
    unawaited(
      ReadStateRepository(
        ref.read(fluxerClientProvider),
        ref.read(fluxerDatabaseProvider),
      ).ackPins(channelId),
    );
  }

  void _openSearch() {
    final channelId = _targetChannelId;
    if (channelId == null) {
      return;
    }
    _searchOpened = true;
    unawaited(_runSearch(channelId: channelId));
  }

  /// Owns the search page's lifetime and bubbles its result outward.
  ///
  /// Each route pops itself: the search page pops with the picked message,
  /// and this sheet immediately pops that message onward. A sheet's `close`
  /// pops whatever is topmost rather than the route that handed it out, so
  /// chained pops would be timing dependent.
  Future<void> _runSearch({required String channelId}) async {
    final ChannelDetailsJumpRequest? request = await showChannelSearchPage(
      context,
      channelId: channelId,
      guildId: _targetGuildId,
    );
    if (request == null || !mounted) {
      return;
    }
    // Pop immediately, with no await between the inner result and this pop:
    // a dismissal in that window would leave no route to carry the jump out.
    // Resolving the message is the helper's job, after both routes are gone.
    Navigator.of(context).pop(request);
  }

  Future<void> _markRead() async {
    final channel = widget.channel;
    final dm = widget.dm;
    if (channel != null) {
      await ReadStateRepository(
        ref.read(fluxerClientProvider),
        ref.read(fluxerDatabaseProvider),
      ).ackLatest(channel.id);
      return;
    }
    if (dm != null) {
      await ref.read(dmViewModelProvider.notifier).markAsRead(dm.id);
    }
  }

  Future<void> _toggleFavorite({required bool isFavorite}) async {
    final channel = widget.channel;
    final dm = widget.dm;
    final channelId = channel?.id ?? dm?.id;
    if (channelId == null) {
      return;
    }

    final repository = ref.read(favoriteChannelsRepositoryProvider);
    if (isFavorite) {
      await repository.removeChannel(channelId);
    } else {
      await repository.addChannel(
        channelId: channelId,
        guildId: resolveFavoriteGuildId(
          channelGuildId: channel?.guildId,
          isDm: dm != null,
        ),
        nickname: channel?.name ?? dm?.displayName,
      );
    }
    if (!mounted) {
      return;
    }
    _toast(
      isFavorite
          ? FluxerLocalizations.of(context).favoritesRemovedToast
          : FluxerLocalizations.of(context).favoritesAddedToast,
    );
  }

  Future<void> _toggleDmPin({required bool isPinned}) async {
    final dm = widget.dm;
    if (dm == null) {
      return;
    }
    final repository = ref.read(dmRepositoryProvider);
    if (isPinned) {
      await repository.unpinDm(dm.id);
      if (!mounted) {
        return;
      }
      _toast(FluxerLocalizations.of(context).dmUnpinned);
    } else {
      await repository.pinDm(dm.id);
      if (!mounted) {
        return;
      }
      _toast(FluxerLocalizations.of(context).dmPinned);
    }
  }

  Future<void> _copy(String value) async {
    await copyToClipboard(context: context, value: value);
  }

  Future<void> _confirmCloseDm() async {
    final dm = widget.dm;
    if (dm == null) {
      return;
    }
    final String? friendNickname = dm.isGroup
        ? null
        : ref.read(friendNicknameProvider(dm.recipientId)).value;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? currentUserId = ref.read(currentUserIdProvider);
    final String resolvedName = dm.displayNameWith(
      friendNickname,
      l10n: l10n,
      currentUserId: currentUserId,
    );
    await FluxerConfirmModal.show(
      context,
      title: dm.isGroup ? l10n.dmLeaveGroup : l10n.dmCloseDmConfirmTitle,
      description: dm.isGroup
          ? l10n.channelDetailsLeaveGroupDescription(resolvedName)
          : l10n.channelDetailsCloseDmDescription(resolvedName),
      confirmLabel: dm.isGroup ? l10n.dmLeaveGroup : l10n.dmCloseDm,
      isDanger: true,
      onConfirm: () {
        unawaited(ref.read(dmViewModelProvider.notifier).closeDmChannel(dm.id));
        widget.close();
      },
    );
  }

  Future<void> _openMuteSheet({required bool isMuted}) async {
    if (isMuted) {
      await _setMute(isMuted: false);
      return;
    }
    final l10n = FluxerLocalizations.of(context);
    final selection = await showMuteDurationSheet(
      context,
      muteTitle: widget.dm != null
          ? l10n.dmMuteConversation
          : l10n.notificationMuteChannel,
    );
    if (selection == null || !mounted) {
      return;
    }
    await _setMute(isMuted: true, durationSeconds: selection.durationSeconds);
  }

  Future<void> _setMute({required bool isMuted, int? durationSeconds}) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final dm = widget.dm;
    final channel = widget.channel;
    if (dm != null) {
      if (isMuted) {
        await ref
            .read(dmRepositoryProvider)
            .muteDm(dm.id, durationSeconds: durationSeconds);
        _toast(l10n.channelDetailsMutedConversation);
      } else {
        await ref.read(dmRepositoryProvider).unmuteDm(dm.id);
        _toast(l10n.channelDetailsUnmutedConversation);
      }
      return;
    }
    if (channel != null) {
      await ref
          .read(guildUserSettingsRepositoryProvider)
          .updateChannelOverride(
            guildId: channel.guildId,
            channelId: channel.id,
            muted: isMuted,
            durationSeconds: durationSeconds,
          );
      _toast(
        isMuted
            ? l10n.channelDetailsMutedChannel
            : l10n.channelDetailsUnmutedChannel,
      );
    }
  }

  Future<void> _setNotification(UserNotificationSettings setting) async {
    final channel = widget.channel;
    if (channel == null) {
      return;
    }
    await ref
        .read(guildUserSettingsRepositoryProvider)
        .updateChannelOverride(
          guildId: channel.guildId,
          channelId: channel.id,
          messageNotifications: setting,
        );
    if (!mounted) {
      return;
    }
    _toast(
      FluxerLocalizations.of(context).channelDetailsNotificationSettingsUpdated,
    );
  }

  void _toast(
    String message, {
    FluxerToastVariant variant = FluxerToastVariant.success,
  }) {
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: message, variant: variant));
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final targetChannelId = widget.channel?.id ?? widget.dm?.id;
    final hasPins = targetChannelId != null;
    final showFavorites = ref.watch(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    );
    final isFavorite =
        showFavorites &&
        targetChannelId != null &&
        (ref.watch(favoriteChannelProvider(targetChannelId)).asData?.value !=
            null);
    final mutedDmIds = ref.watch(mutedDmChannelIdsProvider).value ?? {};
    final mutedChannelIds = widget.channel == null
        ? const <String>{}
        : ref.watch(mutedChannelIdsProvider(widget.channel!.guildId)).value ??
              const <String>{};
    final isMuted = widget.dm != null
        ? mutedDmIds.contains(widget.dm!.id)
        : widget.channel != null &&
              mutedChannelIds.contains(widget.channel!.id);
    final pinnedDmIds = ref.watch(pinnedDmChannelIdsProvider).value ?? {};
    final isDmPinned = widget.dm != null && pinnedDmIds.contains(widget.dm!.id);
    final unread = targetChannelId == null
        ? 0
        : widget.dm?.unreadCount ??
              (ref
                          .watch(channelUnreadProvider(targetChannelId))
                          .value
                          ?.hasUnread ??
                      false
                  ? 1
                  : 0);
    final tabs = <FluxerTab>[
      FluxerTab(
        label: l10n.channelDetailsTabMembers,
        icon: PhosphorIconsFill.users,
      ),
      if (hasPins)
        FluxerTab(
          label: l10n.channelDetailsTabPins,
          icon: PhosphorIconsFill.pushPin,
        ),
    ];
    final selectedIndex = _selectedIndex.clamp(0, tabs.length - 1);
    if (widget.channel != null) {
      final String prefetchChannelId = widget.channel!.id;
      ref.watch(effectiveGuildChannelPermissionBitsProvider(prefetchChannelId));
    }

    return Column(
      children: [
        _DetailsIdentityHeader(
          channel: widget.channel,
          dm: widget.dm,
          topicExpanded: _topicExpanded,
          onToggleTopic: () => setState(() => _topicExpanded = !_topicExpanded),
          onClose: widget.close,
        ),
        SizedBox(height: context.layout.s3),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
          child: Row(
            children: [
              Expanded(
                child: FluxerActionButton(
                  icon: PhosphorIconsFill.bellSlash,
                  label: isMuted
                      ? l10n.channelDetailsActionUnmute
                      : l10n.channelDetailsActionMute,
                  isActive: isMuted,
                  onTap: () => _openMuteSheet(isMuted: isMuted),
                ),
              ),
              if (hasPins) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: FluxerActionButton(
                    icon: PhosphorIconsBold.magnifyingGlass,
                    label: l10n.channelDetailsActionSearch,
                    onTap: _openSearch,
                  ),
                ),
              ],
              const SizedBox(width: 8),
              Expanded(
                child: FluxerActionButton(
                  icon: PhosphorIconsBold.dotsThreeVertical,
                  label: l10n.channelDetailsActionMore,
                  onTap: () {
                    final bits = widget.channel == null
                        ? 0
                        : ref
                                  .read(
                                    effectiveGuildChannelPermissionBitsProvider(
                                      widget.channel!.id,
                                    ),
                                  )
                                  .value ??
                              0;
                    final developerMode = ref
                        .read(userSettingsViewModelProvider)
                        .developerMode;
                    unawaited(
                      _showDetailsMoreSheet(
                        context,
                        ref: ref,
                        channel: widget.channel,
                        dm: widget.dm,
                        showFavorite:
                            showFavorites &&
                            targetChannelId != null &&
                            !(widget.dm?.isPersonalNotes ?? false),
                        isFavorite: isFavorite,
                        isDmPinned: isDmPinned,
                        hasUnread: unread > 0,
                        channelPermissionBits: bits,
                        developerMode: developerMode,
                        onMarkRead: _markRead,
                        onToggleFavorite: _toggleFavorite,
                        onToggleDmPin: _toggleDmPin,
                        onSetNotification: _setNotification,
                        onCopy: _copy,
                        onCloseDm: _confirmCloseDm,
                        onDeleteMyMessages: () {
                          final dm = widget.dm;
                          if (dm == null) {
                            return Future<void>.value();
                          }
                          return confirmAndDeleteMyMessagesInChannel(
                            context,
                            ref,
                            channelId: dm.id,
                            isPrivateConversation: true,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.layout.s3),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 2,
                color: context.colors.backgroundModifierAccent,
              ),
            ),
            FluxerTabs(
              tabs: tabs,
              selectedIndex: selectedIndex,
              onChanged: (index) {
                setState(() => _selectedIndex = index);
                if (index == 1) {
                  _ackPins();
                }
              },
            ),
          ],
        ),
        SizedBox(height: context.layout.s3),
        Expanded(
          child: selectedIndex == 1 && targetChannelId != null
              ? _PinsTab(
                  channelId: targetChannelId,
                  guildId: widget.channel?.guildId,
                  scrollController: widget.scrollController,
                  close: widget.close,
                )
              : _MembersTab(
                  dm: widget.dm,
                  guildId: widget.channel?.guildId,
                  channelId: targetChannelId,
                  scrollController: widget.scrollController,
                ),
        ),
      ],
    );
  }
}
