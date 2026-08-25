import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/modals/group_dm_invites_modal.dart';
import 'package:fluxer_app/features/dm/presentation/sheets/group_dm_invites_bottom_sheet.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';

class GroupDmInvitesFlow {
  GroupDmInvitesFlow._();

  static Future<void> show(BuildContext context, {required DmConversation dm}) {
    if (isMobileLayout(context)) {
      return GroupDmInvitesBottomSheet.show(context, dm: dm);
    }
    return GroupDmInvitesModal.show(context, dm: dm);
  }
}
