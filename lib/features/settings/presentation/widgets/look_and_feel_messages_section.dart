import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/accessibility/message_group_spacing.dart';
import 'package:fluxer_app/features/accessibility/text_scale.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/user_settings_section_scroll.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class LookAndFeelMessagesSection extends ConsumerWidget {
  const LookAndFeelMessagesSection({super.key});

  static const List<int> _chatFontSizeOptions = <int>[
    12,
    14,
    15,
    16,
    18,
    20,
    24,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final themePref = ref.watch(themePreferenceProvider);
    final appearance = ref.watch(appearancePreferencesProvider);
    final userSettings = ref.watch(userSettingsViewModelProvider);
    final bool messageDisplayCompact = userSettings.messageDisplayCompact;
    final double currentSpacing = messageGroupSpacingForDisplayMode(
      messageGroupSpacing: appearance.messageGroupSpacing,
      compactMessageGroupSpacing: appearance.compactMessageGroupSpacing,
      messageDisplayCompact: messageDisplayCompact,
    );
    final int selectedSpacing = nearestMessageGroupSpacing(currentSpacing);
    final int selectedFontSize = snapChatFontSize(
      themePref.chatFontSize.toDouble(),
    );

    final List<Widget> children = <Widget>[
      KeyedSubtree(
        key: UserSettingsSectionScrollKeys.keyFor('chat-font-scaling'),
        child: FluxerSelect<int>(
          label: l10n.lookAndFeelChatFontSizeLabel,
          stretch: true,
          enableSearch: false,
          value: selectedFontSize,
          items: _chatFontSizeOptions
              .map(
                (int size) =>
                    FluxerSelectItem<int>(value: size, label: '${size}px'),
              )
              .toList(growable: false),
          onChanged: (int value) => unawaited(
            ref.read(themePreferenceProvider.notifier).setChatFontSize(value),
          ),
        ),
      ),
      FluxerSelect<int>(
        label: l10n.lookAndFeelMessageGroupSpacingLabel,
        stretch: true,
        enableSearch: false,
        value: selectedSpacing,
        items: kMessageGroupSpacingOptions
            .map(
              (int spacing) => FluxerSelectItem<int>(
                value: spacing,
                label: l10n.lookAndFeelMessageGroupSpacingValue(spacing),
              ),
            )
            .toList(growable: false),
        onChanged: (int value) => unawaited(
          ref
              .read(appearancePreferencesProvider.notifier)
              .setMessageGroupSpacing(
                messageDisplayCompact: messageDisplayCompact,
                spacing: value.toDouble(),
              ),
        ),
      ),
      FluxerRadioGroup<bool>(
        value: messageDisplayCompact,
        onChanged: (bool value) => unawaited(
          ref
              .read(userSettingsViewModelProvider.notifier)
              .setMessageDisplayCompact(value: value),
        ),
        items: [
          FluxerRadioItem(
            value: false,
            label: l10n.lookAndFeelMessageDisplayComfyName,
            description: l10n.lookAndFeelMessageDisplayComfyDescription,
          ),
          FluxerRadioItem(
            value: true,
            label: l10n.lookAndFeelMessageDisplayDenseName,
            description: l10n.lookAndFeelMessageDisplayDenseDescription,
          ),
        ],
      ),
      if (messageDisplayCompact)
        FluxerSwitchGroupItem(
          label: l10n.lookAndFeelHideUserAvatarsLabel,
          value: !appearance.showUserAvatarsInCompactMode,
          onChanged: (bool hideAvatars) => unawaited(
            ref
                .read(appearancePreferencesProvider.notifier)
                .setShowUserAvatarsInCompactMode(value: !hideAvatars),
          ),
        ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < children.length; i++) ...<Widget>[
          children[i],
          if (i < children.length - 1) SizedBox(height: layout.s5),
        ],
      ],
    );
  }
}
