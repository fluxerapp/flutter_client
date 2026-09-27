import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/app_icon_choice.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/app_icon_choice_preview.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/app_icon_settings_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class UserAppIconSettings extends ConsumerWidget {
  const UserAppIconSettings({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final AsyncValue<AppIconSettingsState> settings = ref.watch(
      appIconSettingsProvider,
    );

    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: settings.when(
        loading: () => const Center(child: FluxerLoadingSpinner()),
        error: (_, _) => _unsupportedMessage(context, l10n),
        data: (AppIconSettingsState state) {
          if (!state.supported || state.choices.isEmpty) {
            return _unsupportedMessage(context, l10n);
          }
          final AppIconChoice selected = state.selectedChoice()!;
          return FluxerSettingsSection(
            title: l10n.appIconSectionTitle,
            description: l10n.appIconSectionDescription,
            isFirst: true,
            children: [
              Semantics(
                label: l10n.appIconSectionTitle,
                container: true,
                child: FluxerRadioGroup<AppIconChoice>(
                  value: selected,
                  onChanged: (AppIconChoice value) => unawaited(
                    ref.read(appIconSettingsProvider.notifier).setChoice(value),
                  ),
                  items: [
                    for (final AppIconChoice choice in state.choices)
                      FluxerRadioItem(
                        value: choice,
                        label: choice.label(l10n),
                        leading: AppIconChoicePreview(choice: choice),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget _unsupportedMessage(BuildContext context, FluxerLocalizations l10n) {
  return Text(
    l10n.appIconUnsupported,
    style: context.textStyles.bodyMedium.copyWith(
      color: context.colors.textSecondary,
    ),
  );
}
