import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class GuildUploadSlotInfo extends StatelessWidget {
  const GuildUploadSlotInfo({
    required this.title,
    required this.slotLabel,
    required this.description,
    required this.uploadLabel,
    required this.onUpload,
    super.key,
  });

  final String title;
  final String slotLabel;
  final String description;
  final String uploadLabel;
  final VoidCallback onUpload;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final colors = context.colors;
    final layout = context.layout;
    if (usesDesktopPointerUi(context)) {
      return _buildDesktopPointer(context);
    }
    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s4, layout.s4, layout.s4, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: textStyles.channelName.copyWith(
                        color: colors.textChat,
                      ),
                    ),
                    SizedBox(height: layout.s1),
                    Text(
                      slotLabel,
                      style: textStyles.bodySmall.copyWith(
                        color: colors.textPrimaryMuted,
                      ),
                    ),
                  ],
                ),
              ),
              FluxerButton.primary(
                label: uploadLabel,
                size: FluxerButtonSize.small,
                fitContent: true,
                icon: PhosphorIconsBold.uploadSimple,
                onPressed: onUpload,
              ),
            ],
          ),
          SizedBox(height: layout.s2),
          Text(
            description,
            style: textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopPointer(BuildContext context) {
    final colors = context.colors;
    final TextStyle small = context.textStyles.bodySmall.copyWith(
      fontSize: 12,
      height: 16 / 12,
      color: colors.textPrimaryMuted,
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          borderRadius: context.layout.radiusMd,
          border: Border.all(color: colors.backgroundHeaderSecondary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: context.textStyles.bodyMedium.copyWith(
                          fontSize: 14,
                          height: 20 / 14,
                          fontWeight: FontWeight.w600,
                          color: colors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(slotLabel, style: small),
                    ],
                  ),
                ),
                FluxerButton.primary(
                  label: uploadLabel,
                  fitContent: true,
                  icon: PhosphorIconsRegular.uploadSimple,
                  onPressed: onUpload,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description, style: small),
          ],
        ),
      ),
    );
  }
}
