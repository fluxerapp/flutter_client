import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

enum FluxerKeybindHintStyle { standard, settingsList, compact }

class FluxerKeybindHint extends StatelessWidget {
  const FluxerKeybindHint({
    required this.keys,
    this.style = FluxerKeybindHintStyle.standard,
    super.key,
  });

  final List<String> keys;
  final FluxerKeybindHintStyle style;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final colors = context.colors;

    final bool isSettingsList = style == FluxerKeybindHintStyle.settingsList;
    if (style == FluxerKeybindHintStyle.compact) {
      return _buildCompact(context);
    }
    if (!isSettingsList && usesDesktopPointerUi(context)) {
      return _buildDesktop(context);
    }
    final TextStyle chipStyle = context.textStyles.smallText.copyWith(
      color: isSettingsList ? colors.textPrimary : colors.textSecondary,
      fontWeight: isSettingsList ? FontWeight.w500 : FontWeight.w600,
      fontSize: isSettingsList ? 12 : 11,
      height: 1,
    );
    final Color chipBackground = isSettingsList
        ? colors.backgroundPrimary
        : colors.backgroundSecondary;
    final double chipGap = isSettingsList ? layout.s1 : 2;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 0; i < keys.length; i++) ...<Widget>[
          if (i > 0) SizedBox(width: chipGap),
          DecoratedBox(
            decoration: BoxDecoration(
              color: chipBackground,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: colors.backgroundModifierAccent),
              boxShadow: isSettingsList
                  ? <BoxShadow>[
                      BoxShadow(
                        color: colors.backgroundModifierAccent,
                        offset: const Offset(0, -1),
                      ),
                    ]
                  : null,
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: isSettingsList ? 24 : 20,
                minHeight: isSettingsList ? 22 : 20,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isSettingsList ? 6 : layout.s1_5,
                  vertical: 2,
                ),
                child: Center(child: Text(keys[i], style: chipStyle)),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCompact(BuildContext context) {
    final colors = context.colors;
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 2,
      children: <Widget>[
        for (final String key in keys)
          Container(
            height: 18,
            constraints: const BoxConstraints(minWidth: 18),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isLight
                  ? const Color(0xFF292D35)
                  : colors.backgroundModifierAccent,
              borderRadius: BorderRadius.circular(4),
              boxShadow: isLight
                  ? const <BoxShadow>[
                      BoxShadow(color: Color(0x66000000), offset: Offset(0, 1)),
                    ]
                  : null,
            ),
            child: Text(
              key,
              style: context.textStyles.smallText.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                height: 1,
                color: isLight
                    ? const Color(0xFFFFFFFF)
                    : colors.surfaceInteractiveSelectedColor,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context) {
    final colors = context.colors;
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final Color background = isLight
        ? const Color(0xFF2E2E2E)
        : colors.backgroundSecondary;
    final Color foreground = isLight
        ? const Color(0xFFFAFAFA)
        : colors.textSecondary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 2,
      children: <Widget>[
        for (final String key in keys)
          Container(
            height: 20,
            constraints: BoxConstraints(
              minWidth: _kKeybindSymbols.contains(key) ? 22 : 20,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: background,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              key.toUpperCase(),
              style: context.textStyles.smallText.copyWith(
                color: foreground,
                fontSize: _kKeybindSymbols.contains(key) ? 13 : 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
                height: 1,
              ),
            ),
          ),
      ],
    );
  }
}

const Set<String> _kKeybindSymbols = <String>{
  '⌃',
  '⌘',
  '⇧',
  '⌥',
  '↑',
  '↓',
  '←',
  '→',
  '↵',
  '⏎',
  '⌫',
  '⎋',
  '⇥',
};

@FluxerWidgetPreview(name: 'Default', group: 'FluxerKeybindHint')
Widget fluxerKeybindHintPreview() {
  return const FluxerKeybindHint(keys: <String>['⌘', 'K']);
}
