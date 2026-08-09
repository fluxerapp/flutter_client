import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
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
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/utils/channel_jump_link.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/channel_settings_flow.dart';
import 'package:fluxer_app/features/channels/presentation/delete_channel_flow.dart';
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
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_markdown.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_details_providers.dart';
import 'package:fluxer_app/features/chat/utils/channel_jump_navigator.dart';
import 'package:fluxer_app/features/chat/utils/channel_search_utils.dart';
import 'package:fluxer_app/features/chat/utils/composer_mention_query.dart';
import 'package:fluxer_app/features/chat/utils/message_link.dart';
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
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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

Future<ChannelDetailsJumpRequest?> showChannelSearchSheet(
  BuildContext context, {
  required String channelId,
  required String? guildId,
  required String title,
  Channel? channel,
  DmConversation? dm,
}) {
  return FluxerBottomSheet.showScrollable<ChannelDetailsJumpRequest>(
    context,
    title: FluxerLocalizations.of(context).channelDetailsSearchTitle,
    maxChildSize: 0.96,
    builder: (sheetContext, scrollController, close) => ChannelSearchSheet(
      channelId: channelId,
      guildId: guildId,
      channel: channel,
      dm: dm,
      scrollController: scrollController,
      close: close,
    ),
  );
}

/// Opens the search sheet directly and performs any jump it returns.
///
/// Same contract as [showChannelDetailsSheetAndJump]: the jump runs only
/// after the sheet is off the navigator stack, so no gate UI or route change
/// races the dismissal.
Future<void> showChannelSearchSheetAndJump(
  BuildContext context, {
  required ProviderContainer container,
  required String channelId,
  required String? guildId,
  required String title,
  Channel? channel,
  DmConversation? dm,
}) async {
  final ChannelDetailsJumpRequest? request = await showChannelSearchSheet(
    context,
    channelId: channelId,
    guildId: guildId,
    title: title,
    channel: channel,
    dm: dm,
  );
  if (request == null) {
    return;
  }
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
  String? get _targetTitle => widget.channel?.name ?? widget.dm?.displayName;

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
    final title = _targetTitle;
    if (channelId == null || title == null) {
      return;
    }
    _searchOpened = true;
    unawaited(_runSearch(channelId: channelId, title: title));
  }

  /// Owns the search sheet's lifetime and bubbles its result outward.
  ///
  /// Each route pops itself: the search sheet pops with the picked message,
  /// and this sheet immediately pops that message onward. A sheet's `close`
  /// pops whatever is topmost rather than the route that handed it out, so
  /// chained pops would be timing dependent.
  Future<void> _runSearch({
    required String channelId,
    required String title,
  }) async {
    final ChannelDetailsJumpRequest? request = await showChannelSearchSheet(
      context,
      channelId: channelId,
      guildId: _targetGuildId,
      title: title,
      channel: widget.channel,
      dm: widget.dm,
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

class _DetailsIdentityHeader extends ConsumerWidget {
  const _DetailsIdentityHeader({
    required this.channel,
    required this.dm,
    required this.topicExpanded,
    required this.onToggleTopic,
    required this.onClose,
  });

  final Channel? channel;
  final DmConversation? dm;
  final bool topicExpanded;
  final VoidCallback onToggleTopic;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Channel? channelEntity = channel;
    final DmConversation? dmConvo = dm;
    final String? friendNickname =
        dmConvo != null && !dmConvo.isGroup && !dmConvo.isPersonalNotes
        ? ref.watch(friendNicknameProvider(dmConvo.recipientId)).value
        : null;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final title =
        channelEntity?.name ??
        dmConvo?.displayNameWith(
          friendNickname,
          l10n: l10n,
          currentUserId: currentUserId,
        ) ??
        l10n.channelDetailsFallbackTitle;
    final subtitle = _detailsSubtitle(
      l10n: l10n,
      channel: channelEntity,
      dm: dm,
    );
    final topic = channelEntity?.topic?.trim();
    final bool showUserTag = dm != null && isBotOrSystemDmRecipient(dm!);
    final hasTopic = topic != null && topic.isNotEmpty;
    final int? effectivePermissionBits = channelEntity != null
        ? ref
              .watch(
                effectiveGuildChannelPermissionBitsProvider(channelEntity.id),
              )
              .value
        : null;

    return FluxerSheetIdentityHeader(
      leading: _DetailsAvatar(channel: channelEntity, dm: dm),
      title: title,
      subtitle: subtitle,
      onClose: onClose,
      titlePrefix: switch (channelEntity) {
        null => null,
        final Channel c => ChannelIcon(
          type: c.type,
          channel: c,
          effectivePermissionBits: effectivePermissionBits,
          size: 16,
          color: context.colors.textPrimary,
        ),
      },
      titleAdornments: [if (showUserTag) FluxerUserTag(isSystem: dm!.isSystem)],
      body: hasTopic
          ? _TopicCard(
              topic: topic,
              channelId: channelEntity?.id,
              expanded: topicExpanded,
              onToggle: onToggleTopic,
            )
          : null,
    );
  }
}

class _TopicCard extends StatelessWidget {
  const _TopicCard({
    required this.topic,
    required this.channelId,
    required this.expanded,
    required this.onToggle,
  });

  final String topic;
  final String? channelId;
  final bool expanded;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: AnimatedSize(
            duration: context.motion.fast,
            curve: context.motion.curve,
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: expanded
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 60),
              child: ClipRect(
                child: MessageMarkdown(
                  data: topic,
                  channelId: channelId,
                  markdownContext: FluxerMarkdownContext.restrictedInlineReply,
                  baseStyle: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: onToggle,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: PhosphorIcon(
              expanded
                  ? PhosphorIconsBold.caretUp
                  : PhosphorIconsBold.caretDown,
              size: 16,
              color: context.colors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _DetailsAvatar extends ConsumerWidget {
  const _DetailsAvatar({required this.channel, required this.dm});

  static const double _size = 48;

  final Channel? channel;
  final DmConversation? dm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dm = this.dm;
    final channel = this.channel;
    if (dm != null) {
      if (dm.isPersonalNotes) {
        final currentUserId = ref.watch(currentUserIdProvider);
        if (currentUserId == null) {
          return const SizedBox.square(dimension: _size);
        }
        return FutureBuilder<db.User?>(
          future: ref
              .read(fluxerDatabaseProvider)
              .userDao
              .getUserById(currentUserId),
          builder: (context, snapshot) {
            final user = snapshot.data;
            return FluxerAvatar.userPresence(
              fallbackText:
                  user?.globalName ??
                  user?.username ??
                  FluxerLocalizations.of(context).channelDetailsMemberYou,
              userId: currentUserId,
              imageUrl: user?.avatar == null
                  ? null
                  : FluxerMediaUrl.userAvatar(
                      userId: currentUserId,
                      hash: user!.avatar,
                    ),
              avatarColor: user?.avatarColor,
              size: _size,
            );
          },
        );
      }
      if (dm.isGroup) {
        return groupDmAvatarCluster(
          dm: dm,
          size: _size,
          status: dm.groupStatus,
        );
      }
      return FluxerAvatar.userPresence(
        fallbackText: dm.displayNameWith(
          ref.watch(friendNicknameProvider(dm.recipientId)).value,
        ),
        userId: dm.recipientId,
        imageUrl: FluxerMediaUrl.userAvatar(
          userId: dm.recipientId,
          hash: dm.recipientAvatar,
        ),
        size: _size,
      );
    }
    if (channel != null) {
      final int? effectivePermissionBits = ref
          .watch(effectiveGuildChannelPermissionBitsProvider(channel.id))
          .value;
      return Container(
        width: _size,
        height: _size,
        decoration: BoxDecoration(
          color: context.colors.backgroundTertiary,
          borderRadius: BorderRadius.circular(_size / 2),
        ),
        child: Center(
          child: ChannelIcon(
            type: channel.type,
            channel: channel,
            effectivePermissionBits: effectivePermissionBits,
            size: _size * 0.5,
            color: context.colors.textPrimary,
          ),
        ),
      );
    }
    return const SizedBox.square(dimension: _size);
  }
}

class _MembersTab extends ConsumerWidget {
  const _MembersTab({
    required this.dm,
    required this.guildId,
    required this.channelId,
    required this.scrollController,
  });

  final DmConversation? dm;
  final String? guildId;
  final String? channelId;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (dm != null) {
      final currentUserId = ref.watch(currentUserIdProvider);
      final canShowNewGroupCta =
          !dm!.isGroup && !dm!.isPersonalNotes && !dm!.isBot && !dm!.isSystem;

      return ListView(
        controller: scrollController,
        padding: FluxerBottomSheet.scrollViewPadding(
          context,
          padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
        ),
        children: [
          if (canShowNewGroupCta)
            _NewGroupCtaRow(
              recipientHandle: dm!.recipientUsername ?? dm!.recipientName,
              onTap: () => unawaited(
                CreateDmFlow.show(
                  context,
                  options: CreateDmOptions(
                    initialSelectedUserIds: dm!.remoteRecipientIds,
                    duplicateExcludeChannelId: dm!.id,
                  ),
                ),
              ),
            ),
          _DmMemberGroups(dm: dm!, currentUserId: currentUserId),
        ],
      );
    }

    if (guildId == null || channelId == null) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(context);
      return _EmptySheetState(
        icon: PhosphorIconsBold.users,
        title: l10n.channelDetailsMembersEmptyTitle,
        body: l10n.channelDetailsMembersEmptyBody,
      );
    }
    return GuildMembersTabContent(
      guildId: guildId!,
      channelId: channelId!,
      scrollController: scrollController,
    );
  }
}

class _PinsTab extends ConsumerWidget {
  const _PinsTab({
    required this.channelId,
    required this.guildId,
    required this.scrollController,
    required this.close,
  });

  final String channelId;
  final String? guildId;
  final ScrollController scrollController;
  final VoidCallback close;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pins = ref.watch(channelPinsProvider(channelId));
    return pins.when(
      loading: () => const Center(child: FluxerLoadingSpinner()),
      error: (error, stack) => _ErrorSheetState(
        title: FluxerLocalizations.of(
          context,
        ).channelDetailsPinsLoadFailedTitle,
        onRetry: () => ref.invalidate(channelPinsProvider(channelId)),
      ),
      data: (state) {
        if (state.items.isEmpty) {
          return const _PinsEmptyState();
        }

        final FluxerLocalizations l10n = FluxerLocalizations.of(context);
        final endStateDescription = guildId != null
            ? l10n.channelDetailsPinsGuildEndHint
            : l10n.channelDetailsPinsDmEndHint;

        return ListView.builder(
          controller: scrollController,
          padding: FluxerBottomSheet.scrollViewPadding(
            context,
            padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
          ),
          itemCount:
              state.items.length +
              (state.isLoadingMore ||
                      state.errorMessage != null ||
                      !state.hasMore
                  ? 1
                  : 0),
          itemBuilder: (context, index) {
            if (index >= state.items.length) {
              if (state.errorMessage != null) {
                return _InlineRetry(
                  message: state.errorMessage!,
                  onRetry: () => ref
                      .read(channelPinsProvider(channelId).notifier)
                      .loadMore(),
                );
              }
              if (state.isLoadingMore) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: FluxerLoadingSpinner()),
                );
              }
              return _PinsEndState(description: endStateDescription);
            }
            final entry = state.items[index];
            return MessagePreviewTile(
              message: entry.message,
              guildId: guildId,
              onTap: () => _popWithJumpRequest(
                context,
                message: entry.message,
                guildId: guildId,
              ),
              onLongPress: () => _showPinnedMessageActions(
                context,
                ref,
                channelId: channelId,
                guildId: guildId,
                entry: entry,
              ),
            );
          },
        );
      },
    );
  }
}

