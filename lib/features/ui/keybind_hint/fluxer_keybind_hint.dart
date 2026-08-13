import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';

enum FluxerKeybindHintStyle { standard, settingsList }

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
}

@FluxerWidgetPreview(name: 'Default', group: 'FluxerKeybindHint')
Widget fluxerKeybindHintPreview() {
  return const FluxerKeybindHint(keys: <String>['⌘', 'K']);
}
