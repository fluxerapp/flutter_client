import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/resend_timer_mixin.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

enum _Stage { collect, verify }

class ClaimAccountSheet extends ConsumerStatefulWidget {
  const ClaimAccountSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).claimAccountTitle,
      useRootNavigator: true,
      builder: (_, _) => const ClaimAccountSheet(),
    );
  }

  @override
  ConsumerState<ClaimAccountSheet> createState() => _ClaimAccountSheetState();
}

class _ClaimAccountSheetState extends ConsumerState<ClaimAccountSheet>
    with ResendTimerMixin {
  _Stage _stage = _Stage.collect;
  bool _loading = false;
  String? _error;

  String? _ticket;
  String? _originalProof;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _codeController.dispose();
    disposeResendTimer();
    super.dispose();
  }

  String _extractError(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'] as String?;
      if (message != null && message.isNotEmpty) {
        return message;
      }
    }
    return e.message ?? 'An error occurred';
  }

  Future<void> _handleSendCode() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final client = ref.read(fluxerClientProvider);

      if (_ticket == null) {
        final startResponse = await client.users.startEmailChange(
          body: const EmptyBodyRequest(),
        );
        _ticket = startResponse.ticket;
        _originalProof = startResponse.originalProof;
      }

      final response = await client.users.requestNewEmailAddress(
        body: EmailChangeRequestNewRequest(
          ticket: _ticket!,
          newEmail: email,
          originalProof: _originalProof!,
        ),
      );

      _ticket = response.ticket;
      startResendTimer(response.resendAvailableAt);

      setState(() {
        _stage = _Stage.verify;
        _loading = false;
      });
    } on DioException catch (e) {
      setState(() {
        _loading = false;
        _error = _extractError(e);
      });
    }
  }

  Future<void> _handleClaim() async {
    final code = _codeController.text.trim();
    final password = _passwordController.text;
    if (code.isEmpty || _ticket == null || _originalProof == null) {
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final client = ref.read(fluxerClientProvider);
      final tokenResponse = await client.users.verifyNewEmailAddress(
        body: EmailChangeVerifyNewRequest(
          ticket: _ticket!,
          code: code,
          originalProof: _originalProof!,
        ),
      );

      await client.users.updateCurrentUser(
        body: UserUpdateWithVerificationRequest(
          emailToken: tokenResponse.emailToken,
          newPassword: password,
        ),
      );

      if (!mounted) {
        return;
      }
      final l10n = FluxerLocalizations.of(context);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.claimAccountSuccess,
              variant: FluxerToastVariant.success,
            ),
          );

      await ref.read(userSettingsViewModelProvider.notifier).loadProfile();

      if (mounted) {
        Navigator.of(context).pop();
      }
    } on DioException catch (e) {
      if (!mounted) {
        return;
      }
      setState(() {
        _loading = false;
        _error = _extractError(e);
      });
    }
  }

  Future<void> _handleResend() async {
    if (resendCountdown > 0 || _ticket == null) {
      return;
    }

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.resendNewEmailConfirmation(
        body: EmailChangeTicketRequest(ticket: _ticket!),
      );
      startResendTimer(null);
    } on DioException catch (e) {
      setState(() => _error = _extractError(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _stage == _Stage.collect
                ? l10n.claimAccountDescription
                : l10n.claimAccountVerifyDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s4),
          if (_stage == _Stage.collect) ...[
            FluxerInput(
              controller: _emailController,
              label: l10n.claimAccountEmailLabel,
              hint: 'you@example.com',
              autofocus: true,
              maxLength: 256,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),
            FluxerInput(
              controller: _passwordController,
              label: l10n.claimAccountPasswordLabel,
              obscureText: true,
              maxLength: 128,
              autofillHints: const [AutofillHints.newPassword],
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleSendCode(),
            ),
          ] else ...[
            FluxerInput(
              controller: _codeController,
              label: l10n.verificationCode,
              hint: 'XXXX-XXXX',
              autofocus: true,
              maxLength: 9,
              keyboardType: TextInputType.text,
              autofillHints: const [AutofillHints.oneTimeCode],
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleClaim(),
            ),
            const SizedBox(height: 12),
            FluxerInput(
              controller: _passwordController,
              label: l10n.claimAccountPasswordLabel,
              obscureText: true,
              maxLength: 128,
              autofillHints: const [AutofillHints.newPassword],
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleClaim(),
            ),
          ],
          if (_error != null) ...[
            SizedBox(height: layout.s3),
            Text(
              _error!,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.statusDanger,
              ),
            ),
          ],
          SizedBox(height: layout.s4),
          if (_stage == _Stage.collect)
            Row(
              children: [
                Expanded(
                  child: FluxerButton.secondary(
                    onPressed: _loading
                        ? null
                        : () => Navigator.of(context).pop(),
                    label: l10n.cancel,
                    fitContent: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FluxerButton.primary(
                    onPressed: _loading ? null : _handleSendCode,
                    label: l10n.claimAccountSendCode,
                    isLoading: _loading,
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                Expanded(
                  child: FluxerButton.primary(
                    onPressed: _loading ? null : _handleClaim,
                    label: l10n.claimAccount,
                    isLoading: _loading,
                  ),
                ),
                const SizedBox(width: 8),
                FluxerButton.ghost(
                  onPressed: resendCountdown > 0 ? null : _handleResend,
                  label: resendCountdown > 0
                      ? l10n.resendCountdown(resendCountdown)
                      : l10n.resend,
                  size: FluxerButtonSize.small,
                  fitContent: true,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
