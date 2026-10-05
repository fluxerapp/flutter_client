import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app_startup_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/recovery_kit/domain/recovery_kit.dart';
import 'package:fluxer_app/features/recovery_kit/presentation/recovery_kit_sheet.dart';
import 'package:fluxer_app/features/recovery_kit/providers/recovery_kit_providers.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Duration _kReminderDelay = Duration(seconds: 5);

String recoveryKitPromptShownKey(String userId) =>
    'fluxer_recovery_kit_prompt_shown_$userId';

class RecoveryKitGate extends ConsumerStatefulWidget {
  const RecoveryKitGate({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<RecoveryKitGate> createState() => _RecoveryKitGateState();
}

class _RecoveryKitGateState extends ConsumerState<RecoveryKitGate> {
  bool _isPresenting = false;
  bool _syncScheduled = false;
  Timer? _reminderTimer;
  String? _reminderCheckedFor;
  VoidCallback? _routeListener;
  GoRouter? _listenerRouter;

  @override
  void dispose() {
    _reminderTimer?.cancel();
    final VoidCallback? listener = _routeListener;
    final GoRouter? router = _listenerRouter;
    if (listener != null && router != null) {
      router.routerDelegate.removeListener(listener);
    }
    super.dispose();
  }

  void _attachRouteListener(GoRouter router) {
    if (_routeListener != null) {
      return;
    }
    _routeListener = _scheduleSync;
    router.routerDelegate.addListener(_routeListener!);
    _listenerRouter = router;
  }

  bool _isReady() {
    if (!ref.read(appStartupProvider).hasValue ||
        !ref.read(authStateProvider) ||
        !ref.read(gatewayReadyProvider)) {
      return false;
    }
    final RouteMatchList config = ref
        .read(fluxerRouterProvider)
        .routerDelegate
        .currentConfiguration;
    final String location = config.isNotEmpty
        ? config.last.matchedLocation
        : '/';
    return location != '/loading' &&
        location != '/reconnecting' &&
        location != '/login';
  }

  void _scheduleSync() {
    if (_syncScheduled) {
      return;
    }
    _syncScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncScheduled = false;
      if (mounted) {
        unawaited(_sync());
      }
    });
  }

  Future<void> _sync() async {
    if (_isPresenting || !_isReady()) {
      return;
    }
    final RecoveryKit? kit = ref.read(pendingRecoveryKitProvider);
    if (kit != null) {
      await _present(kit);
      return;
    }
    _scheduleReminder();
  }

  Future<void> _present(RecoveryKit kit) async {
    final BuildContext? modalContext = rootNavigatorKey.currentContext;
    if (modalContext == null || !modalContext.mounted) {
      return;
    }
    _isPresenting = true;
    ref.read(pendingRecoveryKitProvider.notifier).clear();
    try {
      await RecoveryKitSheet.show(modalContext, kit);
    } finally {
      _isPresenting = false;
      if (mounted) {
        _scheduleSync();
      }
    }
  }

  void _scheduleReminder() {
    final UserSettingsViewState settings = ref.read(
      userSettingsViewModelProvider,
    );
    if (!settings.usernameSignIn ||
        !settings.isProfileLoaded ||
        !settings.isClaimed ||
        _reminderCheckedFor == settings.userId) {
      return;
    }
    _reminderCheckedFor = settings.userId;
    _reminderTimer?.cancel();
    _reminderTimer = Timer(
      _kReminderDelay,
      () => unawaited(_maybeRemind(settings.userId)),
    );
  }

  Future<void> _maybeRemind(String userId) async {
    if (!mounted || _isPresenting || !_isReady()) {
      return;
    }
    try {
      final SharedPreferences preferences =
          await SharedPreferences.getInstance();
      final String key = recoveryKitPromptShownKey(userId);
      if (preferences.getBool(key) ?? false) {
        return;
      }
      final RecoveryKitStatusResponse status = await ref.read(
        recoveryKitStatusProvider.future,
      );
      if (!mounted ||
          status.hasRecoveryKit ||
          ref.read(currentUserIdProvider) != userId ||
          ref.read(pendingRecoveryKitProvider) != null) {
        return;
      }
      await preferences.setBool(key, true);
      await _showReminder();
    } on Exception catch (e) {
      talker.warning('[RecoveryKitGate] Reminder check failed: $e');
    }
  }

  Future<void> _showReminder() async {
    final BuildContext? modalContext = rootNavigatorKey.currentContext;
    if (modalContext == null || !modalContext.mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(modalContext);
    _isPresenting = true;
    bool? confirmed;
    try {
      confirmed = await FluxerConfirmSheet.show(
        modalContext,
        title: l10n.recoveryKitReminderTitle,
        description: l10n.recoveryKitReminderBody,
        confirmLabel: l10n.recoveryKitCreate,
      );
    } finally {
      _isPresenting = false;
    }
    if (confirmed != true || !mounted) {
      return;
    }
    try {
      await ref
          .read(pendingRecoveryKitProvider.notifier)
          .createAndPresent(reason: RecoveryKitReason.created);
    } on Exception catch (e) {
      talker.warning('[RecoveryKitGate] Create from reminder failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final GoRouter router = ref.watch(fluxerRouterProvider);
    _attachRouteListener(router);
    ref
      ..listen(appStartupProvider, (_, _) => _scheduleSync())
      ..listen(authStateProvider, (_, _) => _scheduleSync())
      ..listen(gatewayReadyProvider, (_, _) => _scheduleSync())
      ..listen(pendingRecoveryKitProvider, (_, _) => _scheduleSync())
      ..listen(
        userSettingsViewModelProvider.select(
          (UserSettingsViewState s) =>
              s.usernameSignIn && s.isProfileLoaded && s.isClaimed,
        ),
        (_, _) => _scheduleSync(),
      );
    return widget.child;
  }
}
