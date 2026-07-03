import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class UserAccessibility extends ConsumerWidget {
  const UserAccessibility({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appearance = ref.watch(appearancePreferencesProvider);
    final appearanceNotifier = ref.read(appearancePreferencesProvider.notifier);
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return SingleChildScrollView(
      controller: scrollController,
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            title: l10n.accessibilityUnreadGroupTitle,
            description: l10n.accessibilityUnreadGroupDescription,
            isFirst: true,
            children: [
              FluxerSettingsSwitchItem(
                label: l10n.accessibilityShowFadedUnreadOnMutedChannelsLabel,
                description:
                    l10n.accessibilityShowFadedUnreadOnMutedChannelsDescription,
                value: appearance.showFadedUnreadOnMutedChannels,
                onChanged: (value) => unawaited(
                  appearanceNotifier.setShowFadedUnreadOnMutedChannels(
                    value: value,
                  ),
                ),
              ),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.accessibilityDmMessagePreviewGroupTitle,
            description: l10n.accessibilityDmMessagePreviewGroupDescription,
            children: [
              Semantics(
                label: l10n.accessibilityDmMessagePreviewModeLabel,
                container: true,
                child: FluxerRadioGroup<DmMessagePreviewMode>(
                  value: appearance.dmMessagePreviewMode,
                  onChanged: (value) => unawaited(
                    appearanceNotifier.setDmMessagePreviewMode(value),
                  ),
                  items: [
                    FluxerRadioItem(
                      value: DmMessagePreviewMode.all,
                      label: l10n.accessibilityDmMessagePreviewAllName,
                      description:
                          l10n.accessibilityDmMessagePreviewAllDescription,
                    ),
                    FluxerRadioItem(
                      value: DmMessagePreviewMode.unreadOnly,
                      label: l10n.accessibilityDmMessagePreviewUnreadOnlyName,
                      description: l10n
                          .accessibilityDmMessagePreviewUnreadOnlyDescription,
                    ),
                    FluxerRadioItem(
                      value: DmMessagePreviewMode.none,
                      label: l10n.accessibilityDmMessagePreviewNoneName,
                      description:
                          l10n.accessibilityDmMessagePreviewNoneDescription,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
