import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/inline_edit/edit_footer_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class InlineEditFooter extends StatelessWidget {
  const InlineEditFooter({
    required this.onCancel,
    required this.onSave,
    super.key,
  });

  static const String _kActionSlot = '\u0000';
  static const double _kPaddingY = 8;
  static const double _kSeparatorSize = 4;
  static const double _kSeparatorGap = 4;

  final VoidCallback onCancel;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _kPaddingY),
      child: DefaultTextStyle(
        style: context.textStyles.smallText.copyWith(
          color: context.colors.textChat,
          fontWeight: FontWeight.w400,
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            ..._hint(
              template: l10n.chatInlineEditEscapeHint(_kActionSlot),
              link: InlineEditFooterLink(
                label: l10n.chatInlineEditCancelAction,
                onPressed: onCancel,
              ),
            ),
            Container(
              width: _kSeparatorSize,
              height: _kSeparatorSize,
              margin: const EdgeInsets.symmetric(horizontal: _kSeparatorGap),
              decoration: BoxDecoration(
                color: context.colors.textChatMuted,
                shape: BoxShape.circle,
              ),
            ),
            ..._hint(
              template: l10n.chatInlineEditEnterHint(_kActionSlot),
              link: InlineEditFooterLink(
                label: l10n.chatInlineEditSaveAction,
                onPressed: onSave,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _hint({required String template, required Widget link}) {
    final List<String> parts = template.split(_kActionSlot);
    return <Widget>[
      if (parts.first.isNotEmpty) Text(parts.first),
      link,
      if (parts.length > 1 && parts[1].isNotEmpty) Text(parts[1]),
    ];
  }
}
