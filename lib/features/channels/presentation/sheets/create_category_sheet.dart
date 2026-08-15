import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class CreateCategorySheet {
  CreateCategorySheet._();

  static Future<String?> show(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    var currentName = '';
    final ValueNotifier<bool> nameValid = ValueNotifier<bool>(false);

    return FluxerModal.show<String>(
      context,
      title: l10n.guildNavbarCreateCategory,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return FluxerInput(
          label: l10n.guildNavbarNameLabel,
          hint: l10n.guildNavbarNewCategoryHint,
          maxLength: 100,
          autofocus: true,
          textInputAction: TextInputAction.done,
          onChanged: (String value) {
            currentName = value;
            nameValid.value = value.trim().isNotEmpty;
          },
          onSubmitted: (_) {
            final String value = currentName.trim();
            if (value.isNotEmpty) {
              Navigator.of(context).pop(value);
            }
          },
        );
      },
      actions: <Widget>[
        ValueListenableBuilder<bool>(
          valueListenable: nameValid,
          builder: (BuildContext _, bool isValid, Widget? _) =>
              FluxerButton.primary(
                onPressed: isValid
                    ? () => Navigator.of(context).pop(currentName.trim())
                    : null,
                label: l10n.guildNavbarCreateCategory,
              ),
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(
          onPressed: () => Navigator.of(context).pop(),
          label: l10n.cancel,
        ),
      ],
    );
  }
}
