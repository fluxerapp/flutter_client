import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

enum VoiceConnectionConfirmResult { switchToThisDevice, justJoin }

Future<VoiceConnectionConfirmResult?> showVoiceConnectionConfirmModal(
  BuildContext context, {
  required int otherDeviceCount,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final String description = l10n.voiceConnectionConfirmDescription(
    otherDeviceCount,
  );

  List<Widget> buildActions(
    void Function([VoiceConnectionConfirmResult? result]) pop,
  ) {
    return <Widget>[
      FluxerButton.primary(
        onPressed: () => pop(VoiceConnectionConfirmResult.switchToThisDevice),
        label: l10n.voiceConnectionConfirmSwitch,
      ),
      const SizedBox(height: 8),
      FluxerButton.secondary(
        onPressed: () => pop(VoiceConnectionConfirmResult.justJoin),
        label: l10n.voiceConnectionConfirmJustJoin,
      ),
      const SizedBox(height: 8),
      FluxerButton.secondary(
        onPressed: () => pop(),
        label: l10n.voiceConnectionConfirmDoNothing,
      ),
    ];
  }

  if (isMobileLayout(context)) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    return FluxerBottomSheet.show<VoiceConnectionConfirmResult?>(
      context,
      useRootNavigator: true,
      title: l10n.voiceConnectionConfirmTitle,
      subtitle: Text(
        description,
        style: textStyles.bodySmall.copyWith(
          color: colors.textSecondary,
          height: 1.4,
        ),
      ),
      trailing: Opacity(
        opacity: 0.7,
        child: FluxerButton.ghost(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          icon: PhosphorIconsBold.x,
          isSquare: true,
          semanticLabel: l10n.uiClose,
        ),
      ),
      builder: (BuildContext sheetContext, VoidCallback close) {
        void pop([VoiceConnectionConfirmResult? result]) {
          Navigator.of(sheetContext).pop(result);
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: sheetContext.layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildActions(pop),
          ),
        );
      },
    );
  }

  return FluxerModal.show<VoiceConnectionConfirmResult?>(
    context,
    useRootNavigator: true,
    centered: true,
    title: l10n.voiceConnectionConfirmTitle,
    description: description,
    builder: (BuildContext dialogContext, VoidCallback close) {
      return const SizedBox.shrink();
    },
    actionsBuilder: buildActions,
  );
}
