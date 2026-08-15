import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_icon_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_search_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_notification_settings_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_pins_overlay_button.dart';
import 'package:fluxer_app/features/chat/utils/channel_header_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/group_dm_utils.dart';
import 'package:fluxer_app/features/dm/presentation/add_friends_to_group_flow.dart';
import 'package:fluxer_app/features/dm/presentation/create_dm_flow.dart';
import 'package:fluxer_app/features/dm/providers/create_dm_view_model.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/notifications/presentation/inbox_popout.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/utils/call_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelHeaderToolbar extends ConsumerWidget {
  const ChannelHeaderToolbar({
    required this.channelId,
    required this.channel,
    required this.dm,
    required this.isPersonalNotes,
    required this.isMemberListVisible,
    required this.showMessageActions,
    required this.highContrast,
    super.key,
  });

  final String channelId;
  final Channel? channel;
  final DmConversation? dm;
  final bool isPersonalNotes;
  final bool isMemberListVisible;
  final bool showMessageActions;
  final bool highContrast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!showMessageActions) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: _buildCallButtons(context, ref),
      );
    }

    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? targetId = channel?.id ?? dm?.id;
    final bool hasUnreadPins =
        targetId != null &&
        (ref.watch(channelUnreadProvider(targetId)).value?.hasUnreadPins ??
            false);
    final bool showPins = shouldShowPinsForContext(
      channel: channel,
      dm: dm,
      isPersonalNotes: isPersonalNotes,
    );
    final bool showSearch = shouldShowSearchForContext(
      channel: channel,
      dm: dm,
      isPersonalNotes: isPersonalNotes,
    );
    final bool showMembers = shouldShowMemberListToggle(
      channel: channel,
      dm: dm,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (channel != null && !isPersonalNotes)
          buildChannelNotificationButton(channel: channel!),
        ..._buildCallButtons(context, ref),
        if (showPins && targetId != null)
          buildChannelPinsButton(
            channelId: targetId,
            guildId: channel?.guildId,
            hasUnreadPins: hasUnreadPins,
          ),
        if (dm != null &&
            dm!.isGroup &&
            !isPersonalNotes &&
            _shouldShowAddFriends(ref, dm!))
          ChannelHeaderIconButton(
            icon: PhosphorIconsFill.userPlus,
            label: l10n.groupDmWelcomeAddFriends,
            onPressed: () =>
                unawaited(AddFriendsToGroupFlow.show(context, ref, dm: dm!)),
          ),
        if (dm != null &&
            !dm!.isGroup &&
            !isPersonalNotes &&
            !dm!.isBot &&
            !dm!.isSystem)
          ChannelHeaderIconButton(
            icon: PhosphorIconsFill.userPlus,
            label: l10n.createGroupDm,
            onPressed: () => unawaited(
              CreateDmFlow.show(
                context,
                options: CreateDmOptions(
                  initialSelectedUserIds: dm!.remoteRecipientIds,
                  duplicateExcludeChannelId: dm!.id,
                ),
              ),
            ),
          ),
        if (_shouldShowFavorite(ref))
          _FavoriteStarButton(
            channel: channel,
            dm: dm,
            highContrast: highContrast,
          ),
        if (showMembers)
          ChannelHeaderIconButton(
            icon: PhosphorIconsFill.users,
            label: l10n.channelHeaderMemberList,
            isActive: isMemberListVisible,
            onPressed: () => ref
                .read(channelListViewModelProvider.notifier)
                .toggleMemberList(
                  channelId: channelId,
                  channelType: channel?.type,
                ),
          ),
        if (showSearch && targetId != null)
          ChannelHeaderSearchField(
            channelId: targetId,
            guildId: channel?.guildId,
            dm: dm,
            highContrast: highContrast,
          ),
        if (isWideLayout(context))
          InboxPopoutButton(
            anchorBuilder:
                (
                  BuildContext context, {
                  required bool isOpen,
                  required VoidCallback toggle,
                }) => ChannelHeaderIconButton(
                  icon: PhosphorIconsFill.tray,
                  label: l10n.channelHeaderInbox,
                  isActive: isOpen,
                  onPressed: toggle,
                ),
          )
        else
          ChannelHeaderIconButton(
            icon: PhosphorIconsFill.tray,
            label: l10n.channelHeaderInbox,
            onPressed: () =>
                ref.read(fluxerRouterProvider).go(RoutePaths.notificationsPath),
          ),
      ],
    );
  }

  List<Widget> _buildCallButtons(BuildContext context, WidgetRef ref) {
    final DmConversation? conversation = dm;
    if (conversation == null || !canStartDmCall(conversation)) {
      return const <Widget>[];
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return <Widget>[
      ChannelHeaderIconButton(
        icon: PhosphorIconsFill.phone,
        label: l10n.dmVoiceCall,
        onPressed: () => _executeOutboundDmCall(
          ref: ref,
          context: context,
          dm: conversation,
        ),
      ),
      ChannelHeaderIconButton(
        icon: PhosphorIconsFill.videoCamera,
        label: l10n.userProfileVideoCall,
        onPressed: () => _executeOutboundDmCall(
          ref: ref,
          context: context,
          dm: conversation,
          startWithVideo: true,
        ),
      ),
    ];
  }

  bool _shouldShowAddFriends(WidgetRef ref, DmConversation dm) {
    final int maxRecipients = ref.read(
      instanceLimitProvider(LimitKeys.maxGroupDmRecipients),
    );
    return !isGroupDmFull(
      memberCount: dm.recipientCount,
      maxGroupDmRecipients: maxRecipients,
    );
  }

  bool _shouldShowFavorite(WidgetRef ref) {
    if (!ref.watch(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    )) {
      return false;
    }
    if (isPersonalNotes) {
      return false;
    }
    return channel != null || dm != null;
  }
}

