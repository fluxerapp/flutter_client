import 'package:fluxer_app/features/settings/presentation/widgets/user_shortcuts.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class KeyboardShortcutsCheatsheetModal {
  KeyboardShortcutsCheatsheetModal._();

  static Future<void> show(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerModal.show<void>(
      context,
      title: l10n.keybindActionShowShortcutsList,
      builder: (BuildContext context, VoidCallback close) {
        return const SizedBox(
          width: 640,
          child: SingleChildScrollView(
            child: DefaultShortcutsList(searchQuery: ''),
          ),
        );
      },
    );
  }
}
