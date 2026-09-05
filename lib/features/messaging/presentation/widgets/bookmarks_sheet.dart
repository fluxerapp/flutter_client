import 'package:fluxer_app/features/messaging/presentation/widgets/saved_messages_body.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class BookmarksSheet {
  BookmarksSheet._();

  static Future<void> show(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.showScrollable<void>(
      context,
      title: l10n.quickSwitcherBookmarksLabel,
      useRootNavigator: true,
      minChildSize: 0.5,
      builder:
          (
            BuildContext sheetContext,
            ScrollController scrollController,
            VoidCallback close,
          ) {
            return SavedMessagesBody(
              scrollController: scrollController,
              padding: EdgeInsets.zero,
            );
          },
    );
  }
}
