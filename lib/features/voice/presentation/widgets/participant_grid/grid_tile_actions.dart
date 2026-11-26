import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_context_menu.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/participant_grid/grid_card_slot.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_fullscreen_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/call_visual_layout.dart';
import 'package:fluxer_app/features/voice/utils/grid_layout/grid_tile.dart';
import 'package:fluxer_app/features/voice/utils/media/watched_video_tile.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_fullscreen.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceGridTileActions {
  const VoiceGridTileActions({
    required this.ref,
    required this.guildId,
    required this.channelId,
  });

  final WidgetRef ref;
  final String? guildId;
  final String channelId;

  BuildContext get _context => ref.context;

  void toggleOverlay() => ref.read(voiceCallOverlayProvider.notifier).toggle();

  void tap(VoiceGridTile tile, VoiceGridCardSlot slot) {
    if (slot.isDesktop) {
      _tapDesktop(tile, slot);
      return;
    }
    if (_opensFullscreen(tile)) {
      openFullscreen(tile, slot);
      return;
    }
    toggleOverlay();
  }

  void watch(VoiceGridTile tile, VoiceGridCardSlot slot) {
    if (slot.isDesktop) {
      _watchDesktop(tile);
      return;
    }
    openFullscreen(tile, slot);
  }

  void stopWatching(VoiceGridTile tile) =>
      ref.read(voiceScreenShareWatchTileProvider.notifier).unwatch(tile.tileId);

  void openFullscreen(VoiceGridTile tile, VoiceGridCardSlot slot) {
    if (_isFullscreen(tile, slot)) {
      toggleOverlay();
      return;
    }
    _watchStream(tile);
    ref
        .read(voiceScreenShareFullscreenProvider.notifier)
        .expandTile(tile.tileId);
  }

  void exitFullscreen() => ref
      .read(voiceScreenShareFullscreenProvider.notifier)
      .toggle(currentlyExpanded: true);

  void togglePin(VoiceGridTile tile) {
    final VoiceCallLayout layout = ref.read(voiceCallLayoutProvider.notifier);
    if (ref.read(voiceCallLayoutProvider).pinnedTileId == tile.tileId) {
      layout.unpin();
    } else {
      layout.pin(tile.tileId);
    }
  }

  void toggleDevices(VoiceGridTile tile) => ref
      .read(voiceCallLayoutProvider.notifier)
      .toggleExpandedUser(tile.data.userId);

  void openMenu(VoiceGridTile tile, Offset position) {
    unawaited(() async {
      ref.read(voiceCallOverlayProvider.notifier).setMenuPinned(value: true);
      try {
        await VoiceParticipantContextMenu.show(
          _context,
          ref,
          target: VoiceParticipantMenuTarget(
            participant: tile.data,
            tileId: tile.tileId,
            tileSource: tile.source,
            guildId: guildId,
            channelId: channelId,
          ),
          position: position,
        );
      } finally {
        if (_context.mounted) {
          ref
              .read(voiceCallOverlayProvider.notifier)
              .setMenuPinned(value: false);
        }
      }
    }());
  }

  void _tapDesktop(VoiceGridTile tile, VoiceGridCardSlot slot) {
    if (tile.isScreenShare &&
        !_isOwnScreenShare(tile) &&
        !ref.read(voiceScreenShareWatchTileProvider).contains(tile.tileId)) {
      _watchDesktop(tile);
      return;
    }
    final VoiceCallLayoutState layout = ref.read(voiceCallLayoutProvider);
    final VoiceCallLayout notifier = ref.read(voiceCallLayoutProvider.notifier);
    final bool focused = voiceCallTileIsFocused(
      isFocusMode: layout.mode == VoiceCallLayoutMode.focus,
      pinnedTileId: layout.pinnedTileId,
      tileId: tile.tileId,
      effectiveMainTileId: slot.isFocusMain ? tile.tileId : null,
    );
    if (focused) {
      notifier.unpin();
    } else {
      notifier.pin(tile.tileId);
    }
  }

  void _watchDesktop(VoiceGridTile tile) {
    _watchStream(tile);
    if (ref.read(voiceCallLayoutProvider).pinnedTileId != tile.tileId) {
      ref.read(voiceCallLayoutProvider.notifier).pin(tile.tileId);
    }
  }

  void _watchStream(VoiceGridTile tile) {
    if (tile.isScreenShare) {
      ref.read(voiceScreenShareWatchTileProvider.notifier).watch(tile.tileId);
    }
  }

  bool _isOwnScreenShare(VoiceGridTile tile) {
    final String? localConnectionId = ref
        .read(voiceSessionProvider)
        .activeConnectionId;
    return tile.isScreenShare &&
        localConnectionId != null &&
        tile.data.voice.connectionId == localConnectionId;
  }

  bool _opensFullscreen(VoiceGridTile tile) => voiceTileTapOpensFullscreen(
    source: tile.source,
    selfVideo: tile.data.voice.selfVideo,
    isOwnScreenShare: _isOwnScreenShare(tile),
  );

  bool _isFullscreen(VoiceGridTile tile, VoiceGridCardSlot slot) {
    final VoiceScreenShareFullscreenPrefs prefs = ref.read(
      voiceScreenShareFullscreenProvider,
    );
    if (!resolveVoiceScreenShareExpanded(
      watchedTileIds: ref.read(voiceScreenShareWatchTileProvider),
      landscape: MediaQuery.orientationOf(_context) == Orientation.landscape,
      prefs: prefs,
    )) {
      return false;
    }
    final String? expandedTileId = prefs.expandedTileId;
    if (expandedTileId != null) {
      return expandedTileId == tile.tileId;
    }
    return slot.isFocusMain && _opensFullscreen(tile);
  }
}
