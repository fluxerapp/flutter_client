import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_read_only_input.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ApplicationHeader extends StatelessWidget {
  const ApplicationHeader({
    required this.name,
    required this.applicationId,
    required this.onBack,
    required this.onCopyId,
    super.key,
  });

  final String name;
  final String applicationId;
  final VoidCallback onBack;
  final VoidCallback onCopyId;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FluxerButton.secondary(
          onPressed: onBack,
          label: l10n.applicationsBackToList,
          size: FluxerButtonSize.small,
          fitContent: true,
        ),
        SizedBox(height: layout.s3),
        Text(
          name,
          style: context.textStyles.heading.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        SizedBox(height: layout.s4),
        ApplicationReadOnlyInput(
          text: applicationId,
          label: l10n.applicationsId,
          trailing: FluxerButton.secondary(
            onPressed: onCopyId,
            label: l10n.applicationsCopyId,
            icon: PhosphorIconsBold.copy,
            size: FluxerButtonSize.small,
            fitContent: true,
          ),
        ),
      ],
    );
  }
}
