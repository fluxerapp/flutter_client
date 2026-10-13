import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/sudo_interceptor.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/data/webauthn_service.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_segmented_tabs.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_tabs.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/keyboard_focus_restore.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/exceptions.dart';

Future<Map<String, dynamic>?> showSudoVerificationSheet({
  required GlobalKey<NavigatorState> navigatorKey,
  required Dio dio,
  required SudoChallenge challenge,
}) {
  final context = navigatorKey.currentState?.context;
  if (context == null) {
    return Future.value();
  }

  final l10n = FluxerLocalizations.of(context);
  final colors = context.colors;
  final textStyles = context.textStyles;

  Widget buildContent(BuildContext overlayContext) {
    return _SudoVerificationSheetContent(
      dio: dio,
      challenge: challenge,
      onVerified: (payload) {
        Navigator.of(overlayContext, rootNavigator: true).pop(payload);
      },
    );
  }

  if (isMobileLayout(context)) {
    return FluxerBottomSheet.show<Map<String, dynamic>>(
      context,
      useRootNavigator: true,
      title: l10n.sudoTitle,
      subtitle: Text(
        l10n.sudoDescription,
        style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
      ),
      builder: (sheetContext, close) => buildContent(sheetContext),
    );
  }

  return FluxerModal.show<Map<String, dynamic>>(
    context,
    useRootNavigator: true,
    centered: true,
    title: l10n.sudoTitle,
    description: l10n.sudoDescription,
    builder: (dialogContext, close) => buildContent(dialogContext),
  );
}

enum _SudoMethod { password, totp }

class _SudoVerificationSheetContent extends StatefulWidget {
  const _SudoVerificationSheetContent({
    required this.dio,
    required this.challenge,
    required this.onVerified,
  });

  final Dio dio;
  final SudoChallenge challenge;
  final void Function(Map<String, dynamic> payload) onVerified;

  @override
  State<_SudoVerificationSheetContent> createState() =>
      _SudoVerificationSheetContentState();
}

class _SudoVerificationSheetContentState
    extends State<_SudoVerificationSheetContent>
    with WidgetsBindingObserver {
  late final bool _hasPassword = !widget.challenge.hasMfa;
  late final bool _hasCode =
      widget.challenge.totp || widget.challenge.backupCodes;
  late _SudoMethod _selectedMethod = _hasPassword
      ? _SudoMethod.password
      : _SudoMethod.totp;
  late String? _error = widget.challenge.error;

  final _passwordController = TextEditingController();
  final _totpController = TextEditingController();
  final _inputFocusNode = FocusNode();
  late final KeyboardFocusRestoreHandle _keyboardRestore;

  bool get _canShowTextInput => _hasPassword || _hasCode;

  @override
  void initState() {
    super.initState();
    _keyboardRestore = KeyboardFocusRestoreHandle(
      focusNode: _inputFocusNode,
      shouldTrackOnBackground: () =>
          _inputFocusNode.hasFocus && _canShowTextInput,
      canRestoreFocus: () => mounted && _canShowTextInput,
    );
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _keyboardRestore.dispose();
    _passwordController.dispose();
    _totpController.dispose();
    _inputFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _keyboardRestore.handleLifecycleState(state);
  }

  void _submit() {
    final l10n = FluxerLocalizations.of(context);

    if (_selectedMethod == _SudoMethod.password) {
      final password = _passwordController.text.trim();
      if (password.isEmpty) {
        setState(() => _error = l10n.sudoVerificationFailed);
        return;
      }
      widget.onVerified({'password': password});
    } else {
      final code = _totpController.text.trim();
      if (code.isEmpty) {
        setState(() => _error = l10n.sudoVerificationFailed);
        return;
      }
      widget.onVerified({'mfa_method': 'totp', 'mfa_code': code});
    }
  }

  Future<void> _verifyWithPasskey() async {
    setState(() => _error = null);
    try {
      final res = await widget.dio.post<Map<String, dynamic>>(
        '/users/@me/sudo/webauthn/authentication-options',
      );
      final options = res.data!;
      final response = await WebAuthnService(
        PasskeyAuthenticator(),
      ).authenticate(options);
      widget.onVerified(<String, dynamic>{
        'mfa_method': 'webauthn',
        'webauthn_challenge': options['challenge'],
        'webauthn_response': response,
      });
    } on PasskeyAuthCancelledException {
      // User dismissed the OS passkey prompt; leave the sheet open.
    } on Exception catch (e) {
      talker.warning('[SudoDialog] Passkey verification failed: $e');
      if (mounted) {
        setState(
          () => _error = FluxerLocalizations.of(context).sudoVerificationFailed,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_hasPassword && _hasCode) ...[
            FluxerSegmentedTabs(
              tabs: [
                FluxerTab(label: l10n.sudoMethodPassword),
                FluxerTab(label: l10n.sudoMethodTotp),
              ],
              selectedIndex: _selectedMethod == _SudoMethod.password ? 0 : 1,
              onChanged: (index) {
                setState(() {
                  _selectedMethod = index == 0
                      ? _SudoMethod.password
                      : _SudoMethod.totp;
                  _error = null;
                });
              },
            ),
            SizedBox(height: layout.s3),
          ],
          if (_error != null) ...[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(layout.s3),
              decoration: BoxDecoration(
                color: colors.textDanger.withValues(alpha: 0.1),
                borderRadius: layout.radiusSm,
              ),
              child: Text(
                _error!,
                style: textStyles.bodySmall.copyWith(color: colors.textDanger),
              ),
            ),
            SizedBox(height: layout.s3),
          ],
          if (_canShowTextInput) ...[
            if (_selectedMethod == _SudoMethod.password)
              FluxerInput(
                controller: _passwordController,
                focusNode: _inputFocusNode,
                label: l10n.password,
                obscureText: true,
                autofocus: true,
                onSubmitted: (_) => _submit(),
              )
            else
              FluxerInput(
                controller: _totpController,
                focusNode: _inputFocusNode,
                label: widget.challenge.totp
                    ? l10n.sudoAuthenticatorCode
                    : l10n.mfaCodeLabel,
                autofocus: true,
                maxLength: 10,
                keyboardType: widget.challenge.backupCodes
                    ? TextInputType.text
                    : TextInputType.number,
                autocorrect: false,
                enableSuggestions: false,
                autofillHints: const [AutofillHints.oneTimeCode],
                onSubmitted: (_) => _submit(),
              ),
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: _submit,
              label: l10n.continueAction,
            ),
            SizedBox(height: layout.s2),
          ],
          if (widget.challenge.webauthn) ...[
            if (_canShowTextInput)
              FluxerButton.secondary(
                onPressedAsync: _verifyWithPasskey,
                label: l10n.mfaMethodWebauthn,
              )
            else
              FluxerButton.primary(
                onPressedAsync: _verifyWithPasskey,
                label: l10n.mfaMethodWebauthn,
              ),
            SizedBox(height: layout.s2),
          ],
        ],
      ),
    );
  }
}
