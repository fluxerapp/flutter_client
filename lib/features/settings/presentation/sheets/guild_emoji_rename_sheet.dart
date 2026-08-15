import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_name_validation.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

Future<String?> showGuildEmojiRenameSheet({
  required BuildContext context,
  required String initialName,
}) {
  return FluxerBottomSheet.show<String>(
    context,
    title: FluxerLocalizations.of(context).guildSettingsEmojiRenameTitle,
    builder: (BuildContext sheetContext, _) {
      return _GuildEmojiRenameSheet(initialName: initialName);
    },
  );
}

class _GuildEmojiRenameSheet extends StatefulWidget {
  const _GuildEmojiRenameSheet({required this.initialName});

  final String initialName;

  @override
  State<_GuildEmojiRenameSheet> createState() => _GuildEmojiRenameSheetState();
}

class _GuildEmojiRenameSheetState extends State<_GuildEmojiRenameSheet> {
  late final TextEditingController _nameController;
  String? _error;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.all(context.layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FluxerInput(
            controller: _nameController,
            hint: l10n.guildSettingsEmojiRenameHint,
            autofocus: true,
          ),
          if (_error != null) ...<Widget>[
            SizedBox(height: context.layout.s2),
            Text(
              _error!,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textDanger,
              ),
            ),
          ],
          SizedBox(height: context.layout.s4),
          FluxerButton.primary(label: l10n.save, onPressed: _submit),
        ],
      ),
    );
  }

  void _submit() {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String name = _nameController.text.trim();
    final GuildExpressionNameValidationError? validation =
        validateGuildEmojiName(name);
    if (validation == GuildExpressionNameValidationError.tooShort) {
      setState(() => _error = l10n.guildSettingsEmojiNameTooShort);
      return;
    }
    if (validation == GuildExpressionNameValidationError.tooLong) {
      setState(() => _error = l10n.guildSettingsEmojiNameTooLong);
      return;
    }
    if (validation == GuildExpressionNameValidationError.invalidCharacters) {
      setState(() => _error = l10n.guildSettingsEmojiInvalidNameTitle);
      return;
    }
    Navigator.of(context).pop(name);
  }
}
