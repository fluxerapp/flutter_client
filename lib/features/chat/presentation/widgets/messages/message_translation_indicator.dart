import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_app/features/ui/animation/animation_controller_visibility_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/app_locale_display.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MessageTranslationIndicator extends StatelessWidget {
  const MessageTranslationIndicator({
    required this.translation,
    required this.onToggleOriginal,
    super.key,
  });

  final MessageTranslation translation;
  final VoidCallback onToggleOriginal;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle style = _translationFooterStyle(context);
    if (translation.showOriginal) {
      return _TranslationFooter(
        style: style,
        child: FluxerGestureDetector(
          onTap: onToggleOriginal,
          child: Text(l10n.chatMessageSeeTranslation, style: style),
        ),
      );
    }
    final String languageName = appLanguageDisplayName(
      translation.sourceLanguageCode,
    );
    return _TranslationFooter(
      style: style,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          if (languageName.isNotEmpty)
            Text(
              '${l10n.chatMessageTranslatedFrom(languageName)}  ·  ',
              style: style,
            ),
          FluxerGestureDetector(
            onTap: onToggleOriginal,
            child: Text(l10n.chatMessageSeeOriginal, style: style),
          ),
        ],
      ),
    );
  }
}

class MessageTranslatingIndicator extends StatelessWidget {
  const MessageTranslatingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Semantics(
      label: l10n.chatMessageTranslating,
      child: _ShimmeringTranslationStatus(text: l10n.chatMessageTranslating),
    );
  }
}

TextStyle _translationFooterStyle(BuildContext context) {
  return context.textStyles.smallText.copyWith(
    color: context.colors.textTertiaryMuted,
    fontSize: 12,
  );
}

class _TranslationFooter extends StatelessWidget {
  const _TranslationFooter({required this.style, required this.child});

  final TextStyle style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: <Widget>[
          PhosphorIcon(
            PhosphorIconsBold.translate,
            size: 12,
            color: style.color,
          ),
          const SizedBox(width: 4),
          Flexible(child: child),
        ],
      ),
    );
  }
}

class _ShimmeringTranslationStatus extends StatefulWidget {
  const _ShimmeringTranslationStatus({required this.text});

  final String text;

  @override
  State<_ShimmeringTranslationStatus> createState() =>
      _ShimmeringTranslationStatusState();
}

class _ShimmeringTranslationStatusState
    extends State<_ShimmeringTranslationStatus>
    with SingleTickerProviderStateMixin {
  static const Duration _kDuration = Duration(milliseconds: 1400);

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _kDuration);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle style = _translationFooterStyle(context);
    final Color base = style.color ?? context.colors.textTertiaryMuted;
    final bool animationsEnabled = !MediaQuery.disableAnimationsOf(context);
    _controller.syncWithVisibility(
      isVisible: true,
      animationsEnabled: animationsEnabled,
    );
    final Color maskColor = animationsEnabled ? Colors.white : base;
    final Widget status = _TranslationFooter(
      style: style.copyWith(color: maskColor),
      child: Text(widget.text, style: style.copyWith(color: maskColor)),
    );
    if (!animationsEnabled) {
      return status;
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        final double t = _controller.value;
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment(-1.5 + 3 * t, 0),
              end: Alignment(-0.5 + 3 * t, 0),
              colors: <Color>[
                base.withValues(alpha: 0.35),
                base,
                base.withValues(alpha: 0.35),
              ],
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: status,
    );
  }
}
