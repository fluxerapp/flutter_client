import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_motion_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/channel_pins_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_header_icon_button.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/header/channel_pins_content.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_pins_open_request_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

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
    required this.anchorBuilder,
    super.key,
  });

  final String channelId;
  final String? guildId;
  final ChannelPinsAnchorBuilder anchorBuilder;

  @override
  ConsumerState<ChannelPinsOverlayButton> createState() =>
      _ChannelPinsOverlayButtonState();
}

const double _kPinsPopoutWidth = 480;
const double _kPinsPopoutHeight = 640;
const double _kPinsPopoutEdge = 12;
const double _kPinsPopoutGap = 4;

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
    if (!isMobileLayout(context) && _overlayController.isShowing) {
      _close();
      return;
    }
    _open();
  }

  void _open() {
    if (!mounted) {
      return;
    }
    if (!usesDesktopPointerUi(context)) {
      unawaited(
        showChannelPinsSheet(context, ref, channelId: widget.channelId),
      );
      return;
    }
    if (!_overlayController.isShowing) {
      _overlayController.show();
    }
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

  double _availablePopoutHeight(Size screen) {
    double top = _kPinsPopoutEdge;
    final RenderObject? anchor = context.findRenderObject();
    if (anchor is RenderBox && anchor.hasSize && anchor.attached) {
      top =
          anchor.localToGlobal(Offset(0, anchor.size.height)).dy +
          _kPinsPopoutGap;
    }
    return math.max(0, screen.height - top - _kPinsPopoutEdge);
  }

  Widget _buildOverlay(BuildContext context) {
    final Size screen = MediaQuery.sizeOf(context);
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
            targetAnchor: AlignmentDirectional.bottomEnd.resolve(
              Directionality.of(context),
            ),
            followerAnchor: AlignmentDirectional.topEnd.resolve(
              Directionality.of(context),
            ),
            offset: const Offset(0, _kPinsPopoutGap),
            child: Align(
              alignment: AlignmentDirectional.topEnd.resolve(
                Directionality.of(context),
              ),
              child: Container(
                width: math.min(
                  _kPinsPopoutWidth,
                  screen.width - _kPinsPopoutEdge * 2,
                ),
                height: math.min(
                  _kPinsPopoutHeight,
                  _availablePopoutHeight(screen),
                ),
                decoration: BoxDecoration(
                  borderRadius: context.layout.radiusLg,
                  boxShadow: fluxerDesktopPanelShadow(context),
                ),
                child: Material(
                  color: fluxerFormSurfaceBackground(context),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: context.layout.radiusLg,
                    side: BorderSide(
                      color: context.colors.backgroundModifierAccent,
                    ),
                  ),
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
    ref.listen<int>(channelPinsOpenRequestProvider, (int? _, int _) {
      _open();
    });
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
