import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/privacy/privacy_age_range_unlock.dart';
import 'package:fluxer_app/features/settings/providers/view_models/privacy_dashboard_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class PrivacySensitiveContentSection extends ConsumerWidget {
  const PrivacySensitiveContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      privacyDashboardViewModelProvider(watchAccountUserId(ref)),
    );
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final vm = ref.read(
      privacyDashboardViewModelProvider(readAccountUserId(ref)).notifier,
    );
    final SensitiveContentState sensitive = ref.watch(sensitiveContentProvider);
    final bool showLocked = sensitive.showLocked;
    final bool adultDmChoices = state.isAdult && !showLocked;
    final bool guildEditable = state.isAdult && !showLocked;

    final adultFilterItems = <FluxerRadioItem<int>>[
      FluxerRadioItem(value: 0, label: l10n.sensitiveContentFilterShow),
      FluxerRadioItem(value: 1, label: l10n.sensitiveContentFilterBlur),
      FluxerRadioItem(value: 2, label: l10n.sensitiveContentFilterBlock),
    ];
    final minorFriendFilterItems = <FluxerRadioItem<int>>[
      FluxerRadioItem(value: 1, label: l10n.sensitiveContentFilterBlur),
      FluxerRadioItem(value: 2, label: l10n.sensitiveContentFilterBlock),
    ];
    final guildFilterItems = <FluxerRadioItem<int>>[
      FluxerRadioItem(value: 0, label: l10n.sensitiveContentFilterShow),
      FluxerRadioItem(value: 1, label: l10n.sensitiveContentFilterBlur),
    ];

    return FluxerSettingsSection(
      sectionId: 'sensitive-content',
      title: l10n.privacyDashboardSensitiveContentSection,
      children: [
        FluxerSettingsSubsection(
          children: [
            FluxerRadioGroup<int>(
              label: l10n.sensitiveContentFriendDmLabel,
              value: state.effectiveFriendDmFilter,
              items: adultDmChoices ? adultFilterItems : minorFriendFilterItems,
              onChanged: vm.editFriendDmFilter,
            ),
            Opacity(
              opacity: state.isAdult ? 1 : 0.5,
              child: IgnorePointer(
                ignoring: !state.isAdult,
                child: FluxerRadioGroup<int>(
                  label: l10n.sensitiveContentNonFriendDmLabel,
                  value: state.effectiveNonFriendDmFilter,
                  items: adultDmChoices
                      ? adultFilterItems
                      : minorFriendFilterItems,
                  onChanged: vm.editNonFriendDmFilter,
                ),
              ),
            ),
            Opacity(
              opacity: guildEditable ? 1 : 0.5,
              child: IgnorePointer(
                ignoring: !guildEditable,
                child: FluxerRadioGroup<int>(
                  label: l10n.sensitiveContentGuildLabel,
                  value: state.effectiveGuildFilter,
                  items: guildFilterItems,
                  onChanged: vm.editGuildFilter,
                ),
              ),
            ),
            const PrivacyAgeRangeUnlock(),
            if (sensitive.access == MatureAccess.appLocked)
              Text(
                l10n.sensitiveContentAppLockedHint,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
            if (state.isSensitiveContentDirty)
              Row(
                children: [
                  Expanded(
                    child: FluxerButton.secondary(
                      label: l10n.sensitiveContentResetButton,
                      onPressed: vm.resetSensitiveContent,
                    ),
                  ),
                  SizedBox(width: layout.s2),
                  Expanded(
                    child: FluxerButton.primary(
                      label: l10n.sensitiveContentSaveButton,
                      isLoading: state.isSavingSensitiveContent,
                      onPressedAsync: () => vm.saveSensitiveContent(
                        failureMessage:
                            l10n.privacyDashboardSensitiveContentSaveFailed,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
