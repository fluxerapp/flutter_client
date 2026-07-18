import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_participant_menu_widgets.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_participant_volume_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_stream_audio_provider.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_menu_capabilities.dart';
import 'package:fluxer_app/features/voice/utils/voice_participant_moderation.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class VoiceParticipantContextMenu {
  VoiceParticipantContextMenu._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required VoiceParticipantMenuTarget target,
    required Offset position,
  }) async {
    final VoiceParticipantMenuCapabilities capabilities =
        await resolveVoiceParticipantMenuCapabilities(ref: ref, target: target);
    if (!context.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (isMobileLayout(context)) {
      await _showBottomSheet(
        context,
        ref,
        target: target,
        capabilities: capabilities,
        l10n: l10n,
      );
      return;
    }
    await _showDesktopOverlay(
      context,
      ref,
      target: target,
      capabilities: capabilities,
      position: position,
      l10n: l10n,
    );
  }

  static Future<void> _showBottomSheet(
    BuildContext context,
    WidgetRef ref, {
    required VoiceParticipantMenuTarget target,
    required VoiceParticipantMenuCapabilities capabilities,
    required FluxerLocalizations l10n,
  }) {
    return FluxerBottomSheet.showScrollable<void>(
      context,
      useRootNavigator: true,
      initialChildSize: 0.45,
      minChildSize: 0.25,
      maxChildSize: 0.85,
      builder: (sheetContext, scrollController, close) {
        final List<VoiceParticipantMenuGroup> groups = _buildGroups(
          ref: ref,
          context: context,
          target: target,
          capabilities: capabilities,
          l10n: l10n,
          close: close,
        );
        return ListView(
          controller: scrollController,
          padding: EdgeInsets.fromLTRB(
            sheetContext.layout.s4,
            0,
            sheetContext.layout.s4,
            sheetContext.layout.s4,
          ),
          children: [
            FluxerBottomSheetGroupColumn(
              children: [
                for (final VoiceParticipantMenuGroup group in groups)
                  FluxerMenuGroup(
                    children: [
                      for (final VoiceParticipantMenuEntry entry
                          in group.entries)
                        _buildBottomSheetEntry(entry),
                    ],
                  ),
              ],
            ),
          ],
        );
      },
    );
  }

  static Future<void> _showDesktopOverlay(
    BuildContext context,
    WidgetRef ref, {
    required VoiceParticipantMenuTarget target,
    required VoiceParticipantMenuCapabilities capabilities,
    required Offset position,
    required FluxerLocalizations l10n,
  }) async {
    final RenderBox? overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox?;
    if (overlay == null) {
      return;
    }
    final Offset local = overlay.globalToLocal(position);
    void close() {
      Navigator.of(context).pop();
    }

    final List<Widget> menuItems = _buildDesktopItems(
      groups: _buildGroups(
        ref: ref,
        context: context,
        target: target,
        capabilities: capabilities,
        l10n: l10n,
        close: close,
      ),
    );
    final double menuHeight = estimateVoiceParticipantContextMenuHeight(
      menuItems,
    );
    await Navigator.of(context).push<void>(
      _VoiceParticipantContextMenuRoute(
        position: local,
        overlaySize: overlay.size,
        menuHeight: menuHeight,
        panel: _buildDesktopPanel(menuItems),
      ),
    );
  }

  static List<VoiceParticipantMenuGroup> _buildGroups({
    required WidgetRef ref,
    required BuildContext context,
    required VoiceParticipantMenuTarget target,
    required VoiceParticipantMenuCapabilities capabilities,
    required FluxerLocalizations l10n,
    required VoidCallback close,
  }) {
    final String? guildId = target.guildId;
    final String userId = target.participant.userId;
    final String failureMessage = l10n.voiceParticipantModerationFailed;
    return buildVoiceParticipantMenuGroups(
      capabilities: capabilities,
      labels: VoiceParticipantMenuLabels(
        viewProfile: l10n.voiceParticipantMenuViewProfile,
        focus: l10n.voiceParticipantMenuFocus,
        unfocus: l10n.voiceParticipantMenuUnfocus,
        mute: l10n.voiceControlMute,
        deafen: l10n.voiceControlDeafen,
        communityMute: l10n.voiceParticipantMenuCommunityMute,
        communityDeafen: l10n.voiceParticipantMenuCommunityDeafen,
        disconnect: l10n.voiceControlDisconnect,
        userVolume: l10n.voiceParticipantMenuUserVolume,
        streamVolume: l10n.voiceParticipantMenuStreamVolume,
      ),
      onViewProfile: () {
        close();
        unawaited(
          FluxerUserProfileSheet.show(
            context,
            userId: userId,
            guildId: guildId,
          ),
        );
      },
      onToggleFocus: () {
        final VoiceCallLayout layout = ref.read(
          voiceCallLayoutProvider.notifier,
        );
        if (capabilities.isFocused) {
          layout.unpin();
        } else {
          layout.pin(target.tileId);
        }
        close();
      },
      onToggleSelfMute: () {
        unawaited(ref.read(voiceSessionProvider.notifier).toggleSelfMute());
        close();
      },
      onToggleSelfDeafen: () {
        unawaited(ref.read(voiceSessionProvider.notifier).toggleSelfDeafen());
        close();
      },
      onToggleCommunityMute: (bool checked) {
        if (guildId == null) {
          return;
        }
        unawaited(
          updateVoiceParticipantCommunityMute(
            ref: ref,
            guildId: guildId,
            userId: userId,
            muted: checked,
            failureMessage: failureMessage,
          ),
        );
      },
      onToggleCommunityDeafen: (bool checked) {
        if (guildId == null) {
          return;
        }
        unawaited(
          updateVoiceParticipantCommunityDeafen(
            ref: ref,
            guildId: guildId,
            userId: userId,
            deafened: checked,
            failureMessage: failureMessage,
          ),
        );
      },
      onDisconnect: () {
        close();
        if (capabilities.isCurrentUser) {
          unawaited(ref.read(voiceSessionProvider.notifier).leaveVoice());
          return;
        }
        if (guildId == null) {
          return;
        }
        unawaited(
          disconnectVoiceParticipant(
            ref: ref,
            guildId: guildId,
            userId: userId,
            connectionId: target.participant.voice.connectionId,
            failureMessage: failureMessage,
          ),
        );
      },
      onVolumeChanged: (int value) {
        unawaited(
          ref
              .read(voiceParticipantVolumeProvider.notifier)
              .setVolume(userId, value),
        );
      },
      onStreamVolumeChanged: (int value) =>
          _setStreamVolume(ref, capabilities.streamKey, value),
      onToggleStreamMute: (bool muted) =>
          _setStreamMuted(ref, capabilities.streamKey, muted: muted),
    );
  }

  static void _setStreamVolume(WidgetRef ref, String? streamKey, int value) {
    if (streamKey == null) {
      return;
    }
    unawaited(
      ref.read(voiceStreamAudioProvider.notifier).setVolume(streamKey, value),
    );
  }

  static void _setStreamMuted(
    WidgetRef ref,
    String? streamKey, {
    required bool muted,
  }) {
    if (streamKey == null) {
      return;
    }
    unawaited(
      ref
          .read(voiceStreamAudioProvider.notifier)
          .setMuted(streamKey, muted: muted),
    );
  }

  static Widget _buildBottomSheetEntry(VoiceParticipantMenuEntry entry) {
    return switch (entry) {
      VoiceParticipantMenuActionEntry() => FluxerBottomSheetMenuItem(
        label: entry.label,
        icon: entry.icon,
        isDanger: entry.isDanger,
        enabled: entry.enabled,
        onTap: entry.onPressed,
      ),
      VoiceParticipantMenuCheckboxEntry() => FluxerBottomSheetCheckboxItem(
        label: entry.label,
        isChecked: entry.isChecked,
        onTap: () => entry.onChanged(!entry.isChecked),
      ),
      VoiceParticipantMenuVolumeEntry() =>
        VoiceParticipantBottomSheetVolumeItem(
          label: entry.label,
          value: entry.value,
          onChanged: entry.onChanged,
        ),
    };
  }

  static List<Widget> _buildDesktopItems({
    required List<VoiceParticipantMenuGroup> groups,
  }) {
    final List<Widget> items = <Widget>[];
    for (var groupIndex = 0; groupIndex < groups.length; groupIndex++) {
      if (groupIndex > 0) {
        items.add(const ContextMenuDivider());
      }
      for (final VoiceParticipantMenuEntry entry
          in groups[groupIndex].entries) {
        items.add(_buildDesktopEntry(entry));
      }
    }
    return items;
  }

  static Widget _buildDesktopPanel(List<Widget> items) {
    return Builder(
      builder: (BuildContext context) {
        final layout = context.layout;
        return Material(
          color: context.colors.backgroundPrimary,
          borderRadius: layout.radiusSm,
          elevation: 8,
          shadowColor: Colors.black45,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: layout.radiusSm,
              border: Border.all(
                color: context.colors.backgroundModifierAccent,
              ),
            ),
            child: SizedBox(
              width: kVoiceParticipantContextMenuWidth,
              child: Padding(
                padding: EdgeInsets.all(layout.s2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: items,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildDesktopEntry(VoiceParticipantMenuEntry entry) {
    return switch (entry) {
      VoiceParticipantMenuActionEntry() => ContextMenuItem(
        label: entry.label,
        icon: entry.icon,
        isDanger: entry.isDanger,
        onTap: entry.enabled ? entry.onPressed : () {},
      ),
      VoiceParticipantMenuCheckboxEntry() =>
        VoiceParticipantContextMenuCheckboxItem(
          label: entry.label,
          icon: entry.icon,
          isChecked: entry.isChecked,
          onTap: () => entry.onChanged(!entry.isChecked),
        ),
      VoiceParticipantMenuVolumeEntry() =>
        VoiceParticipantContextMenuVolumeItem(
          label: entry.label,
          value: entry.value,
          onChanged: entry.onChanged,
        ),
    };
  }
}

class _VoiceParticipantContextMenuRoute extends PopupRoute<void> {
  _VoiceParticipantContextMenuRoute({
    required this.position,
    required this.overlaySize,
    required this.menuHeight,
    required this.panel,
  });

  final Offset position;
  final Size overlaySize;
  final double menuHeight;
  final Widget panel;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 120);

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => 'Dismiss';

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    final bool opensLeft =
        position.dx + kVoiceParticipantContextMenuWidth > overlaySize.width - 8;
    final bool opensUp = position.dy + menuHeight > overlaySize.height - 8;
    final double left =
        (opensLeft
                ? position.dx - kVoiceParticipantContextMenuWidth
                : position.dx)
            .clamp(
              8.0,
              overlaySize.width - kVoiceParticipantContextMenuWidth - 8,
            );
    final double top = (opensUp ? position.dy - menuHeight : position.dy).clamp(
      8.0,
      overlaySize.height - menuHeight - 8,
    );
    final Alignment alignment = Alignment(
      opensLeft ? 1.0 : -1.0,
      opensUp ? 1.0 : -1.0,
    );
    return Stack(
      children: [
        Positioned(
          left: left,
          top: top,
          width: kVoiceParticipantContextMenuWidth,
          child: ScaleTransition(
            scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            alignment: alignment,
            child: FadeTransition(opacity: animation, child: panel),
          ),
        ),
      ],
    );
  }
}