class _FavoriteStarButton extends ConsumerWidget {
  const _FavoriteStarButton({
    required this.channel,
    required this.dm,
    required this.highContrast,
  });

  final Channel? channel;
  final DmConversation? dm;
  final bool highContrast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? targetId = channel?.id ?? dm?.id;
    if (targetId == null) {
      return const SizedBox.shrink();
    }
    final bool isFavorite =
        ref.watch(favoriteChannelProvider(targetId)).asData?.value != null;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerGestureDetector(
      onLongPress: () => _showHideFavorites(context, ref),
      child: ChannelHeaderIconButton(
        icon: isFavorite ? PhosphorIconsFill.star : PhosphorIconsBold.star,
        label: isFavorite
            ? l10n.favoritesRemoveFromFavorites
            : l10n.favoritesAddToFavorites,
        isActive: isFavorite,
        onPressed: () => _toggleFavorite(context, ref, isFavorite: isFavorite),
      ),
    );
  }

  Future<void> _toggleFavorite(
    BuildContext context,
    WidgetRef ref, {
    required bool isFavorite,
  }) async {
    final String? targetId = channel?.id ?? dm?.id;
    if (targetId == null) {
      return;
    }
    final repository = ref.read(favoriteChannelsRepositoryProvider);
    if (isFavorite) {
      await repository.removeChannel(targetId);
    } else {
      await repository.addChannel(
        channelId: targetId,
        guildId: resolveFavoriteGuildId(
          channelGuildId: channel?.guildId,
          isDm: dm != null,
        ),
        nickname: channel?.name ?? dm?.displayName,
      );
    }
    if (!context.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: isFavorite
                ? l10n.favoritesRemovedToast
                : l10n.favoritesAddedToast,
            variant: FluxerToastVariant.success,
          ),
        );
  }

  void _showHideFavorites(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        title: l10n.favoritesTitle,
        variant: FluxerBottomSheetVariant.menu,
        builder: (sheetContext, close) => FluxerBottomSheetContent(
          child: FluxerBottomSheetMenuItem(
            label: l10n.favoritesHideConfirmTitle,
            icon: PhosphorIconsFill.eyeSlash,
            onTap: () {
              close();
              unawaited(
                ref
                    .read(appearancePreferencesProvider.notifier)
                    .setShowFavorites(value: false),
              );
              ref
                  .read(toastProvider.notifier)
                  .show(
                    FluxerToast(
                      message: l10n.favoritesHiddenToast,
                      variant: FluxerToastVariant.success,
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }
}

void _executeOutboundDmCall({
  required WidgetRef ref,
  required BuildContext context,
  required DmConversation dm,
  bool startWithVideo = false,
}) {
  unawaited(() async {
    final String? selfId = ref.read(currentUserIdProvider);
    final List<String> ringTargets = dm.remoteRecipientIds
        .where((String id) => selfId == null || id != selfId)
        .toList();
    final StartDirectVoiceCallResult r = await startDirectVoiceCall(
      ref,
      context,
      dm.id,
      outboundRingRecipients: ringTargets.isEmpty ? null : ringTargets,
      startWithVideo: startWithVideo,
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
}
