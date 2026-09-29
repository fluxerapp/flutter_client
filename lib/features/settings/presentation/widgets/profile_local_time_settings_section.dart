import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/profile_local_time_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_section.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ProfileLocalTimeSettingsSection extends ConsumerWidget {
  const ProfileLocalTimeSettingsSection({required this.disabled, super.key});

  final bool disabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String productName = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.productName),
    );

    return FluxerSettingsSection(
      title: l10n.profileLocalTimeSettingsTitle,
      description: l10n.profileLocalTimeSettingsSummary(productName),
      children: <Widget>[
        FluxerButton.secondary(
          label: l10n.profileLocalTimeEditButton,
          size: FluxerButtonSize.small,
          fitContent: true,
          onPressed: disabled
              ? null
              : () {
                  unawaited(
                    ProfileLocalTimeSheet.show(context, disabled: disabled),
                  );
                },
        ),
      ],
    );
  }
}
