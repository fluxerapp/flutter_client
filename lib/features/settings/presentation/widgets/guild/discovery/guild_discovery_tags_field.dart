import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_tag_validation.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_tag_chip.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildDiscoveryTagsField extends StatelessWidget {
  const GuildDiscoveryTagsField({
    required this.tagInputController,
    required this.customTags,
    required this.disabled,
    required this.onTagsChanged,
    super.key,
  });

  final TextEditingController tagInputController;
  final List<String> customTags;
  final bool disabled;
  final ValueChanged<List<String>> onTagsChanged;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool tagInputDisabled =
        disabled || customTags.length >= DiscoveryConstants.maxTags;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (customTags.isNotEmpty)
          Wrap(
            spacing: context.layout.s2,
            runSpacing: context.layout.s2,
            children: customTags
                .map(
                  (String tag) => GuildDiscoveryTagChip(
                    tag: tag,
                    onRemove: disabled ? null : () => _removeTag(tag),
                    removeLabel: l10n.guildSettingsDiscoveryRemoveTag(tag),
                  ),
                )
                .toList(),
          ),
        if (customTags.isNotEmpty) SizedBox(height: context.layout.s2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: FluxerInput(
                controller: tagInputController,
                hint: l10n.guildSettingsDiscoveryTagsHint,
                enabled: !tagInputDisabled,
                maxLength: DiscoveryConstants.tagMaxLength,
                onSubmitted: (_) => _addTag(context, l10n),
              ),
            ),
            SizedBox(width: context.layout.s2),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: tagInputController,
              builder: (BuildContext context, TextEditingValue value, _) {
                return FluxerButton.secondary(
                  label: l10n.guildSettingsDiscoveryAddTag,
                  size: FluxerButtonSize.small,
                  fitContent: true,
                  onPressed: tagInputDisabled || value.text.trim().isEmpty
                      ? null
                      : () => _addTag(context, l10n),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  void _removeTag(String tag) {
    onTagsChanged(customTags.where((String value) => value != tag).toList());
  }

  Future<void> _addTag(BuildContext context, FluxerLocalizations l10n) async {
    final String normalized = normalizeDiscoveryTag(tagInputController.text);
    if (normalized.isEmpty) {
      return;
    }
    if (!isValidDiscoveryTag(normalized)) {
      await _showTagError(
        context,
        l10n,
        l10n.guildSettingsDiscoveryTagRequirements(
          DiscoveryConstants.tagMaxLength,
        ),
      );
      return;
    }
    if (customTags.contains(normalized)) {
      tagInputController.clear();
      return;
    }
    if (customTags.length >= DiscoveryConstants.maxTags) {
      await _showTagError(
        context,
        l10n,
        l10n.guildSettingsDiscoveryTagLimit(DiscoveryConstants.maxTags),
      );
      return;
    }
    onTagsChanged(<String>[...customTags, normalized]);
    tagInputController.clear();
  }

  Future<void> _showTagError(
    BuildContext context,
    FluxerLocalizations l10n,
    String message,
  ) async {
    await FluxerModal.show<void>(
      context,
      title: l10n.guildSettingsDiscoveryTagErrorTitle,
      centered: true,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return Text(
          message,
          style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
        );
      },
    );
  }
}
