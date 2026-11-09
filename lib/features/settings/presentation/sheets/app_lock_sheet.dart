import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/app_lock/app_lock_biometric_authenticator.dart';
import 'package:fluxer_app/core/app_lock/app_lock_config.dart';
import 'package:fluxer_app/core/app_lock/app_lock_controller.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/app_lock/presentation/app_lock_biometric_label.dart';
import 'package:fluxer_app/features/app_lock/presentation/app_lock_pin_input.dart';
import 'package:fluxer_app/features/app_lock/presentation/app_lock_timeout_label.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_form_error_text.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showAppLockSheet(BuildContext context) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.appLockSettingTitle,
    builder: (sheetContext, scrollController, close) =>
        _AppLockSheetBody(scrollController: scrollController),
  );
}

class _AppLockSheetBody extends ConsumerStatefulWidget {
  const _AppLockSheetBody({required this.scrollController});

  final ScrollController scrollController;

  @override
  ConsumerState<_AppLockSheetBody> createState() => _AppLockSheetBodyState();
}

class _AppLockSheetBodyState extends ConsumerState<_AppLockSheetBody> {
  late final Future<List<AppLockBiometricKind>> _kinds = ref
      .read(appLockControllerProvider.notifier)
      .availableBiometricKinds();

  AppLockController get _controller =>
      ref.read(appLockControllerProvider.notifier);

  Future<bool> _showPinVerifySheet() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    bool verified = false;
    await FluxerPageSheet.showScrollable<void>(
      context,
      title: l10n.appLockEnterCurrentPinTitle,
      builder: (sheetContext, scrollController, close) => _AppLockPinVerifyView(
        scrollController: scrollController,
        onUnlock: _controller.unlockWithPin,
        onVerified: () {
          verified = true;
          close();
        },
      ),
    );
    return verified;
  }

  Future<String?> _showPinSetupSheet() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    String? created;
    await FluxerPageSheet.showScrollable<void>(
      context,
      title: l10n.appLockSetPinTitle,
      builder: (sheetContext, scrollController, close) => _AppLockPinSetupView(
        scrollController: scrollController,
        onCreated: (String pin) {
          created = pin;
          close();
        },
      ),
    );
    return created;
  }

  Future<void> _setOrChangePin(AppLockState lock) async {
    if (lock.enabled) {
      final bool verified = await _showPinVerifySheet();
      if (!verified || !mounted) {
        return;
      }
    }
    final String? pin = await _showPinSetupSheet();
    if (pin != null) {
      await _controller.setPin(pin);
    }
  }

  Future<void> _toggleBiometric({required bool enabled}) async {
    if (!enabled) {
      await _controller.setBiometricEnabled(enabled: false);
      return;
    }
    final AppLockBiometricResult result = await _controller.verifyBiometric(
      reason: FluxerLocalizations.of(context).appLockBiometricReason,
    );
    if (result == AppLockBiometricResult.success && mounted) {
      await _controller.setBiometricEnabled(enabled: true);
    }
  }

  Future<void> _turnOff() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool verified = await _showPinVerifySheet();
    if (!verified || !mounted) {
      return;
    }
    final bool? confirmed = await FluxerConfirmSheet.show(
      context,
      title: l10n.appLockTurnOffConfirmTitle,
      description: l10n.appLockTurnOffConfirmBody,
      confirmLabel: l10n.appLockTurnOff,
      isDanger: true,
    );
    if (confirmed != true || !mounted) {
      return;
    }
    await _controller.disable();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final AppLockState lock = ref.watch(appLockControllerProvider);

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: FutureBuilder<List<AppLockBiometricKind>>(
        future: _kinds,
        builder:
            (
              BuildContext context,
              AsyncSnapshot<List<AppLockBiometricKind>> snapshot,
            ) {
              final String? biometricLabel = appLockBiometricLabel(
                l10n,
                snapshot.data ?? const <AppLockBiometricKind>[],
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.appLockSettingDescription,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textPrimaryMuted,
                    ),
                  ),
                  SizedBox(height: layout.s4),
                  if (!lock.enabled)
                    FluxerButton.primary(
                      label: l10n.appLockSetPinButton,
                      onPressedAsync: () => _setOrChangePin(lock),
                    )
                  else ...[
                    FluxerButton.secondary(
                      label: l10n.appLockChangePinButton,
                      onPressedAsync: () => _setOrChangePin(lock),
                    ),
                    if (biometricLabel != null) ...[
                      SizedBox(height: layout.s4),
                      FluxerSettingsSwitchGroup(
                        children: [
                          FluxerSettingsSwitchItem.grouped(
                            label: l10n.appLockBiometricSwitchLabel(
                              biometricLabel,
                            ),
                            description: l10n.appLockBiometricSwitchHint,
                            value: lock.biometricEnabled,
                            onChanged: (bool value) =>
                                _toggleBiometric(enabled: value),
                          ),
                        ],
                      ),
                    ],
                    SizedBox(height: layout.s6),
                    FluxerRadioGroup<AppLockTimeout>(
                      label: l10n.appLockTimeoutLabel,
                      value: lock.timeout,
                      onChanged: _controller.setTimeout,
                      items: <FluxerRadioItem<AppLockTimeout>>[
                        for (final AppLockTimeout timeout
                            in AppLockTimeout.values)
                          FluxerRadioItem<AppLockTimeout>(
                            value: timeout,
                            label: appLockTimeoutLabel(l10n, timeout),
                          ),
                      ],
                    ),
                    SizedBox(height: layout.s6),
                    FluxerButton.dangerSecondary(
                      label: l10n.appLockTurnOff,
                      onPressedAsync: _turnOff,
                    ),
                  ],
                ],
              );
            },
      ),
    );
  }
}

