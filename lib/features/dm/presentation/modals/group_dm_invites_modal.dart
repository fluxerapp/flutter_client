import 'package:flutter/material.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_invites_content.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class GroupDmInvitesModal {
  GroupDmInvitesModal._();

  static Future<void> show(BuildContext context, {required DmConversation dm}) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerModal.show<void>(
      context,
      title: l10n.channelDetailsGroupInvites,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return SizedBox(height: 360, child: GroupDmInvitesContent(dm: dm));
      },
    );
  }
}
