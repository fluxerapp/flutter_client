import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/channels/providers/channel_typing_provider.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/utils/voice_e2ee_display.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';

const double kDmHeaderAvatarSize = 32;
const double _kGroupMemberCountDotSize = 8;

class DmHeaderAvatar extends ConsumerWidget {
  const DmHeaderAvatar({required this.dm, super.key});

  final DmConversation dm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          GroupDmAvatar.conversation(
            dm,
            size: kDmHeaderAvatarSize,
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
            size: kDmHeaderAvatarSize,
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
}

class GroupDmMemberCountSubtitle extends StatelessWidget {
  const GroupDmMemberCountSubtitle({required this.dm, super.key});

  final DmConversation dm;

  @override
  Widget build(BuildContext context) {
    final Color color = context.colors.textPrimaryMuted;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: _kGroupMemberCountDotSize,
          height: _kGroupMemberCountDotSize,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            FluxerLocalizations.of(context).dmGroupMemberCount(dm.memberCount),
            style: context.textStyles.timestamp.copyWith(
              color: color,
              fontSize: 14,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
