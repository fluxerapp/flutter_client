import 'dart:async';
import 'dart:ui' show lerpDouble;

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
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/voice/presentation/sheets/voice_channel_chat_sheet.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_chat_unread_badge.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_capability_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_text_chat_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kVoiceControlCircleSize = 52;
const double kVoiceControlCompactCircleSize = 44;
const double kVoiceControlGap = 10;
const double kVoiceControlBarVerticalPadding = 12;
const double kVoiceControlPillVerticalPadding = 10;
const double kVoiceControlSheetHandleHeight = 12;
const double kVoiceControlEmbeddedHandleGap = 4;
const double kVoiceControlEmbeddedBottomPadding = 8;

enum VoiceChannelControlBarStyle { floating, embedded }

double voiceChannelControlPillHeight() {
  return kVoiceControlCircleSize + (kVoiceControlPillVerticalPadding * 2);
}

double voiceChannelControlBarSectionHeight() {
  return voiceChannelControlPillHeight() +
      (kVoiceControlBarVerticalPadding * 2);
}

const double kVoiceControlMorphingBarBorderWidth = 1;
const double kVoiceControlMorphingCollapsedRadius = 36;
const double kVoiceControlMorphingExpandedRadius = 20;

double voiceChannelControlMorphingBarRadius(double expansion) {
  final double t = expansion.clamp(0.0, 1.0);
  return kVoiceControlMorphingCollapsedRadius +
      ((kVoiceControlMorphingExpandedRadius -
              kVoiceControlMorphingCollapsedRadius) *
          t);
}

double voiceChannelControlMorphingHeaderHeight() {
  return kVoiceControlSheetHandleHeight +
      kVoiceControlEmbeddedHandleGap +
      kVoiceControlCircleSize +
      kVoiceControlEmbeddedBottomPadding +
      (kVoiceControlMorphingBarBorderWidth * 2);
}

double voiceChannelControlMorphingCollapsedWidth({required int buttonCount}) {
  if (buttonCount <= 0) {
    return 0;
  }
  const double embeddedHorizontalPadding = 10;
  return (embeddedHorizontalPadding * 2) +
      (buttonCount * kVoiceControlCircleSize) +
      ((buttonCount - 1) * kVoiceControlGap) +
      (kVoiceControlMorphingBarBorderWidth * 2);
}

int voiceChannelControlButtonCount({required bool canScreenShare}) {
  return canScreenShare ? 5 : 4;
}

double voiceChannelControlMorphingWidthExpansion({
  required double barInnerWidth,
  required double collapsedBarInnerWidth,
  required double expandedBarInnerWidth,
}) {
  if (expandedBarInnerWidth <= collapsedBarInnerWidth) {
    return 1;
  }
  return ((barInnerWidth - collapsedBarInnerWidth) /
          (expandedBarInnerWidth - collapsedBarInnerWidth))
      .clamp(0.0, 1.0);
}

({double sideInset, double spacing}) voiceChannelControlMorphingRowLayout({
  required double rowWidth,
  required int buttonCount,
  required double expansion,
}) {
  if (buttonCount <= 0) {
    return (sideInset: 0, spacing: 0);
  }
  final int gapCount = buttonCount - 1;
  final double compactWidth =
      (buttonCount * kVoiceControlCircleSize) + (gapCount * kVoiceControlGap);
  final double t = expansion.clamp(0.0, 1.0);
  final double expandedGap =
      (rowWidth - (buttonCount * kVoiceControlCircleSize)) / (buttonCount + 1);
  final double collapsedSideInset = gapCount == 0
      ? 0
      : ((rowWidth - compactWidth) / 2).clamp(0.0, double.infinity);
  return (
    sideInset: lerpDouble(collapsedSideInset, expandedGap, t) ?? expandedGap,
    spacing: lerpDouble(kVoiceControlGap, expandedGap, t) ?? expandedGap,
  );
}

