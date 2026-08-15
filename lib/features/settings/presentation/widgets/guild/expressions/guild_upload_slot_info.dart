import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
}
