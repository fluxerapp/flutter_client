import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/user_area_popout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/user_panel_widgets.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_status/voice_connection_status.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserArea extends ConsumerWidget {
  final VoidCallback? onSettingsTap;

  const UserArea({this.onSettingsTap, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userSettingsViewModelProvider);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    final localVoice = ref.watch(localVoiceStateProvider);
    final String? connectionId = voice.activeConnectionId;
    final VoiceState? selfVoiceState = connectionId == null
        ? null
        : ref.watch(voiceStateForConnectionProvider(connectionId));
    final bool inVoice = voice.isInVoice;
    final bool isMuted = inVoice
        ? (selfVoiceState?.selfMute ?? false)
        : localVoice.selfMute;
    final bool isDeafened = inVoice
        ? (selfVoiceState?.selfDeaf ?? false)
        : localVoice.selfDeaf;
    final layout = context.layout;
    final colors = context.colors;
    final bool showVoiceSection =
        isWideLayout(context) && voice.showDesktopVoiceConnectionSection;
    final double verticalPadding =
        (layout.userAreaHeight - kUserAreaContentHeight) / 2;

    return ColoredBox(
      color: colors.panelControlBg,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (showVoiceSection) ...<Widget>[
            const UserAreaDivider(),
            const VoiceConnectionStatus(),
            const UserAreaDivider(),
          ] else
            const UserAreaDivider(),
          Padding(
            padding: EdgeInsets.fromLTRB(
              layout.s4,
              verticalPadding,
              layout.s4,
              verticalPadding,
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: layout.radiusMd,
                    child: InkWell(
                      borderRadius: layout.radiusMd,
                      hoverColor: colors.textPrimary.withValues(alpha: 0.03),
                      onTap: () => unawaited(UserAreaPopout.show(context)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: layout.s2),
                        child: SizedBox(
                          height: kUserAreaContentHeight,
                          child: Row(
                            children: <Widget>[
                              FluxerAvatar.userPresence(
                                fallbackText: user.displayName,
                                userId: user.userId,
                                imageUrl: user.avatarUrl,
                                avatarColor: user.avatarColor,
                                size: 36,
                              ),
                              SizedBox(width: layout.s2),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      user.displayName,
                                      style: context.textStyles.label.copyWith(
                                        height: 18 / 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 1),
                                    Text(
                                      '${user.username}#${user.discriminator}',
                                      style: context.textStyles.timestamp
                                          .copyWith(
                                            color: colors.textPrimaryMuted
                                                .withValues(alpha: 0.85),
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500,
                                            height: 16 / 11,
                                          ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: layout.s3),
                UserPanelControlButton(
                  icon: PhosphorIcon(
                    isMuted
                        ? PhosphorIconsFill.microphoneSlash
                        : PhosphorIconsFill.microphone,
                  ),
                  isActive: isMuted,
                  tooltip: isMuted
                      ? l10n.userAreaUnmuteMicrophone
                      : l10n.userAreaMuteMicrophone,
                  onPressed: () {
                    unawaited(
                      ref.read(voiceSessionProvider.notifier).toggleSelfMute(),
                    );
                  },
                ),
                SizedBox(width: layout.s1),
                UserPanelControlButton(
                  icon: PhosphorIcon(
                    isDeafened
                        ? PhosphorIconsFill.speakerSlash
                        : PhosphorIconsFill.speakerHigh,
                  ),
                  isActive: isDeafened,
                  tooltip: isDeafened
                      ? l10n.voiceControlUndeafen
                      : l10n.voiceControlDeafen,
                  onPressed: () {
                    unawaited(
                      ref
                          .read(voiceSessionProvider.notifier)
                          .toggleSelfDeafen(),
                    );
                  },
                ),
                SizedBox(width: layout.s1),
                UserPanelControlButton(
                  icon: const PhosphorIcon(PhosphorIconsRegular.gear),
                  tooltip: l10n.userAreaUserSettings,
                  onPressed: onSettingsTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
