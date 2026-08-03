import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';

class DirectVoiceSessionStrip extends ConsumerWidget {
  const DirectVoiceSessionStrip({required this.channelId, super.key});

  final String channelId;

  bool _isDmVoiceOnThisChannel(VoiceSessionState voice) {
    final bool isPrivate = voice.guildId == null || voice.guildId!.isEmpty;
    return isPrivate &&
        voice.channelId == channelId &&
        voice.isInVoice &&
        voice.errorMessage == null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    if (!_isDmVoiceOnThisChannel(voice)) {
      return const SizedBox.shrink();
    }
    final LayoutMode layout = layoutModeOfSize(MediaQuery.sizeOf(context));
    if (layout == LayoutMode.desktop && voice.isConnected) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String status = voice.isConnected
        ? l10n.dmVoiceStripStatusInCall
        : l10n.dmVoiceStripStatusConnecting;
    return Material(
      color: context.colors.backgroundSecondary,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: context.colors.userAreaDividerColor),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.phone_in_talk_outlined,
                size: 18,
                color: context.colors.textSecondary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  status,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              if (layout != LayoutMode.desktop)
                FilledButton.tonal(
                  onPressed: () {
                    unawaited(
                      context.push(RoutePaths.dmChannelCall(channelId)),
                    );
                  },
                  child: Text(l10n.dmVoiceViewCall),
                )
              else if (!voice.isConnected)
                OutlinedButton(
                  onPressed: () {
                    unawaited(
                      context.push(RoutePaths.dmChannelCall(channelId)),
                    );
                  },
                  child: Text(l10n.dmVoiceCallFullScreen),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
