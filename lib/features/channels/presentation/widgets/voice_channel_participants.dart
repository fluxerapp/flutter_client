import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_avatar.dart';
import 'package:fluxer_app/features/ui/list/fluxer_selectable_row.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/voice/fluxer_live_badge.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_context_menu.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class VoiceChannelParticipantsList extends ConsumerWidget {
  const VoiceChannelParticipantsList({
    required this.guildId,
    required this.channelId,
    super.key,
  });

  final String guildId;
  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String key = voiceChannelParticipantsFamilyKey(guildId, channelId);
    ref.watch(voiceChannelSidebarStructureProvider(key));
    final List<VoiceSidebarParticipant> list = ref.read(
      voiceChannelSidebarParticipantsProvider(key),
    );
    if (list.isEmpty) {
      return const SizedBox.shrink();
    }
    final bool desktop = usesDesktopPointerUi(context);
    return Padding(
      padding: desktop
          ? const EdgeInsetsDirectional.only(start: 24, end: 8, top: 4)
          : const EdgeInsetsDirectional.only(start: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          for (int i = 0; i < list.length; i++) ...<Widget>[
            if (i > 0) const SizedBox(height: 2),
            _VoiceChannelParticipantTile(
              guildId: guildId,
              channelId: channelId,
              participant: list[i],
            ),
          ],
        ],
      ),
    );
  }
}

class _VoiceChannelParticipantTile extends ConsumerWidget {
  const _VoiceChannelParticipantTile({
    required this.guildId,
    required this.channelId,
    required this.participant,
  });

  final String guildId;
  final String channelId;
  final VoiceSidebarParticipant participant;

