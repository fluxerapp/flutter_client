import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/guilds/domain/add_guild_entry_view.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_modal.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

Future<void> showAddGuildButtonMenu(
  BuildContext context,
  WidgetRef ref, {
  required Offset position,
}) {
  void open(AddGuildEntryView view, VoidCallback close) {
    close();
    if (context.mounted) {
      unawaited(showAddGuildModal(context, ref, initialView: view));
    }
  }

  return FluxerActionMenu.show(
    context,
    position: position,
    builder: (BuildContext menuContext, VoidCallback close) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(menuContext);
      return <Widget>[
        FluxerMenuItem(
          label: l10n.addGuildCreateCommunity,
          icon: PhosphorIconsFill.house,
          onPressed: () => open(AddGuildEntryView.create, close),
        ),
        FluxerMenuItem(
          label: l10n.addGuildJoinCommunity,
          icon: PhosphorIconsBold.link,
          onPressed: () => open(AddGuildEntryView.join, close),
        ),
      ];
    },
  );
}
