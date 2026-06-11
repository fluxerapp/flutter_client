import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String kBetaWarningRepoUrl =
    'https://github.com/fluxerapp/flutter_client';

bool _isBetaWarningSheetOpen = false;

Future<bool?> showBetaWarningSheet(BuildContext context) async {
  if (_isBetaWarningSheetOpen) {
    return null;
  }
  _isBetaWarningSheetOpen = true;
  try {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return await FluxerBottomSheet.show<bool>(
      context,
      title: l10n.betaWarningTitle,
      useRootNavigator: true,
      showDragHandle: false,
      isDismissible: false,
      enableDrag: false,
      builder: (sheetContext, close) => _BetaWarningSheetBody(
        onAcknowledge: () {
          Navigator.of(sheetContext, rootNavigator: true).pop(true);
        },
      ),
    );
  } finally {
    _isBetaWarningSheetOpen = false;
  }
}

class _BetaWarningSheetBody extends StatelessWidget {
  const _BetaWarningSheetBody({required this.onAcknowledge});

  final VoidCallback onAcknowledge;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final textStyles = context.textStyles;
    final colors = context.colors;
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colors.backgroundModifierAccent,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: PhosphorIcon(
                    PhosphorIconsFill.warning,
                    size: 24,
                    color: colors.accentWarning,
                  ),
                ),
                SizedBox(height: layout.s3),
                Text(
                  l10n.betaWarningMessage,
                  textAlign: TextAlign.center,
                  style: textStyles.bodyMedium.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: colors.textPrimary,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: layout.s1),
                Text(
                  l10n.betaWarningReportIssues,
                  textAlign: TextAlign.center,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ],
            ),
            SizedBox(height: layout.s4),
            FluxerTappable(
              onTap: () => handleExternalLinkTap(context, kBetaWarningRepoUrl),
              semanticLabel: l10n.betaWarningRepoLink,
              builder: (BuildContext context, Set<WidgetState> states) {
                final bool isHovered = states.contains(WidgetState.hovered);
                final bool isPressed = states.contains(WidgetState.pressed);
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: layout.s4,
                    vertical: layout.s3,
                  ),
                  decoration: BoxDecoration(
                    color: isPressed || isHovered
                        ? colors.backgroundModifierAccent
                        : colors.backgroundTertiary,
                    borderRadius: layout.radiusMd,
                    border: Border.all(color: colors.backgroundModifierAccent),
                  ),
                  child: Row(
                    children: <Widget>[
                      PhosphorIcon(
                        PhosphorIconsBold.code,
                        size: 20,
                        color: colors.textSecondary,
                      ),
                      SizedBox(width: layout.s3),
                      Expanded(
                        child: Text(
                          l10n.betaWarningRepoLink,
                          style: textStyles.bodySmall.copyWith(
                            color: colors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      PhosphorIcon(
                        PhosphorIconsRegular.arrowSquareOut,
                        size: 18,
                        color: colors.textSecondary,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: onAcknowledge,
              label: l10n.betaWarningGotIt,
            ),
            SizedBox(height: layout.s4),
          ],
        ),
      ),
    );
  }
}
