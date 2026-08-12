import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_notification_menu_content.dart';
import 'package:fluxer_app/features/channels/providers/channel_notification_menu_provider.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_icon_button.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

typedef ChannelNotificationAnchorBuilder =
    Widget Function(
      BuildContext context, {
      required bool isOpen,
      required VoidCallback toggle,
    });

class ChannelNotificationSettingsButton extends ConsumerStatefulWidget {
  const ChannelNotificationSettingsButton({
    required this.channel,
    required this.anchorBuilder,
    super.key,
  });

  final Channel channel;
  final ChannelNotificationAnchorBuilder anchorBuilder;

  @override
  ConsumerState<ChannelNotificationSettingsButton> createState() =>
      _ChannelNotificationSettingsButtonState();
}

class _ChannelNotificationSettingsButtonState
    extends ConsumerState<ChannelNotificationSettingsButton>
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
    final bool useSheet = _shouldUseSheet(context);
    if (useSheet) {
      unawaited(_showSheetMenu());
      return;
    }
    if (_overlayController.isShowing) {
      _close();
      return;
    }
    _overlayController.show();
    unawaited(_animationController.forward());
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

  bool _shouldUseSheet(BuildContext context) {
    return isMobileLayout(context) ||
        (isWideLayout(context) &&
            isTouchPrimaryInput(ref) &&
            MediaQuery.sizeOf(context).width < 720);
  }

  Future<void> _showSheetMenu() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerBottomSheet.show<void>(
      context,
      title: l10n.notificationSettings,
      variant: FluxerBottomSheetVariant.menu,
      builder: (sheetContext, close) => ChannelNotificationMenuContent(
        channel: widget.channel,
        onClose: close,
      ),
    );
  }

  Widget _buildOverlay(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

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
              child: IntrinsicWidth(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 220,
                    maxWidth: 360,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.backgroundFloating,
                      borderRadius: layout.radiusSm,
                      border: Border.all(
                        color: colors.backgroundModifierAccent,
                      ),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.2),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: layout.s1),
                      child: ChannelNotificationMenuContent(
                        channel: widget.channel,
                        onClose: _close,
                        layout: ChannelNotificationMenuLayout.actionMenu,
                      ),
                    ),
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

ChannelNotificationSettingsButton buildChannelNotificationButton({
  required Channel channel,
}) {
  return ChannelNotificationSettingsButton(
    channel: channel,
    anchorBuilder:
        (
          BuildContext context, {
          required bool isOpen,
          required VoidCallback toggle,
        }) {
          return Consumer(
            builder: (BuildContext context, WidgetRef ref, _) {
              final FluxerLocalizations l10n = FluxerLocalizations.of(context);
              final AsyncValue<ChannelNotificationMenuState> menuState = ref
                  .watch(channelNotificationMenuStateProvider(channel));
              final bool isMuted = menuState.value?.isMuted ?? false;
              return ChannelHeaderIconButton(
                icon: isMuted
                    ? PhosphorIconsFill.bellSlash
                    : PhosphorIconsFill.bell,
                label: isMuted
                    ? l10n.channelHeaderNotificationSettingsMuted
                    : l10n.notificationSettings,
                isActive: isMuted || isOpen,
                onPressed: toggle,
              );
            },
          );
        },
  );
}
