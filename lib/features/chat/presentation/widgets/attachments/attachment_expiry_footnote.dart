import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

/// Help article for attachment expiry.
const String attachmentExpiryHelpUrl =
    'https://fluxer.app/help/attachment-expiry';

class AttachmentExpiryFootnote extends StatelessWidget {
  const AttachmentExpiryFootnote({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: FluxerTextLink(
        text: text,
        url: attachmentExpiryHelpUrl,
        color: context.colors.textChatMuted,
        style: context.textStyles.smallText.copyWith(fontSize: 10, height: 1.2),
      ),
    );
  }
}
