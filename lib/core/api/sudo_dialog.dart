import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/data/webauthn_service.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_segmented_tabs.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_tabs.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/exceptions.dart';

/// Shows a sudo verification bottom sheet that collects either a password
/// or TOTP code from the user.
///
/// Returns a map with the verification payload on success, or `null` if
/// cancelled.
Future<Map<String, dynamic>?> showSudoVerificationSheet({
  required GlobalKey<NavigatorState> navigatorKey,
  required Dio dio,
}) {
  final context = navigatorKey.currentState?.context;
  if (context == null) {
    return Future.value();
  }

  return FluxerBottomSheet.show<Map<String, dynamic>>(
    context,
    useRootNavigator: true,
    title: FluxerLocalizations.of(context).sudoTitle,
    subtitle: Text(
      FluxerLocalizations.of(context).sudoDescription,
      style: context.textStyles.bodySmall.copyWith(
        color: context.colors.textSecondary,
      ),
    ),
    builder: (sheetContext, close) => _SudoVerificationSheetContent(
      dio: dio,
      onVerified: (payload) {
        Navigator.of(sheetContext, rootNavigator: true).pop(payload);
      },
    ),
  );
}

enum _SudoMethod { password, totp }

class _SudoVerificationSheetContent extends StatefulWidget {
  const _SudoVerificationSheetContent({
    required this.dio,
    required this.onVerified,
  });

  final Dio dio;
  final void Function(Map<String, dynamic> payload) onVerified;

  @override
  State<_SudoVerificationSheetContent> createState() =>
      _SudoVerificationSheetContentState();
}

class _SudoVerificationSheetContentState
    extends State<_SudoVerificationSheetContent> {
  bool _isLoading = true;
  bool _hasPassword = true;
  bool _hasTotp = false;
  bool _hasWebauthn = false;
  _SudoMethod _selectedMethod = _SudoMethod.password;
  String? _error;

  final _passwordController = TextEditingController();
  final _totpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    unawaited(_loadMethods());
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _totpController.dispose();
    super.dispose();
  }

  Future<void> _loadMethods() async {
    try {
      final response = await widget.dio.get<Map<String, dynamic>>(
        '/users/@me/sudo/mfa-methods',
      );
      final data = response.data;
      if (!mounted || data == null) {
        return;
      }
      final hasMfa = data['has_mfa'] as bool? ?? false;
      final totp = data['totp'] as bool? ?? false;
      final webauthn = data['webauthn'] as bool? ?? false;
      setState(() {
        // When MFA is enabled, password-only is not available (matches
        // web app behavior in SudoPrompt.tsx).
        _hasPassword = !hasMfa;
        _hasTotp = totp;
        _hasWebauthn = webauthn;
        _isLoading = false;
        if (hasMfa && totp) {
          _selectedMethod = _SudoMethod.totp;
        } else if (!hasMfa) {
          _selectedMethod = _SudoMethod.password;
        }
      });
    } on Exception catch (e) {
      talker.warning('[SudoDialog] Failed to load MFA methods: $e');
      if (!mounted) {
        return;
      }
      // Fall back to password-only.
      setState(() => _isLoading = false);
    }
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

    if (_isLoading) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: layout.s6),
        child: const Center(child: FluxerLoadingSpinner()),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_hasPassword && _hasTotp) ...[
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
          if (_hasPassword || _hasTotp) ...[
            if (_selectedMethod == _SudoMethod.password)
              FluxerInput(
                controller: _passwordController,
                label: l10n.password,
                obscureText: true,
                autofocus: true,
                onSubmitted: (_) => _submit(),
              )
            else
              FluxerInput(
                controller: _totpController,
                label: l10n.sudoAuthenticatorCode,
                autofocus: true,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submit(),
              ),
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: _submit,
              label: l10n.continueAction,
            ),
            SizedBox(height: layout.s2),
          ],
          if (_hasWebauthn) ...[
            if (_hasPassword || _hasTotp)
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
