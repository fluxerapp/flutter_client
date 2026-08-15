import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/login_error_l10n.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({
    required this.token,
    required this.onBack,
    super.key,
  });

  final String token;
  final VoidCallback onBack;

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _confirmFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    _confirmFocusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final password = _passwordController.text;
    final confirm = _confirmController.text;
    final l10n = FluxerLocalizations.of(context);

    if (password.isEmpty || confirm.isEmpty) {
      return;
    }

    if (password != confirm) {
      ref
          .read(loginViewModelProvider.notifier)
          .setError(l10n.resetPasswordMismatch);
      return;
    }

    unawaited(
      ref
          .read(loginViewModelProvider.notifier)
          .submitResetPassword(token: widget.token, password: password),
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
              PhosphorIconsFill.lockKey,
              size: 48,
              color: colors.brandPrimary,
            ),
            SizedBox(height: layout.s4),
            Text(
              l10n.resetPasswordTitle,
              style: textStyles.heading.copyWith(color: colors.textPrimary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s2),
            Text(
              l10n.resetPasswordDescription,
              style: textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s6),
            FluxerInput(
              controller: _passwordController,
              label: l10n.resetPasswordNewPassword,
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _confirmFocusNode.requestFocus(),
              errorText: vm.fieldErrors['password'],
            ),
            SizedBox(height: layout.s4),
            FluxerInput(
              controller: _confirmController,
              focusNode: _confirmFocusNode,
              label: l10n.resetPasswordConfirm,
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.go,
              onSubmitted: (_) => _submit(),
            ),
            SizedBox(height: layout.s6),
            if (resolveLoginError(vm, l10n) case final errorText?) ...[
              Text(
                errorText,
                style: textStyles.bodySmall.copyWith(color: colors.textDanger),
              ),
              SizedBox(height: layout.s2),
            ],
            FluxerButton.primary(
              onPressed: _submit,
              label: l10n.resetPasswordSubmit,
              isLoading: vm.isLoggingIn,
            ),
            SizedBox(height: layout.s4),
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
