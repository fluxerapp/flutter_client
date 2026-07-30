import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/status_change_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserAreaPopout {
  UserAreaPopout._();

  static Future<void> show(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.statusChangeSheetTitle,
      variant: FluxerBottomSheetVariant.menu,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return FluxerBottomSheetContent(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              StatusChangeSheetBody(onClose: close),
              const Divider(height: 1),
              ListTile(
                leading: const PhosphorIcon(PhosphorIconsBold.user, size: 20),
                title: Text(l10n.userSettingsNavProfile),
                onTap: () {
                  close();
                  unawaited(UserSettingsModal.show(context));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
