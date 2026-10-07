import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ReportFlowSectionHeading extends StatelessWidget {
  const ReportFlowSectionHeading(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.layout.s2),
      child: Semantics(
        header: true,
        child: Text(
          text,
          style: context.textStyles.categoryName.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
        ),
      ),
    );
  }
}

class ReportFlowUrgentBanner extends StatelessWidget {
  const ReportFlowUrgentBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final String message = FluxerLocalizations.of(
      context,
    ).reportFlowUrgentBanner;
    return Semantics(
      container: true,
      label: message,
      child: ExcludeSemantics(
        child: Container(
          padding: EdgeInsets.all(layout.s3),
          decoration: BoxDecoration(
            color: colors.alertNote.withValues(alpha: 0.1),
            border: Border.all(color: colors.alertNote.withValues(alpha: 0.5)),
            borderRadius: layout.radiusLg,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhosphorIcon(
                PhosphorIconsFill.info,
                size: 20,
                color: colors.alertNote,
              ),
              SizedBox(width: layout.s2),
              Expanded(
                child: Text(
                  message,
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportFlowInlineNote extends StatelessWidget {
  const ReportFlowInlineNote({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return Semantics(
      liveRegion: true,
      child: Container(
        padding: EdgeInsets.all(layout.s3),
        decoration: BoxDecoration(
          color: colors.backgroundSecondaryAlt,
          borderRadius: layout.radiusLg,
        ),
        child: Text(
          text,
          style: context.textStyles.bodySmall.copyWith(
            color: colors.textSecondary,
          ),
        ),
      ),
    );
  }
}
