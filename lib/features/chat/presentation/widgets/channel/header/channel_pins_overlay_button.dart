import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_pins_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_icon_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_pins_content.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

typedef ChannelPinsAnchorBuilder =
    Widget Function(
      BuildContext context, {
      required bool isOpen,
      required VoidCallback toggle,
    });

class ChannelPinsOverlayButton extends ConsumerStatefulWidget {
  const ChannelPinsOverlayButton({
    required this.channelId,
    required this.guildId,
    required this.hasUnreadPins,
    required this.anchorBuilder,
    super.key,
  });

  final String channelId;
  final String? guildId;
  final bool hasUnreadPins;
  final ChannelPinsAnchorBuilder anchorBuilder;

  @override
  ConsumerState<ChannelPinsOverlayButton> createState() =>
      _ChannelPinsOverlayButtonState();
}

class _ChannelPinsOverlayButtonState
    extends ConsumerState<ChannelPinsOverlayButton>
    with SingleTickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  final OverlayPortalController _overlayController = OverlayPortalController();
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: FluxerMotionTheme.normalDuration,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController.duration = context.motion.normal;
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggle() {
    if (isMobileLayout(context)) {
      unawaited(
        showChannelPinsSheet(context, ref, channelId: widget.channelId),
      );
      return;
    }
    if (_overlayController.isShowing) {
      _close();
      return;
    }
    _overlayController.show();
    _animationController.forward();
  }

  void _close() {
    unawaited(
      _animationController.reverse().then((_) {
        if (mounted && _overlayController.isShowing) {
          _overlayController.hide();
        }
      }),
    );
  }

  Widget _buildOverlay(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FluxerGestureDetector(
            onTap: _close,
            behavior: HitTestBehavior.opaque,
            child: const ColoredBox(color: Colors.transparent),
          ),
        ),
        FadeTransition(
          opacity: _fadeAnimation,
          child: CompositedTransformFollower(
            link: _layerLink,
            targetAnchor: Alignment.bottomRight,
            followerAnchor: Alignment.topRight,
            offset: const Offset(0, 4),
            child: Align(
              alignment: Alignment.topRight,
              child: Material(
                elevation: 8,
                borderRadius: context.layout.radiusLg,
                color: context.colors.backgroundSecondary,
                child: SizedBox(
                  width: 420,
                  height: 480,
                  child: ChannelPinsContent(
                    channelId: widget.channelId,
                    guildId: widget.guildId,
                    onClose: _close,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isOpen = _overlayController.isShowing;
    if (isMobileLayout(context)) {
      return widget.anchorBuilder(context, isOpen: false, toggle: _toggle);
    }
    return OverlayPortal(
      controller: _overlayController,
      overlayChildBuilder: _buildOverlay,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: widget.anchorBuilder(context, isOpen: isOpen, toggle: _toggle),
      ),
    );
  }
}

ChannelPinsOverlayButton buildChannelPinsButton({
  required String channelId,
  required String? guildId,
  required bool hasUnreadPins,
}) {
  return ChannelPinsOverlayButton(
    channelId: channelId,
    guildId: guildId,
    hasUnreadPins: hasUnreadPins,
    anchorBuilder:
        (
          BuildContext context, {
          required bool isOpen,
          required VoidCallback toggle,
        }) {
          final FluxerLocalizations l10n = FluxerLocalizations.of(context);
          return ChannelHeaderIconButton(
            icon: PhosphorIconsFill.pushPin,
            label: hasUnreadPins
                ? l10n.channelHeaderPinnedMessagesUnread
                : l10n.channelHeaderPinnedMessages,
            isActive: isOpen,
            showIndicator: hasUnreadPins,
            onPressed: toggle,
          );
        },
  );
}
