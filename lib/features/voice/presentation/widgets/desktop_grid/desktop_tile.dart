import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/voice/voice_speaking_ring.dart';
import 'package:fluxer_app/features/ui/voice/voice_tile_metrics.dart';
import 'package:fluxer_app/features/voice/domain/desktop_tile_presentation.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_device_pill.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_nameplate.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_style.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_grid/desktop_tile_watch_overlay.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_style.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_visibility.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/gateway.dart';

class VoiceDesktopTile extends StatefulWidget {
  const VoiceDesktopTile({
    required this.presentation,
    required this.media,
    required this.surfaceColor,
    required this.voice,
    required this.display,
    required this.isScreenShare,
    required this.speakingRingEnabled,
    required this.speakingIdentity,
    required this.ringAroundAvatar,
    required this.showConnectionId,
    required this.showMenuButton,
    required this.onTap,
    required this.onContextMenu,
    this.onWatch,
    this.streamBadge,
    this.overlay,
    this.extraDeviceCount = 0,
    this.expandedDeviceCount = 0,
    this.onToggleDevices,
    super.key,
  });

  final VoiceDesktopTilePresentation presentation;
  final Widget media;
  final Color surfaceColor;
  final VoiceState voice;
  final String display;
  final bool isScreenShare;
  final bool speakingRingEnabled;
  final String speakingIdentity;
  final bool ringAroundAvatar;
  final bool showConnectionId;
  final bool showMenuButton;
  final VoidCallback onTap;
  final ValueChanged<Offset> onContextMenu;
  final VoidCallback? onWatch;
  final Widget? streamBadge;
  final Widget? overlay;
  final int extraDeviceCount;
  final int expandedDeviceCount;
  final VoidCallback? onToggleDevices;

  @override
  State<VoiceDesktopTile> createState() => _VoiceDesktopTileState();
}

class _VoiceDesktopTileState extends State<VoiceDesktopTile> {
  bool _focused = false;

  bool get _isGrid => widget.presentation == VoiceDesktopTilePresentation.grid;

  bool get _isFocusMain =>
      widget.presentation == VoiceDesktopTilePresentation.focusMain;

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(
      voiceDesktopTileRadius(widget.presentation),
    );
    return FocusableActionDetector(
      includeFocusSemantics: false,
      onShowFocusHighlight: (bool value) {
        if (_focused != value) {
          setState(() => _focused = value);
        }
      },
      actions: <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (ActivateIntent intent) {
            widget.onTap();
            return null;
          },
        ),
      },
      child: FluxerGestureDetector(
        behavior: HitTestBehavior.opaque,
        excludeFromSemantics: true,
        onTap: widget.onTap,
        onSecondaryTapUp: (TapUpDetails details) =>
            widget.onContextMenu(details.globalPosition),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: ColoredBox(
            color: widget.surfaceColor,
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  _buildStack(context, constraints.biggest, borderRadius),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStack(
    BuildContext context,
    Size size,
    BorderRadius borderRadius,
  ) {
    final bool compact = size.width <= kVoiceDesktopTileCompactWidth;
    final double inset = compact
        ? kVoiceDesktopTileHudCompactInset
        : kVoiceDesktopTileHudInset;
    final Widget? devicePill = _devicePill(context, compact: compact);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        widget.media,
        if (!widget.isScreenShare)
          VoiceSpeakingRingLayer(
            enabled:
                widget.speakingRingEnabled &&
                (widget.ringAroundAvatar || !_isFocusMain),
            identity: widget.speakingIdentity,
            aroundAvatar: widget.ringAroundAvatar,
            avatarSizeOf: voiceDesktopTileAvatarSize,
            borderRadius: borderRadius,
            ringWidth: widget.ringAroundAvatar
                ? kVoiceSpeakingRingWidth
                : kVoiceDesktopTileSpeakingWidth,
          ),
        ?widget.overlay,
        if (widget.onWatch != null)
          VoiceDesktopTileWatchOverlay(onWatch: widget.onWatch!),
        if (_isGrid && widget.streamBadge != null)
          PositionedDirectional(
            top: kVoiceDesktopTileHudInset,
            end: kVoiceDesktopTileHudInset,
            child: IgnorePointer(child: widget.streamBadge),
          ),
        if (devicePill != null)
          PositionedDirectional(
            top: inset,
            start: inset,
            child: VoiceHudVisibility(child: devicePill),
          ),
        if (size.width >= VoiceDesktopTileNameplate.minTileWidth)
          PositionedDirectional(
            start: inset,
            end: inset,
            bottom: inset,
            child: VoiceHudVisibility(
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: VoiceDesktopTileNameplate(
                  voice: widget.voice,
                  display: widget.display,
                  tileWidth: size.width,
                  showConnectionId: widget.showConnectionId,
                  onOpenMenu: _isGrid && widget.showMenuButton
                      ? widget.onContextMenu
                      : null,
                ),
              ),
            ),
          ),
        if (_focused)
          IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                border: Border.all(
                  color: kVoiceHudFocusBorder,
                  width: kVoiceHudFocusBorderWidth,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget? _devicePill(BuildContext context, {required bool compact}) {
    final VoidCallback? onToggle = widget.onToggleDevices;
    if (!_isGrid || onToggle == null) {
      return null;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (widget.extraDeviceCount > 0) {
      return VoiceDesktopTileDevicePill(
        label: '+${widget.extraDeviceCount}',
        tooltip: l10n.voiceParticipantOtherDevicesLabel(
          widget.extraDeviceCount,
        ),
        compact: compact,
        onPressed: onToggle,
      );
    }
    if (widget.expandedDeviceCount > 1) {
      return VoiceDesktopTileDevicePill(
        label: '-${widget.expandedDeviceCount}',
        tooltip: l10n.voiceParticipantCollapseDevices,
        compact: compact,
        onPressed: onToggle,
      );
    }
    return null;
  }
}
