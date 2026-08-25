import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

/// Start-of-channel welcome for guild text/voice channels, mirroring the web
/// client's `ChannelWelcomeSection`. Shown at the top of fully-loaded history
/// and as the empty state.
class ChannelWelcomeSection extends StatelessWidget {
  const ChannelWelcomeSection({
    required this.channel,
    this.effectivePermissionBits,
    super.key,
  });

  final Channel channel;
  final int? effectivePermissionBits;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String displayName = '#${channel.name}';
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: context.colors.guildListForeground,
              shape: BoxShape.circle,
            ),
            child: ChannelIcon(
              type: channel.type,
              channel: channel,
              effectivePermissionBits: effectivePermissionBits,
              size: 48,
              color: context.colors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.channelWelcomeHeading(displayName),
            style: context.textStyles.heading.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            l10n.channelWelcomeDescription(displayName),
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
        ],
      ),
    );
  }
}
