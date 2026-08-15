import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class SlowmodeSendBlockedNotice extends StatelessWidget {
  const SlowmodeSendBlockedNotice({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        l10n.forwardSendSlowmodeBlocked,
        style: context.textStyles.bodySmall.copyWith(
          color: context.colors.textSecondary,
        ),
      ),
    );
  }
}
