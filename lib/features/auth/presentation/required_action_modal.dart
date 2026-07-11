import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/phone_verification.dart';
import 'package:fluxer_app/features/auth/domain/required_action_flow.dart';
import 'package:fluxer_app/features/auth/presentation/required_action/required_action_view_state.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/phone_verification/phone_inbound_waiting_step.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/phone_verification/phone_number_input.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/phone_verification_view_model.dart';
import 'package:fluxer_app/features/auth/utils/phone_verification_error_l10n.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class RequiredActionModal extends ConsumerStatefulWidget {
  const RequiredActionModal({required this.flow, super.key});

  final RequiredActionFlow flow;

  static bool _isOpen = false;

  static bool isOpen(BuildContext context) => _isOpen;

  static Future<void> show(
    BuildContext context, {
    required RequiredActionFlow flow,
  }) {
    _isOpen = true;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (BuildContext dialogContext) {
        return RequiredActionModal(flow: flow);
      },
    ).whenComplete(() {
      _isOpen = false;
    });
  }

  @override
  ConsumerState<RequiredActionModal> createState() =>
      _RequiredActionModalState();
}

class _RequiredActionModalState extends ConsumerState<RequiredActionModal> {
  late RequiredActionViewState _viewState;
  late final PhoneVerificationViewModelProvider _phoneProvider;
  final TextEditingController _codeController = TextEditingController();
  final List<RequiredActionViewKind> _history = <RequiredActionViewKind>[];

