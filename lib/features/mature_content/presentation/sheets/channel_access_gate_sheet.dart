import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/presentation/mature_content_gate_copy.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

/// Returns `true` when the user may continue into the channel.
Future<bool> showChannelAccessGateSheet({
  required BuildContext context,
  required ProviderContainer container,
  required String channelId,
  String? guildId,
  ChannelType? channelType,
}) async {
  final MatureContentGateReason reason = await container.read(
    matureContentGateReasonProvider(channelId).future,
  );
  if (reason == MatureContentGateReason.none) {
    return true;
  }
  final ResolvedMatureGateContext? gateContext = await container.read(
    matureGateContextProvider(channelId).future,
  );
  if (gateContext == null) {
    return true;
  }
  if (!context.mounted) {
    return false;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final MatureContentGateCopy copy = resolveMatureContentGateCopy(
    l10n: l10n,
    reason: reason,
    context: gateContext,
    channelType: channelType,
  );
  final bool? confirmed = await FluxerBottomSheet.show<bool>(
    context,
    title: copy.title,
    builder: (sheetContext, close) {
      final layout = sheetContext.layout;
      final textStyles = sheetContext.textStyles;
      final colors = sheetContext.colors;
      return Padding(
        padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              copy.body,
              style: textStyles.bodySmall.copyWith(
                color: colors.textSecondary,
                height: 1.4,
              ),
            ),
            SizedBox(height: layout.s4),
            if (copy.canProceed && copy.primaryButtonLabel != null)
              FluxerButton.primary(
                label: copy.primaryButtonLabel,
                onPressed: () => Navigator.of(sheetContext).pop(true),
              ),
            if (copy.canProceed && copy.primaryButtonLabel != null)
              SizedBox(height: layout.s2),
            FluxerButton.secondary(
              label: MaterialLocalizations.of(sheetContext).cancelButtonLabel,
              onPressed: () => Navigator.of(sheetContext).pop(false),
            ),
          ],
        ),
      );
    },
  );
  if (confirmed != true) {
    return false;
  }
  final String scopeId = gateContext.scopeId ?? channelId;
  await container
      .read(matureContentAgreementsProvider.notifier)
      .agreeForScope(scope: gateContext.scope, scopeId: scopeId);
  return true;
}