double voiceChannelControlCollapsedFootprint(BuildContext context) {
  return (kVoiceControlBarVerticalPadding * 2) +
      voiceChannelControlMorphingHeaderHeight() +
      MediaQuery.viewPaddingOf(context).bottom;
}

const List<BoxShadow> kVoiceControlFloatingBarShadow = <BoxShadow>[
  BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.22),
    blurRadius: 18,
    offset: Offset(0, 6),
  ),
];

BoxDecoration voiceChannelControlMorphingSurfaceDecoration(
  BuildContext context, {
  required BorderRadius borderRadius,
}) {
  return BoxDecoration(
    color: context.colors.backgroundFloating,
    borderRadius: borderRadius,
    border: Border.all(color: const Color(0x14FFFFFF)),
  );
}

BoxDecoration voiceChannelControlFloatingDecoration(
  BuildContext context, {
  required BorderRadius borderRadius,
}) {
  return BoxDecoration(
    color: context.colors.backgroundFloating,
    borderRadius: borderRadius,
    border: Border.all(color: const Color(0x14FFFFFF)),
    boxShadow: kVoiceControlFloatingBarShadow,
  );
}

class VoiceChannelControlBar extends ConsumerWidget {
  const VoiceChannelControlBar({this.channelId, super.key});

  final String? channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
    return SafeArea(
      top: false,
      child: VoiceChannelControlBarContent(
        channelId: channelId,
        guildId: guildId,
        isConnected: isConnected,
        connectionId: connectionId,
      ),
    );
  }
}

class VoiceChannelControlBarContent extends ConsumerWidget {
  const VoiceChannelControlBarContent({
    required this.isConnected,
    this.channelId,
    this.guildId,
    this.connectionId,
    this.style = VoiceChannelControlBarStyle.floating,
    this.barInnerWidth,
    this.expansion,
    this.canScreenShare,
    this.useCompactControls = false,
    super.key,
  });

  final String? channelId;
  final String? guildId;
  final String? connectionId;
  final bool isConnected;
  final VoiceChannelControlBarStyle style;
  final double? barInnerWidth;
  final double? expansion;
  final bool? canScreenShare;
  final bool useCompactControls;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceState? selfVs = connectionId == null
        ? null
        : ref.watch(voiceStateForConnectionProvider(connectionId!));
    final bool isMuted = selfVs?.selfMute ?? false;
    final bool isDeafened = selfVs?.selfDeaf ?? false;
    final bool isVideoOn = selfVs?.selfVideo ?? false;
    final bool isScreenSharing = selfVs?.selfStream ?? false;
    final bool canScreenShare =
        this.canScreenShare ??
        ref
            .watch(screenShareCapabilityProvider)
            .maybeWhen(data: (bool value) => value, orElse: () => false);
    final bool isEmbedded = style == VoiceChannelControlBarStyle.embedded;
    final double buttonSize = useCompactControls
        ? kVoiceControlCompactCircleSize
        : kVoiceControlCircleSize;
    final int buttonCount = voiceChannelControlButtonCount(
      canScreenShare: canScreenShare,
    );
    void onControlPressed(VoidCallback action) {
      ref.read(voiceCallOverlayProvider.notifier).reveal();
      action();
    }

