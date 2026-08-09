import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

enum HideMutedChannelsChoice { applyAll, newOnly }

Future<HideMutedChannelsChoice?> showHideMutedChannelsConfirmSheet(
  BuildContext context, {
  required bool value,
}) {
  final l10n = FluxerLocalizations.of(context);
  final title = value
      ? l10n.messagesMediaDefaultHideMutedChannelsEnableTitle
      : l10n.messagesMediaDefaultHideMutedChannelsDisableTitle;
  final description = value
      ? l10n.messagesMediaDefaultHideMutedChannelsEnableDescription
      : l10n.messagesMediaDefaultHideMutedChannelsDisableDescription;
  final primaryLabel = value
      ? l10n.messagesMediaDefaultHideMutedChannelsApplyAllAction
      : l10n.messagesMediaDefaultHideMutedChannelsShowAllAction;

  return FluxerBottomSheet.show<HideMutedChannelsChoice>(
    context,
    useRootNavigator: true,
    title: title,
    builder: (sheetContext, close) {
      final layout = sheetContext.layout;
      final colors = sheetContext.colors;

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: layout.s4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              description,
              style: sheetContext.textStyles.bodySmall.copyWith(
                color: colors.textSecondary,
                height: 1.4,
              ),
            ),
            SizedBox(height: layout.s5),
            FluxerButton.primary(
              onPressed: () => Navigator.of(
                sheetContext,
              ).pop(HideMutedChannelsChoice.applyAll),
              label: primaryLabel,
            ),
            SizedBox(height: layout.s2),
            FluxerButton.secondary(
              onPressed: () => Navigator.of(
                sheetContext,
              ).pop(HideMutedChannelsChoice.newOnly),
              label: l10n.messagesMediaDefaultHideMutedChannelsNewOnlyAction,
            ),
          ],
        ),
      );
    },
  );
}
