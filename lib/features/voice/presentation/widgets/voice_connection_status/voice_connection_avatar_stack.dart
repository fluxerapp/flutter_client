import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:material_ui/material_ui.dart';

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
                child: FluxerAvatar.user(
                  userId: visible[i].userId,
                  fallbackText: visible[i].user?.username ?? visible[i].userId,
                  imageUrl: visible[i].user?.avatar == null
                      ? null
                      : FluxerMediaUrl.userAvatar(
                          userId: visible[i].userId,
                          hash: visible[i].user!.avatar,
                        ),
                  avatarColor: visible[i].user?.avatarColor,
                  size: 24,
                  showStatus: false,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