  @override
  void initState() {
    super.initState();
    _viewState = RequiredActionViewState(
      view: RequiredActionViewKind.intro,
      selectedChannel: widget.flow.defaultTab,
      actionError: null,
      isLoggingOut: false,
      isResendingEmail: false,
    );
    _phoneProvider = phoneVerificationViewModelProvider(
      requiresInboundPhone: widget.flow.requiresInboundPhone,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.flow.requiresInboundPhone) {
        await ref.read(_phoneProvider.notifier).startInboundIfRequired();
        setState(() {
          _viewState = _viewState.copyWith(
            view: RequiredActionViewKind.phoneInboundWaiting,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void _goTo(RequiredActionViewKind view) {
    setState(() {
      _history.add(_viewState.view);
      _viewState = _viewState.copyWith(view: view, clearActionError: true);
    });
  }

  void _goBack() {
    if (_history.isEmpty) {
      return;
    }
    setState(() {
      final RequiredActionViewKind previous = _history.removeLast();
      _viewState = _viewState.copyWith(view: previous, clearActionError: true);
    });
  }

  String _title(FluxerLocalizations l10n) {
    return switch (_viewState.view) {
      RequiredActionViewKind.intro => l10n.requiredActionTitle,
      RequiredActionViewKind.chooseMethod =>
        l10n.requiredActionChooseMethodTitle,
      RequiredActionViewKind.emailCheck => l10n.requiredActionCheckEmailTitle,
      RequiredActionViewKind.phoneNumber => l10n.phoneAddTitle,
      RequiredActionViewKind.phoneCode => l10n.phoneVerifyTitle,
      RequiredActionViewKind.phoneInboundWaiting => l10n.phoneVerifyTitle,
    };
  }

  String _introDescription(FluxerLocalizations l10n) {
    return switch (widget.flow.mode) {
      VerificationMode.phone => l10n.requiredActionIntroPhone,
      VerificationMode.emailOrPhone => l10n.requiredActionIntroEmailOrPhone,
      VerificationMode.emailAndPhone => l10n.requiredActionIntroEmailAndPhone,
      VerificationMode.email => l10n.requiredActionIntroGeneric,
    };
  }

  Future<void> _handleIntroContinue() async {
    final bool showMethodChoice =
        widget.flow.email != null &&
        widget.flow.phone != null &&
        widget.flow.mode == VerificationMode.emailOrPhone;
    if (showMethodChoice) {
      _goTo(RequiredActionViewKind.chooseMethod);
      return;
    }
    if (widget.flow.email != null) {
      _goTo(RequiredActionViewKind.emailCheck);
      return;
    }
    if (widget.flow.requiresInboundPhone) {
      final bool started = await ref
          .read(_phoneProvider.notifier)
          .startInboundIfRequired();
      if (!started || !mounted) {
        return;
      }
      _goTo(RequiredActionViewKind.phoneInboundWaiting);
      return;
    }
    _goTo(RequiredActionViewKind.phoneNumber);
  }

  Future<void> _handleSendPhoneCode() async {
    final bool sent = await ref
        .read(_phoneProvider.notifier)
        .sendVerification();
    if (!sent || !mounted) {
      return;
    }
    final PhoneVerificationViewState phoneState = ref.read(_phoneProvider);
    if (phoneState.step == PhoneVerificationStep.code) {
      _goTo(RequiredActionViewKind.phoneCode);
    } else if (phoneState.step == PhoneVerificationStep.inboundWaiting) {
      _goTo(RequiredActionViewKind.phoneInboundWaiting);
    }
  }

  Future<void> _handleVerifyPhoneCode() async {
    final bool verified = await ref
        .read(_phoneProvider.notifier)
        .verifyCode(_codeController.text);
    if (!verified || !mounted) {
      return;
    }
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: FluxerLocalizations.of(context).phoneAddSuccess,
            variant: FluxerToastVariant.success,
          ),
        );
  }

  Future<void> _handleResendEmail() async {
    setState(() {
      _viewState = _viewState.copyWith(
        isResendingEmail: true,
        clearActionError: true,
      );
    });
    try {
      await ref.read(fluxerClientProvider).auth.resendVerificationEmail();
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(
                context,
              ).requiredActionVerificationEmailSent,
              variant: FluxerToastVariant.success,
            ),
          );
    } on Object {
      if (mounted) {
        setState(() {
          _viewState = _viewState.copyWith(
            actionError: FluxerLocalizations.of(
              context,
            ).phoneSomethingWentWrong,
          );
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _viewState = _viewState.copyWith(isResendingEmail: false);
        });
      }
    }
  }

  Future<void> _handleSignOut() async {
    setState(() {
      _viewState = _viewState.copyWith(isLoggingOut: true);
    });
    final String userId = ref.read(userSettingsViewModelProvider).userId;
    await ref.read(accountManagerProvider.notifier).signOut(userId);
    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
    final PhoneVerificationViewState phoneState = ref.watch(_phoneProvider);
    ref.listen<List<String>>(
      userSettingsViewModelProvider.select(
        (UserSettingsViewState s) => s.requiredActions,
      ),
      (List<String>? previous, List<String> next) {
        if (next.isEmpty && mounted) {
          Navigator.of(context, rootNavigator: true).pop();
        }
      },
    );
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: EdgeInsets.all(context.layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(_title(l10n), style: context.textStyles.heading),
              SizedBox(height: context.layout.s3),
              Flexible(
                child: SingleChildScrollView(
                  child: _buildBody(l10n, settings, phoneState),
                ),
              ),
              if (_viewState.actionError != null) ...[
                SizedBox(height: context.layout.s3),
                Text(
                  _viewState.actionError!,
                  style: context.textStyles.bodySmall.copyWith(
                    color: context.colors.textDanger,
                  ),
                ),
              ],
              SizedBox(height: context.layout.s4),
              _buildActions(l10n, phoneState),
              SizedBox(height: context.layout.s3),
              FluxerButton.ghost(
                onPressed: _viewState.isLoggingOut ? null : _handleSignOut,
                label: l10n.requiredActionSignOut,
                isLoading: _viewState.isLoggingOut,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
    FluxerLocalizations l10n,
    UserSettingsViewState settings,
    PhoneVerificationViewState phoneState,
  ) {
    return switch (_viewState.view) {
      RequiredActionViewKind.intro => Text(
        _introDescription(l10n),
        style: context.textStyles.bodySmall.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
      RequiredActionViewKind.chooseMethod => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.requiredActionChooseMethodDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: context.layout.s4),
          FluxerButton.secondary(
            onPressed: () => _goTo(RequiredActionViewKind.emailCheck),
            label: l10n.requiredActionUseEmail,
          ),
          SizedBox(height: context.layout.s3),
          FluxerButton.secondary(
            onPressed: () => _goTo(RequiredActionViewKind.phoneNumber),
            label: l10n.requiredActionUsePhone,
          ),
        ],
      ),
      RequiredActionViewKind.emailCheck => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.requiredActionCheckEmailDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          if (settings.email != null) ...[
            SizedBox(height: context.layout.s3),
            SelectableText(settings.email!),
          ],
        ],
      ),
      RequiredActionViewKind.phoneNumber => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.phoneAddFooter,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: context.layout.s4),
          PhoneNumberInput(provider: _phoneProvider),
          if (phoneState.generalError != null) ...[
            SizedBox(height: context.layout.s3),
            Text(
              phoneState.generalError!.resolve(l10n),
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textDanger,
              ),
            ),
          ],
        ],
      ),
      RequiredActionViewKind.phoneCode => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
            errorText:
                phoneState.codeError?.resolve(l10n) ??
                phoneState.generalError?.resolve(l10n),
          ),
        ],
      ),
      RequiredActionViewKind.phoneInboundWaiting => PhoneInboundWaitingStep(
        provider: _phoneProvider,
        onVerified: () {
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.phoneAddSuccess,
                  variant: FluxerToastVariant.success,
                ),
              );
        },
      ),
    };
  }

  Widget _buildActions(
    FluxerLocalizations l10n,
    PhoneVerificationViewState phoneState,
  ) {
    return switch (_viewState.view) {
      RequiredActionViewKind.intro => FluxerButton.primary(
        onPressed: _handleIntroContinue,
        label: l10n.continueAction,
      ),
      RequiredActionViewKind.chooseMethod => FluxerButton.secondary(
        onPressed: _history.isEmpty ? null : _goBack,
        label: l10n.back,
      ),
      RequiredActionViewKind.emailCheck => Row(
        children: [
          Expanded(
            child: FluxerButton.secondary(
              onPressed: _goBack,
              label: l10n.back,
              fitContent: true,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FluxerButton.primary(
              onPressed: _viewState.isResendingEmail
                  ? null
                  : _handleResendEmail,
              label: l10n.requiredActionResendVerificationEmail,
              isLoading: _viewState.isResendingEmail,
            ),
          ),
        ],
      ),
      RequiredActionViewKind.phoneNumber => Row(
        children: [
          Expanded(
            child: FluxerButton.secondary(
              onPressed: phoneState.isLoading ? null : _goBack,
              label: l10n.back,
              fitContent: true,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FluxerButton.primary(
              onPressed: phoneState.isLoading ? null : _handleSendPhoneCode,
              label: l10n.phoneAddSendCode,
              isLoading: phoneState.isLoading,
            ),
          ),
        ],
      ),
      RequiredActionViewKind.phoneCode => Row(
        children: [
          Expanded(
            child: FluxerButton.secondary(
              onPressed: phoneState.isLoading
                  ? null
                  : () => _goTo(RequiredActionViewKind.phoneNumber),
              label: l10n.back,
              fitContent: true,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: FluxerButton.primary(
              onPressed: phoneState.isLoading ? null : _handleVerifyPhoneCode,
              label: l10n.verify,
              isLoading: phoneState.isLoading,
            ),
          ),
        ],
      ),
      RequiredActionViewKind.phoneInboundWaiting => FluxerButton.secondary(
        onPressed: phoneState.isLoading ? null : _goBack,
        label: l10n.back,
      ),
    };
  }
}
