import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_e2ee_status_provider.dart';
import 'package:fluxer_app/features/voice/utils/channel_e2ee_status.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

enum VoiceE2eeIndicatorVariant { voiceChannel, call }

/// One-line E2EE status copy matching the desktop voice indicator.
class VoiceE2eeIndicator extends ConsumerWidget {
  const VoiceE2eeIndicator({
    required this.guildId,
    required this.channelId,
    required this.variant,
    this.includeTopPadding = true,
    super.key,
  });

  final String? guildId;
  final String channelId;
  final VoiceE2eeIndicatorVariant variant;
  final bool includeTopPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChannelE2eeStatus status = ref.watch(
      voiceChannelE2eeStatusProvider(
        guildId: guildId,
        channelId: channelId,
        emptyChannelStatus: ChannelE2eeStatus.encrypted,
      ),
    );
    if (status == ChannelE2eeStatus.none) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isEncrypted = status == ChannelE2eeStatus.encrypted;
    final String message = isEncrypted
        ? variant == VoiceE2eeIndicatorVariant.call
              ? l10n.voiceCallE2eeEncrypted
              : l10n.voiceChannelE2eeEncrypted
        : variant == VoiceE2eeIndicatorVariant.call
        ? l10n.voiceCallE2eeBroken
        : l10n.voiceChannelE2eeBroken;
    final Color color = isEncrypted
        ? context.colors.statusOnline
        : context.colors.statusDanger;
    return Semantics(
      label: message,
      child: Padding(
        padding: EdgeInsets.only(top: includeTopPadding ? 12 : 0),
        child: Align(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width < 512
                  ? MediaQuery.sizeOf(context).width
                  : 512,
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: context.textStyles.bodySmall.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.3,
                letterSpacing: 0.005 * 13,
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
