import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/login_error_l10n.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({
    required this.onBack,
    required this.onRegister,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onRegister;

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(loginViewModelProvider);
    final l10n = FluxerLocalizations.of(context);

    if (vm.forgotPasswordEmailSent) {
      return _EmailSentView(onBack: widget.onBack);
    }

    return _EmailEntryView(
      controller: _emailController,
      isSubmitting: vm.isLoggingIn,
      errorMessage: resolveLoginError(vm, l10n),
      fieldErrors: vm.fieldErrors,
      onSubmit: () {
        unawaited(
          ref
              .read(loginViewModelProvider.notifier)
              .submitForgotPassword(_emailController.text),
        );
      },
      onBack: widget.onBack,
      onRegister: widget.onRegister,
      l10n: l10n,
    );
  }
}

class _EmailEntryView extends StatelessWidget {
  const _EmailEntryView({
    required this.controller,
    required this.isSubmitting,
    required this.errorMessage,
    required this.fieldErrors,
    required this.onSubmit,
    required this.onBack,
    required this.onRegister,
    required this.l10n,
  });

  final TextEditingController controller;
  final bool isSubmitting;
  final String? errorMessage;
  final Map<String, String> fieldErrors;
  final VoidCallback onSubmit;
  final VoidCallback onBack;
  final VoidCallback onRegister;
  final FluxerLocalizations l10n;

  static final _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;

    return AbsorbPointer(
      absorbing: isSubmitting,
      child: AnimatedOpacity(
        opacity: isSubmitting ? 0.6 : 1.0,
        duration: context.motion.fast,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.forgotPasswordTitle,
              style: textStyles.heading.copyWith(color: colors.textPrimary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s2),
            Text(
              l10n.forgotPasswordDescription,
              style: textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s6),
            FluxerInput(
              controller: controller,
              label: l10n.email,
              autofillHints: const [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.go,
              onSubmitted: (_) => onSubmit(),
              errorText: fieldErrors['email'],
            ),
            SizedBox(height: layout.s6),
            if (errorMessage != null && errorMessage!.isNotEmpty) ...[
              Text(
                errorMessage!,
                style: textStyles.bodySmall.copyWith(color: colors.textDanger),
              ),
              SizedBox(height: layout.s2),
            ],
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, _) {
                final isValid = _emailRegex.hasMatch(value.text.trim());
                return FluxerButton.primary(
                  onPressed: isValid && !isSubmitting ? onSubmit : null,
                  label: l10n.forgotPasswordSubmit,
                  isLoading: isSubmitting,
                );
              },
            ),
            SizedBox(height: layout.s5),
            FluxerButton.ghost(
              onPressed: onBack,
              label: l10n.forgotPasswordBackToLogin,
            ),
            SizedBox(height: layout.s2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.needAccountPrompt,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textTertiary,
                  ),
                ),
                FluxerTextLink(
                  text: l10n.register,
                  onTap: onRegister,
                  style: textStyles.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailSentView extends StatelessWidget {
  const _EmailSentView({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          PhosphorIconsFill.envelopeSimple,
          size: 48,
          color: colors.brandPrimary,
        ),
        SizedBox(height: layout.s4),
        Text(
          l10n.forgotPasswordSentTitle,
          style: textStyles.heading.copyWith(color: colors.textPrimary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: layout.s2),
        Text(
          l10n.forgotPasswordSentDescription,
          style: textStyles.bodySmall.copyWith(color: colors.textPrimaryMuted),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: layout.s6),
        FluxerButton.ghost(
          onPressed: onBack,
          label: l10n.forgotPasswordBackToLogin,
        ),
      ],
    );
  }
}
