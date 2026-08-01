import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/account_delete_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/account_disable_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/backup_codes_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/email_change_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/passkey_name_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/password_change_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/totp_disable_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/totp_enable_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/providers/webauthn_credentials_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_section.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_subsection.dart';
import 'package:fluxer_app/features/ui/text/fluxer_field_label.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:fluxer_dart/export.dart';

// TODO(Elias): Re-enable if needed for phone eligibility rules.
const int _kMaxPasskeys = 10;

class UserSecurityLogin extends ConsumerStatefulWidget {
  const UserSecurityLogin({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserSecurityLogin> createState() => _UserSecurityLoginState();
}

class _UserSecurityLoginState extends ConsumerState<UserSecurityLogin> {
  bool _emailRevealed = false;
  // TODO(Elias): Restore phone-number flows when backend support is ready.
  // bool _phoneRevealed = false;

  String _maskEmail(String email) {
    final atIndex = email.indexOf('@');
    if (atIndex <= 0) {
      return email;
    }
    return '${'*' * atIndex}${email.substring(atIndex)}';
  }

  // TODO(Elias): Restore phone-number flows when backend support is ready.
  // String _maskPhone(String phone) {
  //   if (phone.length <= 4) {
  //     return '*' * phone.length;
  //   }
  //   return '${'*' * (phone.length - 2)}${phone.substring(phone.length - 2)}';
  // }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userSettingsViewModelProvider);
    final passkeyState = ref.watch(webauthnCredentialsViewModelProvider);
    final colors = context.colors;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            title: l10n.securityAccountTitle,
            description: l10n.securityAccountDescription,
            isFirst: true,
            children: [
              _buildEmailSection(state, colors, l10n),
              _buildPasswordSection(state, colors, l10n),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.securitySectionTitle,
            description: l10n.securitySectionDescription,
            children: [
              _buildSecuritySection(state, passkeyState, colors, l10n),
            ],
          ),
          _buildDangerZone(state, colors, l10n),
        ],
      ),
    );
  }

  Widget _buildEmailSection(
    UserSettingsViewState s,
    FluxerColorTheme colors,
    FluxerLocalizations l10n,
  ) {
    return FluxerSettingsSubsection(
      title: l10n.securityLoginEmailSectionTitle,
      description: l10n.securityLoginEmailSectionDescription,
      children: [
        if (!s.hasVerifiedEmail) ...[
          FluxerWarningAlert(message: l10n.securityLoginNoEmailSet),
          FluxerButton.primary(
            onPressedAsync: () => ClaimAccountSheet.show(context, ref),
            label: l10n.securityLoginAddEmail,
            size: FluxerButtonSize.small,
          ),
        ] else ...[
          _responsiveRow(
            label: l10n.securityLoginEmailAddressLabel,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _emailRevealed ? s.email! : _maskEmail(s.email!),
                  style: TextStyle(
                    fontSize: 14,
                    color: colors.textPrimaryMuted,
                  ),
                ),
                const SizedBox(height: 4),
                FluxerTextLink(
                  text: _emailRevealed
                      ? l10n.securityLoginHide
                      : l10n.securityLoginReveal,
                  onTap: () => setState(() => _emailRevealed = !_emailRevealed),
                ),
              ],
            ),
            button: FluxerButton.primary(
              onPressedAsync: () => EmailChangeSheet.show(context, ref),
              label: l10n.securityLoginChangeEmail,
              size: FluxerButtonSize.small,
            ),
          ),
          if (!s.verified)
            FluxerWarningAlert(
              variant: FluxerAlertVariant.info,
              message: l10n.securityVerifyEmailRequired,
            ),
        ],
      ],
    );
  }

  Widget _buildPasswordSection(
    UserSettingsViewState s,
    FluxerColorTheme colors,
    FluxerLocalizations l10n,
  ) {
    return FluxerSettingsSubsection(
      title: l10n.securityLoginPasswordSectionTitle,
      description: l10n.securityLoginPasswordSectionDescription,
      children: [
        if (!s.hasVerifiedEmail) ...[
          Text(
            l10n.securityLoginNoPasswordSet,
            style: TextStyle(fontSize: 14, color: colors.statusWarning),
          ),
          FluxerButton.primary(
            onPressedAsync: () => ClaimAccountSheet.show(context, ref),
            label: l10n.securityLoginSetPassword,
            size: FluxerButtonSize.small,
          ),
        ] else
          _responsiveRow(
            label: l10n.securityLoginCurrentPasswordLabel,
            child: Text(
              _passwordLastChanged(s, l10n),
              style: TextStyle(fontSize: 14, color: colors.textPrimaryMuted),
            ),
            button: FluxerButton.primary(
              onPressedAsync: () => PasswordChangeSheet.show(context, ref),
              label: l10n.securityLoginChangePassword,
              size: FluxerButtonSize.small,
            ),
          ),
      ],
    );
  }

  String _passwordLastChanged(
    UserSettingsViewState s,
    FluxerLocalizations l10n,
  ) {
    final lc = s.passwordLastChangedAt;
    if (lc == null) {
      return l10n.securityLoginPasswordNeverChanged;
    }
    final date = DateTime.tryParse(lc);
    if (date == null) {
      return l10n.securityLoginPasswordLastChanged(lc);
    }
    return l10n.securityLoginPasswordLastChanged(relativeTime(date, l10n));
  }

  Widget _buildSecuritySection(
    UserSettingsViewState s,
    WebauthnCredentialsViewState passkeyState,
    FluxerColorTheme colors,
    FluxerLocalizations l10n,
  ) {
    if (!s.hasVerifiedEmail) {
      return FluxerSettingsSubsection(
        title: l10n.securityClaimTitle,
        description: l10n.securityClaimDescription,
        children: [
          FluxerButton.primary(
            onPressedAsync: () => ClaimAccountSheet.show(context, ref),
            label: l10n.claimAccount,
            size: FluxerButtonSize.small,
          ),
        ],
      );
    }

    if (!s.verified) {
      return FluxerSettingsSubsection(
        title: l10n.securityTfaSectionTitle,
        description: l10n.securityTfaSectionDescription,
        children: [
          FluxerWarningAlert(message: l10n.securityVerifyEmailRequired),
        ],
      );
    }

    final layout = context.layout;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTfaSubsection(s, colors, l10n),
        SizedBox(height: layout.s8),
        _buildPasskeysSubsection(s, passkeyState, colors, l10n),
        // TODO(Elias): Restore phone-number flows when backend support is ready.
        // if (s.mfaEnabled) ...[
        //   SizedBox(height: layout.s8),
        //   _buildPhoneSubsection(s, colors, l10n),
        // ],
      ],
    );
  }

  Widget _buildTfaSubsection(
    UserSettingsViewState s,
    FluxerColorTheme colors,
    FluxerLocalizations l10n,
  ) {
    return FluxerSettingsSubsection(
      title: l10n.securityTfaSectionTitle,
      description: l10n.securityTfaSectionDescription,
      children: [
        _responsiveRow(
          label: l10n.securityTfaAuthenticatorApp,
          child: Text(
            s.hasTotpMfa
                ? l10n.securityTfaAuthenticatorEnabled
                : l10n.securityTfaAuthenticatorDisabled,
            style: TextStyle(fontSize: 14, color: colors.textPrimaryMuted),
          ),
          button: s.hasTotpMfa
              ? FluxerButton.dangerPrimary(
                  onPressedAsync: () => TotpDisableSheet.show(context, ref),
                  label: l10n.disable,
                  size: FluxerButtonSize.small,
                )
              : FluxerButton.primary(
                  onPressedAsync: () => TotpEnableSheet.show(context, ref),
                  label: l10n.enable,
                  size: FluxerButtonSize.small,
                ),
        ),
        if (s.hasTotpMfa)
          _responsiveRow(
            label: l10n.securityTfaBackupCodes,
            child: Text(
              l10n.securityTfaBackupCodesDescription,
              style: TextStyle(fontSize: 14, color: colors.textPrimaryMuted),
            ),
            button: FluxerButton.secondary(
              onPressedAsync: () => BackupCodesSheet.showView(context, ref),
              label: l10n.securityTfaViewCodes,
              size: FluxerButtonSize.small,
            ),
          ),
      ],
    );
  }

  Widget _buildPasskeysSubsection(
    UserSettingsViewState s,
    WebauthnCredentialsViewState passkeyState,
    FluxerColorTheme colors,
    FluxerLocalizations l10n,
  ) {
    final count = passkeyState.credentials.length;

    return FluxerSettingsSubsection(
      title: l10n.securityPasskeysSectionTitle,
      description: l10n.securityPasskeysSectionDescription,
      children: [
        _responsiveRow(
          label: l10n.securityPasskeysRegistered,
          child: Text(
            count == 0
                ? l10n.securityPasskeysNone
                : l10n.securityPasskeysCount(count),
            style: TextStyle(fontSize: 14, color: colors.textPrimaryMuted),
          ),
          button: FluxerButton.primary(
            onPressedAsync: passkeyState.isLoading || count >= _kMaxPasskeys
                ? null
                : _handleAddPasskey,
            label: l10n.securityPasskeysAdd,
            size: FluxerButtonSize.small,
          ),
        ),
        if (passkeyState.credentials.isNotEmpty)
          ...passkeyState.credentials.map(
            (pk) => _buildPasskeyItem(pk, colors, l10n),
          ),
      ],
    );
  }

  Widget _buildPasskeyItem(
    WebAuthnCredentialResponse pk,
    FluxerColorTheme colors,
    FluxerLocalizations l10n,
  ) {
    final createdAt = DateTime.tryParse(pk.createdAt);
    final createdAtLabel = createdAt != null
        ? relativeTime(createdAt, l10n)
        : pk.createdAt;
    final details = StringBuffer(l10n.securityPasskeysAdded(createdAtLabel));
    if (pk.lastUsedAt != null) {
      final lastUsedAt = DateTime.tryParse(pk.lastUsedAt!);
      final lastUsedLabel = lastUsedAt != null
          ? relativeTime(lastUsedAt, l10n)
          : pk.lastUsedAt!;
      details.write(
        ' \u2022 '
        '${l10n.securityPasskeysLastUsed(lastUsedLabel)}',
      );
    }

    final layout = context.layout;

    return Padding(
      padding: EdgeInsets.only(bottom: layout.s3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pk.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: colors.textPrimary,
            ),
          ),
          SizedBox(height: layout.s1),
          Text(
            details.toString(),
            style: TextStyle(fontSize: 13, color: colors.textPrimaryMuted),
          ),
          SizedBox(height: layout.s2),
          Row(
            children: [
              FluxerButton.secondary(
                onPressedAsync: () => _handleRenamePasskey(pk),
                label: l10n.securityPasskeysRename,
                size: FluxerButtonSize.compact,
                fitContent: true,
              ),
              SizedBox(width: layout.s2),
              FluxerButton.dangerSecondary(
                onPressedAsync: () => _handleDeletePasskey(pk, l10n),
                label: l10n.delete,
                size: FluxerButtonSize.compact,
                fitContent: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _handleAddPasskey() async {
    await PasskeyNameSheet.showForCreate(
      context,
      ref,
      onCreated: () => unawaited(
        ref
            .read(webauthnCredentialsViewModelProvider.notifier)
            .load(silent: true),
      ),
    );
  }

  Future<void> _handleRenamePasskey(WebAuthnCredentialResponse pk) async {
    await PasskeyNameSheet.showForRename(
      context,
      ref,
      credentialId: pk.id,
      currentName: pk.name,
      onRenamed: () => unawaited(
        ref
            .read(webauthnCredentialsViewModelProvider.notifier)
            .load(silent: true),
      ),
    );
  }

  Future<void> _handleDeletePasskey(
    WebAuthnCredentialResponse pk,
    FluxerLocalizations l10n,
  ) async {
    final confirmed = await FluxerConfirmModal.show(
      context,
      title: l10n.securityPasskeysDeleteTitle,
      description: l10n.securityPasskeysDeleteDescription(pk.name),
      confirmLabel: l10n.securityPasskeysDeleteTitle,
      isDanger: true,
      onConfirm: () {},
    );
    if (confirmed != true) {
      return;
    }

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.deleteWebauthnCredential(
        credentialId: pk.id,
        body: const SudoVerificationSchema(),
      );
      await ref
          .read(webauthnCredentialsViewModelProvider.notifier)
          .load(silent: true);
    } on Exception {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.genericError,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  // TODO(Elias): Restore phone-number flows when backend support is ready.
  // Widget _buildPhoneSubsection(
  //   UserSettingsViewState s,
  //   FluxerColorTheme colors,
  //   FluxerLocalizations l10n,
  // ) {
  //   return FluxerSettingsSubsection(
  //     title: l10n.securityPhoneSectionTitle,
  //     description: l10n.securityPhoneSectionDescription,
  //     children: [
  //       if (s.phone != null)
  //         _responsiveRow(
  //           label: l10n.securityPhoneLabel,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 _phoneRevealed ? s.phone! : _maskPhone(s.phone!),
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: colors.textPrimaryMuted,
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               FluxerTextLink(
  //                 text: _phoneRevealed
  //                     ? l10n.securityLoginHide
  //                     : l10n.securityLoginReveal,
  //                 onTap: () => setState(() => _phoneRevealed = !_phoneRevealed),
  //               ),
  //             ],
  //           ),
  //           button: FluxerButton.dangerSecondary(
  //             onPressedAsync: () => _handleRemovePhone(s, l10n),
  //             label: l10n.securityPhoneRemove,
  //             size: FluxerButtonSize.small,
  //           ),
  //         )
  //       else
  //         _responsiveRow(
  //           label: l10n.securityPhoneLabel,
  //           child: Text(
  //             l10n.securityPhoneNone,
  //             style: TextStyle(fontSize: 14, color: colors.textPrimaryMuted),
  //           ),
  //           button: FluxerButton.primary(
  //             onPressedAsync: () => PhoneAddSheet.show(context, ref),
  //             label: l10n.securityPhoneAdd,
  //             size: FluxerButtonSize.small,
  //           ),
  //         ),
  //     ],
  //   );
  // }

  // TODO(Elias): Restore phone-number flows when backend support is ready.
  // Future<void> _handleRemovePhone(
  //   UserSettingsViewState s,
  //   FluxerLocalizations l10n,
  // ) async {
  //   final description = l10n.securityPhoneRemoveDescription;
  //
  //   final confirmed = await FluxerConfirmModal.show(
  //     context,
  //     title: l10n.securityPhoneRemoveTitle,
  //     description: description,
  //     confirmLabel: l10n.securityPhoneRemove,
  //     isDanger: true,
  //     onConfirm: () {},
  //   );
  //   if (confirmed != true) {
  //     return;
  //   }
  //
  //   try {
  //     final client = ref.read(fluxerClientProvider);
  //     await client.users.removePhoneFromAccount(
  //       body: const SudoVerificationSchema(),
  //     );
  //     ref
  //         .read(toastProvider.notifier)
  //         .show(
  //           FluxerToast(
  //             message: l10n.securityPhoneRemoved,
  //             variant: FluxerToastVariant.success,
  //           ),
  //         );
  //     await ref.read(userSettingsViewModelProvider.notifier).loadProfile();
  //   } on Exception {
  //     // TODO(Elias): show error toast
  //   }
  // }

  Widget _buildDangerZone(
    UserSettingsViewState s,
    FluxerColorTheme colors,
    FluxerLocalizations l10n,
  ) {
    return FluxerSettingsSection(
      title: l10n.dangerZoneSectionTitle,
      description: l10n.dangerZoneSectionDescription,
      children: [
        if (s.hasVerifiedEmail)
          FluxerSettingsSubsection(
            title: l10n.dangerZoneDisableTitle,
            description: l10n.dangerZoneDisableDescription,
            children: [
              FluxerButton.dangerPrimary(
                onPressedAsync: () => AccountDisableSheet.show(context, ref),
                label: l10n.dangerZoneDisableTitle,
                size: FluxerButtonSize.small,
              ),
            ],
          ),
        FluxerSettingsSubsection(
          title: l10n.dangerZoneDeleteTitle,
          description: l10n.dangerZoneDeleteDescription,
          children: [
            if (s.hasActiveSubscription)
              Text(
                l10n.dangerZoneDeleteCancelSubscription,
                style: TextStyle(fontSize: 13, color: colors.statusWarning),
              ),
            FluxerButton.dangerPrimary(
              onPressedAsync: s.hasActiveSubscription
                  ? null
                  : () => AccountDeleteSheet.show(context, ref),
              label: l10n.dangerZoneDeleteTitle,
              size: FluxerButtonSize.small,
            ),
          ],
        ),
      ],
    );
  }

  Widget _responsiveRow({
    required String label,
    required Widget child,
    required Widget button,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final layout = context.layout;

        if (constraints.maxWidth >= 500) {
          return Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FluxerFieldLabel(label),
                    SizedBox(height: layout.s1),
                    child,
                  ],
                ),
              ),
              SizedBox(width: layout.s4),
              button,
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerFieldLabel(label),
            SizedBox(height: layout.s1),
            child,
            SizedBox(height: layout.s3),
            button,
          ],
        );
      },
    );
  }
}
