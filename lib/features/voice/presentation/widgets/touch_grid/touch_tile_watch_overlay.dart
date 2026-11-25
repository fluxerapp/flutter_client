import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceTouchTileWatchOverlay extends StatelessWidget {
  const VoiceTouchTileWatchOverlay({required this.onWatch, super.key});

  final VoidCallback onWatch;

  static const Color _kScrim = Color(0x66000000);
  static const double _kIconSize = 18;
  static const double _kShadowOpacity = 0.18;
  static const double _kShadowBlur = 4;
  static const Offset _kShadowOffset = Offset(0, 1);

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        const IgnorePointer(child: ColoredBox(color: _kScrim)),
        Center(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onWatch,
              borderRadius: context.layout.radiusMd,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: context.layout.radiusMd,
                  color: context.colors.backgroundSecondary,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black.withValues(alpha: _kShadowOpacity),
                      blurRadius: _kShadowBlur,
                      offset: _kShadowOffset,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.layout.s4,
                    vertical: context.layout.s2,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: context.layout.s2,
                    children: <Widget>[
                      PhosphorIcon(
                        PhosphorIconsFill.monitorPlay,
                        size: _kIconSize,
                        color: context.colors.textPrimary,
                      ),
                      Text(
                        l10n.voiceWatchStream,
                        style: context.textStyles.categoryName.copyWith(
                          color: context.colors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
