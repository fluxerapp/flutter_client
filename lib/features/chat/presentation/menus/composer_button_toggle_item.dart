import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/composer_button_toggle.dart';
import 'package:fluxer_app/features/settings/providers/preferences/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ComposerButtonToggleItem extends ConsumerWidget {
  const ComposerButtonToggleItem({required this.toggle, super.key});

  final ComposerButtonToggle toggle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool checked = ref.watch(
      advancedPreferencesProvider.select(
        (AdvancedPreferencesState state) => switch (toggle) {
          ComposerButtonToggle.gifs => state.showGifButton,
          ComposerButtonToggle.media => state.showMemesButton,
          ComposerButtonToggle.stickers => state.showStickersButton,
          ComposerButtonToggle.emoji => state.showEmojiButton,
          ComposerButtonToggle.sendButton => state.showMessageSendButton,
        },
      ),
    );
    final String label = switch (toggle) {
      ComposerButtonToggle.gifs => l10n.advancedSettingShowGifsButtonLabel,
      ComposerButtonToggle.media => l10n.advancedSettingShowMediaButtonLabel,
      ComposerButtonToggle.stickers =>
        l10n.advancedSettingShowStickersButtonLabel,
      ComposerButtonToggle.emoji => l10n.advancedSettingShowEmojiButtonLabel,
      ComposerButtonToggle.sendButton =>
        l10n.advancedSettingShowSendButtonLabel,
    };
    return FluxerMenuCheckboxItem(
      label: label,
      isChecked: checked,
      onPressed: () => unawaited(_set(ref, value: !checked)),
    );
  }

  Future<void> _set(WidgetRef ref, {required bool value}) {
    final AdvancedPreferences notifier = ref.read(
      advancedPreferencesProvider.notifier,
    );
    return switch (toggle) {
      ComposerButtonToggle.gifs => notifier.setShowGifButton(value: value),
      ComposerButtonToggle.media => notifier.setShowMemesButton(value: value),
      ComposerButtonToggle.stickers => notifier.setShowStickersButton(
        value: value,
      ),
      ComposerButtonToggle.emoji => notifier.setShowEmojiButton(value: value),
      ComposerButtonToggle.sendButton => notifier.setShowMessageSendButton(
        value: value,
      ),
    };
  }
}
