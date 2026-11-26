import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/voice/voice_fullscreen_video_zoom.dart';
import 'package:fluxer_app/features/ui/voice/voice_participant_media_tile.dart';
import 'package:fluxer_app/features/ui/voice/voice_tile_metrics.dart';
import 'package:fluxer_app/features/voice/domain/desktop_tile_presentation.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_style.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_call_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/participant_card_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/touch_grid/touch_tile.dart';
import 'package:fluxer_app/features/voice/utils/media/participant_track_resolver.dart';
import 'package:fluxer_app/features/voice/utils/media/video_subscription.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:livekit_client/livekit_client.dart';

class VoiceParticipantCardMedia extends ConsumerWidget {
  const VoiceParticipantCardMedia({
    required this.data,
    required this.call,
    required this.surfaceColor,
    super.key,
  });

  final VoiceParticipantCardData data;
  final VoiceGridCallData call;
  final Color surfaceColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceDesktopTilePresentation? desktop = data.slot.desktopPresentation;
    final bool pauseOwnPreview = ref.watch(
      voiceSettingsProvider.select(
        (VoiceSettingsState s) => s.pauseOwnScreenSharePreviewOnUnfocus,
      ),
    );
    final bool mirrorCamera = ref.watch(
      voiceSettingsProvider.select(
        (VoiceSettingsState s) => s.shouldMirrorOwnCamera,
      ),
    );
    final bool blocked =
        data.userId != call.currentUserId &&
        ref.watch(
          blockedUserIdsProvider.select(
            (Set<String> ids) => ids.contains(data.userId),
          ),
        );
    return VoiceFullscreenVideoZoom(
      key: ValueKey<String>('voice-fullscreen-zoom-${data.tile.tileId}'),
      enabled: data.isFullscreen,
      child: VoiceParticipantMediaTile(
        media: call.media,
        userId: data.userId,
        currentUserId: call.currentUserId,
        localConnectionId: call.localConnectionId,
        voice: data.voice,
        display: data.display,
        backgroundColor: surfaceColor,
        user: data.tile.data.user,
        userDisplay: data.userDisplay,
        tileSource: data.source,
        isActiveScreenShare: data.isWatching,
        fillContainer: data.slot.fillContainer,
        videoCornerRadius: desktop != null
            ? voiceDesktopTileRadius(desktop)
            : VoiceTouchTile.radius(data.slot),
        cameraFit: desktop != null ? VideoViewFit.contain : VideoViewFit.cover,
        videoBackgroundColor: desktop != null
            ? kVoiceDesktopTileVideoSurface
            : null,
        avatarSizeOf: desktop != null ? voiceDesktopTileAvatarSize : null,
        streamPreviewUrl: buildViewerStreamPreviewUrl(
          baseUrl: call.baseUrl,
          voice: data.tile.data.voice,
          isScreenShareTile: data.isScreenShare,
        ),
        isTileFocused: data.slot.isFocusMain,
        pauseOwnScreenSharePreviewOnUnfocus: pauseOwnPreview,
        mirrorCamera: mirrorCamera,
        omitVideoTrack: data.omitVideoTrack,
        subscribeQuality: voiceCameraSubscribeQuality(
          isFilmstrip: data.slot.isFilmstrip,
          isFocusMain:
              data.slot.isFocusMain ||
              (data.isWatching && !data.slot.isFilmstrip),
          tileWidth: data.slot.size.width,
          tileHeight: data.slot.size.height,
          devicePixelRatio: MediaQuery.devicePixelRatioOf(context),
        ),
        blocked: blocked,
      ),
    );
  }
}
