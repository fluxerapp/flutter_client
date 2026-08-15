import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/modals/edit_group_dm_modal.dart';
import 'package:fluxer_app/features/dm/presentation/sheets/edit_group_dm_bottom_sheet.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:material_ui/material_ui.dart';

class EditGroupDmFlow {
  EditGroupDmFlow._();

  static Future<void> show(BuildContext context, {required DmConversation dm}) {
    if (isMobileLayout(context)) {
      return EditGroupDmBottomSheet.show(context, dm: dm);
    }
    return EditGroupDmModal.show(context, dm: dm);
  }
}
