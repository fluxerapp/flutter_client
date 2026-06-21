import 'package:flutter/material.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_selector.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Future<void> showInstanceSelectorSheet(BuildContext context) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return FluxerBottomSheet.show<void>(
    context,
    title: l10n.instanceSheetTitle,
    builder: (sheetContext, close) => FluxerBottomSheetContent(
      child: InstanceSelectorControl(
        enabled: true,
        compact: true,
        onConnected: close,
      ),
    ),
  );
}
