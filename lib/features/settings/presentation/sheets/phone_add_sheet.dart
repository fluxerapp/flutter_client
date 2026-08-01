import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/phone_verification.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/phone_verification/phone_inbound_waiting_step.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/phone_verification/phone_number_input.dart';
import 'package:fluxer_app/features/auth/providers/phone_verification_view_model.dart';
import 'package:fluxer_app/features/auth/utils/phone_verification_error_l10n.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/resend_timer_mixin.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class PhoneAddSheet extends ConsumerStatefulWidget {
  const PhoneAddSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).phoneAddTitle,
      useRootNavigator: true,
      builder: (_, _) => const PhoneAddSheet(),
    );
  }

  @override
  ConsumerState<PhoneAddSheet> createState() => _PhoneAddSheetState();
}

class _PhoneAddSheetState extends ConsumerState<PhoneAddSheet>
    with ResendTimerMixin {
  static final PhoneVerificationViewModelProvider _provider =
      phoneVerificationViewModelProvider();

  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_provider.notifier).reset();
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    disposeResendTimer();
    super.dispose();
  }

  Future<void> _handleSendCode() async {
    final bool sent = await ref.read(_provider.notifier).sendVerification();
    if (!sent || !mounted) {
      return;
    }
    final PhoneVerificationViewState state = ref.read(_provider);
    if (state.step == PhoneVerificationStep.code) {
      startResendTimer(null);
    }
  }

  Future<void> _handleVerify() async {
    final bool verified = await ref
        .read(_provider.notifier)
        .verifyCode(_codeController.text);
    if (!verified || !mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.phoneAddSuccess,
            variant: FluxerToastVariant.success,
          ),
        );
    Navigator.of(context).pop();
  }

  void _handleVerified() {
    if (!mounted) {
      return;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.phoneAddSuccess,
            variant: FluxerToastVariant.success,
          ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final PhoneVerificationViewState state = ref.watch(_provider);
    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (state.step == PhoneVerificationStep.phone) ...[
            Text(
              l10n.phoneAddFooter,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: context.layout.s4),
            PhoneNumberInput(provider: _provider),
            if (state.generalError != null) ...[
              SizedBox(height: context.layout.s3),
              Text(
                state.generalError!.resolve(l10n),
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textDanger,
                ),
              ),
            ],
            SizedBox(height: context.layout.s4),
            Row(
              children: [
                Expanded(
                  child: FluxerButton.secondary(
                    onPressed: state.isLoading
                        ? null
                        : () => Navigator.of(context).pop(),
                    label: l10n.cancel,
                    fitContent: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FluxerButton.primary(
                    onPressed: state.isLoading ? null : _handleSendCode,
                    label: l10n.phoneAddSendCode,
                    isLoading: state.isLoading,
                  ),
                ),
              ],
            ),
          ] else if (state.step == PhoneVerificationStep.code) ...[
            Text(
              l10n.phoneVerifyDescription,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: context.layout.s4),
            FluxerInput(
              controller: _codeController,
              label: l10n.verificationCode,
              hint: '000000',
              autofocus: true,
              maxLength: 9,
              keyboardType: TextInputType.text,
              autofillHints: const <String>[AutofillHints.oneTimeCode],
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _handleVerify(),
              errorText:
                  state.codeError?.resolve(l10n) ??
                  state.generalError?.resolve(l10n),
            ),
            SizedBox(height: context.layout.s4),
            Row(
              children: [
                Expanded(
                  child: FluxerButton.secondary(
                    onPressed: state.isLoading
                        ? null
                        : () => ref.read(_provider.notifier).goToPhoneStep(),
                    label: l10n.back,
                    fitContent: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FluxerButton.primary(
                    onPressed: state.isLoading ? null : _handleVerify,
                    label: l10n.verify,
                    isLoading: state.isLoading,
                  ),
                ),
              ],
            ),
          ] else ...[
            PhoneInboundWaitingStep(
              provider: _provider,
              onVerified: _handleVerified,
            ),
            SizedBox(height: context.layout.s4),
            FluxerButton.secondary(
              onPressed: state.isLoading
                  ? null
                  : () => ref.read(_provider.notifier).goToPhoneStep(),
              label: l10n.back,
            ),
          ],
        ],
      ),
    );
  }
}
