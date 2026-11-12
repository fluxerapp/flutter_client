import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/threads/presentation/thread_welcome_section.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ChannelWelcomeSection extends StatelessWidget {
  const ChannelWelcomeSection({required this.channel, super.key});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    if (channel.isThread) {
      return ThreadWelcomeSection(thread: channel);
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String displayName = '#${channel.name}';
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRect(
            child: Text(
              displayName,
              style: context.textStyles.heading.copyWith(fontSize: 24),
            ),
          ),
          const SizedBox(height: 4),
          ClipRect(
            child: Text(
              l10n.channelWelcomeDescription(displayName),
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textPrimaryMuted,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
