import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/utils/webhook_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildWebhooksInfoBox extends StatelessWidget {
  const GuildWebhooksInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String channelSettingsPath = formatChannelSettingsWebhooksPath(l10n);
    final TextStyle baseStyle = context.textStyles.bodySmall.copyWith(
      color: context.colors.textPrimaryMuted,
    );
    final String message = l10n.guildSettingsWebhooksInfo(channelSettingsPath);
    final int pathIndex = message.indexOf(channelSettingsPath);
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
        child: pathIndex == -1
            ? Text(message, style: baseStyle)
            : Text.rich(
                TextSpan(
                  style: baseStyle,
                  children: <InlineSpan>[
                    TextSpan(text: message.substring(0, pathIndex)),
                    TextSpan(
                      text: channelSettingsPath,
                      style: baseStyle.copyWith(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: message.substring(
                        pathIndex + channelSettingsPath.length,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
