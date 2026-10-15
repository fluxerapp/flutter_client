import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/mobile_composer_bar.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_live_gradient.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/voice_message_recording_controller.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/services/voice_message_send.dart';
import 'package:fluxer_app/features/chat/utils/attachments/voice_message_constants.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_variant.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceMessageDiscardButton extends StatelessWidget {
  const VoiceMessageDiscardButton({
    required this.controller,
    required this.size,
    super.key,
  });

  final VoiceMessageRecordingController controller;
  final FluxerButtonSize size;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool armed = controller.discardPreview;
    final bool locked = controller.isLocked;
    final VoidCallback? onPressed = controller.isSending
        ? null
        : () => unawaited(controller.stop(send: false));
    return IgnorePointer(
      key: controller.trashKey,
      ignoring: !locked,
      child: armed
          ? FluxerButton.circle(
              icon: PhosphorIconsFill.trash,
              semanticLabel: l10n.voiceMessageDiscard,
              variant: FluxerButtonVariant.dangerPrimary,
              iconSize: 20,
              size: size,
              onPressed: onPressed,
            )
          : FluxerButton.circleAlt(
              icon: PhosphorIconsFill.trash,
              semanticLabel: l10n.voiceMessageDiscard,
              size: size,
              onPressed: onPressed,
            ),
    );
  }
}

class _RecordingIndicator extends StatelessWidget {
  const _RecordingIndicator({
    required this.controller,
    required this.rowExtent,
  });

  final VoiceMessageRecordingController controller;
  final double? rowExtent;

  @override
  Widget build(BuildContext context) {
    final Widget indicator = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: context.colors.accentDanger,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        ValueListenableBuilder<int>(
          valueListenable: controller.durationMs,
          builder: (BuildContext context, int durationMs, _) {
            return Text(
              formatVoiceDurationMs(durationMs),
              style: context.textStyles.label.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
              ),
            );
          },
        ),
      ],
    );
    if (rowExtent == null) {
      return indicator;
    }
    return SizedBox(
      height: rowExtent,
      child: Center(child: indicator),
    );
  }
}

class _VoiceMessageRecordingBackgroundClipper extends CustomClipper<Path> {
  const _VoiceMessageRecordingBackgroundClipper(this.shape);

  final ShapeBorder shape;

  @override
  Path getClip(Size size) => shape.getOuterPath(Offset.zero & size);

  @override
  bool shouldReclip(covariant _VoiceMessageRecordingBackgroundClipper old) =>
      old.shape != shape;
}

class VoiceMessageRecordingBar extends StatelessWidget {
  const VoiceMessageRecordingBar({
    required this.controller,
    required this.trailing,
    required this.actionSize,
    required this.contentPadding,
    required this.backgroundShape,
    this.rowExtent,
    super.key,
  });

  final VoiceMessageRecordingController controller;
  final Widget trailing;
  final FluxerButtonSize actionSize;
  final EdgeInsetsGeometry contentPadding;
  final ShapeBorder backgroundShape;
  final double? rowExtent;

  static double heightFor(
    FluxerButtonSize actionSize, {
    double verticalPadding = WideComposerLayout.densePaddingY,
  }) {
    return actionSize.height + verticalPadding * 2;
  }

  static ShapeBorder wideBackgroundShape({required bool hasActionStack}) {
    const Radius corner = Radius.circular(
      WideComposerLayout.boxRadius - WideComposerLayout.ringWidth,
    );
    return RoundedRectangleBorder(
      borderRadius: hasActionStack
          ? const BorderRadius.vertical(bottom: corner)
          : const BorderRadius.all(corner),
    );
  }

  static ShapeBorder mobileBackgroundShape({required bool hasHeader}) {
    const Radius corner = Radius.circular(
      MobileComposerLayout.radius - MobileComposerLayout.borderWidth,
    );
    return RoundedSuperellipseBorder(
      borderRadius: hasHeader
          ? const BorderRadius.vertical(bottom: corner)
          : const BorderRadius.all(corner),
    );
  }

  Widget _actionCell(Widget child, {double? width}) {
    final double extent = rowExtent!;
    return SizedBox(
      width: width ?? MobileComposerLayout.buttonExtent,
      height: extent,
      child: Center(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool mobileRow = rowExtent != null;
    final Widget discard = VoiceMessageDiscardButton(
      controller: controller,
      size: actionSize,
    );
    return ClipPath(
      clipper: _VoiceMessageRecordingBackgroundClipper(backgroundShape),
      child: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Positioned.fill(
            child: VoiceMessageLiveGradient(
              rmsLevel: controller.rmsLevel,
              clipShape: backgroundShape,
            ),
          ),
          Padding(
            padding: contentPadding,
            child: Row(
              crossAxisAlignment: mobileRow
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.end,
              children: <Widget>[
                if (mobileRow) _actionCell(discard) else discard,
                const SizedBox(width: 8),
                _RecordingIndicator(
                  controller: controller,
                  rowExtent: rowExtent,
                ),
                const Spacer(),
                if (mobileRow)
                  _actionCell(trailing, width: MobileComposerLayout.sendExtent)
                else
                  trailing,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VoiceMessageLockChip extends StatelessWidget {
  const VoiceMessageLockChip({required this.controller, super.key});

  final VoiceMessageRecordingController controller;

  @override
  Widget build(BuildContext context) {
    final bool showLockedStyle = controller.isLocked;
    final bool showActive = controller.lockPreview || controller.isLocked;
    return IgnorePointer(
      child: Opacity(
        opacity: showActive ? 1 : 0.55,
        child: Container(
          key: controller.lockKey,
          width: 36,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: showLockedStyle ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x40000000),
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                showLockedStyle
                    ? PhosphorIconsFill.lockSimple
                    : PhosphorIconsFill.lockSimpleOpen,
                size: 18,
                color: showLockedStyle
                    ? context.colors.accentSuccess
                    : Colors.white,
              ),
              if (!showLockedStyle)
                const Icon(
                  PhosphorIconsBold.caretUp,
                  size: 16,
                  color: Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class VoiceMessageRecordingSendButton extends StatelessWidget {
  const VoiceMessageRecordingSendButton({
    required this.controller,
    required this.size,
    super.key,
  });

  final VoiceMessageRecordingController controller;
  final FluxerButtonSize size;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerButton.circle(
      icon: PhosphorIconsFill.paperPlaneRight,
      semanticLabel: l10n.voiceMessageSend,
      iconSize: 20,
      size: size,
      onPressed: controller.isSending
          ? null
          : () => unawaited(
              controller.stop(
                send:
                    controller.durationMs.value >=
                    kVoiceMessageMinSendDurationMs,
              ),
            ),
    );
  }
}
