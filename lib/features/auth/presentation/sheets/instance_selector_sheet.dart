import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_selector.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Future<void> showInstanceSelectorSheet(BuildContext context) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final ProviderContainer container = ProviderScope.containerOf(context);
  final InstanceSelectorState? committedSelection = container
      .read(instanceSelectorProvider)
      .asData
      ?.value;
  final InstanceConfigSnapshot committedActiveInstance = container.read(
    activeInstanceProvider,
  );
  final bool? connected = await FluxerBottomSheet.show<bool>(
    context,
    title: l10n.instanceSheetTitle,
    builder: (sheetContext, _) => FluxerBottomSheetContent(
      child: InstanceSelectorControl(
        enabled: true,
        compact: true,
        onConnected: () => Navigator.of(sheetContext).pop(true),
      ),
    ),
  );
  if (connected != true && committedSelection != null) {
    container
        .read(instanceSelectorProvider.notifier)
        .restoreCommittedSelection(
          selection: committedSelection,
          activeInstance: committedActiveInstance,
        );
  }
}
