import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_details_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_topic_dialog.dart';
import 'package:fluxer_app/features/chat/utils/channel_header_utils.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/edit_group_dm_flow.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_e2ee_display.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelHeaderLeftSection extends ConsumerStatefulWidget {
  const ChannelHeaderLeftSection({
    required this.channelId,
    required this.channel,
    required this.dm,
    required this.isPersonalNotes,
    required this.highContrast,
    super.key,
  });

  final String channelId;
  final Channel? channel;
  final DmConversation? dm;
  final bool isPersonalNotes;
  final bool highContrast;

  @override
  ConsumerState<ChannelHeaderLeftSection> createState() =>
      _ChannelHeaderLeftSectionState();
}

class _ChannelHeaderLeftSectionState
    extends ConsumerState<ChannelHeaderLeftSection> {
  bool _hoveringTitle = false;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool touchPrimary = isTouchPrimaryInput(ref);
    final bool showGroupPencil =
        widget.dm != null &&
        widget.dm!.isGroup &&
        (touchPrimary || _hoveringTitle);
    final String title = resolveChannelHeaderTitle(
      ref,
      channelId: widget.channelId,
      l10n: l10n,
      channel: widget.channel,
      dm: widget.dm,
      isPersonalNotes: widget.isPersonalNotes,
    );
    final String? topic = widget.channel?.topic?.trim();
    final bool hasTopic = topic != null && topic.isNotEmpty;
    final Color primaryColor = widget.highContrast
        ? Colors.white
        : context.colors.textPrimary;
    final Color mutedColor = widget.highContrast
        ? Colors.white.withValues(alpha: 0.8)
        : context.colors.textTertiary;

    final bool wideLayout = isWideLayout(context);
    final bool titleTappable =
        !wideLayout ||
        (widget.dm != null &&
            (widget.dm!.isGroup ||
                (!widget.dm!.isGroup && !widget.dm!.isPersonalNotes)));

    final Widget titleContent = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
      child: Row(
        children: [
          _buildLeadingIcon(context),
          const SizedBox(width: 8),
          Flexible(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: context.textStyles.channelName.copyWith(
                      color: primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (showGroupPencil) ...[
                  const SizedBox(width: 4),
                  PhosphorIcon(
                    PhosphorIconsFill.pencilSimple,
                    size: 16,
                    color: mutedColor,
                  ),
                ],
                if (widget.dm != null &&
                    isBotOrSystemDmRecipient(widget.dm!)) ...[
                  const SizedBox(width: 6),
                  FluxerUserTag(isSystem: widget.dm!.isSystem),
                ],
              ],
            ),
          ),
          if (hasTopic) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                '•',
                style: context.textStyles.bodySmall.copyWith(
                  color: mutedColor,
                  fontSize: 13,
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: FluxerGestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => unawaited(
                  showChannelTopicDialog(
                    context,
                    channelName: title,
                    topic: topic,
                    channelId: widget.channel!.id,
                  ),
                ),
                child: Text(
                  topic,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.textStyles.bodySmall.copyWith(
                    color: mutedColor,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveringTitle = true),
      onExit: (_) => setState(() => _hoveringTitle = false),
      cursor: titleTappable ? SystemMouseCursors.click : MouseCursor.defer,
      child: titleTappable
          ? InkWell(
              onTap: () => _handleTitleTap(context),
              borderRadius: BorderRadius.circular(6),
              child: titleContent,
            )
          : titleContent,
    );
  }

  void _handleTitleTap(BuildContext context) {
    if (!isWideLayout(context)) {
      unawaited(
        showChannelDetailsSheet(
          context,
          channel: widget.channel,
          dm: widget.dm,
        ),
      );
      return;
    }
    final DmConversation? dm = widget.dm;
    if (dm != null && dm.isGroup) {
      unawaited(EditGroupDmFlow.show(context, dm: dm));
      return;
    }
    if (dm != null && !dm.isGroup && !dm.isPersonalNotes) {
      unawaited(FluxerUserProfileSheet.show(context, userId: dm.recipientId));
      return;
    }
  }

  Widget _buildLeadingIcon(BuildContext context) {
    if (widget.isPersonalNotes) {
      return SizedBox(
        width: 32,
        height: 32,
        child: Center(
          child: PhosphorIcon(
            PhosphorIconsFill.notePencil,
            size: 20,
            color: widget.highContrast
                ? Colors.white
                : context.colors.interactiveNormal,
          ),
        ),
      );
    }
    final Channel? channel = widget.channel;
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
    final DmConversation? dm = widget.dm;
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
        children: <Widget>[
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
}
