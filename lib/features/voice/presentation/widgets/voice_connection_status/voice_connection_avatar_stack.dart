import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

class VoiceConnectionAvatarStack extends ConsumerWidget {
  const VoiceConnectionAvatarStack({required this.guildChannelKey, super.key});

  final String guildChannelKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<VoiceChannelParticipantData> participants = ref.watch(
      voiceChannelParticipantsProvider(guildChannelKey),
    );
    if (participants.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<VoiceChannelParticipantData> uniqueByUser =
        uniqueVoiceChannelParticipants(participants);
    final List<VoiceChannelParticipantData> visible = uniqueByUser
        .take(5)
        .toList();
    final String? guildId = voiceGuildIdFromParticipantsKey(guildChannelKey);
    final String? currentUserId = ref.watch(currentUserIdProvider);
    const double overlap = 12;
    final double width = 28 + (visible.length - 1) * (28 - overlap);

    return SizedBox(
      height: 28,
      width: width,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          for (int i = 0; i < visible.length; i++)
            Positioned(
              left: i * (28 - overlap),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: context.colors.panelControlBg,
                    width: 2,
                  ),
                ),
                child: _VoiceConnectionStackAvatar(
                  participant: visible[i],
                  guildId: guildId,
                  currentUserId: currentUserId,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _VoiceConnectionStackAvatar extends ConsumerWidget {
  const _VoiceConnectionStackAvatar({
    required this.participant,
    required this.guildId,
    required this.currentUserId,
  });

  final VoiceChannelParticipantData participant;
  final String? guildId;
  final String? currentUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GuildUserDisplay? display = watchGuildScopedUserDisplay(
      ref: ref,
      userId: participant.userId,
      guildId: guildId,
      currentUserId: currentUserId,
    );
    final String fallbackText =
        display?.displayName ??
        participant.user?.username ??
        participant.userId;
    return FluxerAvatar.user(
      userId: participant.userId,
      fallbackText: fallbackText,
      imageUrl: display?.avatarUrl,
      avatarColor: display?.avatarColor ?? participant.user?.avatarColor,
      size: 24,
      showStatus: false,
    );
  }
}
