import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as database;
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/presentation/widgets/manage_member_roles_picker.dart';
import 'package:fluxer_app/features/members/utils/guild_member_menu_state.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/open_report_flow.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/profile/utils/profile_menu_capabilities.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_guild_moderation_entries.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_participant_menu_data.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_participant_menu_widgets.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_layout_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_participant_volume_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_screen_share_watch_tile_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_stream_audio_provider.dart';
import 'package:fluxer_app/features/voice/utils/participant/participant_menu_capabilities.dart';
import 'package:fluxer_app/features/voice/utils/participant/participant_moderation.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/user_tag.dart';
import 'package:fluxer_dart/gateway.dart';

class VoiceParticipantContextMenu {
  VoiceParticipantContextMenu._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required VoiceParticipantMenuTarget target,
    required Offset position,
  }) async {
    if (!context.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (!usesDesktopPointerUi(context)) {
      await _showBottomSheet(context, target: target, l10n: l10n);
      return;
    }
    await _showDesktopOverlay(
      context,
      target: target,
      position: position,
      l10n: l10n,
    );
  }

  static Future<void> _showBottomSheet(
    BuildContext context, {
    required VoiceParticipantMenuTarget target,
    required FluxerLocalizations l10n,
  }) {
    return FluxerBottomSheet.showScrollable<void>(
      context,
      useRootNavigator: true,
      initialChildSize: FluxerBottomSheet.scrollableSheetHalfSize,
      minChildSize: 0.25,
      builder: (sheetContext, scrollController, close) {
        return _VoiceParticipantContextMenuPanel(
          target: target,
          l10n: l10n,
          onClose: close,
          scrollController: scrollController,
          sheetPadding: FluxerBottomSheet.scrollViewPadding(
            sheetContext,
            padding: EdgeInsets.symmetric(horizontal: sheetContext.layout.s4),
          ),
        );
      },
    );
  }

  static Future<void> _showDesktopOverlay(
    BuildContext context, {
    required VoiceParticipantMenuTarget target,
    required Offset position,
    required FluxerLocalizations l10n,
  }) async {
    await pushFluxerDesktopMenu<void>(
      context,
      position: position,
      builder: (BuildContext menuContext, VoidCallback close) {
        return _VoiceParticipantContextMenuPanel(
          target: target,
          l10n: l10n,
          onClose: close,
        );
      },
    );
  }

  static List<VoiceParticipantMenuGroup> buildGroups({
    required WidgetRef ref,
    required BuildContext context,
    required VoiceParticipantMenuTarget target,
    required VoiceParticipantMenuCapabilities capabilities,
    required FluxerLocalizations l10n,
    required VoidCallback close,
    GuildMemberMenuState? roleMenuState,
  }) {
    final String? guildId = target.guildId;
    final String userId = target.participant.userId;
    final List<VoiceParticipantMenuGroup> groups =
        buildVoiceParticipantMenuGroups(
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
            prioritizeSpeakers: l10n.voicePrioritizeSpeakersLabel,
            watchStream: l10n.voiceWatchStream,
            stopWatching: l10n.voiceStopWatching,
            stopStreaming: l10n.voiceParticipantMenuStopStreaming,
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
          },
          onToggleSelfDeafen: () {
            unawaited(
              ref.read(voiceSessionProvider.notifier).toggleSelfDeafen(),
            );
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
                actionLabel: l10n.voiceParticipantMenuCommunityMute,
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
                actionLabel: l10n.voiceParticipantMenuCommunityDeafen,
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
                actionLabel: l10n.voiceControlDisconnect,
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
          onToggleLocalMute: (bool muted) {
            unawaited(
              ref
                  .read(voiceParticipantVolumeProvider.notifier)
                  .setMuted(userId, muted: muted),
            );
          },
          onTogglePrioritizeSpeakers: (bool value) {
            unawaited(
              ref
                  .read(voiceSettingsProvider.notifier)
                  .setPrioritizeSpeakingParticipants(value: value),
            );
          },
          onWatchStream: () {
            ref
                .read(voiceScreenShareWatchTileProvider.notifier)
                .watch(target.tileId);
            close();
          },
          onStopWatching: () {
            ref
                .read(voiceScreenShareWatchTileProvider.notifier)
                .unwatch(target.tileId);
            close();
          },
          onStopStreaming: () {
            close();
            unawaited(
              ref
                  .read(voiceSessionProvider.notifier)
                  .toggleSelfStream(
                    screenShareNotificationText:
                        l10n.voiceScreenShareNotificationText,
                  ),
            );
          },
        );

    if (!capabilities.isScreenShareTile) {
      _addRoleAndModerationGroups(
        groups: groups,
        context: context,
        ref: ref,
        target: target,
        l10n: l10n,
        close: close,
        roleMenuState: roleMenuState,
      );
    }
    if (!capabilities.isCurrentUser) {
      final IarUserContext reportContext = _reportContext(ref, target);
      groups.add(
        VoiceParticipantMenuGroup(
          entries: <VoiceParticipantMenuEntry>[
            VoiceParticipantMenuActionEntry(
              label: l10n.voiceParticipantMenuReport,
              icon: PhosphorIconsFill.flag,
              isDanger: true,
              onPressed: () {
                close();
                unawaited(openReportFlow(context, iarContext: reportContext));
              },
            ),
          ],
        ),
      );
    }
    return groups;
  }

  static void _addRoleAndModerationGroups({
    required List<VoiceParticipantMenuGroup> groups,
    required BuildContext context,
    required WidgetRef ref,
    required VoiceParticipantMenuTarget target,
    required FluxerLocalizations l10n,
    required VoidCallback close,
    required GuildMemberMenuState? roleMenuState,
  }) {
    final String? guildId = target.guildId;
    final String userId = target.participant.userId;
    if ((roleMenuState?.shouldShowRolesSubmenu ?? false) && guildId != null) {
      final GuildMemberMenuState menuState = roleMenuState!;
      groups.add(
        VoiceParticipantMenuGroup(
          entries: <VoiceParticipantMenuEntry>[
            VoiceParticipantMenuActionEntry(
              label: l10n.userProfileRoles,
              icon: PhosphorIconsFill.shield,
              onPressed: () {
                close();
                unawaited(
                  ManageMemberRolesPicker.show(
                    context,
                    ref,
                    position: null,
                    guildId: guildId,
                    userId: userId,
                    allGuildRoles: menuState.allGuildRoles,
                    memberRoleIds: menuState.memberRoleIds,
                    canManageRoles: menuState.canManageRoles,
                    isGuildOwner: menuState.isGuildOwner,
                    viewerHighestRole: menuState.viewerHighestRole,
                  ),
                );
              },
            ),
          ],
        ),
      );
    }

    if (guildId != null && roleMenuState != null) {
      final String username = _voiceParticipantUsername(ref, target);
      final List<VoiceParticipantMenuEntry> moderationEntries =
          buildVoiceParticipantGuildModerationEntries(
            context: context,
            ref: ref,
            l10n: l10n,
            guildId: guildId,
            userId: userId,
            username: username,
            capabilities: roleMenuState.capabilities,
            currentNick: roleMenuState.currentNick,
            close: close,
          );
      if (moderationEntries.isNotEmpty) {
        groups.add(VoiceParticipantMenuGroup(entries: moderationEntries));
      }
    }
  }

  static IarUserContext _reportContext(
    WidgetRef ref,
    VoiceParticipantMenuTarget target,
  ) {
    final String userId = target.participant.userId;
    final database.User? user = target.participant.user;
    final GuildUserDisplay? display = watchGuildScopedUserDisplay(
      ref: ref,
      userId: userId,
      guildId: target.guildId,
      currentUserId: ref.watch(currentUserIdProvider),
    );
    return IarUserContext(
      userId: userId,
      username: user == null
          ? userId
          : formatUserTag(
              user.username,
              user.discriminator,
              uniqueUsernames: ref.watch(uniqueUsernamesProvider),
              bot: user.bot,
            ),
      displayName:
          display?.displayName ?? user?.globalName ?? user?.username ?? userId,
      avatarUrl: display?.avatarUrl,
      avatarColor: display?.avatarColor,
      guildId: target.guildId,
    );
  }

  static String _voiceParticipantUsername(
    WidgetRef ref,
    VoiceParticipantMenuTarget target,
  ) {
    final GuildUserDisplay? display = watchGuildScopedUserDisplay(
      ref: ref,
      userId: target.participant.userId,
      guildId: target.guildId,
      currentUserId: ref.watch(currentUserIdProvider),
    );
    if (display != null) {
      return display.displayName;
    }
    final database.User? user = target.participant.user;
    if (user == null) {
      return target.participant.userId;
    }
    return user.globalName ?? user.username;
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

  static Widget buildBottomSheetEntry(VoiceParticipantMenuEntry entry) {
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

  static List<Widget> buildDesktopItems({
    required List<VoiceParticipantMenuGroup> groups,
  }) {
    final List<Widget> items = <Widget>[];
    for (var groupIndex = 0; groupIndex < groups.length; groupIndex++) {
      if (groupIndex > 0) {
        items.add(const ContextMenuDivider());
      }
      for (final VoiceParticipantMenuEntry entry
          in groups[groupIndex].entries) {
        items.add(buildDesktopEntry(entry));
      }
    }
    return items;
  }

  static Widget buildDesktopPanel(List<Widget> items) {
    return FluxerDesktopMenuPanel.fitContent(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: items,
        ),
      ),
    );
  }

  static Widget buildDesktopEntry(VoiceParticipantMenuEntry entry) {
    return switch (entry) {
      VoiceParticipantMenuActionEntry() => ContextMenuItem(
        label: entry.label,
        icon: entry.icon,
        isDanger: entry.isDanger,
        isDisabled: !entry.enabled,
        onTap: entry.enabled ? entry.onPressed : () {},
      ),
      VoiceParticipantMenuCheckboxEntry() => FluxerMenuCheckboxItem(
        label: entry.label,
        isChecked: entry.isChecked,
        onPressed: () => entry.onChanged(!entry.isChecked),
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

class _VoiceParticipantContextMenuPanel extends ConsumerStatefulWidget {
  const _VoiceParticipantContextMenuPanel({
    required this.target,
    required this.l10n,
    required this.onClose,
    this.scrollController,
    this.sheetPadding,
  });

  final VoiceParticipantMenuTarget target;
  final FluxerLocalizations l10n;
  final VoidCallback onClose;
  final ScrollController? scrollController;
  final EdgeInsets? sheetPadding;

  @override
  ConsumerState<_VoiceParticipantContextMenuPanel> createState() =>
      _VoiceParticipantContextMenuPanelState();
}

class _VoiceParticipantContextMenuPanelState
    extends ConsumerState<_VoiceParticipantContextMenuPanel> {
  GuildMemberMenuState? _roleMenuState;

  @override
  void initState() {
    super.initState();
    unawaited(_loadRoleMenuState());
  }

  Future<void> _loadRoleMenuState() async {
    final String? guildId = widget.target.guildId;
    final String userId = widget.target.participant.userId;
    if (guildId == null) {
      return;
    }
    final GuildMemberMenuState? roleMenuState =
        await resolveGuildMemberMenuStateForUser(
          ref: ref,
          guildId: guildId,
          userId: userId,
        );
    if (!mounted) {
      return;
    }
    setState(() => _roleMenuState = roleMenuState);
  }

  @override
  Widget build(BuildContext context) {
    final VoiceState voice = watchTargetVoiceState(ref, widget.target);
    final VoiceParticipantMenuTarget liveTarget =
        voiceParticipantMenuTargetWithVoice(
          target: widget.target,
          voice: voice,
        );
    final VoiceParticipantMenuCapabilities capabilities =
        buildVoiceParticipantMenuCapabilities(
          ref: ref,
          target: liveTarget,
          voice: voice,
          guildCapabilities:
              _roleMenuState?.capabilities ?? ProfileMenuCapabilities.none,
        );
    final List<VoiceParticipantMenuGroup> groups =
        VoiceParticipantContextMenu.buildGroups(
          ref: ref,
          context: context,
          target: liveTarget,
          capabilities: capabilities,
          l10n: widget.l10n,
          close: widget.onClose,
          roleMenuState: _roleMenuState,
        );
    if (widget.scrollController != null) {
      return ListView(
        controller: widget.scrollController,
        padding: widget.sheetPadding ?? EdgeInsets.zero,
        children: [
          FluxerBottomSheetGroupColumn(
            children: [
              for (final VoiceParticipantMenuGroup group in groups)
                FluxerMenuGroup(
                  children: [
                    for (final VoiceParticipantMenuEntry entry in group.entries)
                      VoiceParticipantContextMenu.buildBottomSheetEntry(entry),
                  ],
                ),
            ],
          ),
        ],
      );
    }
    final List<Widget> items = VoiceParticipantContextMenu.buildDesktopItems(
      groups: groups,
    );
    return VoiceParticipantContextMenu.buildDesktopPanel(items);
  }
}
