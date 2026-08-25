import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/ban_view.dart';
import 'package:fluxer_app/features/auth/providers/ban_view_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SuspendedAccountScreen extends ConsumerStatefulWidget {
  const SuspendedAccountScreen({required this.onBack, super.key});

  final VoidCallback onBack;

  @override
  ConsumerState<SuspendedAccountScreen> createState() =>
      _SuspendedAccountScreenState();
}

class _SuspendedAccountScreenState
    extends ConsumerState<SuspendedAccountScreen> {
  final _appealController = TextEditingController();

  static const _appealMinLength = 50;
  static const _appealMaxLength = 2000;

  @override
  void dispose() {
    _appealController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final banViewState = ref.watch(banViewProvider);

    if (banViewState == null) {
      return const SizedBox.shrink();
    }

    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final status = banViewState.status;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(PhosphorIconsFill.warning, size: 48, color: colors.statusDanger),
        SizedBox(height: layout.s4),
        Text(
          status?.isPermanent ?? false
              ? l10n.suspendedPermanentTitle
              : l10n.suspendedTemporaryTitle,
          style: textStyles.heading.copyWith(color: colors.textPrimary),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: layout.s2),
        Text(
          status?.isPermanent ?? false
              ? l10n.suspendedPermanentDescription
              : l10n.suspendedTemporaryDescription,
          style: textStyles.bodySmall.copyWith(color: colors.textPrimaryMuted),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: layout.s5),

        if (banViewState.isLoading && status == null)
          const Center(child: FluxerLoadingSpinner())
        else if (status != null) ...[
          _BanInfoCard(status: status),
          SizedBox(height: layout.s4),

          // Deletion warning
          if (status.deletionScheduledAt != null) ...[
            _WarningBanner(
              message: l10n.suspendedDeletionWarning(
                _formatDate(status.deletionScheduledAt!),
              ),
            ),
            SizedBox(height: layout.s4),
          ],

          // Error message
          if (banViewState.error != null) ...[
            _ErrorBanner(message: banViewState.error!),
            SizedBox(height: layout.s4),
          ],

          // Appeal section
          if (status.isAppealAccepted)
            _AppealAcceptedSection(onSignIn: widget.onBack)
          else ...[
            if (status.appeal != null)
              _AppealStatusSection(appeal: status.appeal!)
            else if (status.canSubmitAppeal)
              _AppealForm(
                controller: _appealController,
                isSubmitting: banViewState.isSubmittingAppeal,
                onSubmit: () {
                  final text = _appealController.text.trim();
                  if (text.length >= _appealMinLength &&
                      text.length <= _appealMaxLength) {
                    unawaited(
                      ref.read(banViewProvider.notifier).submitAppeal(text),
                    );
                  }
                },
              ),

            SizedBox(height: layout.s4),

            // Actions
            FluxerButton.secondary(
              onPressed: banViewState.recheckCooldown > 0
                  ? null
                  : () => ref.read(banViewProvider.notifier).recheck(),
              label: banViewState.recheckCooldown > 0
                  ? l10n.suspendedRecheckCooldown(banViewState.recheckCooldown)
                  : l10n.suspendedRecheck,
              icon: PhosphorIconsBold.arrowsClockwise,
              isLoading: banViewState.isLoading,
            ),
            SizedBox(height: layout.s2),
            FluxerButton.ghost(
              onPressed: widget.onBack,
              label: l10n.suspendedBackToLogin,
            ),
          ],
        ],
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

// ---------------------------------------------------------------------------
// Ban info card
// ---------------------------------------------------------------------------

class _BanInfoCard extends StatelessWidget {
  const _BanInfoCard({required this.status});

  final BanStatus status;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return Container(
      padding: EdgeInsets.all(layout.s4),
      decoration: BoxDecoration(
        color: colors.backgroundTertiary,
        borderRadius: layout.radiusMd,
        border: Border.all(color: colors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(
            label: l10n.suspendedIssuedAt,
            value: _formatDate(status.bannedAt),
          ),
          if (!status.isPermanent && status.bannedUntil != null) ...[
            SizedBox(height: layout.s2),
            _InfoRow(
              label: l10n.suspendedEndsAt,
              value: _formatDate(status.bannedUntil!),
            ),
          ],
          if (status.isPermanent) ...[
            SizedBox(height: layout.s2),
            _InfoRow(
              label: l10n.suspendedDuration,
              value: l10n.suspendedPermanent,
            ),
          ],
          if (status.appealDeadline != null) ...[
            SizedBox(height: layout.s2),
            _InfoRow(
              label: l10n.suspendedAppealDeadline,
              value: _formatDate(status.appealDeadline!),
            ),
          ],
          if (status.publicReason != null) ...[
            SizedBox(height: layout.s3),
            Text(
              l10n.suspendedReason,
              style: textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
            SizedBox(height: layout.s1),
            Text(
              status.publicReason!,
              style: textStyles.bodyMedium.copyWith(color: colors.textPrimary),
            ),
          ],
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}

// ---------------------------------------------------------------------------
// Info row
// ---------------------------------------------------------------------------

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textStyles.bodySmall.copyWith(color: colors.textPrimaryMuted),
        ),
        Text(
          value,
          style: textStyles.bodyMedium.copyWith(color: colors.textPrimary),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Appeal form
// ---------------------------------------------------------------------------

class _AppealForm extends StatelessWidget {
  const _AppealForm({
    required this.controller,
    required this.isSubmitting,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final bool isSubmitting;
  final VoidCallback onSubmit;

  static const _minLength = 50;
  static const _maxLength = 2000;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.suspendedAppealTitle,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: layout.s2),
        FluxerInput(
          controller: controller,
          hint: l10n.suspendedAppealHint,
          maxLines: 5,
          maxLength: _maxLength,
        ),
        SizedBox(height: layout.s2),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (context, value, _) {
            final length = value.text.trim().length;
            final isValid = length >= _minLength && length <= _maxLength;

            return FluxerButton.primary(
              onPressed: isValid && !isSubmitting ? onSubmit : null,
              label: l10n.suspendedAppealSubmit,
              isLoading: isSubmitting,
            );
          },
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Appeal status display
// ---------------------------------------------------------------------------

class _AppealStatusSection extends StatelessWidget {
  const _AppealStatusSection({required this.appeal});

  final BanAppeal appeal;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    final statusColor = switch (appeal.status) {
      BanAppealStatus.pending => colors.statusWarning,
      BanAppealStatus.accepted => colors.textPositive,
      BanAppealStatus.rejected => colors.statusDanger,
    };

    final statusLabel = switch (appeal.status) {
      BanAppealStatus.pending => l10n.suspendedAppealPending,
      BanAppealStatus.accepted => l10n.suspendedAppealAccepted,
      BanAppealStatus.rejected => l10n.suspendedAppealRejected,
    };

    return Container(
      padding: EdgeInsets.all(layout.s4),
      decoration: BoxDecoration(
        color: colors.backgroundTertiary,
        borderRadius: layout.radiusMd,
        border: Border.all(color: colors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.suspendedAppealTitle,
                style: textStyles.bodyMedium.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: layout.s2,
                  vertical: layout.s1,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.15),
                  borderRadius: layout.radiusSm,
                ),
                child: Text(
                  statusLabel,
                  style: textStyles.bodySmall.copyWith(
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: layout.s3),
          Text(
            appeal.appealRationale,
            style: textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
          if (appeal.status == BanAppealStatus.rejected &&
              appeal.adminRationale != null) ...[
            SizedBox(height: layout.s3),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(layout.s3),
              decoration: BoxDecoration(
                color: colors.statusDanger.withValues(alpha: 0.1),
                borderRadius: layout.radiusSm,
                border: Border.all(
                  color: colors.statusDanger.withValues(alpha: 0.3),
                ),
              ),
              child: Text(
                appeal.adminRationale!,
                style: textStyles.bodySmall.copyWith(color: colors.textPrimary),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Appeal accepted section
// ---------------------------------------------------------------------------

class _AppealAcceptedSection extends StatelessWidget {
  const _AppealAcceptedSection({required this.onSignIn});

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(layout.s4),
          decoration: BoxDecoration(
            color: colors.textPositive.withValues(alpha: 0.1),
            borderRadius: layout.radiusMd,
            border: Border.all(
              color: colors.textPositive.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            children: [
              Icon(
                PhosphorIconsFill.checkCircle,
                size: 32,
                color: colors.textPositive,
              ),
              SizedBox(height: layout.s2),
              Text(
                l10n.suspendedAppealAccepted,
                style: textStyles.bodyMedium.copyWith(
                  color: colors.textPositive,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: layout.s1),
              Text(
                l10n.suspendedAppealAcceptedDescription,
                style: textStyles.bodySmall.copyWith(
                  color: colors.textPrimaryMuted,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(height: layout.s4),
        FluxerButton.primary(onPressed: onSignIn, label: l10n.suspendedSignIn),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Banners
// ---------------------------------------------------------------------------

class _WarningBanner extends StatelessWidget {
  const _WarningBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(layout.s3),
      decoration: BoxDecoration(
        color: colors.statusDanger.withValues(alpha: 0.1),
        borderRadius: layout.radiusSm,
        border: Border.all(color: colors.statusDanger.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(PhosphorIconsFill.warning, size: 18, color: colors.statusDanger),
          SizedBox(width: layout.s2),
          Expanded(
            child: Text(
              message,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.statusDanger,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(layout.s3),
      decoration: BoxDecoration(
        color: colors.statusDanger.withValues(alpha: 0.1),
        borderRadius: layout.radiusSm,
        border: Border.all(color: colors.statusDanger.withValues(alpha: 0.3)),
      ),
      child: Text(
        message,
        style: context.textStyles.bodySmall.copyWith(
          color: colors.statusDanger,
        ),
      ),
    );
  }
}
