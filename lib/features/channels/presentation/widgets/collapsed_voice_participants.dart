import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar_stack.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class CollapsedVoiceParticipants extends ConsumerWidget {
  const CollapsedVoiceParticipants({
    required this.guildId,
    required this.channelIds,
    this.isChannelStack = false,
    super.key,
  });

  static const double _avatarSize = 28;
  static const int _maxVisible = 5;

  final String guildId;
  final List<String> channelIds;
  final bool isChannelStack;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Set<String> seen = <String>{};
    final List<VoiceSidebarParticipant> participants =
        <VoiceSidebarParticipant>[];
    for (final String channelId in channelIds) {
      final List<VoiceSidebarParticipant> list = ref.watch(
        voiceChannelSidebarParticipantsProvider(
          voiceChannelParticipantsFamilyKey(guildId, channelId),
        ),
      );
      for (final VoiceSidebarParticipant participant in list) {
        if (seen.add(participant.userId)) {
          participants.add(participant);
        }
      }
    }
    if (participants.isEmpty) {
      return const SizedBox.shrink();
    }
    final colors = context.colors;
    return Padding(
      padding: isChannelStack
          ? const EdgeInsetsDirectional.only(start: 24, end: 8, top: 4)
          : const EdgeInsetsDirectional.symmetric(horizontal: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: <Widget>[
            if (!isChannelStack) ...<Widget>[
              PhosphorIcon(
                PhosphorIconsFill.speakerHigh,
                size: 20,
                color: colors.textPrimaryMuted,
              ),
              const SizedBox(width: 6),
            ],
            Flexible(
              child: FluxerAvatarStack(
                maxVisible: _maxVisible,
                outlineColor: colors.channelSidebarBackground,
                avatars: <Widget>[
                  for (final VoiceSidebarParticipant participant
                      in participants)
                    FluxerAvatar.user(
                      userId: participant.userId,
                      imageUrl: participant.avatarUrl,
                      fallbackText: participant.displayName,
                      size: _avatarSize,
                      showStatus: false,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
