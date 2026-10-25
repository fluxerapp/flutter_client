import 'dart:async';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/audio/chat_attachment/chat_attachment_audio_session.dart';
import 'package:fluxer_app/core/badge/app_icon_badge_coordinator.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/observability/observability_reporting_provider.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_consent_sheet.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_coordinator.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_logic.dart';
import 'package:fluxer_app/core/observability/reporting_consent/observability_reporting_prompt_provider.dart';
import 'package:fluxer_app/core/permissions/guild_channel_permission_cleanup.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/core/push/push_notifications_coordinator.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_prompt_provider.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_provider.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_sheet.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_setup.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_distributor_ui.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_no_distributor_dismissal_provider.dart';
import 'package:fluxer_app/core/quick_actions/home_quick_action.dart';
import 'package:fluxer_app/core/quick_actions/pending_home_quick_action_provider.dart';
import 'package:fluxer_app/core/router/app_location_persistence.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/guild_root_redirect.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/share/pending_share_provider.dart';
import 'package:fluxer_app/core/share/shared_media_payload.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/share_media_sheet.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_desired_ranges_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/notifications/providers/notification_stream_providers.dart';
import 'package:fluxer_app/features/quick_switcher/presentation/sheets/quick_switcher_bottom_sheet.dart';
import 'package:fluxer_app/features/quick_switcher/providers/quick_switcher_provider.dart';
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
  int _distributorPickerAttempts = 0;
  bool _deferredObservabilityReportingConsent = false;
  @override
  void initState() {
    super.initState();
    ref
      ..read(notificationMentionFeedStreamProvider)
      ..read(dmViewModelProvider);
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
        final String? previousChannelId = previous;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) {
            return;
          }
          _stopTtsIfLeavingSpokenChannel(ref.read(activeChannelIdProvider));
          if (previousChannelId != null) {
            _stopAttachmentAudioOnChannelChange();
            _scheduleInactiveChannelCleanup(previousChannelId);
          }
        });
      });

    if (PushProviderGuard.isUnifiedPush) {
      ref.listenManual<bool>(unifiedPushDistributorSetupProvider, (
        bool? previous,
        bool next,
      ) {
        if (!next) {
          return;
        }
        _distributorPickerAttempts = 0;
        _scheduleDistributorPicker();
      });
    }

    if (PushProviderGuard.isApple || PushProviderGuard.isFirebaseMessaging) {
      ref.listenManual<bool>(pushRelayConsentPromptProvider, (
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
          _schedulePushRelayConsentPrompt();
        });
      }, fireImmediately: true);
    }

    if (observabilityReportingPromptIsMobilePlatform()) {
      ref
        ..listenManual<bool>(observabilityReportingPromptProvider, (
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
            _scheduleObservabilityReportingConsent();
          });
        }, fireImmediately: true)
        ..listenManual<bool>(splashExitAllowedProvider, (
          bool? previous,
          bool next,
        ) {
          if (!next) {
            return;
          }
          if (!ref.read(observabilityReportingPromptProvider)) {
            return;
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) {
              return;
            }
            _scheduleObservabilityReportingConsent();
          });
        });
    }

    ref.listenManual<HomeQuickAction?>(pendingHomeQuickActionProvider, (
      HomeQuickAction? previous,
      HomeQuickAction? next,
    ) {
      if (next == null) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        _presentHomeQuickAction(next);
      });
    }, fireImmediately: true);

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

  void _schedulePushRelayConsentPrompt({int attempt = 0}) {
    if (!mounted) {
      return;
    }
    if (!ref.read(pushRelayConsentPromptProvider) ||
        ref.read(isActiveInstanceOfficialProvider)) {
      return;
    }
    final BuildContext? rootContext = rootNavigatorKey.currentContext;
    if (rootContext == null || !rootContext.mounted) {
      if (attempt >= 60) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        _schedulePushRelayConsentPrompt(attempt: attempt + 1);
      });
      return;
    }
    ref.read(pushRelayConsentPromptProvider.notifier).beginPresentation();
    unawaited(_presentPushRelayConsent(rootContext));
  }

  Future<void> _presentPushRelayConsent(BuildContext rootContext) async {
    final promptNotifier = ref.read(pushRelayConsentPromptProvider.notifier);
    try {
      final bool? agreed = await showPushRelayConsentSheet(rootContext);
      if (!mounted) {
        return;
      }
      await recordPushRelayConsentSheetResult(
        consent: ref.read(pushRelayConsentProvider.notifier),
        agreed: agreed,
      );
    } finally {
      promptNotifier.endPresentation();
      _scheduleDeferredObservabilityReportingConsent();
    }
  }

  bool _isPushRelayConsentPresentationInFlight() {
    if (!PushProviderGuard.isApple && !PushProviderGuard.isFirebaseMessaging) {
      return false;
    }
    return ref
        .read(pushRelayConsentPromptProvider.notifier)
        .isPresentationInFlight;
  }

  void _scheduleDeferredObservabilityReportingConsent() {
    if (!_deferredObservabilityReportingConsent || !mounted) {
      return;
    }
    _deferredObservabilityReportingConsent = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _scheduleObservabilityReportingConsent();
    });
  }

  void _scheduleObservabilityReportingConsent({int attempt = 0}) {
    if (!mounted) {
      return;
    }
    if (!ref.read(observabilityReportingPromptProvider)) {
      return;
    }
    if (!ref.read(splashExitAllowedProvider)) {
      if (attempt >= 60) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        _scheduleObservabilityReportingConsent(attempt: attempt + 1);
      });
      return;
    }
    if (_isPushRelayConsentPresentationInFlight()) {
      _deferredObservabilityReportingConsent = true;
      return;
    }
    final BuildContext? rootContext = rootNavigatorKey.currentContext;
    if (rootContext == null || !rootContext.mounted) {
      if (attempt >= 60) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        _scheduleObservabilityReportingConsent(attempt: attempt + 1);
      });
      return;
    }
    ref.read(observabilityReportingPromptProvider.notifier).beginPresentation();
    unawaited(_presentObservabilityReportingConsent(rootContext));
  }

  Future<void> _presentObservabilityReportingConsent(
    BuildContext rootContext,
  ) async {
    final ObservabilityReportingPrompt promptNotifier = ref.read(
      observabilityReportingPromptProvider.notifier,
    );
    try {
      final bool? optedIn = await showObservabilityReportingConsentSheet(
        rootContext,
      );
      if (!mounted) {
        return;
      }
      await recordObservabilityReportingConsentSheetResult(
        reporting: ref.read(observabilityReportingProvider.notifier),
        dismissed: ref.read(
          observabilityReportingPromptDismissedProvider.notifier,
        ),
        optedIn: optedIn,
      );
    } finally {
      promptNotifier.endPresentation();
    }
  }

  void _presentHomeQuickAction(HomeQuickAction action, {bool retried = false}) {
    final HomeQuickAction? pending = ref.read(pendingHomeQuickActionProvider);
    if (pending != action) {
      return;
    }
    final BuildContext? rootContext = rootNavigatorKey.currentContext;
    if (rootContext == null || !rootContext.mounted) {
      if (retried) {
        return;
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        _presentHomeQuickAction(action, retried: true);
      });
      return;
    }
    ref.read(pendingHomeQuickActionProvider.notifier).clear();
    switch (action) {
      case HomeQuickAction.dms:
        ref.read(fluxerRouterProvider).go(RoutePaths.me);
      case HomeQuickAction.search:
        if (ref.read(quickSwitcherProvider).isOpen) {
          return;
        }
        unawaited(QuickSwitcherBottomSheet.show(rootContext, ref));
      case HomeQuickAction.notifications:
        ref.read(fluxerRouterProvider).go(RoutePaths.notificationsPath);
    }
  }

  void _scheduleActiveGuildEffects({
    required String? previous,
    required String? next,
  }) {
    if (next != null) {
      _loadActiveGuildChannels(next);
    }
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
      if (!_loadActiveGuildChannels(next)) {
        return;
      }
      ref.read(guildSyncProvider.notifier).syncIfNeeded(next);
    });
  }

  void _applyActiveGuildEffects(String guildId) {
    if (_loadActiveGuildChannels(guildId)) {
      ref.read(guildSyncProvider.notifier).syncIfNeeded(guildId);
    }
  }

  bool _loadActiveGuildChannels(String guildId) {
    return ref
        .read(channelListViewModelProvider.notifier)
        .loadActiveGuild(guildId);
  }

  void _scheduleDistributorPicker() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(_presentDistributorPicker());
    });
  }

  Future<void> _presentDistributorPicker() async {
    if (!mounted || !ref.read(unifiedPushDistributorSetupProvider)) {
      _distributorPickerAttempts = 0;
      return;
    }
    final BuildContext? rootContext = rootNavigatorKey.currentContext;
    if (rootContext == null || !rootContext.mounted) {
      if (_distributorPickerAttempts >= 60) {
        return;
      }
      _distributorPickerAttempts++;
      _scheduleDistributorPicker();
      return;
    }
    _distributorPickerAttempts = 0;
    ref.read(unifiedPushDistributorSetupProvider.notifier).clearRequest();
    await showUnifiedPushDistributorSetup(
      rootContext,
      dismissalStorage: ref.read(
        unifiedPushNoDistributorDismissalStorageProvider,
      ),
    );
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
