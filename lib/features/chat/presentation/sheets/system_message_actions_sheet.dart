import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/delete_message_confirm_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showSystemMessageActionsSheet(
  BuildContext context,
  WidgetRef ref, {
  required Message message,
  required String? guildId,
  required bool canDelete,
}) async {
  if (!canDelete) {
    return;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String? action = await FluxerBottomSheet.show<String>(
    context,
    title: l10n.chatMessageDelete,
    variant: FluxerBottomSheetVariant.menu,
    builder: (sheetContext, _) {
      void pop(String value) {
        Navigator.of(sheetContext).pop(value);
      }

      return FluxerBottomSheetContent(
        child: FluxerMenuGroup(
          children: [
            FluxerBottomSheetMenuItem(
              label: l10n.chatMessageDelete,
              icon: PhosphorIconsRegular.trash,
              isDanger: true,
              onTap: () => pop('delete'),
            ),
          ],
        ),
      );
    },
  );
  if (action != 'delete' || !context.mounted) {
    return;
  }
  unawaited(
    showDeleteMessageConfirmSheet(
      context,
      ref,
      message: message,
      guildId: guildId,
    ),
  );
}
