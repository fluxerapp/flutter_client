import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/privacy_data_request.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/privacy_data_request_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class PrivacyDataExportSection extends StatelessWidget {
  const PrivacyDataExportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    return FluxerSettingsSection(
      sectionId: 'data-export',
      title: l10n.privacyDashboardDataExportSection,
      children: [
        FluxerSettingsSubsection(
          children: [
            Text(
              l10n.privacyDashboardDataExportDesc,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
            SizedBox(height: layout.s3),
            SizedBox(
              width: double.infinity,
              child: FluxerButton.primary(
                label: l10n.privacyDashboardExportMyData,
                onPressed: () => unawaited(
                  PrivacyDataRequestSheet.show(
                    context,
                    variant: PrivacyDataRequestVariant.export,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PrivacyDataDeletionSection extends StatelessWidget {
  const PrivacyDataDeletionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    return FluxerSettingsSection(
      sectionId: 'data-deletion',
      title: l10n.privacyDashboardDataDeletionSection,
      children: [
        FluxerSettingsSubsection(
          children: [
            Text(
              l10n.privacyDashboardDataDeletionDesc,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
            SizedBox(height: layout.s3),
            SizedBox(
              width: double.infinity,
              child: FluxerButton.dangerPrimary(
                label: l10n.privacyDashboardDeleteMyMessages,
                onPressed: () => unawaited(
                  PrivacyDataRequestSheet.show(
                    context,
                    variant: PrivacyDataRequestVariant.delete,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
