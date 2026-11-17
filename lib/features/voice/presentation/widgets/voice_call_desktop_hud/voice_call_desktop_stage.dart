import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_desktop_hud/voice_call_desktop_control_bar.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_desktop_hud/voice_call_hud_style.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceCallDesktopStage extends ConsumerWidget {
  const VoiceCallDesktopStage({
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
    final bool showsHud = ref.watch(
      voiceCallOverlayProvider.select(
        (VoiceCallOverlayState state) => state.showsOverlay,
      ),
    );
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
          color: kVoiceCallHudSurface,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final ({double end, double bottom}) corner = _cornerInsets(
                stageWidth: constraints.maxWidth,
              );
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: headerHeight,
                      bottom: kVoiceCallHudFooterHeight,
                    ),
                    child: child,
                  ),
                  if (header != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: VoiceCallDesktopHudFade(
                        visible: showsHud,
                        child: header!,
                      ),
                    ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: VoiceCallDesktopHudFade(
                      visible: showsHud,
                      child: const _VoiceCallDesktopFooter(),
                    ),
                  ),
                  if (cornerControls.isNotEmpty)
                    PositionedDirectional(
                      end: corner.end,
                      bottom: corner.bottom,
                      child: VoiceCallDesktopHudFade(
                        visible: showsHud,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: kVoiceCallHudCornerGap,
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
    final double end = (stageWidth * kVoiceCallHudCornerInsetFraction).clamp(
      kVoiceCallHudCornerMinInset,
      kVoiceCallHudCornerMaxInset,
    );
    final double cornerWidth =
        (cornerControls.length * kVoiceCallHudCornerButtonSize) +
        ((cornerControls.length - 1) * kVoiceCallHudCornerGap);
    final double freeBesideBar = (stageWidth - kVoiceCallHudBarMaxWidth) / 2;
    final bool overlapsBar =
        freeBesideBar < cornerWidth + end + kVoiceCallHudCornerGap;
    return (
      end: end,
      bottom: overlapsBar
          ? kVoiceCallHudFooterHeight
          : kVoiceCallHudFooterBottomPadding +
                (kVoiceCallHudBarHeight - kVoiceCallHudCornerButtonSize) / 2,
    );
  }
}

class VoiceCallDesktopHudFade extends StatelessWidget {
  const VoiceCallDesktopHudFade({
    required this.visible,
    required this.child,
    super.key,
  });

  final bool visible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !visible,
      child: AnimatedOpacity(
        duration: context.motion.panel,
        curve: context.motion.curve,
        opacity: visible ? 1 : 0,
        child: child,
      ),
    );
  }
}

class _VoiceCallDesktopFooter extends StatelessWidget {
  const _VoiceCallDesktopFooter();

  @override
  Widget build(BuildContext context) {
    return const Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: -kVoiceCallHudEdgeGradientExtension,
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: kVoiceCallHudFooterGradient),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            kVoiceCallHudFooterHorizontalPadding,
            kVoiceCallHudFooterTopPadding,
            kVoiceCallHudFooterHorizontalPadding,
            kVoiceCallHudFooterBottomPadding,
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: VoiceCallDesktopControlBar(),
            ),
          ),
        ),
      ],
    );
  }
}
