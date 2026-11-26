import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/desktop_control_bar.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/desktop_stage_insets.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_style.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_visibility.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceDesktopStage extends ConsumerWidget {
  const VoiceDesktopStage({
    required this.child,
    this.header,
    this.cornerControls = const <Widget>[],
    super.key,
  });

  final Widget child;
  final Widget? header;
  final List<Widget> cornerControls;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final VoiceCallOverlay overlay = ref.read(
      voiceCallOverlayProvider.notifier,
    );
    final double headerHeight = header == null
        ? 0
        : context.layout.headerHeight;
    return MouseRegion(
      onEnter: (PointerEnterEvent event) =>
          overlay.notePointerActivity(kind: event.kind),
      onHover: (PointerHoverEvent event) =>
          overlay.notePointerActivity(kind: event.kind),
      onExit: (PointerExitEvent event) =>
          overlay.notePointerExit(kind: event.kind),
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (PointerDownEvent event) =>
            overlay.notePointerActivity(kind: event.kind),
        child: ColoredBox(
          color: kVoiceHudSurface,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final ({double end, double bottom}) corner = _cornerInsets(
                stageWidth: constraints.maxWidth,
              );
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  VoiceDesktopStageInsets(
                    header: headerHeight,
                    footer: kVoiceHudFooterHeight,
                    child: child,
                  ),
                  if (header != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: VoiceHudVisibility(child: header!),
                    ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: VoiceHudVisibility(child: _VoiceDesktopFooter()),
                  ),
                  if (cornerControls.isNotEmpty)
                    PositionedDirectional(
                      end: corner.end,
                      bottom: corner.bottom,
                      child: VoiceHudVisibility(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: kVoiceHudCornerGap,
                          children: cornerControls,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  ({double end, double bottom}) _cornerInsets({required double stageWidth}) {
    final double end = (stageWidth * kVoiceHudCornerInsetFraction).clamp(
      kVoiceHudCornerMinInset,
      kVoiceHudCornerMaxInset,
    );
    final double cornerWidth =
        (cornerControls.length * kVoiceHudCornerButtonSize) +
        ((cornerControls.length - 1) * kVoiceHudCornerGap);
    final double freeBesideBar = (stageWidth - kVoiceHudBarMaxWidth) / 2;
    final bool overlapsBar =
        freeBesideBar < cornerWidth + end + kVoiceHudCornerGap;
    return (
      end: end,
      bottom: overlapsBar
          ? kVoiceHudFooterHeight
          : kVoiceHudFooterBottomPadding +
                (kVoiceHudBarHeight - kVoiceHudCornerButtonSize) / 2,
    );
  }
}

class _VoiceDesktopFooter extends StatelessWidget {
  const _VoiceDesktopFooter();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: -kVoiceHudEdgeGradientExtension,
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: kVoiceHudFooterGradient),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            kVoiceHudFooterHorizontalPadding,
            kVoiceHudFooterTopPadding,
            kVoiceHudFooterHorizontalPadding,
            kVoiceHudFooterBottomPadding,
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: VoiceDesktopControlBar(),
            ),
          ),
        ),
      ],
    );
  }
}
