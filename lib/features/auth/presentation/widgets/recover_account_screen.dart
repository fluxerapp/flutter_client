import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_form_error_text.dart';
import 'package:fluxer_app/features/auth/providers/login_error_l10n.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/recovery_kit/domain/recovery_kit.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RecoverAccountScreen extends ConsumerStatefulWidget {
  const RecoverAccountScreen({required this.onBack, super.key});

  final VoidCallback onBack;

  @override
  ConsumerState<RecoverAccountScreen> createState() =>
      _RecoverAccountScreenState();
}

class _RecoverAccountScreenState extends ConsumerState<RecoverAccountScreen> {
  final _loginController = TextEditingController();
  final _keyController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _keyFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmFocus = FocusNode();
  String? _confirmError;

  @override
  void initState() {
    super.initState();
    final prefill = ref
        .read(loginViewModelProvider.notifier)
        .takeRecoveryPrefill();
    _loginController.text =
        prefill?.login ?? ref.read(loginViewModelProvider).email;
    _keyController.text = formatRecoveryKeyInput(prefill?.recoveryKey ?? '');
  }

  @override
  void dispose() {
    _loginController.dispose();
    _keyController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _keyFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();
    super.dispose();
  }

  bool get _canSubmit =>
      _loginController.text.trim().isNotEmpty &&
      isCompleteRecoveryKey(_keyController.text) &&
      _passwordController.text.isNotEmpty &&
      _confirmController.text.isNotEmpty;

  void _submit() {
    if (!_canSubmit) {
      return;
    }
    if (_passwordController.text != _confirmController.text) {
      setState(
        () => _confirmError = FluxerLocalizations.of(
          context,
        ).resetPasswordMismatch,
      );
      return;
    }
    setState(() => _confirmError = null);
    unawaited(
      ref
          .read(loginViewModelProvider.notifier)
          .submitRecoverAccount(
            login: _loginController.text,
            recoveryKey: formatRecoveryKeyInput(_keyController.text),
            password: _passwordController.text,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(loginViewModelProvider);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return AbsorbPointer(
      absorbing: vm.isLoggingIn,
      child: AnimatedOpacity(
        opacity: vm.isLoggingIn ? 0.6 : 1.0,
        duration: context.motion.fast,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              PhosphorIconsFill.lifebuoy,
              size: 48,
              color: colors.brandPrimary,
            ),
            SizedBox(height: layout.s4),
            Text(
              l10n.recoverAccountTitle,
              style: textStyles.heading.copyWith(color: colors.textPrimary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s2),
            Text(
              l10n.recoverAccountDescription,
              style: textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s6),
            FluxerInput(
              controller: _loginController,
              label: l10n.usernameLabel,
              autofillHints: const [AutofillHints.username],
              autocorrect: false,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _keyFocus.requestFocus(),
              onChanged: (_) => setState(() {}),
              errorText: vm.fieldErrors['login'],
            ),
            SizedBox(height: layout.s4),
            FluxerInput(
              controller: _keyController,
              focusNode: _keyFocus,
              label: l10n.recoveryKitKeyLabel,
              hint: 'XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XXXX-XXXX',
              autocorrect: false,
              textCapitalization: TextCapitalization.characters,
              keyboardType: TextInputType.visiblePassword,
              inputFormatters: const [_RecoveryKeyInputFormatter()],
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _passwordFocus.requestFocus(),
              onChanged: (_) => setState(() {}),
              errorText: vm.fieldErrors['recovery_key'],
            ),
            SizedBox(height: layout.s4),
            FluxerInput(
              controller: _passwordController,
              focusNode: _passwordFocus,
              label: l10n.resetPasswordNewPassword,
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _confirmFocus.requestFocus(),
              onChanged: (_) => setState(() {}),
              errorText: vm.fieldErrors['password'],
            ),
            SizedBox(height: layout.s4),
            FluxerInput(
              controller: _confirmController,
              focusNode: _confirmFocus,
              label: l10n.resetPasswordConfirm,
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.go,
              onSubmitted: (_) => _submit(),
              onChanged: (_) => setState(() {}),
              errorText: _confirmError,
            ),
            SizedBox(height: layout.s6),
            if (resolveLoginError(vm, l10n) case final errorText?) ...[
              AuthFormErrorText(errorText),
              SizedBox(height: layout.s2),
            ],
            FluxerButton.primary(
              onPressed: _canSubmit && !vm.isLoggingIn ? _submit : null,
              label: l10n.resetPasswordSubmit,
              isLoading: vm.isLoggingIn,
            ),
            SizedBox(height: layout.s4),
            Text(
              l10n.recoverAccountNoKit,
              style: textStyles.bodySmall.copyWith(color: colors.textTertiary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s2),
            FluxerButton.ghost(
              onPressed: widget.onBack,
              label: l10n.forgotPasswordBackToLogin,
            ),
          ],
        ),
      ),
    );
  }
}

class _RecoveryKeyInputFormatter extends TextInputFormatter {
  const _RecoveryKeyInputFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String formatted = formatRecoveryKeyInput(newValue.text);
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
