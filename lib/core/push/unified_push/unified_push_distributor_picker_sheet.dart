import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/push/push_delivery_display.dart';
import 'package:fluxer_app/core/push/services/unified_push_service.dart';
import 'package:fluxer_app/core/push/unified_push/unified_push_functions.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/push_delivery_details_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showUnifiedPushDistributorPickerSheet(
  BuildContext context, {
  required WidgetRef ref,
  required List<String> distributors,
  required String? currentDistributor,
}) async {
  if (distributors.length < 2 || !context.mounted) {
    return;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final FluxerUnifiedPushFunctions functions = FluxerUnifiedPushFunctions();
  String? selected = currentDistributor;
  if (selected == null || !distributors.contains(selected)) {
    selected = distributors.first;
  }

  await FluxerBottomSheet.show<void>(
    context,
    useRootNavigator: true,
    title: l10n.notificationsPushDeliveryDistributorSheetTitle,
    builder: (sheetContext, close) {
      return FluxerRadioGroup<String>(
        value: selected,
        onChanged: (String value) async {
          if (value == currentDistributor) {
            close();
            return;
          }
          await functions.saveDistributor(value);
          for (final String instance
              in UnifiedPushService.instance.distributorInstances) {
            await functions.registerApp(instance);
          }
          ref.invalidate(pushDeliveryDetailsProvider);
          if (sheetContext.mounted) {
            close();
          }
        },
        items: distributors
            .map(
              (String id) => FluxerRadioItem<String>(
                value: id,
                label: formatUnifiedPushDistributor(id),
                leading: PhosphorIcon(
                  PhosphorIconsFill.plugs,
                  size: 20,
                  color: sheetContext.colors.textSecondary,
                ),
              ),
            )
            .toList(),
      );
    },
  );
}
