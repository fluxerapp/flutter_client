import 'dart:typed_data';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_style.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_labels.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceScreenSharePickerCard extends StatelessWidget {
  const VoiceScreenSharePickerCard({
    required this.source,
    required this.onSelected,
    this.enabled = true,
    super.key,
  });

  final ScreenShareSource source;
  final VoidCallback onSelected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String label = screenShareSourceLabel(l10n, source);
    final PhosphorIconData icon = source.kind == ScreenShareSourceKind.window
        ? PhosphorIconsFill.appWindow
        : PhosphorIconsFill.monitor;
    return Opacity(
      opacity: enabled ? 1 : kScreenSharePickerCardDisabledOpacity,
      child: FluxerTappable(
        onTap: onSelected,
        enabled: enabled,
        semanticLabel: label,
        excludeChildSemantics: true,
        builder: (BuildContext context, Set<WidgetState> states) {
          final bool hovered = enabled && states.contains(WidgetState.hovered);
          final bool focused = states.contains(WidgetState.focused);
          return FluxerFocusRing(
            focused: focused,
            borderRadius: BorderRadius.circular(
              kScreenSharePickerPreviewRadius,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: _Preview(
                    thumbnail: source.thumbnail,
                    icon: icon,
                    hovered: hovered,
                    showAction: hovered || focused,
                    actionLabel: l10n.voiceScreenSharePickerShareAction,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    kScreenSharePickerCardBodyHorizontalPadding,
                    kScreenSharePickerCardBodyTopPadding,
                    kScreenSharePickerCardBodyHorizontalPadding,
                    0,
                  ),
                  child: Row(
                    spacing: kScreenSharePickerCardBodyGap,
                    children: <Widget>[
                      PhosphorIcon(
                        icon,
                        size: kScreenSharePickerCardIconSize,
                        color: context.colors.textSecondary,
                      ),
                      Expanded(
                        child: Text(
                          label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodyMedium.copyWith(
                            color: context.colors.textPrimary,
                            fontSize: kScreenSharePickerCardTitleFontSize,
                            fontWeight: FontWeight.w600,
                            height: kScreenSharePickerCardTitleLineHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _Preview extends StatelessWidget {
  const _Preview({
    required this.thumbnail,
    required this.icon,
    required this.hovered,
    required this.showAction,
    required this.actionLabel,
  });

  final Uint8List? thumbnail;
  final PhosphorIconData icon;
  final bool hovered;
  final bool showAction;
  final String actionLabel;

  @override
  Widget build(BuildContext context) {
    final Uint8List? image = thumbnail;
    return AnimatedContainer(
      duration: kScreenSharePickerTransition,
      curve: Curves.ease,
      decoration: BoxDecoration(
        color: kScreenSharePickerCardBackground,
        borderRadius: BorderRadius.circular(kScreenSharePickerPreviewRadius),
        border: Border.all(
          color: hovered
              ? kScreenSharePickerCardBorderHover
              : kScreenSharePickerCardBorder,
          width: kScreenSharePickerPreviewBorderWidth,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(kScreenSharePickerPreviewPadding),
            child: image == null
                ? Center(
                    child: PhosphorIcon(
                      icon,
                      size: kScreenSharePickerPlaceholderIconSize,
                      color: kScreenSharePickerCardMuted,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(
                      kScreenSharePickerImageRadius,
                    ),
                    child: Image.memory(
                      image,
                      fit: BoxFit.contain,
                      gaplessPlayback: true,
                    ),
                  ),
          ),
          AnimatedOpacity(
            duration: kScreenSharePickerTransition,
            curve: Curves.ease,
            opacity: showAction ? 1 : 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: kScreenSharePickerOverlay,
                borderRadius: BorderRadius.circular(
                  kScreenSharePickerOverlayRadius,
                ),
              ),
              child: Center(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: kScreenSharePickerActionBackground,
                    borderRadius: BorderRadius.circular(
                      kScreenSharePickerActionRadius,
                    ),
                    boxShadow: const <BoxShadow>[
                      kScreenSharePickerActionShadow,
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: kScreenSharePickerActionHorizontalPadding,
                      vertical: kScreenSharePickerActionVerticalPadding,
                    ),
                    child: Text(
                      actionLabel,
                      style: context.textStyles.label.copyWith(
                        color: kScreenSharePickerActionText,
                        fontSize: kScreenSharePickerActionFontSize,
                        fontWeight: FontWeight.w700,
                        height:
                            kScreenSharePickerActionLineHeight /
                            kScreenSharePickerActionFontSize,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
