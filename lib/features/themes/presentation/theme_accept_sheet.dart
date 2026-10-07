import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/themes/providers/shared_theme_css_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ThemeAcceptSheet extends ConsumerStatefulWidget {
  const ThemeAcceptSheet({required this.themeId, super.key});

  final String themeId;

  static Future<void> show(BuildContext context, {required String themeId}) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).themeImportTitle,
      useRootNavigator: true,
      builder: (_, _) => ThemeAcceptSheet(themeId: themeId),
    );
  }

  @override
  ConsumerState<ThemeAcceptSheet> createState() => _ThemeAcceptSheetState();
}

class _ThemeAcceptSheetState extends ConsumerState<ThemeAcceptSheet> {
  bool _applying = false;

  Future<void> _apply(String css) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Toast toasts = ref.read(toastProvider.notifier);
    setState(() => _applying = true);
    await ref.read(themePreferenceProvider.notifier).setCustomThemeCss(css);
    toasts.show(
      FluxerToast(
        message: l10n.themeImportApplied,
        variant: FluxerToastVariant.success,
      ),
    );
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final AsyncValue<String> css = ref.watch(
      sharedThemeCssProvider(widget.themeId),
    );
    final String? loadedCss = css.value;

    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.themeImportDescription,
            style: context.textStyles.bodySmall,
          ),
          SizedBox(height: layout.s4),
          Container(
            constraints: const BoxConstraints(minHeight: 96, maxHeight: 320),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colors.backgroundSecondaryAlt,
              borderRadius: BorderRadius.circular(8),
            ),
            child: css.when(
              loading: () => const Center(child: FluxerLoadingSpinner()),
              error: (_, _) => Text(
                l10n.themeImportReadFailed,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.statusDanger,
                ),
              ),
              data: (String value) => SingleChildScrollView(
                child: SelectableText(
                  value,
                  style: context.textStyles.codeText.copyWith(fontSize: 12),
                ),
              ),
            ),
          ),
          SizedBox(height: layout.s4),
          Row(
            children: [
              Expanded(
                child: FluxerButton.secondary(
                  onPressed: _applying
                      ? null
                      : () => Navigator.of(context).pop(),
                  label: l10n.cancel,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FluxerButton.primary(
                  onPressed: loadedCss == null || _applying
                      ? null
                      : () => _apply(loadedCss),
                  label: l10n.themeImportApply,
                  isLoading: _applying,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
