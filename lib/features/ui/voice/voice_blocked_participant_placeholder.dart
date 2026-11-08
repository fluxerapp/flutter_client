import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceBlockedParticipantPlaceholder extends StatelessWidget {
  const VoiceBlockedParticipantPlaceholder({
    this.cornerRadius = 12,
    this.showLabel = true,
    super.key,
  });

  final double cornerRadius;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Color foreground = context.colors.textTertiary;
    return ClipRRect(
      borderRadius: BorderRadius.circular(cornerRadius),
      child: ColoredBox(
        color: context.colors.backgroundTertiary,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(PhosphorIconsFill.eyeSlash, color: foreground, size: 28),
                if (showLabel) ...<Widget>[
                  const SizedBox(height: 8),
                  Text(
                    l10n.voiceBlockedParticipantVideoHidden,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.timestamp.copyWith(
                      color: foreground,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
