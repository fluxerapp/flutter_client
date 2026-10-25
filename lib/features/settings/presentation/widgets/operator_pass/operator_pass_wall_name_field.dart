import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/utils/operator_pass_utils.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class OperatorPassWallNameField extends StatelessWidget {
  const OperatorPassWallNameField({
    required this.controller,
    required this.optOut,
    required this.problem,
    required this.disabled,
    required this.onOptOutChanged,
    super.key,
  });

  final TextEditingController controller;
  final bool optOut;
  final OperatorPassWallNameProblem? problem;
  final bool disabled;
  final ValueChanged<bool?> onOptOutChanged;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? error = !optOut
        ? switch (problem) {
            OperatorPassWallNameProblem.required =>
              l10n.operatorPassWallNameRequired,
            OperatorPassWallNameProblem.tooLong =>
              l10n.operatorPassWallNameTooLong,
            null => null,
          }
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FluxerInput(
          controller: controller,
          label: l10n.operatorPassWallNameSettingsLabel,
          onChanged: (_) {},
          enabled: !disabled && !optOut,
          errorText: error,
          hint: l10n.operatorPassWallNameHint,
        ),
        SizedBox(height: context.layout.s2),
        FluxerCheckbox(
          label: l10n.operatorPassWallDontListMe,
          value: optOut,
          onChanged: disabled ? (_) {} : onOptOutChanged,
        ),
      ],
    );
  }
}
