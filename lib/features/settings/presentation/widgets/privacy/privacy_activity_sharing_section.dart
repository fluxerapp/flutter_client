import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/privacy_dashboard_view_model.dart';
import 'package:fluxer_app/features/settings/utils/privacy_duration_formatting.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class PrivacyActivitySharingSection extends ConsumerStatefulWidget {
  const PrivacyActivitySharingSection({super.key});

  @override
  ConsumerState<PrivacyActivitySharingSection> createState() =>
      _PrivacyActivitySharingSectionState();
}

class _PrivacyActivitySharingSectionState
    extends ConsumerState<PrivacyActivitySharingSection> {
  Timer? _cooldownTimer;

  @override
  void dispose() {
    _cooldownTimer?.cancel();
    super.dispose();
  }

  void _syncCooldownTimer(int? remainingMs) {
    if (remainingMs != null) {
      _cooldownTimer ??= Timer.periodic(const Duration(seconds: 30), (_) {
        if (mounted) {
          setState(() {});
        }
      });
    } else {
      _cooldownTimer?.cancel();
      _cooldownTimer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(privacyDashboardViewModelProvider);
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final remainingMs = state.voiceActivityCooldownRemainingMs;
    _syncCooldownTimer(remainingMs);

    return FluxerSettingsSection(
      title: l10n.privacyDashboardActivitySharingSection,
      children: [
        FluxerSettingsSubsection(
          title: l10n.privacyDashboardVoiceActivityTitle,
          children: [
            FluxerSettingsSwitchGroup(
              children: [
                FluxerSettingsSwitchItem.grouped(
                  label: l10n.privacyDashboardShareVoiceActivity,
                  value: state.defaultShareVoiceActivity,
                  enabled: remainingMs == null,
                  onChanged: (value) => unawaited(_confirmChange(value)),
                ),
              ],
            ),
            if (remainingMs != null) ...[
              SizedBox(height: layout.s2),
              Text(
                l10n.privacyDashboardVoiceActivityCooldown(
                  formatPrivacyCooldown(l10n, remainingMs),
                ),
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textPrimaryMuted,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Future<void> _confirmChange(bool nextValue) async {
    final l10n = FluxerLocalizations.of(context);
    final title = nextValue
        ? l10n.privacyDashboardVoiceActivityEnableTitle
        : l10n.privacyDashboardVoiceActivityDisableTitle;
    final description = nextValue
        ? l10n.privacyDashboardVoiceActivityEnableDesc
        : l10n.privacyDashboardVoiceActivityDisableDesc;
    final confirmLabel = nextValue
        ? l10n.privacyDashboardVoiceActivityEnableConfirm
        : l10n.privacyDashboardVoiceActivityDisableConfirm;

    final confirmed = await FluxerConfirmModal.show(
      context,
      title: title,
      description: description,
      confirmLabel: confirmLabel,
      isDanger: !nextValue,
      onConfirm: () {},
    );
    if (confirmed != true || !mounted) {
      return;
    }

    await ref
        .read(privacyDashboardViewModelProvider.notifier)
        .updateVoiceActivitySharingWithToast(
          value: nextValue,
          successMessage: l10n.privacyDashboardVoiceActivityUpdated,
          failureMessage: l10n.privacyDashboardVoiceActivityUpdateFailed,
        );
  }
}
