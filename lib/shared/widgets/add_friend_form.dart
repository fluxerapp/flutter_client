import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/friends/domain/friend_request_exception.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/fluxer_tag_parser.dart';
import 'package:fluxer_app/shared/utils/relationship_error_messages.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum _FormResultStatus { success, error }

class AddFriendForm extends ConsumerStatefulWidget {
  const AddFriendForm({super.key});

  @override
  ConsumerState<AddFriendForm> createState() => _AddFriendFormState();
}

class _AddFriendFormState extends ConsumerState<AddFriendForm> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  _FormResultStatus? _resultStatus;
  String? _errorMessage;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearResult() {
    if (_resultStatus == null && _errorMessage == null) {
      return;
    }
    setState(() {
      _resultStatus = null;
      _errorMessage = null;
    });
  }

  Future<void> _handleSubmit() async {
    final l10n = FluxerLocalizations.of(context);
    final parsed = parseFluxerTagInput(_controller.text.trim());
    if (!isValidFluxerTagSubmission(parsed.username, parsed.discriminator)) {
      setState(() {
        _resultStatus = _FormResultStatus.error;
        _errorMessage = l10n.addFriendNoUserFound;
      });
      return;
    }
    setState(() {
      _isLoading = true;
      _resultStatus = null;
      _errorMessage = null;
    });
    try {
      await ref
          .read(friendRepositoryProvider)
          .sendFriendRequestByTag(parsed.username, parsed.discriminator);
      if (!mounted) {
        return;
      }
      setState(() {
        _isLoading = false;
        _resultStatus = _FormResultStatus.success;
        _controller.clear();
      });
    } on FriendRequestException catch (e) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isLoading = false;
        _resultStatus = _FormResultStatus.error;
        _errorMessage = getSendFriendRequestErrorFromException(l10n, e);
      });
    } on Exception catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isLoading = false;
        _resultStatus = _FormResultStatus.error;
        _errorMessage = l10n.addFriendSendFailedGeneric;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final settings = ref.watch(userSettingsViewModelProvider);
    if (!settings.isProfileLoaded) {
      return const Center(child: FluxerLoadingSpinner());
    }
    if (!settings.hasVerifiedEmail) {
      return _AddFriendGate(
        icon: PhosphorIconsFill.warningCircle,
        title: l10n.addFriendClaimTitle,
        description: l10n.addFriendClaimDescription,
        actionLabel: l10n.claimAccount,
        onAction: () => ClaimAccountSheet.show(context, ref),
      );
    }
    if (!settings.verified) {
      return _AddFriendGate(
        icon: PhosphorIconsFill.envelopeSimple,
        title: l10n.addFriendVerifyTitle,
        description: l10n.addFriendVerifyDescription,
        actionLabel: l10n.addFriendVerifyEmail,
        onAction: () => UserSettingsModal.show(context),
      );
    }
    final isDisabled = _isLoading || _controller.text.trim().isEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FluxerInput(
          controller: _controller,
          label: l10n.addFriendUsernameLabel,
          hint: l10n.addFriendUsernameHint,
          enabled: !_isLoading,
          onChanged: (_) {
            _clearResult();
            setState(() {});
          },
          textInputAction: TextInputAction.done,
          onSubmitted: (_) {
            if (!isDisabled) {
              unawaited(_handleSubmit());
            }
          },
        ),
        SizedBox(height: context.layout.s3),
        FluxerButton.primary(
          label: l10n.addFriendSendRequest,
          isLoading: _isLoading,
          onPressed: isDisabled ? null : _handleSubmit,
        ),
        if (_resultStatus == _FormResultStatus.error && _errorMessage != null)
          Padding(
            padding: EdgeInsets.only(top: context.layout.s2),
            child: Text(
              _errorMessage!,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.statusDanger,
              ),
            ),
          ),
        if (_resultStatus == _FormResultStatus.success)
          Padding(
            padding: EdgeInsets.only(top: context.layout.s2),
            child: Text(
              l10n.addFriendOutgoingSuccess,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.statusOnline,
              ),
            ),
          ),
      ],
    );
  }
}

class _AddFriendGate extends StatelessWidget {
  const _AddFriendGate({
    required this.icon,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onAction,
  });

  final IconData icon;
  final String title;
  final String description;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PhosphorIcon(icon, size: 48, color: context.colors.textPrimaryMuted),
        SizedBox(height: context.layout.s3),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textStyles.heading.copyWith(fontSize: 18),
        ),
        SizedBox(height: context.layout.s2),
        Text(
          description,
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
            height: 1.4,
          ),
        ),
        SizedBox(height: context.layout.s4),
        FluxerButton.primary(label: actionLabel, onPressed: onAction),
      ],
    );
  }
}
