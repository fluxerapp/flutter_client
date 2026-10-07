import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_parts.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_target_preview.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

class ReportFlowSummary extends StatelessWidget {
  const ReportFlowSummary({
    required this.target,
    required this.categoryLabels,
    required this.urgent,
    required this.guidelinesUrl,
    this.note,
    super.key,
  });

  final IarContext target;
  final List<String> categoryLabels;
  final bool urgent;
  final String? guidelinesUrl;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final String? noteText = note;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        _ReportFlowDisclaimer(guidelinesUrl: guidelinesUrl),
        if (urgent) ...[
          SizedBox(height: layout.s4),
          const ReportFlowUrgentBanner(),
        ],
        SizedBox(height: layout.s4),
        ReportFlowSectionHeading(switch (target) {
          IarMessageContext() => l10n.reportFlowSelectedMessage,
          IarUserContext() => l10n.reportFlowSelectedUser,
        }),
        ReportFlowTargetPreview(target: target),
        SizedBox(height: layout.s4),
        ReportFlowSectionHeading(l10n.reportFlowReportCategory),
        ReportFlowCategoryTrail(labels: categoryLabels),
        if (noteText != null) ...[
          SizedBox(height: layout.s4),
          ReportFlowInlineNote(text: noteText),
        ],
      ],
    );
  }
}

class _ReportFlowDisclaimer extends StatelessWidget {
  const _ReportFlowDisclaimer({required this.guidelinesUrl});

  final String? guidelinesUrl;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle style = context.textStyles.bodySmall.copyWith(
      color: context.colors.textSecondary,
    );
    final String? url = guidelinesUrl;
    if (url == null) {
      return Text(l10n.reportFlowDisclaimerNoLink, style: style);
    }
    final String linkText = l10n.reportFlowCommunityGuidelinesLink;
    final String text = l10n.reportFlowDisclaimer(linkText);
    final int linkIndex = text.indexOf(linkText);
    if (linkIndex < 0) {
      return Text(text, style: style);
    }
    final String rest = text.substring(linkIndex + linkText.length);
    final String punctuation =
        RegExp(r'^\p{P}+', unicode: true).stringMatch(rest) ?? '';
    final Widget link = FluxerTextLink(
      text: linkText,
      url: url,
      style: style,
      onTap: () =>
          unawaited(handleExternalLinkTap(context, url, skipWarning: true)),
    );
    return Text.rich(
      TextSpan(
        style: style,
        children: <InlineSpan>[
          TextSpan(text: text.substring(0, linkIndex)),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: punctuation.isEmpty
                ? link
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Flexible(child: link),
                      Text(punctuation, style: style),
                    ],
                  ),
          ),
          TextSpan(text: rest.substring(punctuation.length)),
        ],
      ),
    );
  }
}

class ReportFlowCategoryTrail extends StatelessWidget {
  const ReportFlowCategoryTrail({required this.labels, super.key});

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int index = 0; index < labels.length; index++)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 12,
                  child: Column(
                    children: [
                      SizedBox(height: layout.s1_5),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: colors.textSecondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      if (index < labels.length - 1)
                        Expanded(
                          child: Container(
                            width: 2,
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            color: colors.backgroundModifierAccent,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: layout.s2),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: index < labels.length - 1 ? layout.s3 : 0,
                    ),
                    child: Text(
                      labels[index],
                      style: context.textStyles.bodySmall.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
