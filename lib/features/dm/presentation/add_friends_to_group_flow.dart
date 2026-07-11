import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/modals/add_friends_to_group_modal.dart';
import 'package:fluxer_app/features/dm/presentation/sheets/add_friends_to_group_bottom_sheet.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

class AddFriendsToGroupFlow {
  AddFriendsToGroupFlow._();

  static Future<void> show(
    BuildContext context,
    WidgetRef ref, {
    required DmConversation dm,
  }) {
    if (isMobileLayout(context)) {
      return AddFriendsToGroupBottomSheet.show(context, ref, dm: dm);
    }
    return AddFriendsToGroupModal.show(context, ref, dm: dm);
  }
}
