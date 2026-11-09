import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/data/browser_sign_in_service.dart';
import 'package:fluxer_app/features/auth/domain/mfa_challenge.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_form_error_text.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_error_l10n.dart';
import 'package:fluxer_app/features/auth/providers/mfa_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/utils/keyboard_focus_restore.dart';

class MfaScreen extends ConsumerWidget {
  final MfaChallenge challenge;
  final VoidCallback onBack;
  final VoidCallback onAuthorized;

  const MfaScreen({
    required this.challenge,
    required this.onBack,
    required this.onAuthorized,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(mfaViewModelProvider(challenge));
    final notifier = ref.read(mfaViewModelProvider(challenge).notifier);
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final textStyles = context.textStyles;
    final errorText = vm.errorType != null
        ? vm.errorType!.resolve(l10n)
        : vm.error;
    final bool offerWebauthn =
        challenge.webauthn && ref.watch(authInstanceSupportsPasskeysProvider);
    final bool passkeyUnavailable = challenge.webauthn && !offerWebauthn;
    final bool passkeyOnlyUnavailable = passkeyUnavailable && !challenge.totp;
    final bool offerBrowserSignIn =
        passkeyUnavailable &&
        ref.watch(authInstanceOffersBrowserSignInProvider);
    final bool busy = vm.isSubmitting || vm.browserSignInLoading;

    ref.listen(
      mfaViewModelProvider(challenge).select((s) => s.completedSession),
      (_, session) {
        if (session != null) {
          onAuthorized();
        }
      },
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text(l10n.mfaTitle, style: textStyles.heading)),
        SizedBox(height: layout.s4),
        if (passkeyOnlyUnavailable) ...[
          Text(
            l10n.mfaPasskeyUnavailable,
            style: textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
          if (offerBrowserSignIn) ...[
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: vm.browserSignInLoading
                  ? null
                  : () => unawaited(notifier.signInWithBrowser()),
              label: l10n.signInWithBrowser,
              icon: PhosphorIconsFill.globe,
              isLoading: vm.browserSignInLoading,
            ),
          ],
        ] else if (vm.selectedMethod == null)
          _MethodSelector(
            challenge: challenge,
            offerWebauthn: offerWebauthn,
            onSelect: notifier.selectMethod,
            onWebauthn: notifier.startWebauthn,
            webauthnLoading: vm.webauthnLoading,
            l10n: l10n,
          )
        else if (vm.selectedMethod == MfaMethod.webauthn)
          _WebauthnEntry(vm: vm, notifier: notifier, l10n: l10n)
        else
          _CodeEntry(challenge: challenge, l10n: l10n),
        if (errorText != null) ...[
          SizedBox(height: layout.s3),
          AuthFormErrorText(errorText),
        ],
        SizedBox(height: layout.s6),
        if (offerBrowserSignIn && !passkeyOnlyUnavailable) ...[
          FluxerTextLink(
            text: l10n.signInWithBrowser,
            onTap: busy ? null : () => unawaited(notifier.signInWithBrowser()),
          ),
          SizedBox(height: layout.s2),
        ],
        if (vm.selectedMethod != null && challenge.totp && offerWebauthn) ...[
          if (vm.selectedMethod != MfaMethod.webauthn)
            Padding(
              padding: EdgeInsets.only(bottom: layout.s2),
              child: FluxerTextLink(
                text: l10n.mfaUseSecurityKey,
                onTap: vm.isSubmitting ? null : notifier.startWebauthn,
              ),
            ),
          FluxerTextLink(
            text: l10n.mfaTryAnotherMethod,
            onTap: vm.isSubmitting ? null : notifier.clearMethod,
          ),
          SizedBox(height: layout.s2),
        ],
        FluxerTextLink(text: l10n.back, onTap: busy ? null : onBack),
      ],
    );
  }
}

class _MethodSelector extends StatelessWidget {
  final MfaChallenge challenge;
  final bool offerWebauthn;
  final void Function(MfaMethod) onSelect;
  final VoidCallback onWebauthn;
  final bool webauthnLoading;
  final FluxerLocalizations l10n;

