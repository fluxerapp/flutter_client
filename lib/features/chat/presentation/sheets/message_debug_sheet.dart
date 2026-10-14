import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/debug_bottom_sheet.dart';

Future<void> showMessageDebugSheet(
  BuildContext context, {
  required Message message,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  return showDebugBottomSheet(
    context,
    title: l10n.chatMessageDebugSheetTitle,
    data: message.toJson(),
    copiedMessage: l10n.chatMessageDebugJsonCopiedToast,
  );
}
