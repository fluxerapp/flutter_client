import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ApplicationDangerSection extends StatelessWidget {
  const ApplicationDangerSection({
    required this.isDeleting,
    required this.onDelete,
    super.key,
  });

  final bool isDeleting;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerSettingsSection(
      title: l10n.applicationsDangerTitle,
      description: l10n.applicationsDangerSubtitle,
      children: [
        Text(
          l10n.applicationsDangerHelper,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: FluxerButton.dangerPrimary(
            onPressed: isDeleting ? null : onDelete,
            label: l10n.applicationsDelete,
            icon: PhosphorIconsFill.trash,
            isLoading: isDeleting,
            fitContent: true,
          ),
        ),
      ],
    );
  }
}