  const _MethodSelector({
    required this.challenge,
    required this.offerWebauthn,
    required this.onSelect,
    required this.onWebauthn,
    required this.webauthnLoading,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final textStyles = context.textStyles;
    final colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            l10n.mfaChooseMethod,
            style: textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
        ),
        SizedBox(height: layout.s4),
        if (challenge.totp)
          Padding(
            padding: EdgeInsets.only(bottom: layout.s2),
            child: FluxerButton.primary(
              onPressed: () => onSelect(MfaMethod.totp),
              label: l10n.mfaMethodTotp,
              icon: PhosphorIconsFill.shieldCheck,
            ),
          ),
        if (offerWebauthn)
          FluxerButton.secondary(
            onPressed: webauthnLoading ? null : onWebauthn,
            label: l10n.mfaMethodWebauthn,
            icon: PhosphorIconsFill.key,
            isLoading: webauthnLoading,
          ),
      ],
    );
  }
}

class _WebauthnEntry extends StatelessWidget {
  final MfaViewState vm;
  final MfaViewModel notifier;
  final FluxerLocalizations l10n;

  const _WebauthnEntry({
    required this.vm,
    required this.notifier,
    required this.l10n,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FluxerButton.primary(
          onPressed: vm.webauthnLoading ? null : notifier.startWebauthn,
          label: l10n.mfaMethodWebauthn,
          icon: PhosphorIconsFill.key,
          isLoading: vm.webauthnLoading,
        ),
        SizedBox(height: layout.s4),
      ],
    );
  }
}

class _CodeEntry extends ConsumerStatefulWidget {
  final MfaChallenge challenge;
  final FluxerLocalizations l10n;

  const _CodeEntry({required this.challenge, required this.l10n});

  @override
  ConsumerState<_CodeEntry> createState() => _CodeEntryState();
}

class _CodeEntryState extends ConsumerState<_CodeEntry>
    with WidgetsBindingObserver {
  late final TextEditingController _codeController;
  final _codeFocusNode = FocusNode();
  late final KeyboardFocusRestoreHandle _keyboardRestore;
  bool _backupCode = false;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _keyboardRestore = KeyboardFocusRestoreHandle(
      focusNode: _codeFocusNode,
      shouldTrackOnBackground: () =>
          _codeFocusNode.hasFocus && _canShowTextInput(),
      canRestoreFocus: () => mounted && _canShowTextInput(),
    );
    WidgetsBinding.instance.addObserver(this);
    _codeController.addListener(_syncCodeToViewModel);
  }

  bool _canShowTextInput() {
    final vm = ref.read(mfaViewModelProvider(widget.challenge));
    return !vm.isSubmitting;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _keyboardRestore.handleLifecycleState(state);
  }

  void _syncCodeToViewModel() {
    ref
        .read(mfaViewModelProvider(widget.challenge).notifier)
        .updateCode(_codeController.text);
  }

  void _toggleBackupCode() {
    _codeFocusNode.unfocus();
    setState(() => _backupCode = !_backupCode);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _codeFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _keyboardRestore.dispose();
    _codeController
      ..removeListener(_syncCodeToViewModel)
      ..dispose();
    _codeFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(mfaViewModelProvider(widget.challenge));
    final notifier = ref.read(mfaViewModelProvider(widget.challenge).notifier);
    final layout = context.layout;
    final textStyles = context.textStyles;
    final colors = context.colors;

    ref.listen(
      mfaViewModelProvider(widget.challenge).select((state) => state.code),
      (_, next) {
        if (_codeController.text == next) {
          return;
        }
        _codeController.value = TextEditingValue(
          text: next,
          selection: TextSelection.collapsed(offset: next.length),
        );
      },
    );

    return AutofillGroup(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              widget.l10n.mfaTotpDescription,
              style: textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: layout.s4),
          FluxerInput(
            controller: _codeController,
            label: widget.l10n.mfaCodeLabel,
            focusNode: _codeFocusNode,
            autofocus: true,
            maxLength: 10,
            keyboardType: _backupCode
                ? TextInputType.visiblePassword
                : TextInputType.number,
            autocorrect: false,
            enableSuggestions: false,
            textInputAction: TextInputAction.go,
            autofillHints: _backupCode
                ? null
                : const [AutofillHints.oneTimeCode],
            onSubmitted: (_) {
              if (vm.canSubmitCode) {
                unawaited(notifier.submitCode());
              }
            },
          ),
          SizedBox(height: layout.s2),
          FluxerTextLink(
            text: _backupCode
                ? widget.l10n.mfaUseAuthenticatorCode
                : widget.l10n.mfaUseBackupCode,
            onTap: vm.isSubmitting ? null : _toggleBackupCode,
          ),
          SizedBox(height: layout.s4),
          FluxerButton.primary(
            onPressed: vm.canSubmitCode ? notifier.submitCode : null,
            label: widget.l10n.logIn,
            isLoading: vm.isSubmitting,
          ),
        ],
      ),
    );
  }
}
