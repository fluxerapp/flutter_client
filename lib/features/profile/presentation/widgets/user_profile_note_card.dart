import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserProfileNoteCard extends StatelessWidget {
  const UserProfileNoteCard({
    required this.note,
    required this.onTap,
    super.key,
  });

  final String? note;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return FluxerTappable(
      onTap: onTap,
      builder: (context, _) => DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: layout.radiusXl,
        ),
        child: Padding(
          padding: EdgeInsets.all(layout.s4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      l10n.userProfileNoteTitle,
                      style: textStyles.label.copyWith(
                        color: colors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.userProfileNoteVisibility,
                      style: textStyles.timestamp,
                    ),
                    if (note != null && note!.isNotEmpty) ...[
                      SizedBox(height: layout.s1),
                      Text(
                        note!,
                        style: textStyles.bodySmall.copyWith(
                          color: colors.textSecondary,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: layout.s3),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.backgroundTertiary,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: FluxerButtonVariant.secondary.borderColor(colors)!,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(layout.s2),
                  child: PhosphorIcon(
                    PhosphorIconsFill.notePencil,
                    size: 16,
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
