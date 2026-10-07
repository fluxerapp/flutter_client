import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_parts.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ReportFlowBlockTarget {
  const ReportFlowBlockTarget({required this.userId, required this.name});

  final String userId;
  final String name;
}

class ReportFlowThankYou extends StatelessWidget {
  const ReportFlowThankYou({
    required this.reportSent,
    required this.endedOnStartScreen,
    required this.productName,
    required this.blockTarget,
    required this.blocked,
    required this.blocking,
    required this.onBlock,
    super.key,
  });

  final bool reportSent;
  final bool endedOnStartScreen;
  final String productName;
  final ReportFlowBlockTarget? blockTarget;
  final bool blocked;
  final bool blocking;
  final VoidCallback onBlock;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final ReportFlowBlockTarget? target = blockTarget;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          reportSent
              ? l10n.reportFlowThankYouBody(productName)
              : endedOnStartScreen
              ? l10n.reportFlowThankYouNoReportBody
              : l10n.reportFlowThankYouNoReportBodyShort,
          style: context.textStyles.bodyMedium.copyWith(
            color: colors.textSecondary,
          ),
        ),
        if (target != null) ...[
          SizedBox(height: layout.s4),
          ReportFlowSectionHeading(l10n.reportFlowMoreYouCanDo),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: layout.s4,
              vertical: layout.s3,
            ),
            decoration: BoxDecoration(
              borderRadius: layout.radiusLg,
              border: Border.all(color: colors.backgroundModifierAccent),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        l10n.reportFlowBlockName(target.name),
                        style: context.textStyles.bodyMedium.copyWith(
                          color: colors.textPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: layout.s1),
                      Text(
                        l10n.reportFlowBlockDescription,
                        style: context.textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: layout.s3),
                if (blocked)
                  FluxerButton.secondary(
                    label: l10n.reportFlowBlockedButton,
                    size: FluxerButtonSize.small,
                    fitContent: true,
                  )
                else
                  FluxerButton.dangerPrimary(
                    onPressed: blocking ? null : onBlock,
                    isLoading: blocking,
                    label: l10n.reportFlowBlockButton,
                    size: FluxerButtonSize.small,
                    fitContent: true,
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
