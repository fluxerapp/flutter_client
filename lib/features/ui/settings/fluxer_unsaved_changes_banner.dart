import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_entry.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerUnsavedChangesBanner extends StatelessWidget {
  const FluxerUnsavedChangesBanner({
    required this.entry,
    required this.flashing,
    super.key,
  });

  final FluxerUnsavedChangesEntry entry;
  final bool flashing;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            entry.label ?? l10n.uiUnsavedChangesCareful,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.textStyles.bodyMedium.copyWith(
              fontSize: 14,
              height: 20 / 14,
              fontWeight: FontWeight.w500,
              color: flashing ? Colors.white : context.colors.textPrimary,
            ),
          ),
        ),
        const SizedBox(width: 16),
        FluxerButton.secondary(
          onPressed: entry.isSaving ? null : entry.onReset,
          label: l10n.uiReset,
          size: FluxerButtonSize.small,
          fitContent: true,
        ),
        const SizedBox(width: 12),
        FluxerButton.primary(
          onPressed: entry.isSaving ? null : entry.onSave,
          label: l10n.uiSaveChanges,
          size: FluxerButtonSize.small,
          isLoading: entry.isSaving,
          fitContent: true,
        ),
      ],
    );
  }
}
