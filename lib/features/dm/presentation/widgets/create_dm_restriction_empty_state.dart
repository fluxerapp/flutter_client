import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/dm/domain/create_dm_labels.dart';
import 'package:fluxer_app/features/dm/domain/create_dm_restriction.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CreateDmRestrictionEmptyState extends ConsumerWidget {
  const CreateDmRestrictionEmptyState({required this.restriction, super.key});

  final CreateDmRestriction restriction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isUnclaimed = restriction == CreateDmRestriction.unclaimed;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhosphorIcon(
              isUnclaimed
                  ? PhosphorIconsFill.warningCircle
                  : PhosphorIconsFill.envelopeSimple,
              size: 40,
              color: context.colors.textTertiary,
            ),
            SizedBox(height: context.layout.s4),
            Text(
              createDmRestrictionTitle(l10n, restriction),
              textAlign: TextAlign.center,
              style: context.textStyles.username.copyWith(
                color: context.colors.textPrimary,
                fontSize: 16,
              ),
            ),
            SizedBox(height: context.layout.s2),
            Text(
              createDmRestrictionDescription(l10n, restriction),
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: context.layout.s6),
            FluxerButton.primary(
              label: createDmRestrictionActionLabel(l10n, restriction),
              onPressed: () {
                if (isUnclaimed) {
                  unawaited(ClaimAccountSheet.show(context, ref));
                  return;
                }
                unawaited(
                  UserSettingsModal.show(context, openSecuritySection: true),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
