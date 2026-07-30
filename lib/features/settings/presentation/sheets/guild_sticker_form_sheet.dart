import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/guild/expressions/guild_sticker_settings_entry.dart';
import 'package:fluxer_app/features/settings/utils/guild_expression_name_validation.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const int kGuildStickerTagLimit = 10;

Future<({String name, String description, List<String> tags})?>
showGuildStickerFormSheet({
  required BuildContext context,
  required String title,
  required String submitLabel,
  GuildStickerSettingsEntry? initial,
  Uint8List? previewBytes,
}) {
  return FluxerBottomSheet.show<
    ({String name, String description, List<String> tags})?
  >(
    context,
    title: title,
    builder: (BuildContext sheetContext, VoidCallback close) {
      return _GuildStickerFormSheet(initial: initial, submitLabel: submitLabel);
    },
  );
}

class _GuildStickerFormSheet extends ConsumerStatefulWidget {
  const _GuildStickerFormSheet({
    required this.initial,
    required this.submitLabel,
  });

  final GuildStickerSettingsEntry? initial;
  final String submitLabel;

  @override
  ConsumerState<_GuildStickerFormSheet> createState() =>
      _GuildStickerFormSheetState();
}

class _GuildStickerFormSheetState
    extends ConsumerState<_GuildStickerFormSheet> {
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _tagController;
  late List<String> _tags;
  String? _error;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initial?.name ?? '');
    _descriptionController = TextEditingController(
      text: widget.initial?.description ?? '',
    );
    _tagController = TextEditingController();
    _tags = List<String>.from(widget.initial?.tags ?? const <String>[]);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _tagController.dispose();
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
            label: l10n.guildSettingsStickerNameLabel,
            hint: l10n.guildSettingsStickerNameHint,
          ),
          SizedBox(height: context.layout.s3),
          FluxerInput(
            controller: _descriptionController,
            label: l10n.guildSettingsStickerDescriptionLabel,
            hint: l10n.guildSettingsStickerDescriptionHint,
            maxLines: 3,
          ),
          SizedBox(height: context.layout.s3),
          Text(
            l10n.guildSettingsStickerTagsLabel(
              _tags.length,
              kGuildStickerTagLimit,
            ),
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
          SizedBox(height: context.layout.s2),
          Row(
            children: <Widget>[
              Expanded(
                child: FluxerInput(
                  controller: _tagController,
                  hint: l10n.guildSettingsStickerTagHint,
                ),
              ),
              SizedBox(width: context.layout.s2),
              FluxerButton.secondary(
                label: l10n.guildSettingsStickerTagAdd,
                onPressed: _addTag,
              ),
            ],
          ),
          if (_tags.isNotEmpty) ...<Widget>[
            SizedBox(height: context.layout.s2),
            Wrap(
              spacing: context.layout.s2,
              runSpacing: context.layout.s2,
              children: _tags
                  .map(
                    (String tag) => InputChip(
                      label: Text(tag),
                      onDeleted: () => setState(() => _tags.remove(tag)),
                    ),
                  )
                  .toList(growable: false),
            ),
          ],
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
          FluxerButton.primary(label: widget.submitLabel, onPressed: _submit),
        ],
      ),
    );
  }

  void _addTag() {
    final String tag = _tagController.text.trim();
    if (tag.isEmpty || _tags.length >= kGuildStickerTagLimit) {
      return;
    }
    setState(() {
      _tags.add(tag);
      _tagController.clear();
    });
  }

  void _submit() {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String name = _nameController.text.trim();
    final String description = _descriptionController.text.trim();
    final GuildExpressionNameValidationError? nameError =
        validateGuildStickerName(name);
    if (nameError == GuildExpressionNameValidationError.tooShort &&
        name.isEmpty) {
      setState(() => _error = l10n.guildSettingsStickerNameRequired);
      return;
    }
    if (nameError == GuildExpressionNameValidationError.tooShort) {
      setState(() => _error = l10n.guildSettingsStickerNameTooShort);
      return;
    }
    if (nameError == GuildExpressionNameValidationError.tooLong) {
      setState(() => _error = l10n.guildSettingsStickerNameTooLong);
      return;
    }
    if (validateGuildStickerDescription(description) != null) {
      setState(() => _error = l10n.guildSettingsStickerDescriptionTooLong);
      return;
    }
    Navigator.of(context).pop((
      name: name,
      description: description,
      tags: List<String>.from(_tags),
    ));
  }
}
