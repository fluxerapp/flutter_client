import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/chat_back_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_left_section.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_toolbar.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_back_button_unread_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/utils/channel_header_utils.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_layout.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/favorites/domain/favorite_guild_id.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_handler.dart';
import 'package:fluxer_app/features/shell/navigation/shell_back_resolver.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/providers/reveal_side_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/call_actions.dart';
import 'package:fluxer_app/features/voice/utils/voice_camera_platform.dart';
import 'package:fluxer_app/features/voice/utils/voice_e2ee_display.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// The chat header bar showing channel name, topic, and action icons.
class ChannelHeader extends ConsumerWidget {
  const ChannelHeader({
    this.channelId,
    this.showMessageActions = true,
    this.forceVoiceCallStyle = false,
    super.key,
  });

  final String? channelId;
  final bool showMessageActions;
  final bool forceVoiceCallStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String viewModelChannelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final String channelId =
        (this.channelId != null && this.channelId!.isNotEmpty)
        ? this.channelId!
        : viewModelChannelId;
    final Channel? channel = ref.watch(channelByIdProvider(channelId)).value;
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final DmConversation? dm = channel == null
        ? findDmById(
            ref.watch(dmViewModelProvider.select((s) => s.conversations)),
            channelId,
          )
        : null;
    final bool isPersonalNotes = isPersonalNotesHeader(
      dm: dm,
      channelId: channelId,
      currentUserId: currentUserId,
    );
    final bool isMemberListVisible = ref.watch(
      channelListViewModelProvider.select(
        (ChannelListState state) => state.isMemberListToggleActive(
          channelId: channelId,
          channelType: channel?.type,
        ),
      ),
    );
    final bool highContrast = _resolveHighContrast(
      ref,
      channel: channel,
      forceVoiceCallStyle: forceVoiceCallStyle,
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        color: highContrast
            ? Colors.transparent
            : context.colors.backgroundSecondaryLighter,
        border: Border(
          bottom: BorderSide(
            color: highContrast
                ? Colors.transparent
                : context.colors.userAreaDividerColor,
          ),
        ),
      ),
      child: highContrast
          ? Stack(
              children: [
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.96),
                          Colors.black.withValues(alpha: 0.58),
                          Colors.transparent,
                        ],
                        stops: const <double>[0, 0.72, 1],
                      ),
                    ),
                  ),
                ),
                _buildBody(
                  context,
                  ref,
                  channelId: channelId,
                  l10n: l10n,
                  channel: channel,
                  dm: dm,
                  isPersonalNotes: isPersonalNotes,
                  isMemberListVisible: isMemberListVisible,
                  highContrast: highContrast,
                ),
              ],
            )
          : _buildBody(
              context,
              ref,
              channelId: channelId,
              l10n: l10n,
              channel: channel,
              dm: dm,
              isPersonalNotes: isPersonalNotes,
              isMemberListVisible: isMemberListVisible,
              highContrast: highContrast,
            ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    WidgetRef ref, {
    required String channelId,
    required FluxerLocalizations l10n,
    required Channel? channel,
    required DmConversation? dm,
    required bool isPersonalNotes,
    required bool isMemberListVisible,
    required bool highContrast,
  }) {
    return ResponsiveLayout(
      builder: (context, mode) => switch (mode) {
        LayoutMode.mobile => _buildMobileBar(
          context,
          ref,
          channelId: channelId,
          l10n: l10n,
          channel: channel,
          dm: dm,
          isPersonalNotes: isPersonalNotes,
        ),
        _ => _buildWideBar(
          context,
          ref,
          channelId: channelId,
          channel: channel,
          dm: dm,
          isPersonalNotes: isPersonalNotes,
          isMemberListVisible: isMemberListVisible,
          highContrast: highContrast,
        ),
      },
    );
  }

  Widget _buildWideBar(
    BuildContext context,
    WidgetRef ref, {
    required String channelId,
    required Channel? channel,
    required DmConversation? dm,
    required bool isPersonalNotes,
    required bool isMemberListVisible,
    required bool highContrast,
  }) {
    return SizedBox(
      height: context.layout.headerHeight,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
        child: Row(
          children: [
            Expanded(
              child: ChannelHeaderLeftSection(
                channelId: channelId,
                channel: channel,
                dm: dm,
                isPersonalNotes: isPersonalNotes,
                highContrast: highContrast,
              ),
            ),
            ChannelHeaderToolbar(
              channelId: channelId,
              channel: channel,
              dm: dm,
              isPersonalNotes: isPersonalNotes,
              isMemberListVisible: isMemberListVisible,
              showMessageActions: showMessageActions,
              highContrast: highContrast,
            ),
          ],
        ),
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
  }) {
    final bool showFavorites = ref.watch(
      appearancePreferencesProvider.select((s) => s.showFavorites),
    );
    final String? targetChannelId = channel?.id ?? dm?.id;
    final bool isFavorite =
        showFavorites &&
        targetChannelId != null &&
        (ref.watch(favoriteChannelProvider(targetChannelId)).asData?.value !=
            null);
    final int backButtonUnreadCount = ref.watch(
      chatBackButtonUnreadCountProvider(channelId),
    );

    return Container(
      height: kMobileChannelHeaderHeight,
      color: context.colors.chatInputBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ChatBackButton(
            unreadCount: backButtonUnreadCount,
            onPressed: () => _handleMobileBack(context, ref),
          ),
          Expanded(
            child: Semantics(
              button: true,
              label: 'Open channel details',
              child: InkWell(
                onTap: () =>
                    _openDetails(context, ref, channel: channel, dm: dm),
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      _buildMobileLeadingIcon(
                        context,
                        ref,
                        channel: channel,
                        dm: dm,
                        isPersonalNotes: isPersonalNotes,
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: Text(
                          resolveChannelHeaderTitle(
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
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              if (showMessageActions &&
                  showFavorites &&
                  !isPersonalNotes &&
                  targetChannelId != null)
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
              if (dm != null && canStartDmCall(dm)) ...[
                FluxerButton.circle(
                  icon: PhosphorIconsFill.phone,
                  variant: FluxerButtonVariant.secondary,
                  size: FluxerButtonSize.small,
                  iconSize: 20,
                  onPressed: () => _executeOutboundDmCall(
                    ref: ref,
                    context: context,
                    dm: dm,
                  ),
                ),
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
                  onPressed: () => unawaited(
                    showChannelSearchSheetAndJump(
                      context,
                      container: ref.container,
                      channelId: channel.id,
                      guildId: channel.guildId,
                      title: channel.name,
                      channel: channel,
                    ),
                  ),
                ),
              if (channel != null &&
                  channel.type == ChannelType.guildVoice) ...[
                ChatButton(
                  channelId: channel.id,
                  channelName: channel.name.isNotEmpty ? channel.name : null,
                ),
                if (isMobileVoiceCameraPlatform()) const FlipCameraButton(),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLeadingIcon(
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
      final bool isVoiceChannel = channel.type == ChannelType.guildVoice;
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
      final bool isTyping = ref.watch(dmAvatarIsTypingProvider(dm));
      return Stack(
        clipBehavior: Clip.none,
        children: [
          if (dm.isGroup)
            groupDmAvatarCluster(
              dm: dm,
              size: 32,
              status: dm.groupStatus,
              isTyping: isTyping,
            )
          else
            FluxerAvatar.userPresence(
              fallbackText: dm.recipientName,
              userId: dm.recipientId,
              imageUrl: FluxerMediaUrl.userAvatar(
                userId: dm.recipientId,
                hash: dm.recipientAvatar,
                animated: true,
              ),
              showStatus: shouldShowDmRecipientPresence(dm) || isTyping,
              isTyping: isTyping,
              size: 32,
            ),
          if (showE2eeBadge)
            Positioned(
              right: -2,
              top: -2,
              child: ChannelIcon(
                type: ChannelType.guildVoice,
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

  void _openDetails(
    BuildContext context,
    WidgetRef ref, {
    required Channel? channel,
    required DmConversation? dm,
  }) {
    if (channel == null && dm == null) {
      return;
    }
    unawaited(
      showChannelDetailsSheetAndJump(
        context,
        container: ref.container,
        channel: channel,
        dm: dm,
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
    final String? targetChannelId = channel?.id ?? dm?.id;
    if (targetChannelId == null) {
      return;
    }
    final repository = ref.read(favoriteChannelsRepositoryProvider);
    if (isFavorite) {
      await repository.removeChannel(targetChannelId);
    } else {
      await repository.addChannel(
        channelId: targetChannelId,
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

  void _showFavoriteActions(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
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

  void _handleMobileBack(BuildContext context, WidgetRef ref) {
    applyShellBackAction(
      context: context,
      container: ref.container,
      action: resolveShellBackAction(
        hasPopupOverlay: false,
        hasManualGestureBlock: false,
        hasExpressionPanelOpen: false,
        revealSide: ref.read(currentRevealSideProvider),
        shellLocation: ref.read(shellLocationProvider),
      ),
    );
  }

  bool _resolveHighContrast(
    WidgetRef ref, {
    required Channel? channel,
    required bool forceVoiceCallStyle,
  }) {
    if (forceVoiceCallStyle) {
      return true;
    }
    if (channel?.type != ChannelType.guildVoice) {
      return false;
    }
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    return voice.isInVoice &&
        voice.channelId == channel!.id &&
        voice.guildId == channel.guildId;
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
