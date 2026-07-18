import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/phone_verification.dart';
import 'package:fluxer_app/features/auth/providers/phone_verification_view_model.dart';
import 'package:fluxer_app/features/auth/utils/phone_verification_error_l10n.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class PhoneInboundWaitingStep extends ConsumerStatefulWidget {
  const PhoneInboundWaitingStep({
    required this.provider,
    required this.onVerified,
    super.key,
  });

  final PhoneVerificationViewModelProvider provider;
  final VoidCallback onVerified;

  @override
  ConsumerState<PhoneInboundWaitingStep> createState() =>
      _PhoneInboundWaitingStepState();
}

class _PhoneInboundWaitingStepState
    extends ConsumerState<PhoneInboundWaitingStep> {
  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(
      userSettingsViewModelProvider.select(
        (UserSettingsViewState s) => s.hasVerifiedPhone,
      ),
      (bool? previous, bool next) {
        if (next) {
          widget.onVerified();
        }
      },
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final PhoneVerificationViewState state = ref.watch(widget.provider);
    final PhoneVerificationViewModel notifier = ref.read(
      widget.provider.notifier,
    );
    final InboundChallengeState? challenge = state.inboundChallenge;
    final bool isExpensive = challenge?.reason == 'expensive_destination';
    final String description = isExpensive
        ? l10n.phoneInboundExpensiveDescription
        : l10n.phoneInboundDefaultDescription;
    final String? generalError = state.generalError?.resolve(l10n);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          description,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        if (generalError != null) ...[
          SizedBox(height: context.layout.s3),
          Text(
            generalError,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textDanger,
            ),
          ),
        ],
        if (challenge != null) ...[
          SizedBox(height: context.layout.s4),
          _StepRow(index: 1, text: l10n.phoneInboundStepOpenMessaging),
          SizedBox(height: context.layout.s3),
          _StepRow(
            index: 2,
            text: l10n.phoneInboundStepSendCode(
              challenge.challengeCode,
              challenge.ourNumber,
            ),
          ),
          SizedBox(height: context.layout.s3),
          _SelectableValue(
            label: l10n.phoneInboundChallengeCodeLabel,
            value: challenge.challengeCode,
          ),
          SizedBox(height: context.layout.s3),
          _SelectableValue(
            label: l10n.phoneInboundOurNumberLabel,
            value: challenge.ourNumber,
          ),
          SizedBox(height: context.layout.s3),
          _StepRow(index: 3, text: l10n.phoneInboundStepWait),
        ],
        SizedBox(height: context.layout.s4),
        FluxerButton.secondary(
          onPressed: state.isLoading ? null : notifier.refreshInboundChallenge,
          label: l10n.phoneInboundGetNewCode,
          isLoading: state.isLoading,
        ),
      ],
    );
  }
}

class _StepRow extends StatelessWidget {
  const _StepRow({required this.index, required this.text});

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.colors.backgroundSecondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('$index', style: context.textStyles.smallText),
        ),
        SizedBox(width: context.layout.s3),
        Expanded(
          child: Text(
            text,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _SelectableValue extends StatelessWidget {
  const _SelectableValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textStyles.label.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: context.layout.s1),
        SelectableText(
          value,
          style: context.textStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
          onTap: () => Clipboard.setData(ClipboardData(text: value)),
        ),
      ],
    );
  }
}
