import 'dart:async';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_coordinator.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/permissions/guild_channel_permission_cleanup.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/push/push_notifications_coordinator.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_setup.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_ui.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_no_distributor_dismissal_provider.dart';
import 'package:fluxer_app/core/router/app_location_persistence.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/share/pending_share_provider.dart';
import 'package:fluxer_app/core/share/shared_media_payload.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/share_media_sheet.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/utils/guild_outage_availability.dart';
import 'package:fluxer_app/features/members/providers/member_list_desired_ranges_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/voice/tts/fluxer_tts_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class ShellRouteListeners extends ConsumerStatefulWidget {
  const ShellRouteListeners({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<ShellRouteListeners> createState() =>
      _ShellRouteListenersState();
}

class _ShellRouteListenersState extends ConsumerState<ShellRouteListeners> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      DrawerNavigationCoordinator.syncForShellLocation(
        ref.container,
        ref.read(shellLocationProvider),
      );
      final String? activeGuildId = ref.read(activeGuildIdProvider);
      if (activeGuildId != null) {
        _applyActiveGuildEffects(activeGuildId);
      }
    });
    ref
      ..listenManual<String>(shellLocationProvider, (
        String? previous,
        String next,
      ) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }
          DrawerNavigationCoordinator.syncForShellLocation(ref.container, next);
          final db = ref.read(fluxerDatabaseProvider);
          persistGuildChannelFromLocation(db, next);
          persistAppLocation(db, next);
        });
      })
      ..listenManual<String?>(activeGuildIdProvider, (
        String? previous,
        String? next,
      ) {
        _scheduleActiveGuildEffects(previous: previous, next: next);
      })
      ..listenManual<String?>(activeChannelIdProvider, (
        String? previous,
        String? next,
      ) {
        if (previous == next) {
          return;
        }
        _stopTtsIfLeavingSpokenChannel(next);
        if (previous != null) {
          _stopAttachmentAudioOnChannelChange();
          _scheduleInactiveChannelCleanup(previous);
        }
      });

    if (PushProviderGuard.isUnifiedPush) {
      ref.listenManual<bool>(unifiedPushDistributorSetupProvider, (
        bool? previous,
        bool next,
      ) {
        if (!next) {
          return;
        }
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }
          final BuildContext? rootContext = rootNavigatorKey.currentContext;
          if (rootContext == null || !rootContext.mounted) {
            return;
          }
          ref.read(unifiedPushDistributorSetupProvider.notifier).clearRequest();
          unawaited(
            showUnifiedPushDistributorSetup(
              rootContext,
              dismissalStorage: ref.read(
                unifiedPushNoDistributorDismissalStorageProvider,
              ),
            ),
          );
        });
      });
    }

    ref.listenManual<SharedMediaPayload?>(pendingShareProvider, (
      SharedMediaPayload? previous,
      SharedMediaPayload? next,
    ) {
      if (next == null) {
        return;
      }
      final List<XFile> files = next.toXFiles();
      final String? initialMessage = next.initialMessage;
      if (files.isEmpty && (initialMessage == null || initialMessage.isEmpty)) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        final BuildContext? rootContext = rootNavigatorKey.currentContext;
        if (rootContext == null || !rootContext.mounted) {
          return;
        }
        ref.read(pendingShareProvider.notifier).clear();
        unawaited(
          showShareMediaSheet(
            rootContext,
            files: files,
            initialMessage: initialMessage,
          ),
        );
      });
    });
  }

  void _scheduleActiveGuildEffects({
    required String? previous,
    required String? next,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      final String? activeGuildId = ref.read(activeGuildIdProvider);
      if (previous != null && previous != activeGuildId) {
        unawaited(evictInactiveGuildPermissionState(ref.container, previous));
      }
      if (next == null || activeGuildId != next) {
        return;
      }
      _applyActiveGuildEffects(next);
    });
  }

  void _applyActiveGuildEffects(String guildId) {
    final guilds = ref.read(guildListViewModelProvider).guilds;
    final guild = guilds.where((g) => g.id == guildId).firstOrNull;
    if (isGuildOutageUnavailable(
      guildId: guildId,
      trackedUnavailableGuildIds: ref.read(guildAvailabilityProvider),
      guild: guild,
    )) {
      return;
    }
    ref
        .read(channelListViewModelProvider.notifier)
        .loadChannels(guildId, guild: guild);
    ref.read(guildSyncProvider.notifier).syncIfNeeded(guildId);
  }

  void _stopAttachmentAudioOnChannelChange() {
    unawaited(ChatAttachmentAudioSession.instance.clearActivePlayback());
  }

  void _stopTtsIfLeavingSpokenChannel(String? nextChannelId) {
    final FluxerTtsSpeakingState speaking = ref.read(fluxerTtsServiceProvider);
    if (!speaking.isSpeaking || speaking.channelId == null) {
      return;
    }
    if (speaking.channelId != nextChannelId) {
      unawaited(ref.read(fluxerTtsServiceProvider.notifier).stop());
    }
  }

  void _scheduleInactiveChannelCleanup(String previousChannelId) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || ref.read(activeChannelIdProvider) == previousChannelId) {
        return;
      }
      final String? guildId = ref.read(activeGuildIdProvider);
      if (guildId == null) {
        return;
      }
      ref
          .read(memberListViewportProvider.notifier)
          .clearChannel(guildId: guildId, channelId: previousChannelId);
      ref
          .read(memberListDesiredRangesProvider.notifier)
          .clearChannel(guildId: guildId, channelId: previousChannelId);
    });
  }

  @override
  Widget build(BuildContext context) {
    ref
      ..watch(pushNotificationsCoordinatorProvider)
      ..watch(appIconBadgeCoordinatorProvider);
    return widget.child;
  }
}
