import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:material_ui/material_ui.dart';

class GuildWebhooksNoticeBox extends StatelessWidget {
  const GuildWebhooksNoticeBox({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        0,
        context.layout.s4,
        context.layout.s4,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: context.colors.borderColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          message,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
        ),
      ),
    );
  }
}
