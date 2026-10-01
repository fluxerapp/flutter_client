import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ChannelFollowSuccessSheet {
  ChannelFollowSuccessSheet._();

  static Future<void> show(
    BuildContext context, {
    required String sourceName,
    required String targetName,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerModal.show<void>(
      context,
      title: l10n.channelFollowSuccessTitle,
      centered: true,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return Text(
          l10n.channelFollowSuccessBody(sourceName, targetName),
          style: dialogContext.textStyles.bodySmall.copyWith(height: 1.4),
        );
      },
      actionsBuilder: (void Function([void]) pop) => <Widget>[
        FluxerButton.primary(
          onPressed: () => pop(),
          label: l10n.channelFollowSuccessDismiss,
        ),
      ],
    );
  }
}
