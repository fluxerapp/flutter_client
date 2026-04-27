import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Compact controls when a voice session is active.
/// 
/// This is just a temporary design for testing, need to work on a final design.
class VoiceCallBar extends ConsumerWidget {
  const VoiceCallBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    if (!voice.isInVoice && voice.errorMessage == null) {
      return const SizedBox.shrink();
    }
    return Padding(
        padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
        child: Material(
          elevation: 6,
          borderRadius: BorderRadius.circular(12),
          color: context.colors.backgroundSecondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                PhosphorIcon(
                  PhosphorIconsRegular.phone,
                  color: context.colors.textSecondary,
                  size: 22,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        voice.isConnected
                            ? 'Voice connected'
                            : 'Connecting…',
                        style: context.textStyles.channelName,
                      ),
                      if (voice.channelId != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          voice.channelId!,
                          style: context.textStyles.categoryName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      if (voice.errorMessage != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          voice.errorMessage!,
                          style: context.textStyles.categoryName.copyWith(
                            color: context.colors.statusDanger,
                          ),
                          maxLines: 2,
                        ),
                      ],
                    ],
                  ),
                ),
                if (voice.errorMessage != null)
                  TextButton(
                    onPressed: () {
                      ref.read(voiceSessionProvider.notifier).clearError();
                    },
                    child: const Text('Dismiss'),
                  )
                else if (voice.isConnected)
                  FilledButton.tonal(
                    onPressed: () {
                      unawaited(
                        ref.read(voiceSessionProvider.notifier).leaveVoice(),
                      );
                    },
                    child: const Text('Leave'),
                  ),
              ],
            ),
          ),
        ),
      
    );
  }
}
