import 'package:flutter/material.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_invites_content.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class GroupDmInvitesBottomSheet {
  GroupDmInvitesBottomSheet._();

  static Future<void> show(BuildContext context, {required DmConversation dm}) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.channelDetailsGroupInvites,
      useRootNavigator: true,
      minChildSize: 0.45,
      maxChildSize: 0.85,
      initialChildSize: 0.85,
      builder:
          (
            BuildContext sheetContext,
            ScrollController scrollController,
            VoidCallback close,
          ) {
            return GroupDmInvitesContent(
              dm: dm,
              scrollController: scrollController,
            );
          },
    );
  }
}
