import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';

class VoiceConnectionAvatarStack extends ConsumerWidget {
  const VoiceConnectionAvatarStack({
    required this.guildChannelKey,
    this.desktop = false,
    super.key,
  });

  final String guildChannelKey;
  final bool desktop;

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
    final String? guildIdForStack = voiceGuildIdFromParticipantsKey(
      guildChannelKey,
    );
    if (desktop) {
      return _DesktopVoiceConnectionAvatarStack(
        participants: uniqueByUser,
        guildId: guildIdForStack,
        currentUserId: ref.watch(currentUserIdProvider),
      );
    }
    final List<VoiceChannelParticipantData> visible = uniqueByUser
        .take(5)
        .toList();
    final String? guildId = guildIdForStack;
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
            PositionedDirectional(
              start: i * (28 - overlap),
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

class _DesktopVoiceConnectionAvatarStack extends StatelessWidget {
  const _DesktopVoiceConnectionAvatarStack({
    required this.participants,
    required this.guildId,
    required this.currentUserId,
  });

  static const double _size = 32;
  static const double _outline = 2;
  static const int _maxVisible = 4;

  final List<VoiceChannelParticipantData> participants;
  final String? guildId;
  final String? currentUserId;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final List<VoiceChannelParticipantData> visible = participants
        .take(_maxVisible)
        .toList();
    final int remaining = participants.length - visible.length;
    final int columns = visible.length + (remaining > 0 ? 1 : 0);
    const double ringSize = _size + _outline * 2;

    Widget ring(Widget child) {
      return Container(
        width: ringSize,
        height: ringSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colors.backgroundTertiary,
        ),
        child: child,
      );
    }

    return SizedBox(
      width: columns * _size + _outline,
      height: ringSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          for (int i = 0; i < visible.length; i++)
            PositionedDirectional(
              start: i * _size - _outline,
              top: 0,
              child: ring(
                _VoiceConnectionStackAvatar(
                  participant: visible[i],
                  guildId: guildId,
                  currentUserId: currentUserId,
                  size: _size,
                ),
              ),
            ),
          if (remaining > 0)
            PositionedDirectional(
              start: visible.length * _size,
              top: _outline,
              child: Container(
                width: _size,
                height: _size,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colors.backgroundTertiary,
                ),
                child: Text(
                  '+$remaining',
                  style: context.textStyles.smallText.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                    color: colors.textSecondary,
                  ),
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
    this.size = 24,
  });

  final VoiceChannelParticipantData participant;
  final String? guildId;
  final String? currentUserId;
  final double size;

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
      size: size,
      showStatus: false,
    );
  }
}
