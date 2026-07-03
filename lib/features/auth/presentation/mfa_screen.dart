import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/mfa_challenge.dart';
import 'package:fluxer_app/features/auth/providers/login_error_l10n.dart';
import 'package:fluxer_app/features/auth/providers/mfa_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
    final colors = context.colors;
    final errorText = vm.errorType != null
        ? vm.errorType!.resolve(l10n)
        : vm.error;

    // Listen for completion.
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
        if (vm.selectedMethod == null)
          _MethodSelector(
            challenge: challenge,
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
          Text(
            errorText,
            style: textStyles.bodySmall.copyWith(color: colors.textDanger),
          ),
        ],
        SizedBox(height: layout.s6),
        if (vm.selectedMethod != null && challenge.hasMultipleMethods) ...[
          if (challenge.webauthn && vm.selectedMethod != MfaMethod.webauthn)
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
        FluxerTextLink(text: l10n.back, onTap: vm.isSubmitting ? null : onBack),
      ],
    );
  }
}

class _MethodSelector extends StatelessWidget {
  final MfaChallenge challenge;
  final void Function(MfaMethod) onSelect;
  final VoidCallback onWebauthn;
  final bool webauthnLoading;
  final FluxerLocalizations l10n;

  const _MethodSelector({
    required this.challenge,
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
        if (challenge.webauthn)
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

class _CodeEntryState extends ConsumerState<_CodeEntry> {
  late final TextEditingController _codeController;

  @override
  void initState() {
    super.initState();
    _codeController = TextEditingController();
    _codeController.addListener(_syncCodeToViewModel);
  }

  void _syncCodeToViewModel() {
    ref
        .read(mfaViewModelProvider(widget.challenge).notifier)
        .updateCode(_codeController.text);
  }

  @override
  void dispose() {
    _codeController
      ..removeListener(_syncCodeToViewModel)
      ..dispose();
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
        if (_codeController.text != next) {
          _codeController.text = next;
        }
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
            autofocus: true,
            maxLength: 10,
            keyboardType: TextInputType.text,
            autocorrect: false,
            enableSuggestions: false,
            textInputAction: TextInputAction.go,
            autofillHints: const [AutofillHints.oneTimeCode],
            onSubmitted: (_) {
              if (vm.canSubmitCode) {
                unawaited(notifier.submitCode());
              }
            },
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
