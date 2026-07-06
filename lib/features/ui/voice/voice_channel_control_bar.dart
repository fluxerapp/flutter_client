import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_chat_sheet.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_chat_unread_badge.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_capability_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kControlSize = 52;
const double _kControlGap = 10;

class VoiceChannelControlBar extends ConsumerWidget {
  const VoiceChannelControlBar({this.channelId, super.key});

  final String? channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final (
      bool isInVoice,
      bool isConnected,
      String? connectionId,
      String? channelId,
      String? guildId,
    ) = ref.watch(
      voiceSessionProvider.select(
        (VoiceSessionState s) => (
          s.isInVoice,
          s.isConnected,
          s.activeConnectionId,
          s.channelId,
          s.guildId,
        ),
      ),
    );
    if (!isInVoice) {
      return const SizedBox.shrink();
    }
    final VoiceState? selfVs = connectionId == null
        ? null
        : ref.watch(voiceStateForConnectionProvider(connectionId));
    final bool isMuted = selfVs?.selfMute ?? false;
    final bool isDeafened = selfVs?.selfDeaf ?? false;
    final bool isVideoOn = selfVs?.selfVideo ?? false;
    final bool isScreenSharing = selfVs?.selfStream ?? false;
    final bool canScreenShare = ref
        .watch(screenShareCapabilityProvider)
        .maybeWhen(data: (bool value) => value, orElse: () => false);
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.backgroundFloating,
                borderRadius: BorderRadius.circular(36),
                border: Border.all(color: const Color(0x14FFFFFF)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.22),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: _kControlGap,
                  children: <Widget>[
                    _VoiceControlCircle(
                      size: _kControlSize,
                      color: isMuted
                          ? context.colors.statusDanger
                          : context.colors.backgroundTertiary,
                      tooltip: isMuted
                          ? l10n.voiceControlUnmute
                          : l10n.voiceControlMute,
                      icon: isMuted
                          ? PhosphorIconsFill.microphoneSlash
                          : PhosphorIconsFill.microphone,
                      toggled: isMuted,
                      onPressed: () {
                        unawaited(
                          ref
                              .read(voiceSessionProvider.notifier)
                              .toggleSelfMute(),
                        );
                      },
                    ),
                    _VoiceControlCircle(
                      size: _kControlSize,
                      color: isDeafened
                          ? context.colors.statusDanger
                          : context.colors.backgroundTertiary,
                      tooltip: isDeafened
                          ? l10n.voiceControlUndeafen
                          : l10n.voiceControlDeafen,
                      icon: isDeafened
                          ? PhosphorIconsFill.speakerSlash
                          : PhosphorIconsFill.speakerHigh,
                      toggled: isDeafened,
                      onPressed: () {
                        unawaited(
                          ref
                              .read(voiceSessionProvider.notifier)
                              .toggleSelfDeafen(),
                        );
                      },
                    ),
                    _VoiceControlCircle(
                      size: _kControlSize,
                      color: isVideoOn
                          ? context.colors.statusOnline
                          : context.colors.backgroundTertiary,
                      tooltip: l10n.voiceControlVideo,
                      icon: PhosphorIconsFill.videoCamera,
                      toggled: isVideoOn,
                      onPressed: isConnected
                          ? () {
                              unawaited(
                                ref
                                    .read(voiceSessionProvider.notifier)
                                    .toggleSelfVideo(),
                              );
                            }
                          : null,
                    ),
                    if (canScreenShare)
                      _VoiceControlCircle(
                        size: _kControlSize,
                        color: isScreenSharing
                            ? context.colors.statusOnline
                            : context.colors.backgroundTertiary,
                        tooltip: l10n.voiceControlScreenShare,
                        icon: PhosphorIconsFill.monitor,
                        toggled: isScreenSharing,
                        onPressed: isConnected
                            ? () {
                                unawaited(
                                  ref
                                      .read(voiceSessionProvider.notifier)
                                      .toggleSelfStream(
                                        screenShareNotificationText: l10n
                                            .voiceScreenShareNotificationText,
                                      ),
                                );
                              }
                            : null,
                      ),
                    _VoiceControlCircle(
                      size: _kControlSize,
                      color: context.colors.statusDanger,
                      tooltip: l10n.voiceControlDisconnect,
                      icon: PhosphorIconsFill.phoneDisconnect,
                      onPressed: () {
                        if (context.mounted && isMobileLayout(context)) {
                          final String location = ref.read(
                            currentLocationProvider,
                          );
                          if (isFavoritesChannelRoute(location)) {
                            returnToFavoritesList(ref);
                          } else if (guildId != null && guildId.isNotEmpty) {
                            navigateToContent(
                              context,
                              RoutePaths.guild(guildId),
                            );
                          }
                        }
                        unawaited(
                          ref.read(voiceSessionProvider.notifier).leaveVoice(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VoiceControlCircle extends StatefulWidget {
  const _VoiceControlCircle({
    required this.size,
    required this.color,
    required this.tooltip,
    required this.icon,
    required this.onPressed,
    this.toggled = false,
  });

  final double size;
  final Color color;
  final String tooltip;
  final PhosphorIconData icon;
  final VoidCallback? onPressed;
  final bool toggled;

  @override
  State<_VoiceControlCircle> createState() => _VoiceControlCircleState();
}

class _VoiceControlCircleState extends State<_VoiceControlCircle> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (widget.onPressed == null || _pressed == value) {
      return;
    }
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.onPressed != null;
    final Widget circle = AnimatedScale(
      scale: _pressed ? 0.9 : 1,
      duration: const Duration(milliseconds: 110),
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
        child: Center(
          child: ExcludeSemantics(
            child: PhosphorIcon(
              widget.icon,
              size: 24,
              color: context.colors.textPrimary.withValues(
                alpha: enabled ? 1 : 0.45,
              ),
            ),
          ),
        ),
      ),
    );
    return Semantics(
      button: true,
      label: widget.tooltip,
      toggled: widget.toggled,
      enabled: enabled,
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapDown: (_) => _setPressed(true),
          onTapUp: (_) => _setPressed(false),
          onTapCancel: () => _setPressed(false),
          onTap: widget.onPressed,
          child: circle,
        ),
      ),
    );
  }
}

class ChatButton extends ConsumerWidget {
  const ChatButton({
    required this.channelId,
    required this.channelName,
    super.key,
  });

  final String channelId;
  final String? channelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool textChatSupported =
        ref.watch(voiceChannelTextChatSupportedProvider(channelId)).value ??
        false;
    if (!textChatSupported) {
      return const SizedBox.shrink();
    }
    final UnreadState? unread = ref
        .watch(channelUnreadProvider(channelId))
        .value;
    final String semanticsLabel = voiceChatAccessibilityLabel(
      l10n: l10n,
      unread: unread,
    );
    return GestureDetector(
      onTap: () {
        unawaited(
          showVoiceChannelChatSheet(
            context,
            channelId: channelId,
            channelName: channelName,
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Semantics(
            button: true,
            label: semanticsLabel,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: context.colors.backgroundFloating.withValues(
                  alpha: 0.85,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: PhosphorIcon(
                  PhosphorIconsFill.chatTeardrop,
                  size: 20,
                  color: context.colors.textPrimary,
                ),
              ),
            ),
          ),
          VoiceChatUnreadBadge(channelId: channelId),
        ],
      ),
    );
  }
}
