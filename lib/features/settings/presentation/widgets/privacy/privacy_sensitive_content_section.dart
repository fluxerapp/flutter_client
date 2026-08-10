import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/privacy_dashboard_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class PrivacySensitiveContentSection extends ConsumerWidget {
  const PrivacySensitiveContentSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(privacyDashboardViewModelProvider);
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final vm = ref.read(privacyDashboardViewModelProvider.notifier);

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
      title: l10n.privacyDashboardSensitiveContentSection,
      children: [
        FluxerSettingsSubsection(
          children: [
            FluxerRadioGroup<int>(
              label: l10n.sensitiveContentFriendDmLabel,
              value: state.effectiveFriendDmFilter,
              items: state.isAdult ? adultFilterItems : minorFriendFilterItems,
              onChanged: vm.editFriendDmFilter,
            ),
            Opacity(
              opacity: state.isAdult ? 1 : 0.5,
              child: IgnorePointer(
                ignoring: !state.isAdult,
                child: FluxerRadioGroup<int>(
                  label: l10n.sensitiveContentNonFriendDmLabel,
                  value: state.effectiveNonFriendDmFilter,
                  items: adultFilterItems,
                  onChanged: vm.editNonFriendDmFilter,
                ),
              ),
            ),
            Opacity(
              opacity: state.isAdult ? 1 : 0.5,
              child: IgnorePointer(
                ignoring: !state.isAdult,
                child: FluxerRadioGroup<int>(
                  label: l10n.sensitiveContentGuildLabel,
                  value: state.effectiveGuildFilter,
                  items: guildFilterItems,
                  onChanged: vm.editGuildFilter,
                ),
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
