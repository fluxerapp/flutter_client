import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/app_lock/app_lock_biometric_authenticator.dart';
import 'package:fluxer_app/core/app_lock/app_lock_config.dart';
import 'package:fluxer_app/core/app_lock/app_lock_controller.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/app_lock/presentation/app_lock_biometric_label.dart';
import 'package:fluxer_app/features/app_lock/presentation/app_lock_pin_input.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_form_error_text.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_viewport.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/ui/background/starfield_background.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/icons/instance_branding_image.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class AppLockScreen extends ConsumerStatefulWidget {
  const AppLockScreen({super.key});

  @override
  ConsumerState<AppLockScreen> createState() => _AppLockScreenState();
}

class _AppLockScreenState extends ConsumerState<AppLockScreen> {
  late final AppLifecycleListener _lifecycle;
  Timer? _cooldownTicker;
  List<AppLockBiometricKind> _kinds = const <AppLockBiometricKind>[];
  bool _promptOnResume = false;
  bool _wrongPin = false;
  bool _biometricFailed = false;
  bool _unlocking = false;
  int _errorSignal = 0;

  bool get _canUseBiometric =>
      ref.read(appLockControllerProvider).biometricEnabled && _kinds.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(
      onShow: () => _promptOnResume = true,
      onResume: _onResume,
    );
    _syncCooldownTicker();
    unawaited(_loadBiometrics());
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    _cooldownTicker?.cancel();
    super.dispose();
  }

  Duration _remainingCooldown() =>
      ref.read(appLockControllerProvider).remainingCooldown(clock.now());

  void _syncCooldownTicker() {
    if (_cooldownTicker != null || _remainingCooldown() == Duration.zero) {
      return;
    }
    _cooldownTicker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      if (_remainingCooldown() == Duration.zero) {
        _cooldownTicker?.cancel();
        _cooldownTicker = null;
      }
    });
  }

  Future<void> _loadBiometrics() async {
    final List<AppLockBiometricKind> kinds = await ref
        .read(appLockControllerProvider.notifier)
        .availableBiometricKinds();
    if (!mounted) {
      return;
    }
    setState(() => _kinds = kinds);
    if (!_canUseBiometric) {
      return;
    }
    if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed) {
      unawaited(_unlockWithBiometric());
    } else {
      _promptOnResume = true;
    }
  }

  void _onResume() {
    if (!_promptOnResume) {
      return;
    }
    _promptOnResume = false;
    if (_canUseBiometric) {
      unawaited(_unlockWithBiometric());
    }
  }

  Future<void> _unlockWithBiometric() async {
    if (_unlocking) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    setState(() {
      _unlocking = true;
      _biometricFailed = false;
    });
    try {
      final AppLockBiometricResult result = await ref
          .read(appLockControllerProvider.notifier)
          .unlockWithBiometric(reason: l10n.appLockBiometricReason);
      if (mounted && result == AppLockBiometricResult.failed) {
        setState(() => _biometricFailed = true);
      }
    } finally {
      if (mounted) {
        setState(() => _unlocking = false);
      }
    }
  }

  Future<void> _onPinCompleted(String pin) async {
    final AppLockUnlockResult result = await ref
        .read(appLockControllerProvider.notifier)
        .unlockWithPin(pin);
    if (!mounted) {
      return;
    }
    setState(() {
      _wrongPin = result == AppLockUnlockResult.wrongPin;
      if (_wrongPin) {
        _errorSignal++;
      }
    });
    _syncCooldownTicker();
  }

  Future<void> _confirmSignOut() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool? confirmed = await FluxerConfirmSheet.show(
      context,
      title: l10n.appLockSignOutConfirmTitle,
      description: l10n.appLockSignOutConfirmBody,
      confirmLabel: l10n.signOut,
      isDanger: true,
    );
    if (confirmed != true || !mounted) {
      return;
    }
    final AccountManager accounts = ref.read(accountManagerProvider.notifier);
    final String? currentUserId = ref.read(currentUserIdProvider);
    for (final StoredAccount account
        in ref.read(accountManagerProvider).accounts) {
      if (account.userId != currentUserId) {
        await accounts.removeAccount(account.userId);
      }
    }
    if (currentUserId != null) {
      await accounts.signOut(currentUserId);
    }
    await ref.read(appLockControllerProvider.notifier).disable();
  }

  String _formatCooldown(Duration remaining) {
    final int totalSeconds = (remaining.inMilliseconds / 1000).ceil();
    final int hours = totalSeconds ~/ 3600;
    final String minutes = (totalSeconds ~/ 60 % 60).toString().padLeft(2, '0');
    final String seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return hours > 0 ? '$hours:$minutes:$seconds' : '$minutes:$seconds';
  }

  String? _pinErrorText(FluxerLocalizations l10n, Duration cooldown) {
    if (cooldown > Duration.zero) {
      return l10n.appLockCooldownMessage(_formatCooldown(cooldown));
    }
    return _wrongPin ? l10n.appLockWrongPin : null;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;
    final AppLockState lock = ref.watch(appLockControllerProvider);
    final Duration cooldown = lock.remainingCooldown(clock.now());
    final String? pinError = _pinErrorText(l10n, cooldown);
    final String? biometricLabel = lock.biometricEnabled
        ? appLockBiometricLabel(l10n, _kinds)
        : null;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StarfieldBackground(
        child: AuthViewport(
          maxWidth: 448,
          padding: EdgeInsets.symmetric(
            horizontal: layout.s6,
            vertical: layout.s8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: InstanceWordmark(height: 32, color: colors.textPrimary),
              ),
              SizedBox(height: layout.s8),
              Center(
                child: Text(l10n.appLockUnlockTitle, style: textStyles.heading),
              ),
              SizedBox(height: layout.s2),
              Center(
                child: Text(
                  biometricLabel != null
                      ? l10n.appLockUnlockSubtitleWithBiometric(biometricLabel)
                      : l10n.appLockUnlockSubtitlePin(appLockPinLength),
                  textAlign: TextAlign.center,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textPrimaryMuted,
                  ),
                ),
              ),
              SizedBox(height: layout.s4),
              if (biometricLabel != null) ...[
                if (_biometricFailed) ...[
                  AuthFormErrorText(l10n.appLockBiometricFailed),
                  SizedBox(height: layout.s3),
                ],
                FluxerButton.primary(
                  label: l10n.appLockUseBiometric(biometricLabel),
                  icon:
                      _kinds.length == 1 &&
                          _kinds.single == AppLockBiometricKind.face
                      ? PhosphorIconsFill.faceMask
                      : PhosphorIconsFill.fingerprint,
                  onPressed: _unlocking ? null : _unlockWithBiometric,
                  isLoading: _unlocking,
                ),
                SizedBox(height: layout.s6),
              ],
              AppLockPinInput(
                label: l10n.appLockPinFieldLabel,
                enabled: cooldown == Duration.zero,
                autofocus: biometricLabel == null,
                errorSignal: _errorSignal,
                onCompleted: _onPinCompleted,
              ),
              if (pinError != null) ...[
                SizedBox(height: layout.s3),
                AuthFormErrorText(pinError),
              ],
              SizedBox(height: layout.s6),
              FluxerTextLink(
                text: l10n.appLockForgotPin,
                onTap: _confirmSignOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
