import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/resend_timer_mixin.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

enum _Stage { intro, verifyEmail, changePassword }

class PasswordChangeSheet extends ConsumerStatefulWidget {
  const PasswordChangeSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).passwordChangeTitle,
      useRootNavigator: true,
      builder: (_, _) => const PasswordChangeSheet(),
    );
  }

  @override
  ConsumerState<PasswordChangeSheet> createState() =>
      _PasswordChangeSheetState();
}

class _PasswordChangeSheetState extends ConsumerState<PasswordChangeSheet>
    with ResendTimerMixin {
  _Stage _stage = _Stage.intro;
  bool _loading = false;
  String? _error;

  String? _ticket;
  String? _verificationProof;

  final _codeController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    disposeResendTimer();
    super.dispose();
  }

  String _extractErrorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic>) {
      final message = data['message'] as String?;
      if (message != null && message.isNotEmpty) {
        return message;
      }
    }
    return e.message ?? 'An error occurred';
  }

  Future<void> _handleStart() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final client = ref.read(fluxerClientProvider);
      final response = await client.users.startPasswordChange(
        body: const EmptyBodyRequest(),
      );

      _ticket = response.ticket;
      startResendTimer(response.resendAvailableAt);

      setState(() {
        _stage = _Stage.verifyEmail;
        _loading = false;
      });
    } on DioException catch (e) {
      setState(() {
        _loading = false;
        _error = _extractErrorMessage(e);
      });
    }
  }

  Future<void> _handleVerifyCode() async {
    final code = _codeController.text.trim();
    if (code.isEmpty || _ticket == null) {
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final client = ref.read(fluxerClientProvider);
      final response = await client.users.verifyPasswordChangeCode(
        body: PasswordChangeVerifyRequest(ticket: _ticket!, code: code),
      );

      _verificationProof = response.verificationProof;

      if (!mounted) {
        return;
      }
      setState(() {
        _stage = _Stage.changePassword;
        _loading = false;
      });
    } on DioException catch (e) {
      if (!mounted) {
        return;
      }
      final l10n = FluxerLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = e.response?.statusCode == 400
            ? l10n.passwordChangeInvalidCode
            : _extractErrorMessage(e);
      });
    }
  }

  Future<void> _handleResendCode() async {
    if (resendCountdown > 0 || _ticket == null) {
      return;
    }

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.resendPasswordChangeCode(
        body: PasswordChangeTicketRequest(ticket: _ticket!),
      );
      startResendTimer(null);
    } on DioException catch (e) {
      setState(() => _error = _extractErrorMessage(e));
    }
  }

  Future<void> _handleChangePassword() async {
    final l10n = FluxerLocalizations.of(context);
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (newPassword.isEmpty) {
      return;
    }

    if (newPassword != confirmPassword) {
      setState(() => _error = l10n.passwordChangePasswordsDoNotMatch);
      return;
    }

    if (_ticket == null || _verificationProof == null) {
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.completePasswordChange(
        body: PasswordChangeCompleteRequest(
          ticket: _ticket!,
          verificationProof: _verificationProof!,
          newPassword: newPassword,
        ),
      );

      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.passwordChangeSuccess,
              variant: FluxerToastVariant.success,
            ),
          );

      await ref.read(userSettingsViewModelProvider.notifier).loadProfile();

      if (mounted) {
        Navigator.of(context).pop();
      }
    } on DioException catch (e) {
      setState(() {
        _loading = false;
        _error = _extractErrorMessage(e);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_stage != _Stage.intro) ...[
            Text(
              _stageTitle(l10n),
              style: context.textStyles.bodyMedium.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: layout.s2),
          ],
          Text(
            _stageDescription(l10n),
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s4),
          ..._buildStageContent(l10n),
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
          _buildStageAction(l10n),
        ],
      ),
    );
  }

  String _stageTitle(FluxerLocalizations l10n) {
    switch (_stage) {
      case _Stage.intro:
        return l10n.passwordChangeTitle;
      case _Stage.verifyEmail:
        return l10n.passwordChangeVerifyTitle;
      case _Stage.changePassword:
        return l10n.passwordChangeNewPasswordTitle;
    }
  }

  String _stageDescription(FluxerLocalizations l10n) {
    switch (_stage) {
      case _Stage.intro:
        return l10n.passwordChangeIntroDescription;
      case _Stage.verifyEmail:
        return l10n.passwordChangeVerifyDescription;
      case _Stage.changePassword:
        return l10n.passwordChangeNewPasswordDescription;
    }
  }

  List<Widget> _buildStageContent(FluxerLocalizations l10n) {
    switch (_stage) {
      case _Stage.intro:
        return const [];
      case _Stage.verifyEmail:
        return [
          FluxerInput(
            controller: _codeController,
            label: l10n.passwordChangeVerificationCode,
            hint: 'XXXX-XXXX',
            autofocus: true,
            maxLength: 9,
            keyboardType: TextInputType.text,
            autofillHints: const [AutofillHints.oneTimeCode],
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleVerifyCode(),
          ),
        ];
      case _Stage.changePassword:
        return [
          FluxerInput(
            controller: _newPasswordController,
            label: l10n.passwordChangeNewPassword,
            obscureText: true,
            autofocus: true,
            maxLength: 128,
            autofillHints: const [AutofillHints.newPassword],
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          FluxerInput(
            controller: _confirmPasswordController,
            label: l10n.passwordChangeConfirmPassword,
            obscureText: true,
            maxLength: 128,
            autofillHints: const [AutofillHints.newPassword],
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleChangePassword(),
          ),
        ];
    }
  }

  Widget _buildStageAction(FluxerLocalizations l10n) {
    switch (_stage) {
      case _Stage.intro:
        return FluxerButton.primary(
          onPressed: _loading ? null : _handleStart,
          label: l10n.passwordChangeStart,
          isLoading: _loading,
        );
      case _Stage.verifyEmail:
        return Row(
          children: [
            Expanded(
              child: FluxerButton.primary(
                onPressed: _loading ? null : _handleVerifyCode,
                label: l10n.passwordChangeVerify,
                isLoading: _loading,
              ),
            ),
            const SizedBox(width: 8),
            FluxerButton.ghost(
              onPressed: resendCountdown > 0 ? null : _handleResendCode,
              label: resendCountdown > 0
                  ? l10n.resendCountdown(resendCountdown)
                  : l10n.resend,
              size: FluxerButtonSize.small,
            ),
          ],
        );
      case _Stage.changePassword:
        return FluxerButton.primary(
          onPressed: _loading ? null : _handleChangePassword,
          label: l10n.passwordChangeSubmit,
          isLoading: _loading,
        );
    }
  }
}
