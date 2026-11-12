import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo_format.dart';
import 'package:fluxer_app/features/quick_switcher/presentation/sheets/quick_switcher_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/keybind_hint/fluxer_keybind_hint.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

const KeybindCombo _kQuickSwitcherCombo = KeybindCombo(
  key: 'k',
  ctrlOrMeta: true,
);

class DmListQuickSwitcherHeader extends ConsumerWidget {
  const DmListQuickSwitcherHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final String label = FluxerLocalizations.of(context).quickSwitcherTitle;
    final List<String> keys = formatKeybindComboChips(_kQuickSwitcherCombo);
    return Semantics(
      button: true,
      label: label,
      excludeSemantics: true,
      child: FluxerTappable(
        onTap: () => unawaited(QuickSwitcherBottomSheet.show(context, ref)),
        builder: (BuildContext context, Set<WidgetState> states) {
          final bool hovered = states.contains(WidgetState.hovered);
          return Container(
            height: context.layout.headerHeight,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: hovered
                  ? colors.backgroundModifierHover
                  : colors.backgroundSecondary,
              border: Border(
                bottom: BorderSide(color: colors.userAreaDividerColor),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              height: 28,
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      label,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyles.label.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        height: 16 / 13,
                        color: hovered
                            ? colors.textPrimary
                            : colors.textPrimaryMuted,
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    end: 8,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: FluxerKeybindHint(
                        keys: keys,
                        style: FluxerKeybindHintStyle.compact,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
