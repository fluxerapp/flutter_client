import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/data/message_repository.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/context_menu/remove_reactions_submenu.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_providers.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> showRemoveReactionsSheet(
  BuildContext context,
  WidgetRef ref, {
  required Message message,
}) {
  final MessageRepository repository = ref.read(messageRepositoryProvider);
  final List<Reaction> reactions = <Reaction>[
    for (final Reaction reaction in message.reactions)
      if (reaction.count > 0) reaction,
  ];
  if (reactions.isEmpty) {
    return Future<void>.value();
  }
  return FluxerBottomSheet.show<void>(
    context,
    title: FluxerLocalizations.of(context).chatMessageRemoveReactions,
    variant: FluxerBottomSheetVariant.menu,
    builder: (BuildContext sheetContext, _) {
      final MaterialLocalizations material = MaterialLocalizations.of(
        sheetContext,
      );
      return FluxerBottomSheetContent(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            for (final Reaction reaction in reactions)
              FluxerBottomSheetMenuItem(
                leading: ReactionEmojiGlyph(reaction: reaction, size: 24),
                label: reactionShortcode(reaction),
                hint: material.formatDecimal(reaction.count),
                isDanger: true,
                onTap: () {
                  Navigator.of(sheetContext).pop();
                  unawaited(
                    removeAllReactionsForEmoji(
                      repository: repository,
                      message: message,
                      reaction: reaction,
                    ),
                  );
                },
              ),
          ],
        ),
      );
    },
  );
}
