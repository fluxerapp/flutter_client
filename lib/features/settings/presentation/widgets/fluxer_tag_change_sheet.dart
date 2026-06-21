import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const int _kMinUsernameLength = 1;
const int _kMaxUsernameLength = 32;
final RegExp _kUsernamePattern = RegExp(r'^[a-zA-Z0-9_]+$');

Future<void> showFluxerTagChangeSheet(BuildContext context) {
  final canDismissNotifier = ValueNotifier<bool>(true);
  return FluxerBottomSheet.show<void>(
    context,
    title: FluxerLocalizations.of(context).changeYourFluxerTag,
    canDismissNotifier: canDismissNotifier,
    builder: (sheetContext, close) => _FluxerTagChangeContent(
      canDismissNotifier: canDismissNotifier,
      onDone: close,
    ),
  );
}

class _FluxerTagChangeContent extends ConsumerStatefulWidget {
  const _FluxerTagChangeContent({
    required this.canDismissNotifier,
    required this.onDone,
  });

  final ValueNotifier<bool> canDismissNotifier;
  final VoidCallback onDone;

  @override
  ConsumerState<_FluxerTagChangeContent> createState() =>
      _FluxerTagChangeContentState();
}

class _FluxerTagChangeContentState
    extends ConsumerState<_FluxerTagChangeContent> {
  late final TextEditingController _usernameController;
  late final TextEditingController _discriminatorController;
  late String _originalUsername;
  late String _originalDiscriminator;

  var _isSubmitting = false;
  String? _error;
  var _confirmedReroll = false;
  var _confirmedTemporary = false;

  @override
  void initState() {
    super.initState();
    final state = ref.read(userSettingsViewModelProvider);
    _originalUsername = state.username;
    _originalDiscriminator = state.discriminator;

    _usernameController = TextEditingController(text: _originalUsername);
    _discriminatorController = TextEditingController(
      text: _originalDiscriminator,
    );

    _usernameController.addListener(_onFormChanged);
    _discriminatorController.addListener(_onFormChanged);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _discriminatorController.dispose();
    super.dispose();
  }

  void _onFormChanged() {
    final isDirty =
        _usernameController.text != _originalUsername ||
        _discriminatorController.text != _originalDiscriminator;
    widget.canDismissNotifier.value = !isDirty;
    setState(() {
      _confirmedReroll = false;
      _confirmedTemporary = false;
      _error = null;
    });
  }

  bool get _isValidLength {
    final trimmed = _usernameController.text.trim();
    return trimmed.length >= _kMinUsernameLength &&
        trimmed.length <= _kMaxUsernameLength;
  }

  bool get _isValidChars {
    final trimmed = _usernameController.text.trim();
    if (trimmed.isEmpty) {
      return false;
    }
    return _kUsernamePattern.hasMatch(trimmed);
  }

  bool get _isValidDiscriminator {
    final state = ref.read(userSettingsViewModelProvider);
    final text = _discriminatorController.text.trim();
    if (text.length != 4) {
      return false;
    }
    final value = int.tryParse(text);
    if (value == null) {
      return false;
    }
    if (state.hasLifetimePremium) {
      return value >= 0 && value <= 9999;
    }
    return value >= 1 && value <= 9999;
  }

  bool get _isFormValid =>
      _isValidLength && _isValidChars && _isValidDiscriminator;

  bool get _isDirty {
    return _usernameController.text != _originalUsername ||
        _discriminatorController.text != _originalDiscriminator;
  }

  bool get _hasPendingDiscriminatorChange =>
      _discriminatorController.text.trim() != _originalDiscriminator;

  Future<void> _submit() async {
    if (!_isFormValid || _isSubmitting) {
      return;
    }

    final username = _usernameController.text.trim();
    final discriminator = _discriminatorController.text.trim().padLeft(4, '0');
    final state = ref.read(userSettingsViewModelProvider);
    final bool hasCustomDiscriminator = ref.read(
      instanceFeatureEnabledProvider(LimitKeys.featureCustomDiscriminator),
    );

    setState(() {
      _isSubmitting = true;
      _error = null;
    });

    try {
      if (!hasCustomDiscriminator && !_confirmedReroll) {
        final checkResponse = await ref
            .read(fluxerClientProvider)
            .users
            .checkUsernameTagAvailability(
              username: username,
              discriminator: discriminator,
            );

        if (!mounted) {
          return;
        }

        if (checkResponse.taken) {
          setState(() => _isSubmitting = false);

          final confirmed = await _showRerollConfirmation(
            username: username,
            discriminator: discriminator,
          );

          if (!mounted) {
            return;
          }
          if (confirmed != true) {
            return;
          }
          _confirmedReroll = true;
          unawaited(_submit());
          return;
        }
      }

      if (ref.read(shouldShowPremiumCommerceProvider) &&
          state.isPremium &&
          !state.hasLifetimePremium &&
          _hasPendingDiscriminatorChange &&
          !_confirmedTemporary) {
        setState(() => _isSubmitting = false);

        final confirmed = await _showTemporaryTagWarning(state);

        if (!mounted) {
          return;
        }
        if (confirmed != true) {
          return;
        }
        _confirmedTemporary = true;
        unawaited(_submit());
        return;
      }

      await ref
          .read(fluxerClientProvider)
          .users
          .updateCurrentUser(
            body: UserUpdateWithVerificationRequest(
              username: username,
              discriminator: discriminator,
            ),
          );

      if (!mounted) {
        return;
      }

      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(context).fluxerTagUpdated,
              variant: FluxerToastVariant.success,
            ),
          );
      widget.onDone();
    } on Exception catch (e) {
      talker.error('Failed to update FluxerTag', e);
      if (!mounted) {
        return;
      }
      setState(() {
        _isSubmitting = false;
        _error = FluxerLocalizations.of(context).fluxerTagUpdateFailed;
      });
    }
  }

  Future<bool?> _showRerollConfirmation({
    required String username,
    required String discriminator,
  }) {
    final l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<bool>(
      context,
      title: l10n.fluxerTagAlreadyTaken,
      builder: (sheetContext, _) => Padding(
        padding: EdgeInsets.all(sheetContext.layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.fluxerTagAlreadyTakenBody(username, discriminator),
              style: sheetContext.textStyles.bodyMedium.copyWith(
                color: sheetContext.colors.textSecondary,
              ),
            ),
            SizedBox(height: sheetContext.layout.s4),
            FluxerButton.primary(
              onPressed: () => Navigator.of(sheetContext).pop(true),
              label: l10n.continueAction,
            ),
            SizedBox(height: sheetContext.layout.s2),
            FluxerButton.secondary(
              onPressed: () => Navigator.of(sheetContext).pop(false),
              label: l10n.cancel,
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> _showTemporaryTagWarning(UserSettingsViewState state) {
    final l10n = FluxerLocalizations.of(context);
    final expiryDate = state.premiumUntil != null
        ? DateTime.tryParse(state.premiumUntil!)
        : null;

    final String message;
    if (expiryDate != null) {
      final formatted = DateFormat.yMMMd().format(expiryDate);
      message = l10n.customTagTemporaryBodyWithDate(formatted);
    } else {
      message = l10n.customTagTemporaryBody;
    }

    return FluxerBottomSheet.show<bool>(
      context,
      title: l10n.customTagIsTemporary,
      builder: (sheetContext, _) => Padding(
        padding: EdgeInsets.all(sheetContext.layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              message,
              style: sheetContext.textStyles.bodyMedium.copyWith(
                color: sheetContext.colors.textSecondary,
              ),
            ),
            SizedBox(height: sheetContext.layout.s4),
            FluxerButton.primary(
              onPressed: () => Navigator.of(sheetContext).pop(true),
              label: l10n.iUnderstandContinue,
            ),
            SizedBox(height: sheetContext.layout.s2),
            FluxerButton.secondary(
              onPressed: () => Navigator.of(sheetContext).pop(false),
              label: l10n.cancel,
            ),
          ],
        ),
      ),
    );
  }

  String _buildDescriptionText(
    UserSettingsViewState state,
    FluxerLocalizations l10n,
  ) {
    if (state.isPremium) {
      if (state.hasLifetimePremium) {
        return l10n.fluxerTagDescriptionVisionary;
      }
      return l10n.fluxerTagDescriptionPremium;
    }
    return l10n.fluxerTagDescriptionBase;
  }

  String? _buildPremiumWarningText(
    UserSettingsViewState state,
    FluxerLocalizations l10n, {
    required bool shouldShowPremiumCommerce,
  }) {
    if (!shouldShowPremiumCommerce ||
        !state.isPremium ||
        state.hasLifetimePremium) {
      return null;
    }

    if (!state.premiumDiscriminator && !_hasPendingDiscriminatorChange) {
      return null;
    }

    if (_hasPendingDiscriminatorChange) {
      return l10n.premiumWarningPendingDiscriminator;
    }

    return l10n.premiumWarningActiveDiscriminator(state.discriminator);
  }

  Widget _buildValidationRules(FluxerLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _ValidationRule(
          label: l10n.validationLengthRange(
            _kMinUsernameLength,
            _kMaxUsernameLength,
          ),
          isValid: _isValidLength,
        ),
        _ValidationRule(
          label: l10n.validationAllowedChars,
          isValid: _isValidChars,
        ),
      ],
    );
  }

  Widget _buildPremiumUpsell(
    UserSettingsViewState state,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final String text;
    if (state.isOutOfBandTrialActive) {
      final expiryDate = state.premiumOutOfBandTrialEndsAt;
      if (expiryDate != null) {
        final formatted = DateFormat.yMMMd().format(expiryDate);
        text = l10n.premiumTrialExpiresOn(formatted);
      } else {
        text = l10n.premiumTrialActive;
      }
    } else {
      text = l10n.premiumUpsellCustomizeTag;
    }

    return Padding(
      padding: EdgeInsets.only(top: layout.s3),
      child: FluxerPlutoniumUpsell(text: text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userSettingsViewModelProvider);
    final bool hasCustomDiscriminator = ref.watch(
      instanceFeatureEnabledProvider(LimitKeys.featureCustomDiscriminator),
    );
    final bool shouldShowPremiumCommerce = ref.watch(
      shouldShowPremiumCommerceProvider,
    );
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;

    final l10n = FluxerLocalizations.of(context);
    final premiumWarning = _buildPremiumWarningText(
      state,
      l10n,
      shouldShowPremiumCommerce: shouldShowPremiumCommerce,
    );

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _buildDescriptionText(state, l10n),
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
            SizedBox(height: layout.s4),
            Padding(
              padding: EdgeInsets.only(bottom: layout.s2),
              child: Text(
                l10n.fluxerTagInputLabel,
                style: textStyles.bodySmall.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: FluxerInput(
                    controller: _usernameController,
                    hint: 'Marty_McFly',
                    maxLength: _kMaxUsernameLength,
                    autofocus: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: layout.s2,
                    right: layout.s2,
                    top: layout.s3,
                  ),
                  child: Text(
                    '#',
                    style: textStyles.bodyMedium.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ),
                Expanded(
                  child: FluxerInput(
                    controller: _discriminatorController,
                    hint: '0000',
                    maxLength: 4,
                    enabled: hasCustomDiscriminator,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
            SizedBox(height: layout.s3),
            DecoratedBox(
              decoration: BoxDecoration(
                color: colors.backgroundSecondary,
                borderRadius: layout.radiusSm,
                border: Border.all(color: colors.borderColor),
              ),
              child: Padding(
                padding: EdgeInsets.all(layout.s3),
                child: _buildValidationRules(l10n),
              ),
            ),
            if (!hasCustomDiscriminator && shouldShowPremiumCommerce)
              _buildPremiumUpsell(state, layout, l10n),
            if (premiumWarning != null) ...[
              SizedBox(height: layout.s3),
              FluxerWarningAlert(message: premiumWarning),
            ],
            if (_error != null) ...[
              SizedBox(height: layout.s2),
              Text(
                _error!,
                style: textStyles.bodySmall.copyWith(
                  color: colors.accentDanger,
                ),
              ),
            ],
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: _isFormValid && _isDirty && !_isSubmitting
                  ? _submit
                  : null,
              label: l10n.continueAction,
              isLoading: _isSubmitting,
            ),
          ],
        ),
      ),
    );
  }
}

class _ValidationRule extends StatelessWidget {
  const _ValidationRule({required this.label, required this.isValid});

  final String label;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final color = isValid ? colors.accentSuccess : colors.accentDanger;
    final icon = isValid
        ? PhosphorIconsFill.checkCircle
        : PhosphorIconsFill.xCircle;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          PhosphorIcon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: textStyles.bodySmall.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
