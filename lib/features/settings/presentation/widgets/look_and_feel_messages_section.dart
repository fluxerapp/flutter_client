import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/accessibility/domain/message_group_spacing.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/look_and_feel_step_slider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/user_settings/user_settings_section_scroll.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class LookAndFeelMessagesSection extends ConsumerWidget {
  const LookAndFeelMessagesSection({super.key});

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
    final int defaultSpacing = messageDisplayCompact
        ? kDefaultCompactMessageGroupSpacing
        : kDefaultMessageGroupSpacing;
    final int selectedFontSize = snapChatFontSize(
      themePref.chatFontSize.toDouble(),
    );

    final List<Widget> children = <Widget>[
      KeyedSubtree(
        key: UserSettingsSectionScrollKeys.keyFor('chat-font-scaling'),
        child: LookAndFeelStepSlider(
          label: l10n.lookAndFeelChatFontSizeLabel,
          stops: kChatFontSizeMarkers,
          value: selectedFontSize,
          defaultValue: kDefaultChatFontSize,
          labelledStops: <int>[
            kChatFontSizeMarkers.first,
            kDefaultChatFontSize,
            kChatFontSizeMarkers.last,
          ],
          formatValue: (int size) => '${size}px',
          semanticValue: l10n.lookAndFeelPixelsAccessibleValue,
          onChanged: (int value) => unawaited(
            ref.read(themePreferenceProvider.notifier).setChatFontSize(value),
          ),
        ),
      ),
      LookAndFeelStepSlider(
        label: l10n.lookAndFeelMessageGroupSpacingLabel,
        stops: kMessageGroupSpacingOptions,
        value: selectedSpacing,
        defaultValue: defaultSpacing,
        labelledStops: <int>[
          kMessageGroupSpacingOptions.first,
          defaultSpacing,
          kMessageGroupSpacingOptions.last,
        ],
        formatValue: l10n.lookAndFeelMessageGroupSpacingValue,
        semanticValue: l10n.lookAndFeelPixelsAccessibleValue,
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