class _PinsEmptyState extends StatelessWidget {
  const _PinsEmptyState();

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsBold.sparkle,
              size: 80,
              color: context.colors.textPrimaryMuted,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.channelPinsEmptyTitle,
              style: context.textStyles.heading.copyWith(
                color: context.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              l10n.channelPinsEmptyDescription,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _PinsEndState extends StatelessWidget {
  const _PinsEndState({required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsFill.flagCheckered,
              size: 48,
              color: context.colors.textPrimaryMuted,
            ),
            const SizedBox(height: 8),
            Text(
              FluxerLocalizations.of(context).channelDetailsPinsEndReached,
              style: context.textStyles.heading.copyWith(
                color: context.colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                description,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textPrimaryMuted,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChannelSearchSheet extends ConsumerStatefulWidget {
  const ChannelSearchSheet({
    required this.channelId,
    required this.guildId,
    required this.scrollController,
    required this.close,
    this.channel,
    this.dm,
    super.key,
  });

  final String channelId;
  final String? guildId;
  final Channel? channel;
  final DmConversation? dm;
  final ScrollController scrollController;
  final VoidCallback close;

  @override
  ConsumerState<ChannelSearchSheet> createState() => _ChannelSearchSheetState();
}

class _ChannelSearchSheetState extends ConsumerState<ChannelSearchSheet> {
  late final TextEditingController _textController;
  late final FocusNode _focusNode;
  final Set<String> _selectedAuthorIds = <String>{};
  final Map<String, String> _selectedAuthorNames = <String, String>{};
  final Map<String, String> _userIdsByTag = <String, String>{};

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _focusNode = FocusNode();
    widget.scrollController.addListener(_onScroll);
    _textController.addListener(_onTextChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    _textController
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {});
  }

  void _onScroll() {
    final ScrollPosition position = widget.scrollController.position;
    if (position.pixels >=
        position.maxScrollExtent - _kSheetLoadMoreThreshold) {
      unawaited(
        ref
            .read(
              channelSearchProvider(widget.channelId, widget.guildId).notifier,
            )
            .loadMore(),
      );
    }
  }

  String get _authorIdsValue => _selectedAuthorIds.join(',');

  String? get _authorChipValue {
    if (_selectedAuthorIds.isEmpty) {
      return null;
    }
    if (_selectedAuthorIds.length == 1) {
      final String id = _selectedAuthorIds.first;
      return _selectedAuthorNames[id] ?? id;
    }
    return '${_selectedAuthorIds.length} users';
  }

  void _setAuthorSelection(List<_PickerUser> selectedUsers) {
    setState(() {
      _selectedAuthorIds
        ..clear()
        ..addAll(selectedUsers.map((_PickerUser u) => u.id));
      _selectedAuthorNames
        ..clear()
        ..addEntries(
          selectedUsers.map(
            (_PickerUser u) => MapEntry<String, String>(u.id, u.displayName),
          ),
        );
      _userIdsByTag
        ..clear()
        ..addEntries(
          selectedUsers.map(
            (_PickerUser u) => MapEntry<String, String>(u.username, u.id),
          ),
        );
    });
    _runSearch();
  }

  void _clearAuthorSelection() {
    setState(() {
      _selectedAuthorIds.clear();
      _selectedAuthorNames.clear();
      _userIdsByTag.clear();
    });
    _runSearch();
  }

  String? _resolveChannelName(String channelName) {
    final String? guildId = widget.guildId;
    if (guildId == null) {
      return null;
    }
    final String normalized = channelName.toLowerCase();
    final List<ChannelCategory> categories = ref
        .read(channelListViewModelProvider)
        .categories;
    for (final ChannelCategory category in categories) {
      for (final Channel channel in category.channels) {
        if (channel.name.toLowerCase() == normalized) {
          return channel.id;
        }
      }
    }
    for (final ChannelCategory category in categories) {
      for (final Channel channel in category.channels) {
        if (channel.name.toLowerCase().contains(normalized)) {
          return channel.id;
        }
      }
    }
    return null;
  }

  MessageSearchQuery _buildSearchQuery({
    MessageSearchScopeFilter? scope,
    MessageSearchSortFilter? sort,
    Set<MessageSearchContentFilter>? contentTypes,
  }) {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    return MessageSearchQuery.build(
      channelId: widget.channelId,
      guildId: widget.guildId,
      rawQuery: _textController.text,
      uiScope: scope ?? state.query.uiScope,
      uiSort: sort ?? state.query.uiSort,
      hints: ChannelSearchParseHints(usersByTag: _userIdsByTag),
      context: ChannelSearchParseContext(
        guildId: widget.guildId,
        currentUserId: ref.read(currentUserIdProvider),
        resolveChannelByName: _resolveChannelName,
      ),
      chipAuthorId: _authorIdsValue.isEmpty ? null : _authorIdsValue,
      chipContentTypes: contentTypes ?? state.query.contentTypes,
    );
  }

  void _runSearch() {
    final MessageSearchQuery query = _buildSearchQuery();
    if (!query.hasSearchTerms) {
      return;
    }
    unawaited(
      ref
          .read(
            channelSearchProvider(widget.channelId, widget.guildId).notifier,
          )
          .search(query: query),
    );
    unawaited(_saveSearchHistory(query));
  }

  Future<void> _saveSearchHistory(MessageSearchQuery query) async {
    final AsyncValue<ChannelSearchHistoryRepository> repoAsync = ref.read(
      channelSearchHistoryRepositoryProvider,
    );
    final ChannelSearchHistoryRepository? repo = repoAsync.value;
    if (repo == null) {
      return;
    }
    await repo.addEntry(
      ChannelSearchHistoryEntry(
        contextKey: channelSearchContextKey(
          channelId: widget.channelId,
          guildId: widget.guildId,
        ),
        displayText: _textController.text,
        authorId: query.authorId,
        scopeIndex: query.uiScope.index,
        sortIndex: query.uiSort.index,
        contentTypeIndices: query.contentTypes
            .map((MessageSearchContentFilter f) => f.index)
            .toList(),
        timestampMs: DateTime.now().millisecondsSinceEpoch,
      ),
    );
  }

  void _clearAll() {
    _textController.clear();
    setState(() {
      _selectedAuthorIds.clear();
      _selectedAuthorNames.clear();
      _userIdsByTag.clear();
    });
    _updateFilters(
      scope: MessageSearchScopeFilter.current,
      sort: MessageSearchSortFilter.newest,
      contentTypes: const <MessageSearchContentFilter>{},
    );
  }

  bool get _hasActiveFilters {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    return _selectedAuthorIds.isNotEmpty ||
        state.query.uiScope != MessageSearchScopeFilter.current ||
        state.query.uiSort != MessageSearchSortFilter.newest ||
        state.query.contentTypes.isNotEmpty;
  }

  bool get _canSearch {
    if (_textController.text.trim().isNotEmpty || _hasActiveFilters) {
      return true;
    }
    return _buildSearchQuery().hasSearchTerms;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ChannelSearchState state = ref.watch(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    final bool hasContent = _textController.text.isNotEmpty;
    final bool hasAuthorFilter = _selectedAuthorIds.isNotEmpty;
    final bool scopeIsCustom =
        state.query.uiScope != MessageSearchScopeFilter.current;
    final bool hasContentFilter = state.query.contentTypes.isNotEmpty;
    final String? hasChipValue = _hasChipValue(l10n, state.query.contentTypes);
    final bool showResultCount =
        state.hasSearched && !state.isSearching && state.total > 0;
    final bool showClear = hasContent || _hasActiveFilters;

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
          child: Column(
            children: <Widget>[
              FluxerInput(
                controller: _textController,
                focusNode: _focusNode,
                hint: l10n.channelDetailsSearchHint,
                prefixIcon: const PhosphorIcon(
                  PhosphorIconsBold.magnifyingGlass,
                ),
                suffixIcon: showClear
                    ? const PhosphorIcon(PhosphorIconsBold.x)
                    : null,
                onSuffixTap: showClear ? _clearAll : null,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => _runSearch(),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  _SearchFilterChip(
                    label: l10n.channelDetailsSearchFilterFrom,
                    value: _authorChipValue,
                    icon: PhosphorIconsFill.user,
                    isActive: hasAuthorFilter,
                    onTap: _openFromSheet,
                    onRemove: hasAuthorFilter ? _clearAuthorSelection : null,
                  ),
                  _SearchFilterChip(
                    label: l10n.channelDetailsSearchFilterHas,
                    value: hasChipValue,
                    icon: PhosphorIconsFill.funnel,
                    isActive: hasContentFilter,
                    onTap: _openHasSheet,
                    onRemove: hasContentFilter
                        ? () => _updateFilters(
                            contentTypes: const <MessageSearchContentFilter>{},
                          )
                        : null,
                  ),
                  _SearchFilterChip(
                    label: l10n.channelDetailsSearchFilterSort,
                    value: channelSearchSortLabel(l10n, state.query.sort),
                    icon: channelSearchSortIcon(state.query.sort),
                    onTap: _openSortSheet,
                  ),
                  _SearchFilterChip(
                    label: channelSearchScopeLabel(
                      l10n,
                      state.query.uiScope,
                      isGuildChannel: widget.guildId != null,
                    ),
                    icon: channelSearchScopeIcon(state.query.uiScope),
                    isActive: scopeIsCustom,
                    onTap: _openScopeSheet,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FluxerButton.primary(
                  label: l10n.channelDetailsActionSearch,
                  onPressed: _canSearch ? _runSearch : null,
                ),
              ),
              if (showResultCount) ...<Widget>[
                const SizedBox(height: 8),
                Text(
                  l10n.channelDetailsSearchResultCount(state.total),
                  style: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        ),
        Expanded(child: _buildResults(context, state)),
      ],
    );
  }

  void _updateFilters({
    MessageSearchScopeFilter? scope,
    MessageSearchSortFilter? sort,
    Set<MessageSearchContentFilter>? contentTypes,
  }) {
    final MessageSearchQuery query = _buildSearchQuery(
      scope: scope,
      sort: sort,
      contentTypes: contentTypes,
    );
    unawaited(
      ref
          .read(
            channelSearchProvider(widget.channelId, widget.guildId).notifier,
          )
          .search(query: query),
    );
  }

  String? _hasChipValue(
    FluxerLocalizations l10n,
    Set<MessageSearchContentFilter> contentTypes,
  ) {
    if (contentTypes.isEmpty) {
      return null;
    }
    if (contentTypes.length == 1) {
      return channelSearchContentLabel(l10n, contentTypes.first);
    }
    return l10n.channelDetailsSearchContentTypesCount(contentTypes.length);
  }

  Future<void> _openFromSheet() async {
    final String? guildId = widget.guildId;
    if (!mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<_PickerUser>? selected =
        await FluxerBottomSheet.showScrollable<List<_PickerUser>>(
          context,
          title: l10n.channelDetailsSearchFilterByUser,
          initialChildSize: 0.85,
          minChildSize: 0.5,
          builder: (sheetContext, scrollController, close) {
            if (guildId != null) {
              return _GuildUserSearchFilterSheet(
                guildId: guildId,
                initialSelectedIds: _selectedAuthorIds,
                scrollController: scrollController,
                onDone: (List<_PickerUser> chosen) =>
                    Navigator.of(sheetContext).pop(chosen),
              );
            }
            return _DmUserFilterSheetLoader(
              channelId: widget.channelId,
              initialSelectedIds: _selectedAuthorIds,
              scrollController: scrollController,
              onDone: (List<_PickerUser> chosen) =>
                  Navigator.of(sheetContext).pop(chosen),
            );
          },
        );
    if (selected != null) {
      _setAuthorSelection(selected);
    }
  }

  Future<void> _openHasSheet() async {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Set<MessageSearchContentFilter>? selected =
        await FluxerBottomSheet.showScrollable<Set<MessageSearchContentFilter>>(
          context,
          title: l10n.channelDetailsSearchFilterByContent,
          initialChildSize: 0.85,
          minChildSize: 0.5,
          builder: (sheetContext, scrollController, close) => _HasFilterSheet(
            initialSelected: state.query.contentTypes,
            scrollController: scrollController,
            onDone: (Set<MessageSearchContentFilter> chosen) =>
                Navigator.of(sheetContext).pop(chosen),
          ),
        );
    if (selected != null) {
      _updateFilters(contentTypes: selected);
    }
  }

  Future<void> _openSortSheet() async {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MessageSearchSortFilter? selected =
        await FluxerBottomSheet.show<MessageSearchSortFilter>(
          context,
          title: l10n.channelDetailsSearchSortBy,
          builder: (sheetContext, close) => FluxerBottomSheetContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (final MessageSearchSortFilter value
                    in MessageSearchSortFilter.values) ...<Widget>[
                  _SearchOptionCard(
                    icon: channelSearchSortIcon(value),
                    label: channelSearchSortLabel(l10n, value),
                    description: channelSearchSortDescription(l10n, value),
                    isSelected: state.query.sort == value,
                    onTap: () => Navigator.of(sheetContext).pop(value),
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        );
    if (selected != null) {
      _updateFilters(sort: selected);
    }
  }

  Future<void> _openScopeSheet() async {
    final ChannelSearchState state = ref.read(
      channelSearchProvider(widget.channelId, widget.guildId),
    );
    final bool isGuildChannel = widget.guildId != null;
    final List<MessageSearchScopeFilter> options = channelSearchScopeOptions(
      isGuildChannel: isGuildChannel,
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MessageSearchScopeFilter? selected =
        await FluxerBottomSheet.show<MessageSearchScopeFilter>(
          context,
          title: l10n.channelDetailsSearchIn,
          builder: (sheetContext, close) => FluxerBottomSheetContent(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                for (final MessageSearchScopeFilter value
                    in options) ...<Widget>[
                  _SearchOptionCard(
                    icon: channelSearchScopeIcon(value),
                    label: channelSearchScopeLabel(
                      l10n,
                      value,
                      isGuildChannel: isGuildChannel,
                    ),
                    description: channelSearchScopeDescription(
                      l10n,
                      value,
                      isGuildChannel: isGuildChannel,
                    ),
                    isSelected: state.query.uiScope == value,
                    onTap: () => Navigator.of(sheetContext).pop(value),
                  ),
                  const SizedBox(height: 8),
                ],
              ],
            ),
          ),
        );
    if (selected != null) {
      _updateFilters(scope: selected);
    }
  }

  void _retrySearch() => _runSearch();

  Widget _buildResults(BuildContext context, ChannelSearchState state) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (!state.hasSearched) {
      return _scrollableSheetPlaceholder(
        context,
        widget.scrollController,
        _EmptySheetState(
          icon: PhosphorIconsBold.magnifyingGlass,
          title: l10n.channelDetailsSearchEmptyTitle,
          body: l10n.channelDetailsSearchEmptyBody,
        ),
      );
    }
    if (state.isSearching) {
      return _scrollableSheetPlaceholder(
        context,
        widget.scrollController,
        const Center(child: FluxerLoadingSpinner()),
      );
    }
    if (state.errorMessage != null) {
      return _scrollableSheetPlaceholder(
        context,
        widget.scrollController,
        _ErrorSheetState(title: state.errorMessage!, onRetry: _retrySearch),
      );
    }
    if (state.indexing) {
      return _scrollableSheetPlaceholder(
        context,
        widget.scrollController,
        _EmptySheetState(
          icon: PhosphorIconsBold.clockCounterClockwise,
          title: l10n.channelDetailsSearchIndexingTitle,
          body: l10n.channelDetailsSearchIndexingBody,
        ),
      );
    }
    if (state.results.isEmpty) {
      return _scrollableSheetPlaceholder(
        context,
        widget.scrollController,
        _EmptySheetState(
          icon: PhosphorIconsBold.magnifyingGlass,
          title: l10n.channelDetailsSearchNoResultsTitle,
          body: l10n.channelDetailsSearchNoResultsBody,
        ),
      );
    }

    return ListView.builder(
      controller: widget.scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: EdgeInsets.symmetric(horizontal: context.layout.s3),
      ),
      itemCount: state.results.length + (state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= state.results.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: FluxerLoadingSpinner()),
          );
        }
        final entry = state.results[index];
        final label = entry.channelName == null
            ? _formatDate(entry.message.timestamp)
            : '#${entry.channelName} - ${_formatDate(entry.message.timestamp)}';
        return MessagePreviewTile(
          message: entry.message,
          label: label,
          guildId: entry.guildId,
          onTap: () => _popWithJumpRequest(
            context,
            message: entry.message,
            guildId: entry.guildId,
          ),
          onLongPress: () =>
              _showSearchMessageActions(context, ref, entry: entry),
        );
      },
    );
  }
}

class MessagePreviewTile extends StatelessWidget {
  const MessagePreviewTile({
    required this.message,
    required this.onTap,
    this.label,
    this.onLongPress,
    this.guildId,
    super.key,
  });

  final Message message;
  final String? label;
  final String? guildId;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final hasLabel = label != null && label!.isNotEmpty;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: context.colors.backgroundModifierHover,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasLabel)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 4),
                    child: Text(
                      label!,
                      style: context.textStyles.timestamp.copyWith(
                        color: context.colors.textTertiary,
                      ),
                    ),
                  ),
                MessageItem(
                  message: message,
                  inboxPreviewMode: true,
                  hideMentionHighlight: true,
                  previewRoleGuildId: guildId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DmMemberGroups extends ConsumerWidget {
  const _DmMemberGroups({required this.dm, required this.currentUserId});

  final DmConversation dm;
  final String? currentUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? userId = currentUserId;
    if (userId == null) {
      return const SizedBox.shrink();
    }
    final db.User? currentUser = ref.watch(userPresenceProvider(userId)).value;
    final Map<String, String?> friendNicknameById = friendNicknamesById(
      ref.watch(friendsListProvider).value ?? const <Friend>[],
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<_DmParticipant> participants = _buildDmParticipants(
      dm: dm,
      currentUserId: userId,
      currentUser: currentUser,
      friendNicknameById: friendNicknameById,
      youLabel: l10n.channelDetailsMemberYou,
    );
    final Map<String, db.User?> presenceById = <String, db.User?>{
      for (final _DmParticipant participant in participants)
        participant.id: participant.id == userId
            ? currentUser
            : ref.watch(userPresenceProvider(participant.id)).value,
    };
    String resolveStatus(String id) => presenceById[id]?.status ?? 'offline';
    final List<GroupDmMemberGroup<_DmParticipant>> groups =
        groupDmMembersByPresence<_DmParticipant>(
          members: participants,
          resolveUserId: (_DmParticipant p) => p.id,
          resolveDisplayName: (_DmParticipant p) => p.name,
          resolveStatus: resolveStatus,
          onlineHeader: l10n.channelDetailsMembersOnline,
          offlineHeader: l10n.channelDetailsMembersOffline,
        );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (final GroupDmMemberGroup<_DmParticipant> group in groups)
          FluxerListSection(
            header: group.displayName,
            children: <Widget>[
              for (final _DmParticipant participant in group.members)
                _SimpleMemberRow(
                  userId: participant.id,
                  name: participant.name,
                  avatarUrl: participant.avatar == null
                      ? null
                      : FluxerMediaUrl.userAvatar(
                          userId: participant.id,
                          hash: participant.avatar,
                        ),
                  avatarColor: participant.avatarColor,
                  status: resolveStatus(participant.id),
                  customStatus: presenceById[participant.id]?.customStatus,
                  isBot: participant.isBot,
                  isSystem: participant.isSystem,
                  isCurrentUser: participant.isCurrentUser,
                  onTap: () => FluxerUserProfileSheet.show(
                    context,
                    userId: participant.id,
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

List<_DmParticipant> _buildDmParticipants({
  required DmConversation dm,
  required String currentUserId,
  required db.User? currentUser,
  required Map<String, String?> friendNicknameById,
  required String youLabel,
}) {
  final List<_DmParticipant> participants = <_DmParticipant>[];
  final Set<String> addedIds = <String>{};

  String withFriendNickname(String userId, String fallback) {
    final String? nickname = friendNicknameById[userId]?.trim();
    return nickname != null && nickname.isNotEmpty ? nickname : fallback;
  }

  String withMemberDisplayName(String userId, String fallback) {
    final String? channelNick = dm.channelNicks[userId]?.trim();
    if (channelNick != null && channelNick.isNotEmpty) {
      return channelNick;
    }
    return withFriendNickname(userId, fallback);
  }

  void add(_DmParticipant participant) {
    if (participant.id.isEmpty || !addedIds.add(participant.id)) {
      return;
    }
    participants.add(participant);
  }

  add(
    _DmParticipant(
      id: currentUserId,
      name: currentUser?.globalName ?? currentUser?.username ?? youLabel,
      avatar: currentUser?.avatar,
      avatarColor: currentUser?.avatarColor,
      isBot: currentUser?.bot ?? false,
      isSystem: currentUser?.system ?? false,
      isCurrentUser: true,
    ),
  );

  if (dm.isPersonalNotes) {
    return participants;
  }

  if (dm.isGroup) {
    for (final GroupMemberInfo member in dm.groupMembers) {
      final String name = member.name.trim();
      add(
        _DmParticipant(
          id: member.id,
          name: withMemberDisplayName(
            member.id,
            name.isEmpty ? member.id : member.name,
          ),
          avatar: member.avatar,
        ),
      );
    }
    return participants;
  }

  add(
    _DmParticipant(
      id: dm.recipientId,
      name: withFriendNickname(
        dm.recipientId,
        dm.recipientName.trim().isEmpty ? dm.recipientId : dm.recipientName,
      ),
      avatar: dm.recipientAvatar,
      isBot: dm.isBot,
      isSystem: dm.isSystem,
    ),
  );
  return participants;
}

class _DmParticipant {
  const _DmParticipant({
    required this.id,
    required this.name,
    this.avatar,
    this.avatarColor,
    this.isBot = false,
    this.isSystem = false,
    this.isCurrentUser = false,
  });

  final String id;
  final String name;
  final String? avatar;
  final int? avatarColor;
  final bool isBot;
  final bool isSystem;
  final bool isCurrentUser;
}

class _SimpleMemberRow extends StatelessWidget {
  const _SimpleMemberRow({
    required this.userId,
    required this.name,
    this.avatarUrl,
    this.avatarColor,
    this.status = 'offline',
    this.isBot = false,
    this.isSystem = false,
    this.isCurrentUser = false,
    this.onTap,
    this.customStatus,
  });

  final String userId;
  final String name;
  final String? avatarUrl;
  final int? avatarColor;
  final String status;
  final bool isBot;
  final bool isSystem;
  final bool isCurrentUser;
  final String? customStatus;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FluxerListRow(
      leading: FluxerAvatar.userPresence(
        fallbackText: name,
        userId: userId,
        imageUrl: avatarUrl,
        avatarColor: avatarColor,
        size: 36,
      ),
      title: name,
      subtitle: hasVisibleCustomStatus(customStatus) ? null : customStatus,
      subtitleWidget: hasVisibleCustomStatus(customStatus)
          ? CustomStatusDisplay(stored: customStatus, maxLines: 1)
          : null,
      onTap: onTap,
      titleAdornments: [
        if (isCurrentUser)
          _MemberTag(
            label: FluxerLocalizations.of(context).channelDetailsMemberYou,
          ),
        if (isBot || isSystem) FluxerUserTag(isSystem: isSystem),
      ],
    );
  }
}

class _MemberTag extends StatelessWidget {
  const _MemberTag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: context.colors.brandPrimary.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: context.textStyles.smallText.copyWith(
          color: context.colors.brandPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _NewGroupCtaRow extends StatelessWidget {
  const _NewGroupCtaRow({required this.recipientHandle, required this.onTap});

  final String recipientHandle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 24),
      child: Material(
        color: colors.backgroundSecondaryAlt,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.brandPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: PhosphorIcon(
                      PhosphorIconsFill.chatCircle,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.createDmNewGroup,
                        style: context.textStyles.username.copyWith(
                          color: colors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.createDmCreateGroupWithRecipient(recipientHandle),
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textTertiary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                PhosphorIcon(
                  PhosphorIconsBold.caretRight,
                  size: 20,
                  color: colors.textTertiary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SearchFilterChip extends StatelessWidget {
  const _SearchFilterChip({
    required this.label,
    required this.onTap,
    this.value,
    this.icon,
    this.isActive = false,
    this.onRemove,
  });

  final String label;
  final String? value;
  final IconData? icon;
  final bool isActive;
  final VoidCallback onTap;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final background = isActive
        ? colors.brandPrimary
        : colors.backgroundSecondaryAlt;
    final borderColor = isActive ? colors.brandPrimary : colors.borderColor;
    final labelColor = isActive ? Colors.white : colors.textSecondary;
    final valueColor = isActive ? Colors.white : colors.textPrimary;
    final iconColor = isActive ? Colors.white : colors.textSecondary;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                PhosphorIcon(icon!, size: 14, color: iconColor),
                const SizedBox(width: 6),
              ],
              Text(
                label,
                style: context.textStyles.label.copyWith(
                  color: labelColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (value != null && value!.isNotEmpty) ...[
                const SizedBox(width: 4),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    value!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: context.textStyles.label.copyWith(color: valueColor),
                  ),
                ),
              ],
              if (isActive && onRemove != null) ...[
                const SizedBox(width: 6),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onRemove,
                  child: const PhosphorIcon(
                    PhosphorIconsBold.x,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchOptionCard extends StatelessWidget {
  const _SearchOptionCard({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.description,
  });

  final IconData icon;
  final String label;
  final String? description;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final accent = colors.brandPrimaryLight;
    final background = isSelected
        ? accent.withValues(alpha: 0.10)
        : colors.backgroundTertiary;
    final borderColor = isSelected ? accent : colors.borderColor;
    final iconColor = isSelected ? accent : colors.textSecondary;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              PhosphorIcon(icon, size: 22, color: iconColor),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style:
                          (isSelected
                                  ? context.textStyles.channelName
                                  : context.textStyles.bodyMedium)
                              .copyWith(color: colors.textPrimary),
                    ),
                    if (description != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        description!,
                        style: context.textStyles.bodySmall.copyWith(
                          fontSize: 13,
                          height: 1.2,
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 12),
                PhosphorIcon(PhosphorIconsBold.check, size: 20, color: accent),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _PickerUser {
  const _PickerUser({
    required this.id,
    required this.username,
    required this.displayName,
    required this.discriminator,
    this.avatar,
    this.avatarColor,
    this.status = 'offline',
  });

  factory _PickerUser.fromUserRow(db.User user, {String? nick}) {
    final display =
        nick ??
        user.globalName ??
        (user.username.isNotEmpty ? user.username : user.id);
    return _PickerUser(
      id: user.id,
      username: user.username,
      displayName: display,
      discriminator: user.discriminator,
      avatar: user.avatar,
      avatarColor: user.avatarColor,
      status: user.status,
    );
  }

  factory _PickerUser.fromMember(
    Member member, {
    required String discriminator,
  }) {
    return _PickerUser(
      id: member.id,
      username: member.username,
      displayName: member.displayName,
      discriminator: discriminator,
      avatar: member.avatar,
      avatarColor: member.avatarColor,
      status: member.status,
    );
  }

  final String id;
  final String username;
  final String displayName;
  final String discriminator;
  final String? avatar;
  final int? avatarColor;
  final String status;

  String get tag {
    if (username.isEmpty) {
      return '@$id';
    }
    final String? visibleDiscriminator = _visibleDiscriminator(discriminator);
    if (visibleDiscriminator == null) {
      return '@$username';
    }
    return '@$username#$visibleDiscriminator';
  }
}

String? _visibleDiscriminator(String discriminator) {
  final String trimmed = discriminator.trim();
  if (trimmed.isEmpty || trimmed == '0') {
    return null;
  }
  return trimmed;
}

const Duration _kUserFilterSearchDebounce = Duration(milliseconds: 300);

class _DmUserFilterSheetLoader extends ConsumerStatefulWidget {
  const _DmUserFilterSheetLoader({
    required this.channelId,
    required this.initialSelectedIds,
    required this.scrollController,
    required this.onDone,
  });

  final String channelId;
  final Set<String> initialSelectedIds;
  final ScrollController scrollController;
  final ValueChanged<List<_PickerUser>> onDone;

  @override
  ConsumerState<_DmUserFilterSheetLoader> createState() =>
      _DmUserFilterSheetLoaderState();
}

class _DmUserFilterSheetLoaderState
    extends ConsumerState<_DmUserFilterSheetLoader> {
  late final Future<List<_PickerUser>> _usersFuture;

  @override
  void initState() {
    super.initState();
    _usersFuture = _loadDmCandidates();
  }

  Future<List<_PickerUser>> _loadDmCandidates() async {
    final db.FluxerDatabase database = ref.read(fluxerDatabaseProvider);
    final db.DmChannel? dmRow = await database.dmChannelDao.getDmChannelById(
      widget.channelId,
    );
    final Set<String> ids = <String>{};
    if (dmRow != null) {
      try {
        final Object? raw = jsonDecode(dmRow.recipientIds);
        if (raw is List<dynamic>) {
          for (final Object? entry in raw) {
            if (entry is String && entry.isNotEmpty) {
              ids.add(entry);
            }
          }
        }
      } on FormatException {
        // Ignore malformed cache; falls back to recipientId only.
      }
      if (dmRow.recipientId.isNotEmpty) {
        ids.add(dmRow.recipientId);
      }
    }
    final List<db.User> users = await database.userDao.getUsersByIds(
      ids.toList(),
    );
    final List<_PickerUser> pickers =
        <_PickerUser>[
          for (final db.User user in users) _PickerUser.fromUserRow(user),
        ]..sort(
          (a, b) => a.displayName.toLowerCase().compareTo(
            b.displayName.toLowerCase(),
          ),
        );
    return pickers;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<_PickerUser>>(
      future: _usersFuture,
      builder: (BuildContext context, AsyncSnapshot<List<_PickerUser>> snap) {
        if (!snap.hasData) {
          return _scrollableSheetPlaceholder(
            context,
            widget.scrollController,
            const Center(child: FluxerLoadingSpinner()),
          );
        }
        return _UserFilterSheet(
          availableUsers: snap.data!,
          initialSelectedIds: widget.initialSelectedIds,
          scrollController: widget.scrollController,
          onDone: widget.onDone,
        );
      },
    );
  }
}

class _GuildUserSearchFilterSheet extends ConsumerStatefulWidget {
  const _GuildUserSearchFilterSheet({
    required this.guildId,
    required this.initialSelectedIds,
    required this.scrollController,
    required this.onDone,
  });

  final String guildId;
  final Set<String> initialSelectedIds;
  final ScrollController scrollController;
  final ValueChanged<List<_PickerUser>> onDone;

  @override
  ConsumerState<_GuildUserSearchFilterSheet> createState() =>
      _GuildUserSearchFilterSheetState();
}

class _GuildUserSearchFilterSheetState
    extends ConsumerState<_GuildUserSearchFilterSheet> {
  late final TextEditingController _searchController;
  late final Map<String, _PickerUser> _selectedById;
  List<_PickerUser> _results = <_PickerUser>[];
  bool _isLoading = false;
  String _searchTerm = '';
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _selectedById = <String, _PickerUser>{
      for (final String id in widget.initialSelectedIds)
        id: _PickerUser(
          id: id,
          username: '',
          displayName: id,
          discriminator: '',
        ),
    };
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() => _searchTerm = _searchController.text);
    _searchDebounce?.cancel();
    _searchDebounce = Timer(_kUserFilterSearchDebounce, () {
      unawaited(_fetchUsers(_searchTerm.trim()));
    });
  }

  Future<void> _fetchUsers(String query) async {
    if (query.isEmpty) {
      if (mounted) {
        setState(() {
          _results = <_PickerUser>[];
          _isLoading = false;
        });
      }
      return;
    }
    if (mounted) {
      setState(() => _isLoading = true);
    }
    List<_PickerUser> pickers = <_PickerUser>[];
    try {
      final ParsedMentionQuery parsed = parseMentionQuery(query);
      final String searchQuery = parsed.usernameQuery.trim();
      final ParsedMentionQuery rankingQuery =
          parsed.hasTagSeparator &&
              searchQuery.isNotEmpty &&
              (parsed.tagQuery ?? '').trim().isEmpty
          ? parseMentionQuery(searchQuery)
          : parsed;
      final GuildMentionMemberSearch search = ref.read(
        guildMentionMemberSearchProvider,
      );
      List<Member> members = await search.searchCached(
        guildId: widget.guildId,
        parsed: rankingQuery,
      );
      if (searchQuery.isNotEmpty &&
          await search.shouldFetchFromGateway(widget.guildId, searchQuery)) {
        members = (await search.fetchGatewayAndMerge(
          guildId: widget.guildId,
          query: searchQuery,
          parsed: rankingQuery,
        )).members;
      }
      final Map<String, String> discriminatorByUserId = await search
          .discriminatorsFor(members);
      pickers = members
          .map(
            (Member member) => _PickerUser.fromMember(
              member,
              discriminator:
                  _visibleDiscriminator(
                    discriminatorByUserId[member.id] ?? '',
                  ) ??
                  '',
            ),
          )
          .toList();
    } on Object {
      pickers = <_PickerUser>[];
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _results = pickers;
      _isLoading = false;
    });
  }

  void _toggle(_PickerUser user) {
    setState(() {
      if (_selectedById.containsKey(user.id)) {
        _selectedById.remove(user.id);
      } else {
        _selectedById[user.id] = user;
      }
    });
  }

  List<_PickerUser> _selectionForResult() => _selectedById.values.toList();

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    return Padding(
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
      child: Column(
        children: <Widget>[
          FluxerInput(
            controller: _searchController,
            hint: l10n.channelDetailsSearchUsersHint,
            prefixIcon: const PhosphorIcon(PhosphorIconsBold.magnifyingGlass),
            suffixIcon: _searchTerm.isNotEmpty
                ? const PhosphorIcon(PhosphorIconsBold.x)
                : null,
            onSuffixTap: _searchTerm.isNotEmpty
                ? () {
                    _searchController.clear();
                  }
                : null,
            textInputAction: TextInputAction.search,
            autofocus: true,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: _searchTerm.trim().isEmpty
                ? _scrollableSheetPlaceholder(
                    context,
                    widget.scrollController,
                    Center(
                      child: Text(
                        l10n.channelDetailsSearchUsersTypeToSearch,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                  )
                : _isLoading
                ? _scrollableSheetPlaceholder(
                    context,
                    widget.scrollController,
                    const Center(child: FluxerLoadingSpinner()),
                  )
                : _results.isEmpty
                ? _scrollableSheetPlaceholder(
                    context,
                    widget.scrollController,
                    Center(
                      child: Text(
                        l10n.channelDetailsSearchUsersEmpty,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    controller: widget.scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: FluxerBottomSheet.scrollViewPadding(
                      context,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    itemCount: _results.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 4),
                    itemBuilder: (BuildContext context, int index) {
                      final _PickerUser user = _results[index];
                      final bool isSelected = _selectedById.containsKey(
                        user.id,
                      );
                      return _UserFilterRow(
                        user: user,
                        isSelected: isSelected,
                        onTap: () => _toggle(user),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FluxerButton.primary(
              label: l10n.channelDetailsDone,
              onPressed: () => widget.onDone(_selectionForResult()),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserFilterSheet extends StatefulWidget {
  const _UserFilterSheet({
    required this.availableUsers,
    required this.initialSelectedIds,
    required this.scrollController,
    required this.onDone,
  });

  final List<_PickerUser> availableUsers;
  final Set<String> initialSelectedIds;
  final ScrollController scrollController;
  final ValueChanged<List<_PickerUser>> onDone;

  @override
  State<_UserFilterSheet> createState() => _UserFilterSheetState();
}

class _UserFilterSheetState extends State<_UserFilterSheet> {
  late final TextEditingController _searchController;
  late final Set<String> _selectedIds;
  String _searchTerm = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _selectedIds = <String>{...widget.initialSelectedIds};
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() => _searchTerm = _searchController.text);
  }

  void _toggle(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  List<_PickerUser> get _filteredUsers {
    final q = _searchTerm.trim().toLowerCase();
    if (q.isEmpty) {
      return widget.availableUsers;
    }
    return [
      for (final user in widget.availableUsers)
        if (user.displayName.toLowerCase().contains(q) ||
            user.username.toLowerCase().contains(q) ||
            user.tag.toLowerCase().contains(q))
          user,
    ];
  }

  List<_PickerUser> _selectionForResult() {
    final byId = {for (final u in widget.availableUsers) u.id: u};
    return [
      for (final id in _selectedIds)
        if (byId[id] != null)
          byId[id]!
        else
          _PickerUser(id: id, username: '', displayName: id, discriminator: ''),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final filtered = _filteredUsers;

    return Padding(
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
      child: Column(
        children: [
          FluxerInput(
            controller: _searchController,
            hint: l10n.channelDetailsSearchUsersHint,
            prefixIcon: const PhosphorIcon(PhosphorIconsBold.magnifyingGlass),
            suffixIcon: _searchTerm.isNotEmpty
                ? const PhosphorIcon(PhosphorIconsBold.x)
                : null,
            onSuffixTap: _searchTerm.isNotEmpty
                ? () {
                    _searchController.clear();
                  }
                : null,
            textInputAction: TextInputAction.search,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: filtered.isEmpty
                ? _scrollableSheetPlaceholder(
                    context,
                    widget.scrollController,
                    Center(
                      child: Text(
                        _searchTerm.isNotEmpty
                            ? l10n.channelDetailsSearchUsersEmpty
                            : l10n.channelDetailsSearchUsersNoAvailable,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ),
                  )
                : ListView.separated(
                    controller: widget.scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: FluxerBottomSheet.scrollViewPadding(
                      context,
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    itemCount: filtered.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 4),
                    itemBuilder: (context, index) {
                      final user = filtered[index];
                      final isSelected = _selectedIds.contains(user.id);
                      return _UserFilterRow(
                        user: user,
                        isSelected: isSelected,
                        onTap: () => _toggle(user.id),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FluxerButton.primary(
              label: l10n.channelDetailsDone,
              onPressed: () => widget.onDone(_selectionForResult()),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserFilterRow extends StatelessWidget {
  const _UserFilterRow({
    required this.user,
    required this.isSelected,
    required this.onTap,
  });

  final _PickerUser user;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final accent = colors.brandPrimaryLight;
    final background = isSelected
        ? accent.withValues(alpha: 0.10)
        : Colors.transparent;
    final borderColor = isSelected ? accent : colors.borderColor;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              FluxerAvatar.user(
                imageUrl: FluxerMediaUrl.userAvatar(
                  userId: user.id,
                  hash: user.avatar,
                ),
                fallbackText: user.displayName,
                avatarColor: user.avatarColor,
                size: 36,
                showStatus: false,
                userId: user.id,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      user.displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          (isSelected
                                  ? context.textStyles.channelName
                                  : context.textStyles.username)
                              .copyWith(
                                fontSize: 15,
                                color: colors.textPrimary,
                              ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      user.tag,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyles.timestamp.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 12),
                PhosphorIcon(PhosphorIconsBold.check, size: 20, color: accent),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _HasFilterSheet extends StatefulWidget {
  const _HasFilterSheet({
    required this.initialSelected,
    required this.scrollController,
    required this.onDone,
  });

  final Set<MessageSearchContentFilter> initialSelected;
  final ScrollController scrollController;
  final ValueChanged<Set<MessageSearchContentFilter>> onDone;

  @override
  State<_HasFilterSheet> createState() => _HasFilterSheetState();
}

class _HasFilterSheetState extends State<_HasFilterSheet> {
  late final Set<MessageSearchContentFilter> _selected;

  @override
  void initState() {
    super.initState();
    _selected = <MessageSearchContentFilter>{...widget.initialSelected};
  }

  void _toggle(MessageSearchContentFilter value) {
    setState(() {
      if (_selected.contains(value)) {
        _selected.remove(value);
      } else {
        _selected.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;

    return Padding(
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                l10n.channelDetailsHasFilterPrompt,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              controller: widget.scrollController,
              padding: FluxerBottomSheet.scrollViewPadding(
                context,
                padding: const EdgeInsets.symmetric(vertical: 4),
              ),
              itemCount: MessageSearchContentFilter.values.length,
              separatorBuilder: (_, _) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final value = MessageSearchContentFilter.values[index];
                return _SearchOptionCard(
                  icon: _contentIcon(value),
                  label: _contentLabel(l10n, value),
                  description: _contentDescription(l10n, value),
                  isSelected: _selected.contains(value),
                  onTap: () => _toggle(value),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FluxerButton.primary(
              label: l10n.channelDetailsDone,
              onPressed: () => widget.onDone(_selected),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptySheetState extends StatelessWidget {
  const _EmptySheetState({
    required this.icon,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(icon, size: 42, color: context.colors.textTertiary),
            const SizedBox(height: 12),
            Text(
              title,
              style: context.textStyles.channelName,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 6),
            Text(
              body,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorSheetState extends StatelessWidget {
  const _ErrorSheetState({required this.title, required this.onRetry});

  final String title;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsBold.warning,
              size: 42,
              color: context.colors.statusDanger,
            ),
            const SizedBox(height: 12),
            Text(title, style: context.textStyles.channelName),
            const SizedBox(height: 12),
            FluxerButton.secondary(
              label: FluxerLocalizations.of(context).channelDetailsRetry,
              onPressed: onRetry,
            ),
          ],
        ),
      ),
    );
  }
}

class _InlineRetry extends StatelessWidget {
  const _InlineRetry({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.statusDanger,
              ),
            ),
          ),
          FluxerButton.secondary(
            label: FluxerLocalizations.of(context).channelDetailsRetry,
            size: FluxerButtonSize.small,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}

enum _PinnedMessageAction { jump, unpin, copyMessageId, copyMessageLink }

void _stubComingSoon(BuildContext context, WidgetRef ref) {
  ref
      .read(toastProvider.notifier)
      .show(FluxerToast(message: FluxerLocalizations.of(context).comingSoon));
}

Future<void> _showDetailsMoreSheet(
  BuildContext context, {
  required WidgetRef ref,
  required Channel? channel,
  required DmConversation? dm,
  required bool showFavorite,
  required bool isFavorite,
  required bool isDmPinned,
  required bool hasUnread,
  required int channelPermissionBits,
  required bool developerMode,
  required Future<void> Function() onMarkRead,
  required Future<void> Function({required bool isFavorite}) onToggleFavorite,
  required Future<void> Function({required bool isPinned}) onToggleDmPin,
  required Future<void> Function(UserNotificationSettings setting)
  onSetNotification,
  required Future<void> Function(String value) onCopy,
  required Future<void> Function() onCloseDm,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final channelId = channel?.id ?? dm?.id;
  final title = dm == null
      ? l10n.channelDetailsChannelSettingsTitle
      : (dm.isGroup
            ? l10n.channelDetailsGroupSettingsTitle
            : l10n.channelDetailsDmSettingsTitle);
  final isDM = dm != null && !dm.isGroup && !dm.isPersonalNotes;
  final isGroupDM = dm != null && dm.isGroup;
  final String? currentUserId = ref.read(currentUserIdProvider);
  final bool isGroupDmOwner =
      isGroupDM &&
      dm.ownerId != null &&
      currentUserId != null &&
      dm.ownerId == currentUserId;
  final bool isGroupDmFullState =
      isGroupDM &&
      isGroupDmFull(
        memberCount: dm.recipientCount,
        maxGroupDmRecipients: ref.read(
          instanceLimitProvider(LimitKeys.maxGroupDmRecipients),
        ),
      );
  return FluxerBottomSheet.show<void>(
    context,
    title: title,
    variant: FluxerBottomSheetVariant.menu,
    builder: (sheetContext, close) {
      void run(Future<void> Function() action) {
        close();
        unawaited(action());
      }

      final canManageChannel =
          channel != null &&
          hasPermission(channelPermissionBits, Permission.manageChannels);
      final canCreateInvite =
          channel != null &&
          hasPermission(channelPermissionBits, Permission.createInstantInvite);

      final commonItems = <Widget>[
        if (showFavorite)
          FluxerBottomSheetMenuItem(
            label: isFavorite
                ? l10n.favoritesRemoveFromFavorites
                : l10n.favoritesAddToFavorites,
            icon: isFavorite ? PhosphorIconsFill.star : PhosphorIconsBold.star,
            onTap: () => run(() => onToggleFavorite(isFavorite: isFavorite)),
          ),
        if (hasUnread)
          FluxerBottomSheetMenuItem(
            label: l10n.dmMarkAsRead,
            icon: PhosphorIconsBold.checkCircle,
            onTap: () => run(onMarkRead),
          ),
        if (dm != null && !dm.isPersonalNotes)
          FluxerBottomSheetMenuItem(
            label: dm.isGroup
                ? (isDmPinned ? l10n.dmUnpinGroupDm : l10n.dmPinGroupDm)
                : (isDmPinned ? l10n.dmUnpinDm : l10n.dmPinDm),
            icon: PhosphorIconsBold.pushPin,
            onTap: () => run(() => onToggleDmPin(isPinned: isDmPinned)),
          ),
        if (canCreateInvite)
          FluxerBottomSheetMenuItem(
            label: l10n.channelDetailsInvitePeople,
            icon: PhosphorIconsBold.userPlus,
            onTap: () {
              close();
              _stubComingSoon(context, ref);
            },
          ),
        if (channel != null)
          FluxerBottomSheetMenuItem(
            label: l10n.channelDetailsCopyLink,
            icon: PhosphorIconsBold.link,
            onTap: () =>
                run(() => onCopy(channelLink(channel.id, channel.guildId))),
          ),
        if (channel != null)
          FluxerBottomSheetSubmenuItem(
            label: l10n.notificationSettings,
            icon: PhosphorIconsBold.bellRinging,
            onTap: () {
              close();
              unawaited(
                showChannelNotificationSettingsSheet(
                  context,
                  channel: channel,
                  onSetNotification: onSetNotification,
                ),
              );
            },
          ),
      ];

      final miscItems = <Widget>[
        if (developerMode && channelId != null)
          FluxerBottomSheetMenuItem(
            label: l10n.dmDebugChannel,
            icon: PhosphorIconsBold.bug,
            onTap: () {
              close();
              unawaited(
                _showDebugChannelSheet(context, ref: ref, channelId: channelId),
              );
            },
          ),
        if (developerMode && isDM)
          FluxerBottomSheetMenuItem(
            label: l10n.dmDebugUser,
            icon: PhosphorIconsBold.bug,
            onTap: () {
              close();
              unawaited(
                _showDebugUserSheet(context, ref: ref, userId: dm.recipientId),
              );
            },
          ),
        if (isDM)
          FluxerBottomSheetMenuItem(
            label: l10n.dmCopyUserId,
            icon: PhosphorIconsBold.snowflake,
            onTap: () => run(() => onCopy(dm.recipientId)),
          ),
        if (channelId != null)
          FluxerBottomSheetMenuItem(
            label: l10n.dmCopyChannelId,
            icon: PhosphorIconsBold.snowflake,
            onTap: () => run(() => onCopy(channelId)),
          ),
      ];

      final groups = <Widget>[
        if (commonItems.isNotEmpty) FluxerMenuGroup(children: commonItems),
        if (isGroupDM)
          FluxerMenuGroup(
            children: <Widget>[
              FluxerBottomSheetMenuItem(
                label: l10n.dmEditGroup,
                icon: PhosphorIconsBold.pencilSimple,
                onTap: () {
                  close();
                  unawaited(EditGroupDmFlow.show(context, dm: dm));
                },
              ),
              if (!isGroupDmFullState)
                FluxerBottomSheetMenuItem(
                  label: l10n.channelDetailsAddFriendsToGroup,
                  icon: PhosphorIconsBold.userPlus,
                  onTap: () {
                    close();
                    unawaited(AddFriendsToGroupFlow.show(context, ref, dm: dm));
                  },
                ),
              if (isGroupDmOwner)
                FluxerBottomSheetMenuItem(
                  label: l10n.channelDetailsGroupInvites,
                  icon: PhosphorIconsBold.envelope,
                  onTap: () {
                    close();
                    unawaited(GroupDmInvitesFlow.show(context, dm: dm));
                  },
                ),
            ],
          ),
        if (canManageChannel)
          FluxerMenuGroup(
            children: [
              FluxerBottomSheetMenuItem(
                label: l10n.channelDetailsEditChannel,
                icon: PhosphorIconsBold.pencilSimple,
                onTap: () {
                  close();
                  if (channelId != null) {
                    unawaited(
                      ChannelSettingsFlow.show(context, channelId: channelId),
                    );
                  }
                },
              ),
              FluxerBottomSheetMenuItem(
                label: l10n.channelDetailsDeleteChannel,
                icon: PhosphorIconsBold.trash,
                isDanger: true,
                onTap: () {
                  close();
                  unawaited(
                    DeleteChannelFlow.confirmAndDelete(
                      context,
                      ref,
                      channel: channel,
                    ),
                  );
                },
              ),
            ],
          ),
        if (isDM || isGroupDM)
          FluxerMenuGroup(
            children: [
              FluxerBottomSheetMenuItem(
                label: isGroupDM ? l10n.dmLeaveGroup : l10n.dmCloseDm,
                icon: PhosphorIconsBold.xCircle,
                isDanger: true,
                onTap: () => run(onCloseDm),
              ),
            ],
          ),
        if (miscItems.isNotEmpty) FluxerMenuGroup(children: miscItems),
      ];

      return FluxerBottomSheetContent(
        child: FluxerBottomSheetGroupColumn(children: groups),
      );
    },
  );
}

Future<void> _showDebugChannelSheet(
  BuildContext context, {
  required WidgetRef ref,
  required String channelId,
}) => showChannelDebugSheet(
  context,
  ref: ref,
  channelId: channelId,
  title: FluxerLocalizations.of(context).dmDebugChannel,
);

Future<void> _showDebugUserSheet(
  BuildContext context, {
  required WidgetRef ref,
  required String userId,
}) async {
  try {
    final client = ref.read(fluxerClientProvider);
    final user = await client.users.getUserById(userId: userId);
    if (!context.mounted) {
      return;
    }
    await showDebugBottomSheet(
      context,
      title: FluxerLocalizations.of(context).dmDebugUser,
      data: user.toJson(),
      onCopied: (message) => ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(message: message, variant: FluxerToastVariant.success),
          ),
    );
  } on Exception catch (_) {
    // Ignore — failed to fetch user.
  }
}

Future<void> _showPinnedMessageActions(
  BuildContext context,
  WidgetRef ref, {
  required String channelId,
  required String? guildId,
  required PinnedMessageEntry entry,
}) async {
  final canUnpin = await _canUnpinMessage(
    ref,
    channelId: channelId,
    guildId: guildId,
  );
  if (!context.mounted) {
    return;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final action = await FluxerBottomSheet.show<_PinnedMessageAction>(
    context,
    title: l10n.channelDetailsPinnedMessageTitle,
    variant: FluxerBottomSheetVariant.menu,
    builder: (sheetContext, _) {
      void pop(_PinnedMessageAction action) {
        Navigator.of(sheetContext).pop(action);
      }

      return FluxerBottomSheetContent(
        child: FluxerMenuGroup(
          children: [
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsJumpToMessage,
              icon: PhosphorIconsBold.arrowSquareOut,
              onTap: () => pop(_PinnedMessageAction.jump),
            ),
            if (canUnpin)
              FluxerBottomSheetMenuItem(
                label: l10n.channelDetailsUnpinMessage,
                icon: PhosphorIconsBold.pushPinSlash,
                isDanger: true,
                onTap: () => pop(_PinnedMessageAction.unpin),
              ),
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsCopyMessageLink,
              icon: PhosphorIconsBold.link,
              onTap: () => pop(_PinnedMessageAction.copyMessageLink),
            ),
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsCopyMessageId,
              icon: PhosphorIconsBold.snowflake,
              onTap: () => pop(_PinnedMessageAction.copyMessageId),
            ),
          ],
        ),
      );
    },
  );

  if (action == null || !context.mounted) {
    return;
  }
  switch (action) {
    case _PinnedMessageAction.jump:
      _popWithJumpRequest(context, message: entry.message, guildId: guildId);
    case _PinnedMessageAction.unpin:
      await ref.read(channelPinsProvider(channelId).notifier).unpin(entry);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.channelDetailsMessageUnpinned,
              variant: FluxerToastVariant.success,
            ),
          );
    case _PinnedMessageAction.copyMessageId:
      await copyToClipboard(context: context, value: entry.message.id);
    case _PinnedMessageAction.copyMessageLink:
      await copyToClipboard(
        context: context,
        value: messageLink(
          channelId: entry.message.channelId,
          messageId: entry.message.id,
          guildId: guildId,
        ),
      );
  }
}

Future<void> _showSearchMessageActions(
  BuildContext context,
  WidgetRef ref, {
  required MessageSearchResultEntry entry,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final action = await FluxerBottomSheet.show<_PinnedMessageAction>(
    context,
    title: l10n.channelDetailsSearchResultTitle,
    variant: FluxerBottomSheetVariant.menu,
    builder: (sheetContext, _) {
      void pop(_PinnedMessageAction action) {
        Navigator.of(sheetContext).pop(action);
      }

      return FluxerBottomSheetContent(
        child: FluxerMenuGroup(
          children: [
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsJumpToMessage,
              icon: PhosphorIconsBold.arrowSquareOut,
              onTap: () => pop(_PinnedMessageAction.jump),
            ),
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsCopyMessageLink,
              icon: PhosphorIconsBold.link,
              onTap: () => pop(_PinnedMessageAction.copyMessageLink),
            ),
            FluxerBottomSheetMenuItem(
              label: l10n.channelDetailsCopyMessageId,
              icon: PhosphorIconsBold.snowflake,
              onTap: () => pop(_PinnedMessageAction.copyMessageId),
            ),
          ],
        ),
      );
    },
  );

  if (action == null || !context.mounted) {
    return;
  }
  switch (action) {
    case _PinnedMessageAction.jump:
      _popWithJumpRequest(
        context,
        message: entry.message,
        guildId: entry.guildId,
      );
    case _PinnedMessageAction.copyMessageId:
      await copyToClipboard(context: context, value: entry.message.id);
    case _PinnedMessageAction.copyMessageLink:
      await copyToClipboard(
        context: context,
        value: messageLink(
          channelId: entry.message.channelId,
          messageId: entry.message.id,
          guildId: entry.guildId,
        ),
      );
    case _PinnedMessageAction.unpin:
      break;
  }
}

Future<bool> _canUnpinMessage(
  WidgetRef ref, {
  required String channelId,
  required String? guildId,
}) async {
  if (guildId == null) {
    return true;
  }
  try {
    final int bits = await readEffectiveGuildChannelPermissionBits(
      container: ref.container,
      channelId: channelId,
    );
    return hasPermission(bits, Permission.pinMessages) ||
        hasPermission(bits, Permission.manageMessages);
  } on Object {
    return false;
  }
}

String? _detailsSubtitle({
  required FluxerLocalizations l10n,
  required Channel? channel,
  required DmConversation? dm,
}) {
  if (dm != null) {
    if (dm.isPersonalNotes) {
      return l10n.personalNotesPrivateSpace;
    }
    if (dm.isGroup) {
      return l10n.channelDetailsGroupDmSubtitle(dm.memberCount);
    }
    return dm.recipientTag ??
        (dm.isSystem ? l10n.channelDetailsSystemMessage : null);
  }
  if (channel != null) {
    return switch (channel.type) {
      ChannelType.guildText => l10n.channelDetailsTextChannel,
      ChannelType.guildVoice => l10n.channelDetailsVoiceChannel,
      ChannelType.guildCategory => l10n.channelDetailsCategory,
      ChannelType.guildLink => l10n.channelDetailsLinkChannel,
      ChannelType.dm ||
      ChannelType.groupDm ||
      ChannelType.dmPersonalNotes => l10n.channelDetailsGenericChannel,
    };
  }
  return null;
}

/// Pops the current route, handing the picked message back to its opener.
///
/// The sheet must not navigate itself: it is about to be dismissed, so any
/// context or ref it holds dies mid flight, and `close()` only starts the
/// dismissal so navigating here would race the animation.
void _popWithJumpRequest(
  BuildContext context, {
  required Message message,
  String? guildId,
}) {
  Navigator.of(
    context,
  ).pop(ChannelDetailsJumpRequest(message: message, guildId: guildId));
}

String _formatDate(DateTime dateTime) {
  final local = dateTime.toLocal();
  final h = local.hour.toString().padLeft(2, '0');
  final m = local.minute.toString().padLeft(2, '0');
  return '${local.month}/${local.day}/${local.year} $h:$m';
}

String _contentLabel(
  FluxerLocalizations l10n,
  MessageSearchContentFilter value,
) => switch (value) {
  MessageSearchContentFilter.image => l10n.channelDetailsSearchContentImage,
  MessageSearchContentFilter.video => l10n.channelDetailsSearchContentVideo,
  MessageSearchContentFilter.audio => l10n.channelDetailsSearchContentAudio,
  MessageSearchContentFilter.file => l10n.channelDetailsSearchContentFile,
  MessageSearchContentFilter.link => l10n.channelDetailsSearchContentLink,
  MessageSearchContentFilter.embed => l10n.channelDetailsSearchContentEmbed,
  MessageSearchContentFilter.sticker => l10n.channelDetailsSearchContentSticker,
};

String _contentDescription(
  FluxerLocalizations l10n,
  MessageSearchContentFilter value,
) => switch (value) {
  MessageSearchContentFilter.image =>
    l10n.channelDetailsSearchContentImageDescription,
  MessageSearchContentFilter.video =>
    l10n.channelDetailsSearchContentVideoDescription,
  MessageSearchContentFilter.audio =>
    l10n.channelDetailsSearchContentAudioDescription,
  MessageSearchContentFilter.file =>
    l10n.channelDetailsSearchContentFileDescription,
  MessageSearchContentFilter.link =>
    l10n.channelDetailsSearchContentLinkDescription,
  MessageSearchContentFilter.embed =>
    l10n.channelDetailsSearchContentEmbedDescription,
  MessageSearchContentFilter.sticker =>
    l10n.channelDetailsSearchContentStickerDescription,
};

IconData _contentIcon(MessageSearchContentFilter value) =>
    channelSearchContentIcon(value);