class _AppLockPinVerifyView extends StatefulWidget {
  const _AppLockPinVerifyView({
    required this.scrollController,
    required this.onUnlock,
    required this.onVerified,
  });

  final ScrollController scrollController;
  final Future<AppLockUnlockResult> Function(String pin) onUnlock;
  final VoidCallback onVerified;

  @override
  State<_AppLockPinVerifyView> createState() => _AppLockPinVerifyViewState();
}

class _AppLockPinVerifyViewState extends State<_AppLockPinVerifyView> {
  String? _error;
  int _errorSignal = 0;

  Future<void> _onCompleted(String pin) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AppLockUnlockResult result = await widget.onUnlock(pin);
    if (!mounted) {
      return;
    }
    if (result == AppLockUnlockResult.unlocked) {
      widget.onVerified();
      return;
    }
    setState(() {
      _error = result == AppLockUnlockResult.wrongPin
          ? l10n.appLockWrongPin
          : l10n.appLockTooManyAttemptsShort;
      _errorSignal++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return _AppLockPinSheetBody(
      scrollController: widget.scrollController,
      prompt: l10n.appLockEnterCurrentPinSubtitle(appLockPinLength),
      error: _error,
      errorSignal: _errorSignal,
      onCompleted: _onCompleted,
    );
  }
}

class _AppLockPinSetupView extends StatefulWidget {
  const _AppLockPinSetupView({
    required this.scrollController,
    required this.onCreated,
  });

  final ScrollController scrollController;
  final ValueChanged<String> onCreated;

  @override
  State<_AppLockPinSetupView> createState() => _AppLockPinSetupViewState();
}

class _AppLockPinSetupViewState extends State<_AppLockPinSetupView> {
  String? _firstEntry;
  String? _error;
  int _errorSignal = 0;

  void _onCompleted(String pin) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? firstEntry = _firstEntry;
    if (firstEntry == null) {
      setState(() {
        _firstEntry = pin;
        _error = null;
      });
    } else if (pin == firstEntry) {
      widget.onCreated(pin);
    } else {
      setState(() {
        _firstEntry = null;
        _error = l10n.appLockPinMismatch;
        _errorSignal++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return _AppLockPinSheetBody(
      scrollController: widget.scrollController,
      prompt: _firstEntry == null
          ? l10n.appLockCreatePinSubtitle(appLockPinLength)
          : l10n.appLockConfirmPinSubtitle,
      error: _error,
      errorSignal: _errorSignal,
      onCompleted: _onCompleted,
    );
  }
}

class _AppLockPinSheetBody extends StatelessWidget {
  const _AppLockPinSheetBody({
    required this.scrollController,
    required this.prompt,
    required this.onCompleted,
    required this.errorSignal,
    this.error,
  });

  final ScrollController scrollController;
  final String prompt;
  final ValueChanged<String> onCompleted;
  final int errorSignal;
  final String? error;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            prompt,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
          SizedBox(height: layout.s4),
          AppLockPinInput(
            label: l10n.appLockPinFieldLabel,
            errorSignal: errorSignal,
            onCompleted: onCompleted,
          ),
          if (error != null) ...[
            SizedBox(height: layout.s3),
            AuthFormErrorText(error!),
          ],
        ],
      ),
    );
  }
}
