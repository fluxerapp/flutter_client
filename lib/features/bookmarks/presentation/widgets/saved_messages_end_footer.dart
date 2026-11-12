import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/desktop_settings_text.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class SavedMessagesEndFooter extends ConsumerWidget {
  const SavedMessagesEndFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (usesDesktopPointerUi(context)) {
      return _buildDesktop(context, l10n);
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 200),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              PhosphorIcon(
                PhosphorIconsFill.flagCheckered,
                size: 48,
                color: context.colors.textPrimaryMuted,
              ),
              const SizedBox(height: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    l10n.channelDetailsPinsEndReached,
                    style: context.textStyles.heading.copyWith(
                      color: context.colors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      l10n.savedMessagesEndBody,
                      style: context.textStyles.bodySmall.copyWith(
                        color: context.colors.textPrimaryMuted,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktop(BuildContext context, FluxerLocalizations l10n) {
    final colors = context.colors;
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 200),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: <Widget>[
            PhosphorIcon(
              PhosphorIconsRegular.flagCheckered,
              size: 48,
              color: colors.textPrimaryMuted,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: <Widget>[
                Text(
                  l10n.channelDetailsPinsEndReached,
                  style: desktopSettingsTitleStyle(context),
                  textAlign: TextAlign.center,
                ),
                Text(
                  l10n.savedMessagesEndBody,
                  style: desktopSettingsSubtitleStyle(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
