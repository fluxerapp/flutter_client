import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/utils/oauth_authorize_url.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ApplicationInfoSection extends StatelessWidget {
  const ApplicationInfoSection({
    required this.nameController,
    required this.nameError,
    required this.botPublic,
    required this.botRequireCodeGrant,
    required this.redirectControllers,
    required this.onBotPublicChanged,
    required this.onBotRequireCodeGrantChanged,
    required this.onAddRedirect,
    required this.onRemoveRedirect,
    super.key,
  });

  final TextEditingController nameController;
  final String? nameError;
  final bool botPublic;
  final bool botRequireCodeGrant;
  final List<TextEditingController> redirectControllers;
  final ValueChanged<bool> onBotPublicChanged;
  final ValueChanged<bool> onBotRequireCodeGrantChanged;
  final VoidCallback onAddRedirect;
  final ValueChanged<int> onRemoveRedirect;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;

    return FluxerSettingsSection(
      title: l10n.applicationsInfoTitle,
      description: l10n.applicationsInfoDescription,
      sectionId: 'applications-info',
      children: [
        FluxerInput(
          controller: nameController,
          label: l10n.applicationsName,
          hint: l10n.applicationsNameHint,
          maxLength: 100,
          errorText: nameError,
        ),
        FluxerSwitchGroup(
          children: [
            FluxerSwitchGroupItem(
              label: l10n.applicationsPublicBot,
              description: l10n.applicationsPublicBotDescription,
              value: botPublic,
              onChanged: onBotPublicChanged,
            ),
            FluxerSwitchGroupItem(
              label: l10n.applicationsRequireCodeGrant,
              description: l10n.applicationsRequireCodeGrantDescription,
              value: botRequireCodeGrant,
              onChanged: onBotRequireCodeGrantChanged,
            ),
          ],
        ),
        for (int i = 0; i < redirectControllers.length; i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: FluxerInput(
                  controller: redirectControllers[i],
                  label: i == 0 ? l10n.applicationsRedirectUris : null,
                  hint: kExampleCallbackUrl,
                ),
              ),
              SizedBox(width: layout.s2),
              FluxerButton.secondary(
                onPressed: i == 0 ? null : () => onRemoveRedirect(i),
                semanticLabel: l10n.applicationsDeleteRedirect,
                icon: PhosphorIconsBold.x,
                size: FluxerButtonSize.small,
                isSquare: true,
              ),
            ],
          ),
        if (redirectControllers.length < kMaxApplicationRedirectUris)
          Align(
            alignment: Alignment.centerLeft,
            child: FluxerButton.primary(
              onPressed: onAddRedirect,
              label: l10n.applicationsAddRedirect,
              size: FluxerButtonSize.small,
              fitContent: true,
            ),
          ),
      ],
    );
  }
}
