import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/preferences/interface_extras_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

class InterfaceExtraSwitch extends ConsumerWidget {
  const InterfaceExtraSwitch({
    required this.flag,
    required this.label,
    this.description,
    this.invert = false,
    super.key,
  });

  final InterfaceExtraFlag flag;
  final String label;
  final String? description;
  final bool invert;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool stored = ref.watch(
      interfaceExtrasPreferencesProvider.select(
        (InterfaceExtrasState state) => state[flag],
      ),
    );
    return FluxerSettingsSwitchItem(
      label: label,
      description: description,
      value: invert ? !stored : stored,
      onChanged: (bool value) => unawaited(
        ref
            .read(interfaceExtrasPreferencesProvider.notifier)
            .set(flag, value: invert ? !value : value),
      ),
    );
  }
}
