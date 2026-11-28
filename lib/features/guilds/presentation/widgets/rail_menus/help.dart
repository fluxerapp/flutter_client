import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/providers/preferences/synced_extras_preferences_provider.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

Future<void> showHelpButtonMenu(
  BuildContext context,
  WidgetRef ref, {
  required Offset position,
}) {
  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback close) => <Widget>[
      FluxerMenuItem(
        label: FluxerLocalizations.of(menuContext).railMenuHideHelpButton,
        icon: PhosphorIconsFill.eyeSlash,
        onPressed: () {
          close();
          unawaited(
            ref
                .read(syncedExtrasPreferencesProvider.notifier)
                .setHideHelpButton(value: true),
          );
        },
      ),
    ],
  );
}