  void _showParticipantMenu(
    BuildContext context,
    WidgetRef ref,
    Offset position,
  ) {
    final VoiceSidebarParticipant p = participant;
    final String connectionId = p.primaryVoice.connectionId ?? p.userId;
    unawaited(
      VoiceParticipantContextMenu.show(
        context,
        ref,
        target: VoiceParticipantMenuTarget(
          participant: VoiceChannelParticipantData(
            userId: p.userId,
            voice: p.primaryVoice,
          ),
          tileId: '$connectionId:camera',
          guildId: guildId,
          channelId: channelId,
          tileSource: VoiceParticipantTileSource.camera,
        ),
        position: position,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceSidebarParticipant p = participant;
    final VoiceSidebarVoiceFlags flags = ref.watch(
      voiceSidebarVoiceFlagsProvider(
        voiceSidebarVoiceFlagsKey(
          guildId: guildId,
          channelId: channelId,
          userId: p.userId,
        ),
      ),
    );
    final bool showMic = flags.guildMute || flags.selfMute;
    final bool micDanger = flags.guildMute;
    final bool showDeaf = flags.guildDeaf || flags.selfDeaf;
    final bool deafDanger = flags.guildDeaf;
    final bool hasIcons =
        flags.selfVideo || showMic || showDeaf || flags.selfStream;
    if (usesDesktopPointerUi(context)) {
      final bool isCurrentUser = p.userId == watchAccountUserId(ref);
      return FluxerSelectableRow(
        isSelected: false,
        selectedColor: Colors.transparent,
        hoverColor: context.colors.backgroundModifierHover,
        pressedColor: context.colors.backgroundModifierHover,
        borderRadius: context.layout.radiusMd,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        onContextMenuRequested: (TapUpDetails details) async =>
            _showParticipantMenu(context, ref, details.globalPosition),
        childBuilder: (BuildContext context, Set<WidgetState> states) {
          final bool emphasized =
              isCurrentUser || states.contains(WidgetState.hovered);
          return Row(
            children: <Widget>[
              FluxerAvatar.user(
                userId: p.userId,
                imageUrl: p.avatarUrl,
                fallbackText: p.displayName,
                size: 24,
                showStatus: false,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  p.displayName,
                  style: context.textStyles.channelName.copyWith(
                    color: emphasized
                        ? context.colors.textPrimary
                        : context.colors.textPrimaryMuted,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 20 / 14,
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (hasIcons) ...<Widget>[
                const SizedBox(width: 6),
                _VoiceParticipantStatusIcons(
                  selfVideo: flags.selfVideo,
                  showMic: showMic,
                  micDanger: micDanger,
                  showDeaf: showDeaf,
                  deafDanger: deafDanger,
                  selfStream: flags.selfStream,
                  desktop: true,
                ),
              ],
            ],
          );
        },
      );
    }
    return FluxerGestureDetector(
      behavior: HitTestBehavior.opaque,
      onSecondaryTapUp: (TapUpDetails details) {
        _showParticipantMenu(context, ref, details.globalPosition);
      },
      onLongPress: isTouchPrimaryInput(ref)
          ? () {
              final RenderBox? box = context.findRenderObject() as RenderBox?;
              final Offset position = box == null
                  ? Offset.zero
                  : box.localToGlobal(Offset.zero);
              _showParticipantMenu(context, ref, position);
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: <Widget>[
            FluxerAvatar.user(
              userId: p.userId,
              imageUrl: p.avatarUrl,
              fallbackText: p.displayName,
              size: 20,
              showStatus: false,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                p.displayName,
                style: context.textStyles.channelName.copyWith(
                  color: context.colors.textTertiary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (hasIcons) ...<Widget>[
              const SizedBox(width: 4),
              _VoiceParticipantStatusIcons(
                selfVideo: flags.selfVideo,
                showMic: showMic,
                micDanger: micDanger,
                showDeaf: showDeaf,
                deafDanger: deafDanger,
                selfStream: flags.selfStream,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _VoiceParticipantStatusIcons extends StatelessWidget {
  const _VoiceParticipantStatusIcons({
    required this.selfVideo,
    required this.showMic,
    required this.micDanger,
    required this.showDeaf,
    required this.deafDanger,
    required this.selfStream,
    this.desktop = false,
  });

  final bool desktop;
  final bool selfVideo;
  final bool showMic;
  final bool micDanger;
  final bool showDeaf;
  final bool deafDanger;
  final bool selfStream;

  Widget _buildDesktop(BuildContext context) {
    final Color muted = context.colors.textPrimaryMuted;
    const Color guildAction = Color(0xFFEF4444);
    final List<Widget> icons = <Widget>[
      if (selfVideo)
        PhosphorIcon(PhosphorIconsFill.videoCamera, size: 16, color: muted),
      if (showMic)
        PhosphorIcon(
          PhosphorIconsFill.microphoneSlash,
          size: 16,
          color: micDanger ? guildAction : muted,
        ),
      if (showDeaf)
        PhosphorIcon(
          PhosphorIconsFill.speakerSlash,
          size: 16,
          color: deafDanger ? guildAction : muted,
        ),
      if (selfStream) const FluxerLiveBadge(),
    ];
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 0; i < icons.length; i++) ...<Widget>[
          if (i > 0) const SizedBox(width: 4),
          icons[i],
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (desktop) {
      return _buildDesktop(context);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (selfVideo)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: PhosphorIcon(
              PhosphorIconsFill.videoCamera,
              size: 14,
              color: context.colors.textSecondary,
            ),
          ),
        if (showMic)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: PhosphorIcon(
              PhosphorIconsFill.microphoneSlash,
              size: 14,
              color: micDanger
                  ? context.colors.statusDanger
                  : context.colors.textSecondary,
            ),
          ),
        if (showDeaf)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 4),
            child: PhosphorIcon(
              PhosphorIconsFill.speakerSlash,
              size: 14,
              color: deafDanger
                  ? context.colors.statusDanger
                  : context.colors.textSecondary,
            ),
          ),
        if (selfStream) const FluxerLiveBadge(),
      ],
    );
  }
}
