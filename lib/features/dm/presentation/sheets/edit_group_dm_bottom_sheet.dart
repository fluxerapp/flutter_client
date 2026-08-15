import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/edit_group_dm_content.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class EditGroupDmBottomSheet {
  EditGroupDmBottomSheet._();

  static Future<void> show(BuildContext context, {required DmConversation dm}) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.groupDmEditTitle,
      useRootNavigator: true,
      initialChildSize: 0.85,
      builder:
          (
            BuildContext sheetContext,
            ScrollController scrollController,
            VoidCallback close,
          ) {
            return EditGroupDmContent(
              dm: dm,
              onSaved: close,
              scrollController: scrollController,
            );
          },
    );
  }
}