    final List<Widget> controlButtons = <Widget>[
      _VoiceControlCircle(
        size: buttonSize,
        color: isMuted
            ? context.colors.statusDanger
            : context.colors.backgroundTertiary,
        tooltip: isMuted ? l10n.voiceControlUnmute : l10n.voiceControlMute,
        icon: isMuted
            ? PhosphorIconsFill.microphoneSlash
            : PhosphorIconsFill.microphone,
        toggled: isMuted,
        onPressed: () {
          onControlPressed(() {
            unawaited(ref.read(voiceSessionProvider.notifier).toggleSelfMute());
          });
        },
      ),
      _VoiceControlCircle(
        size: buttonSize,
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
          onControlPressed(() {
            unawaited(
              ref.read(voiceSessionProvider.notifier).toggleSelfDeafen(),
            );
          });
        },
      ),
      _VoiceControlCircle(
        size: buttonSize,
        color: isVideoOn
            ? context.colors.statusOnline
            : context.colors.backgroundTertiary,
        tooltip: l10n.voiceControlVideo,
        icon: PhosphorIconsFill.videoCamera,
        toggled: isVideoOn,
        onPressed: isConnected
            ? () {
                onControlPressed(() {
                  unawaited(
                    ref.read(voiceSessionProvider.notifier).toggleSelfVideo(),
                  );
                });
              }
            : null,
      ),
      if (canScreenShare)
        _VoiceControlCircle(
          size: buttonSize,
          color: isScreenSharing
              ? context.colors.statusOnline
              : context.colors.backgroundTertiary,
          tooltip: l10n.voiceControlScreenShare,
          icon: PhosphorIconsFill.monitor,
          toggled: isScreenSharing,
          onPressed: isConnected
              ? () {
                  onControlPressed(() {
                    unawaited(
                      ref
                          .read(voiceSessionProvider.notifier)
                          .toggleSelfStream(
                            screenShareNotificationText:
                                l10n.voiceScreenShareNotificationText,
                          ),
                    );
                  });
                }
              : null,
        ),
      _VoiceControlCircle(
        size: buttonSize,
        color: context.colors.statusDanger,
        tooltip: l10n.voiceControlDisconnect,
        icon: PhosphorIconsFill.phoneDisconnect,
        onPressed: () {
          onControlPressed(() {
            if (context.mounted && isMobileLayout(context)) {
              final String location = ref.read(currentLocationProvider);
              if (isFavoritesChannelRoute(location)) {
                returnToFavoritesList(ref);
              } else if (guildId != null && guildId!.isNotEmpty) {
                navigateToContent(context, RoutePaths.guild(guildId!));
              }
            }
            unawaited(ref.read(voiceSessionProvider.notifier).leaveVoice());
          });
        },
      ),
    ];
    final Widget controls;
    if (isEmbedded && barInnerWidth != null && expansion != null) {
      const double embeddedHorizontalPadding = 10;
      final double rowWidth = barInnerWidth! - (embeddedHorizontalPadding * 2);
      final ({double sideInset, double spacing}) rowLayout =
          voiceChannelControlMorphingRowLayout(
            rowWidth: rowWidth,
            buttonCount: buttonCount,
            expansion: expansion!,
          );
      controls = Padding(
        padding: EdgeInsets.symmetric(horizontal: rowLayout.sideInset),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(spacing: rowLayout.spacing, children: controlButtons),
        ),
      );
    } else {
      controls = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: kVoiceControlGap,
        children: controlButtons,
      );
    }
    if (isEmbedded) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(
          10,
          kVoiceControlEmbeddedHandleGap,
          10,
          kVoiceControlEmbeddedBottomPadding,
        ),
        child: controls,
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: kVoiceControlBarVerticalPadding,
      ),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DecoratedBox(
            decoration: voiceChannelControlFloatingDecoration(
              context,
              borderRadius: BorderRadius.circular(36),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: kVoiceControlPillVerticalPadding,
              ),
              child: controls,
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
        duration: context.motion.normal,
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
        child: FluxerGestureDetector(
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
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        FluxerButton.circle(
          icon: PhosphorIconsFill.chatTeardrop,
          variant: FluxerButtonVariant.secondary,
          size: FluxerButtonSize.small,
          iconSize: 20,
          semanticLabel: semanticsLabel,
          onPressed: () {
            unawaited(
              showVoiceChannelChatSheet(
                context,
                channelId: channelId,
                channelName: channelName,
              ),
            );
          },
        ),
        VoiceChatUnreadBadge(channelId: channelId),
      ],
    );
  }
}
