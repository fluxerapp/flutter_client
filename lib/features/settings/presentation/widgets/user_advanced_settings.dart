import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/observability/observability_reporting_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class UserAdvancedSettings extends ConsumerWidget {
  const UserAdvancedSettings({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(observabilityReportingProvider.notifier);
    final bool isAvailable = observabilityReportingIsAvailable();
    final bool isEnabled = ref.watch(observabilityReportingProvider);
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            title: l10n.advancedPerformanceReportingTitle,
            description: l10n.advancedPerformanceReportingSectionDescription,
            isFirst: true,
            children: [
              FluxerSettingsSwitchItem(
                label: l10n.advancedPerformanceReportingLabel,
                description: l10n.advancedPerformanceReportingDescription,
                value: isEnabled,
                enabled: isAvailable,
                onChanged: (bool value) => notifier.setEnabled(value: value),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
