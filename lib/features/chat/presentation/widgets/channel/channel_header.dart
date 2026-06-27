import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/drawer_reveal_sync_trigger_provider.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/call_actions.dart';
import 'package:fluxer_app/features/voice/utils/voice_e2ee_display.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// The chat header bar showing channel name, topic, and
/// action icons. Renders a compact single-row layout on
/// mobile and the full toolbar on tablet and desktop.
///
/// Resolves the title from server channels first, then
/// falls back to DM conversations so both contexts
/// display correctly.
class ChannelHeader extends ConsumerWidget {
  const ChannelHeader({this.showMessageActions = true, super.key});

  final bool showMessageActions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final channel = ref.watch(channelByIdProvider(channelId)).value;
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final dm = channel == null
        ? findDmById(
            ref.watch(dmViewModelProvider.select((s) => s.conversations)),
            channelId,
          )
        : null;
    final bool isPersonalNotes = _isPersonalNotesHeader(
      dm: dm,
      channelId: channelId,
      currentUserId: currentUserId,
    );
    final isMemberListVisible = ref.watch(
      channelListViewModelProvider.select((s) => s.isMemberListVisible),
    );
    final hasUnreadPins =
        channel != null &&
        (ref.watch(channelUnreadProvider(channel.id)).value?.hasUnreadPins ??
            false);

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: context.colors.userAreaDividerColor),
        ),
      ),
      child: ResponsiveLayout(
        builder: (context, mode) => switch (mode) {
          LayoutMode.mobile => _buildMobileBar(
            context,
            ref,
            channelId: channelId,
            l10n: l10n,
            channel: channel,
            dm: dm,
            isPersonalNotes: isPersonalNotes,
            showMessageActions: showMessageActions,
          ),
          _ => _buildDesktopBar(
            context,
            ref,
            channelId: channelId,
            l10n: l10n,
            channel: channel,
            dm: dm,
            isPersonalNotes: isPersonalNotes,
            isMemberListVisible: isMemberListVisible,
            showMessageActions: showMessageActions,
            hasUnreadPins: hasUnreadPins,
          ),
        },
      ),
    );
  }

  Widget _buildMobileBar(
    BuildContext context,
    WidgetRef ref, {
    required String channelId,
    required FluxerLocalizations l10n,
    required Channel? channel,
    required DmConversation? dm,
    required bool isPersonalNotes,
    required bool showMessageActions,
  }) {
    final showFavorites = ref.watch(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    );
    final targetChannelId = channel?.id ?? dm?.id;
    final isFavorite =
        showFavorites &&
        targetChannelId != null &&
        (ref.watch(favoriteChannelProvider(targetChannelId)).asData?.value !=
            null);

    return Container(
      height: 64,
      color: context.colors.chatInputBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          IconButton(
            icon: const PhosphorIcon(PhosphorIconsBold.arrowLeft, size: 24),
            color: context.colors.textPrimaryMuted,
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              final String location = ref.read(currentLocationProvider);
              if (isFavoritesChannelRoute(location)) {
                returnToFavoritesList(ref);
                return;
              }
              ref.read(currentRevealSideProvider.notifier).set(RevealSide.left);
              ref.read(drawerRevealSyncTriggerProvider.notifier).nudge();
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            style: IconButton.styleFrom(shape: const CircleBorder()),
          ),
          Expanded(
            child: Semantics(
              button: true,
              label: 'Open channel details',
              child: InkWell(
                onTap: () => _openDetails(context, channel: channel, dm: dm),
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      _buildLeadingIcon(
                        context,
                        ref,
                        channel: channel,
                        dm: dm,
                        isPersonalNotes: isPersonalNotes,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          _resolveHeaderTitle(
                            ref,
                            channelId: channelId,
                            l10n: l10n,
                            channel: channel,
                            dm: dm,
                            isPersonalNotes: isPersonalNotes,
                          ),
                          style: context.textStyles.channelName,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (dm != null && isBotOrSystemDmRecipient(dm)) ...[
                        const SizedBox(width: 6),
                        FluxerUserTag(isSystem: dm.isSystem),
                      ],
                      if (channel != null) ...<Widget>[
                        const SizedBox(width: 4),
                        _buildVoiceConnectionStatus(
                          context,
                          ref,
                          l10n,
                          channel,
                          compact: true,
                        ),
                      ],
                      const SizedBox(width: 4),
                      PhosphorIcon(
                        PhosphorIconsBold.caretRight,
                        size: 16,
                        color: context.colors.textPrimaryMuted,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (showMessageActions &&
              showFavorites &&
              !isPersonalNotes &&
              targetChannelId != null) ...[
            GestureDetector(
              onLongPress: () => _showFavoriteActions(context, ref),
              child: FluxerButton.circle(
                icon: isFavorite
                    ? PhosphorIconsFill.star
                    : PhosphorIconsBold.star,
                variant: isFavorite
                    ? FluxerButtonVariant.primary
                    : FluxerButtonVariant.secondary,
                size: FluxerButtonSize.small,
                iconSize: 20,
                onPressedAsync: () => _toggleFavorite(
                  context,
                  ref,
                  channel: channel,
                  dm: dm,
                  isFavorite: isFavorite,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          if (dm != null && canStartDmCall(dm)) ...[
            FluxerButton.circle(
              icon: PhosphorIconsFill.phone,
              variant: FluxerButtonVariant.secondary,
              size: FluxerButtonSize.small,
              iconSize: 20,
              onPressed: () =>
                  _executeOutboundDmCall(ref: ref, context: context, dm: dm),
            ),
            const SizedBox(width: 8),
            FluxerButton.circle(
              icon: PhosphorIconsFill.videoCamera,
              variant: FluxerButtonVariant.secondary,
              size: FluxerButtonSize.small,
              iconSize: 20,
              onPressed: () => _executeOutboundDmCall(
                ref: ref,
                context: context,
                dm: dm,
                startWithVideo: true,
              ),
            ),
          ],
          if (showMessageActions && dm == null && channel != null)
            FluxerButton.circle(
              icon: PhosphorIconsBold.magnifyingGlass,
              variant: FluxerButtonVariant.secondary,
              size: FluxerButtonSize.small,
              iconSize: 20,
              onPressed: () => _openSearch(context, channel: channel),
            ),
        ],
      ),
    );
  }

  Widget _buildDesktopBar(
    BuildContext context,
    WidgetRef ref, {
    required String channelId,
    required FluxerLocalizations l10n,
    required Channel? channel,
    required DmConversation? dm,
    required bool isPersonalNotes,
    required bool isMemberListVisible,
    required bool showMessageActions,
    required bool hasUnreadPins,
  }) => SizedBox(
    height: 56,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Flexible(
            child: InkWell(
              onTap: () => _openDetails(context, channel: channel, dm: dm),
              borderRadius: BorderRadius.circular(6),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildLeadingIcon(
                      context,
                      ref,
                      channel: channel,
                      dm: dm,
                      isPersonalNotes: isPersonalNotes,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        _resolveHeaderTitle(
                          ref,
                          channelId: channelId,
                          l10n: l10n,
                          channel: channel,
                          dm: dm,
                          isPersonalNotes: isPersonalNotes,
                        ),
                        style: context.textStyles.channelName,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (dm != null && isBotOrSystemDmRecipient(dm)) ...[
            const SizedBox(width: 6),
            FluxerUserTag(isSystem: dm.isSystem),
          ],
          if (channel != null) ...<Widget>[
            const SizedBox(width: 8),
            _buildVoiceConnectionStatus(
              context,
              ref,
              l10n,
              channel,
              compact: false,
            ),
          ],
          const SizedBox(width: 8),
          if (dm != null && canStartDmCall(dm)) ...[
            FluxerButton.circle(
              icon: PhosphorIconsFill.phone,
              variant: FluxerButtonVariant.secondary,
              size: FluxerButtonSize.small,
              iconSize: 20,
              onPressed: () =>
                  _executeOutboundDmCall(ref: ref, context: context, dm: dm),
            ),
            const SizedBox(width: 8),
            FluxerButton.circle(
              icon: PhosphorIconsFill.videoCamera,
              variant: FluxerButtonVariant.secondary,
              size: FluxerButtonSize.small,
              iconSize: 20,
              onPressed: () => _executeOutboundDmCall(
                ref: ref,
                context: context,
                dm: dm,
                startWithVideo: true,
              ),
            ),
            const SizedBox(width: 8),
          ],
          const Spacer(),
          if (showMessageActions) ...[
            if (_shouldShowFavoriteStar(ref, channel: channel, dm: dm))
              _buildFavoriteStar(context, ref, channel: channel, dm: dm),
            if (channel != null)
              _topBarIcon(
                context,
                PhosphorIconsFill.pushPin,
                'Pinned Messages',
                showIndicator: hasUnreadPins,
                onTap: () => showChannelDetailsSheet(
                  context,
                  channel: channel,
                  dm: null,
                  initialTab: ChannelDetailsInitialTab.pins,
                ),
              ),
            if (dm == null)
              _topBarIcon(
                context,
                PhosphorIconsFill.users,
                'Member List',
                isActive: isMemberListVisible,
                onTap: () => ref
                    .read(channelListViewModelProvider.notifier)
                    .toggleMemberList(),
              ),
            if (channel != null)
              InkWell(
                onTap: () => _openSearch(context, channel: channel),
                borderRadius: BorderRadius.circular(4),
                child: SizedBox(
                  width: 160,
                  height: 28,
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colors.backgroundTertiary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Search',
                            style: TextStyle(
                              color: context.colors.textPrimaryMuted,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        PhosphorIcon(
                          PhosphorIconsFill.magnifyingGlass,
                          size: 16,
                          color: context.colors.textPrimaryMuted,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            _topBarIcon(
              context,
              PhosphorIconsFill.tray,
              'Inbox',
              onTap: () => ref
                  .read(fluxerRouterProvider)
                  .go(RoutePaths.notificationsPath),
            ),
          ],
        ],
      ),
    ),
  );

  static bool _isPersonalNotesHeader({
    required DmConversation? dm,
    required String channelId,
    required String? currentUserId,
  }) {
    if (dm?.isPersonalNotes ?? false) {
      return true;
    }
    return isPersonalNotesChannelRoute(
      channelId: channelId,
      currentUserId: currentUserId,
    );
  }

  Widget _buildLeadingIcon(
    BuildContext context,
    WidgetRef ref, {
    required Channel? channel,
    required DmConversation? dm,
    required bool isPersonalNotes,
  }) {
    if (isPersonalNotes) {
      return SizedBox(
        width: 32,
        height: 32,
        child: Center(
          child: PhosphorIcon(
            PhosphorIconsFill.notePencil,
            size: 20,
            color: context.colors.interactiveNormal,
          ),
        ),
      );
    }
    if (channel != null) {
      final int? effectivePermissionBits = ref.watch(
        channelPermissionCacheProvider.select((m) => m[channel.id]),
      );
      final VoiceSessionState voice = ref.watch(voiceSessionProvider);
      final Map<String, VoiceState> voiceStates = ref.watch(
        voiceStatesMapProvider,
      );
      final bool isVoiceChannel = channel.type == ChannelType.voice;
      final Guild? guild = ref
          .watch(guildListViewModelProvider)
          .guilds
          .where((Guild g) => g.id == channel.guildId)
          .firstOrNull;
      final bool e2eeEncrypted =
          isVoiceChannel &&
          isVoiceChannelE2eeEncryptedForIcon(
            voiceStates: voiceStates,
            guildId: channel.guildId,
            channelId: channel.id,
            connectedVoiceGuildId: voice.guildId,
            connectedVoiceChannelId: voice.channelId,
            guildHasVoiceE2ee: guild?.hasVoiceE2ee ?? false,
          );
      return ChannelIcon(
        type: channel.type,
        channel: channel,
        effectivePermissionBits: effectivePermissionBits,
        e2eeEncrypted: e2eeEncrypted,
      );
    }
    if (dm != null) {
      final VoiceSessionState voice = ref.watch(voiceSessionProvider);
      final Map<String, VoiceState> voiceStates = ref.watch(
        voiceStatesMapProvider,
      );
      final bool showE2eeBadge = isDmCallE2eeEncryptedForHeader(
        voiceStates: voiceStates,
        channelId: dm.id,
        connectedVoiceGuildId: voice.guildId,
        connectedVoiceChannelId: voice.channelId,
      );
      return Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          if (dm.isGroup)
            groupDmAvatarCluster(dm: dm, size: 32, status: dm.groupStatus)
          else
            FluxerAvatar.user(
              fallbackText: dm.recipientName,
              userId: dm.recipientId,
              imageUrl: FluxerMediaUrl.userAvatar(
                userId: dm.recipientId,
                hash: dm.recipientAvatar,
                animated: true,
              ),
              status: shouldShowDmRecipientPresence(dm)
                  ? dm.recipientStatus
                  : null,
              showStatus: shouldShowDmRecipientPresence(dm),
              size: 32,
            ),
          if (showE2eeBadge)
            Positioned(
              right: -2,
              top: -2,
              child: ChannelIcon(
                type: ChannelType.voice,
                size: 14,
                e2eeEncrypted: true,
                color: context.colors.statusOnline,
              ),
            ),
        ],
      );
    }
    return PhosphorIcon(
      PhosphorIconsFill.chatCircle,
      size: 20,
      color: context.colors.interactiveNormal,
    );
  }

  /// Builds the current voice connection status for voice channels.
  Widget _buildVoiceConnectionStatus(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    Channel channel, {
    required bool compact,
  }) {
    if (channel.type != ChannelType.voice) {
      return const SizedBox.shrink();
    }
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    if (!_channelHeaderVoiceSessionMatches(
      voice: voice,
      channelId: channel.id,
      guildId: channel.guildId,
    )) {
      return const SizedBox.shrink();
    }
    final bool hasError = voice.errorMessage != null;
    final IconData icon;
    final Color color;
    final String label;
    if (hasError) {
      icon = PhosphorIconsFill.cellSignalSlash;
      color = context.colors.statusDanger;
      label = l10n.voiceChannelStatusError;
    } else if (voice.isConnected) {
      icon = PhosphorIconsFill.cellSignalFull;
      color = context.colors.statusOnline;
      label = l10n.voiceChannelStatusConnected;
    } else {
      icon = PhosphorIconsFill.cellSignalMedium;
      color = context.colors.statusIdle;
      label = l10n.voiceChannelStatusConnecting;
    }
    final String tip = hasError
        ? resolveVoiceSessionErrorMessage(voice.errorMessage!, l10n)
        : label;
    return Tooltip(
      message: tip,
      child: Semantics(
        label: tip,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhosphorIcon(icon, size: compact ? 15 : 17, color: color),
            if (!compact) ...<Widget>[
              const SizedBox(width: 4),
              Text(
                label,
                style: context.textStyles.bodySmall.copyWith(
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }

  static bool _channelHeaderVoiceSessionMatches({
    required VoiceSessionState voice,
    required String channelId,
    required String guildId,
  }) {
    if (!voice.isInVoice) {
      return false;
    }
    if (voice.channelId != channelId) {
      return false;
    }
    return voice.guildId == guildId;
  }

  String _resolveHeaderTitle(
    WidgetRef ref, {
    required String channelId,
    required FluxerLocalizations l10n,
    required Channel? channel,
    required DmConversation? dm,
    required bool isPersonalNotes,
  }) {
    final String? nickname = ref
        .watch(favoriteChannelProvider(channelId))
        .value
        ?.nickname;
    if (nickname != null && nickname.isNotEmpty) {
      return nickname;
    }
    return _resolveTitle(
      l10n: l10n,
      channel: channel,
      dm: dm,
      isPersonalNotes: isPersonalNotes,
    );
  }

  String _resolveTitle({
    required FluxerLocalizations l10n,
    required Channel? channel,
    required DmConversation? dm,
    required bool isPersonalNotes,
  }) {
    if (channel != null) {
      return channel.name;
    }
    if (isPersonalNotes) {
      return l10n.personalNotesTitle;
    }
    if (dm != null) {
      return dm.displayName;
    }
    return '';
  }

  void _openDetails(
    BuildContext context, {
    required Channel? channel,
    required DmConversation? dm,
  }) {
    if (channel == null && dm == null) {
      return;
    }
    unawaited(showChannelDetailsSheet(context, channel: channel, dm: dm));
  }

  void _openSearch(BuildContext context, {required Channel channel}) {
    unawaited(
      showChannelDetailsSheet(
        context,
        channel: channel,
        dm: null,
        openSearchImmediately: true,
      ),
    );
  }

  Future<void> _toggleFavorite(
    BuildContext context,
    WidgetRef ref, {
    required Channel? channel,
    required DmConversation? dm,
    required bool isFavorite,
  }) async {
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

    if (!context.mounted) {
      return;
    }
    final l10n = FluxerLocalizations.of(context);
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

  bool _shouldShowFavoriteStar(
    WidgetRef ref, {
    required Channel? channel,
    required DmConversation? dm,
  }) {
    final showFavorites = ref.watch(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    );
    if (!showFavorites) {
      return false;
    }
    final targetChannelId = channel?.id ?? dm?.id;
    if (targetChannelId == null) {
      return false;
    }
    final currentUserId = ref.watch(currentUserIdProvider);
    if (_isPersonalNotesHeader(
      dm: dm,
      channelId: targetChannelId,
      currentUserId: currentUserId,
    )) {
      return false;
    }
    return true;
  }

  Widget _buildFavoriteStar(
    BuildContext context,
    WidgetRef ref, {
    required Channel? channel,
    required DmConversation? dm,
  }) {
    final targetChannelId = channel?.id ?? dm?.id;
    final isFavorite =
        targetChannelId != null &&
        (ref.watch(favoriteChannelProvider(targetChannelId)).asData?.value !=
            null);
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onLongPress: () => _showFavoriteActions(context, ref),
        child: FluxerButton.circle(
          icon: isFavorite ? PhosphorIconsFill.star : PhosphorIconsBold.star,
          variant: isFavorite
              ? FluxerButtonVariant.primary
              : FluxerButtonVariant.secondary,
          size: FluxerButtonSize.small,
          iconSize: 20,
          onPressedAsync: () => _toggleFavorite(
            context,
            ref,
            channel: channel,
            dm: dm,
            isFavorite: isFavorite,
          ),
        ),
      ),
    );
  }

  void _showFavoriteActions(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        title: l10n.favoritesTitle,
        variant: FluxerBottomSheetVariant.menu,
        builder: (sheetContext, close) => FluxerBottomSheetContent(
          child: FluxerBottomSheetMenuItem(
            label: l10n.favoritesHideConfirmTitle,
            icon: PhosphorIconsBold.eyeSlash,
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

  Widget _topBarIcon(
    BuildContext context,
    IconData icon,
    String tooltip, {
    required VoidCallback onTap,
    bool isActive = false,
    bool showIndicator = false,
  }) => Tooltip(
    message: tooltip,
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: PhosphorIcon(
              icon,
              size: 24,
              color: isActive
                  ? context.colors.interactiveActive
                  : context.colors.interactiveNormal,
            ),
          ),
          if (showIndicator)
            Positioned(
              right: 5,
              top: 5,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.statusDanger,
                  shape: BoxShape.circle,
                ),
                child: const SizedBox.square(dimension: 8),
              ),
            ),
        ],
      ),
    ),
  );
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
