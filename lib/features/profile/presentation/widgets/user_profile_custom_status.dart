import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';

class UserProfileCustomStatus extends StatelessWidget {
  const UserProfileCustomStatus({
    required this.text,
    this.popout = false,
    super.key,
  });

  final String? text;
  final bool popout;

  @override
  Widget build(BuildContext context) {
    if (!popout) {
      return CustomStatusDisplay(stored: text, maxLines: null);
    }
    return CustomStatusDisplay(
      stored: text,
      maxLines: null,
      emojiSize: 13.5,
      textStyle: context.textStyles.bodySmall.copyWith(
        fontSize: 12,
        height: 16 / 12,
        color: context.colors.textPrimaryMuted,
      ),
    );
  }
}
