import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/voice/voice_channel_join_button.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_e2ee_indicator.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_join_empty_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_connection_actions.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceCallJoinEmptyState extends ConsumerWidget {
  const VoiceCallJoinEmptyState({
    required this.channelId,
    required this.participantPreviewCount,
    super.key,
  });

  final String channelId;
  final int participantPreviewCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final conversations = ref.watch(
      dmViewModelProvider.select((s) => s.conversations),
    );
    final DmConversation? dm = findDmById(conversations, channelId);
    final String headline = dm?.displayName ?? l10n.dmVoiceFullscreenTitle;

    return VoiceJoinEmptyState(
      childBuilder: (VoiceJoinEmptyLayout layout) => <Widget>[
        VoiceJoinEmptyMark(
          layout: layout,
          child: _buildMarkChild(context, dm, layout.iconSize),
        ),
        VoiceJoinEmptyTitle(title: headline, layout: layout),
        if (participantPreviewCount > 0)
          VoiceJoinEmptySubtitle(
            text: l10n.voiceChannelParticipantCount(participantPreviewCount),
          ),
        VoiceChannelJoinButton(
          label: l10n.voiceCallJoin,
          onPressed: () {
            unawaited(
              joinVoiceChannelWithConfirmation(
                ref: ref,
                context: context,
                guildId: null,
                channelId: channelId,
              ),
            );
          },
        ),
        VoiceE2eeIndicator(
          guildId: null,
          channelId: channelId,
          variant: VoiceE2eeIndicatorVariant.call,
          includeTopPadding: false,
        ),
      ],
    );
  }

  Widget _buildMarkChild(
    BuildContext context,
    DmConversation? dm,
    double iconSize,
  ) {
    if (dm == null) {
      return PhosphorIcon(
        PhosphorIconsFill.phone,
        size: iconSize,
        color: context.colors.textPrimary,
      );
    }
    if (dm.isGroup) {
      return ClipOval(
        child: SizedBox(
          width: iconSize,
          height: iconSize,
          child: FittedBox(
            fit: BoxFit.cover,
            child: groupDmAvatarCluster(
              dm: dm,
              size: iconSize,
              status: dm.groupStatus,
            ),
          ),
        ),
      );
    }
    return ClipOval(
      child: SizedBox(
        width: iconSize,
        height: iconSize,
        child: FluxerAvatar.user(
          fallbackText: dm.recipientName,
          userId: dm.recipientId,
          imageUrl: FluxerMediaUrl.userAvatar(
            userId: dm.recipientId,
            hash: dm.recipientAvatar,
            animated: true,
          ),
          status: dm.recipientStatus,
          size: iconSize,
          showStatus: false,
        ),
      ),
    );
  }
}
