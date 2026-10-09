import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/core/theme/theme_color_editor.dart';
import 'package:fluxer_app/core/theme/theme_variable_mapping.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_colors/theme_colors_app_preview.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_colors/theme_colors_group_preview.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/theme_colors/theme_colors_preview_theme.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/utils/theme_color_token_labels.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> openUserThemeColorsSettings(BuildContext context) {
  final l10n = FluxerLocalizations.of(context);
  return FluxerPageSheet.showScrollable<void>(
    context,
    title: l10n.lookAndFeelThemeColorsTitle,
    builder: (sheetContext, scrollController, close) {
      return UserThemeColors(scrollController: scrollController);
    },
  );
}

class UserThemeColors extends ConsumerStatefulWidget {
  const UserThemeColors({this.scrollController, super.key});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserThemeColors> createState() => _UserThemeColorsState();
}

class _UserThemeColorsState extends ConsumerState<UserThemeColors> {
  final Set<ThemeColorEditorGroupId> _expandedGroups =
      <ThemeColorEditorGroupId>{};

  late final ThemePreference _themePreference;

  @override
  void initState() {
    super.initState();
    _themePreference = ref.read(themePreferenceProvider.notifier);
  }

  @override
  void dispose() {
    unawaited(_themePreference.flushPendingThemeColorPersist());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final themePref = ref.watch(themePreferenceProvider);
    final notifier = ref.read(themePreferenceProvider.notifier);
    final platformBrightness = MediaQuery.platformBrightnessOf(context);
    final editingMode = themeColorEditingMode(
      themePref.mode,
      platformBrightness: platformBrightness,
    );
    final modeLabel = _modeLabel(l10n, editingMode);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            sectionId: 'theme-colors-sync',
            isFirst: true,
            density: FluxerSettingsSectionDensity.compact,
            title: l10n.lookAndFeelThemeColorsSyncSectionTitle,
            children: [
              FluxerSwitchGroupItem(
                label: l10n.lookAndFeelThemeColorsSyncFromStudioLabel,
                description:
                    l10n.lookAndFeelThemeColorsSyncFromStudioDescription,
                value: themePref.syncThemeColorsFromThemeStudio,
                onChanged: (bool value) =>
                    notifier.setSyncThemeColorsFromThemeStudio(value: value),
              ),
              FluxerSwitchGroupItem(
                label: l10n.lookAndFeelThemeColorsSyncToStudioLabel,
                description: l10n.lookAndFeelThemeColorsSyncToStudioDescription,
                value: themePref.syncThemeColorsToThemeStudio,
                onChanged: (bool value) =>
                    notifier.setSyncThemeColorsToThemeStudio(value: value),
              ),
            ],
          ),
          if (!themePref.syncThemeColorsFromThemeStudio) ...[
            SizedBox(height: layout.s2),
            Text(
              l10n.lookAndFeelThemeColorsSyncFromStudioOffBanner,
              style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
            ),
          ],
          SizedBox(height: layout.s2),
          Text(
            l10n.lookAndFeelThemeColorsEditingMode(modeLabel),
            style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
          ),
          SizedBox(height: layout.s2),
          ThemeColorsPreviewTheme(
            editingMode: editingMode,
            child: const ThemeColorsAppPreview(),
          ),
          SizedBox(height: layout.s3),
          FluxerSettingsSection(
            sectionId: 'theme-colors-essential',
            density: FluxerSettingsSectionDensity.compact,
            title: l10n.lookAndFeelThemeColorsEssentialSectionTitle,
            children: [
              for (final String property in kEssentialThemeColorPropertyNames)
                if (themeColorTokenForProperty(property) != null)
                  _tokenPicker(
                    context: context,
                    ref: ref,
                    propertyName: property,
                    editingMode: editingMode,
                    themePref: themePref,
                    notifier: notifier,
                  ),
            ],
          ),
          SizedBox(height: layout.s3),
          for (final ThemeColorEditorGroup group in kThemeColorEditorGroups)
            _buildGroupSection(
              context: context,
              l10n: l10n,
              group: group,
              editingMode: editingMode,
              themePref: themePref,
              notifier: notifier,
            ),
          SizedBox(height: layout.s3),
          FluxerButton.secondary(
            label: l10n.lookAndFeelThemeColorsResetForMode(modeLabel),
            onPressed:
                hasThemeColorOverridesForMode(
                  customThemeCss: themePref.customThemeCss,
                  editingMode: editingMode,
                )
                ? () => _confirmReset(context, l10n, editingMode, modeLabel)
                : null,
          ),
          SizedBox(height: layout.s6),
        ],
      ),
    );
  }

  Widget _buildGroupSection({
    required BuildContext context,
    required FluxerLocalizations l10n,
    required ThemeColorEditorGroup group,
    required FluxerThemeMode editingMode,
    required ThemePreferenceState themePref,
    required ThemePreference notifier,
  }) {
    final layout = context.layout;
    final expanded = _expandedGroups.contains(group.id);
    final title = _groupTitle(l10n, group.id);

    return Padding(
      padding: EdgeInsets.only(bottom: layout.s2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerTappable(
            onTap: () {
              setState(() {
                if (expanded) {
                  _expandedGroups.remove(group.id);
                } else {
                  _expandedGroups.add(group.id);
                }
              });
            },
            semanticLabel: title,
            builder: (context, states) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: layout.s2),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(title, style: context.textStyles.label),
                    ),
                    Icon(
                      expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: context.colors.textSecondary,
                    ),
                  ],
                ),
              );
            },
          ),
          if (expanded) ...[
            ThemeColorsPreviewTheme(
              editingMode: editingMode,
              child: ThemeColorsGroupPreview(groupId: group.id),
            ),
            SizedBox(height: layout.s2),
            for (final String property in group.tokenPropertyNames)
              if (themeColorTokenForProperty(property) != null)
                Padding(
                  padding: EdgeInsets.only(bottom: layout.s2),
                  child: _tokenPicker(
                    context: context,
                    ref: ref,
                    propertyName: property,
                    editingMode: editingMode,
                    themePref: themePref,
                    notifier: notifier,
                  ),
                ),
          ],
        ],
      ),
    );
  }

  Widget _tokenPicker({
    required BuildContext context,
    required WidgetRef ref,
    required String propertyName,
    required FluxerThemeMode editingMode,
    required ThemePreferenceState themePref,
    required ThemePreference notifier,
  }) {
    final token = themeColorTokenForProperty(propertyName)!;
    final humanLabel = themeColorTokenLabel(propertyName);
    final effective = effectiveThemeColorForProperty(
      customThemeCss: themePref.customThemeCss,
      propertyName: propertyName,
      editingMode: editingMode,
      saturationFactor: themePref.saturationFactor,
    );
    final defaultColor = defaultThemeColorForProperty(
      propertyName,
      mode: editingMode,
      saturationFactor: themePref.saturationFactor,
    );
    final overridden = isThemeColorOverriddenForMode(
      customThemeCss: themePref.customThemeCss,
      cssVariable: token.cssVariable,
      editingMode: editingMode,
    );

    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;

    final picker = FluxerColorPickerField(
      label: humanLabel,
      description: token.cssVariable,
      value: themeColorToPickerInt(effective),
      defaultValue: themeColorToPickerInt(defaultColor),
      isDefaultValue: !overridden,
      onChanged: (int value) {
        notifier.previewThemeColorOverride(
          editingMode: editingMode,
          cssVariable: token.cssVariable,
          color: themeColorFromPickerInt(value),
        );
      },
      onReset: overridden
          ? () {
              unawaited(
                notifier.clearThemeColorOverride(
                  editingMode: editingMode,
                  cssVariable: token.cssVariable,
                ),
              );
            }
          : null,
    );

    return Semantics(
      label: '$humanLabel, ${token.cssVariable}',
      child: propertyName == 'chatBackground'
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                picker,
                SizedBox(height: layout.s1),
                Text(
                  l10n.lookAndFeelThemeColorsChatBackgroundWallpaperNote,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ],
            )
          : picker,
    );
  }

  Future<void> _confirmReset(
    BuildContext context,
    FluxerLocalizations l10n,
    FluxerThemeMode editingMode,
    String modeLabel,
  ) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text(l10n.lookAndFeelThemeColorsResetConfirmTitle),
          content: Text(l10n.lookAndFeelThemeColorsResetConfirmBody(modeLabel)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(MaterialLocalizations.of(context).cancelButtonLabel),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
            ),
          ],
        );
      },
    );
    if (confirmed ?? false) {
      await ref
          .read(themePreferenceProvider.notifier)
          .resetThemeColorOverridesForMode(editingMode);
    }
  }

  String _modeLabel(FluxerLocalizations l10n, FluxerThemeMode mode) {
    return switch (mode) {
      FluxerThemeMode.dark => l10n.lookAndFeelThemeDark,
      FluxerThemeMode.darkLegacy => l10n.lookAndFeelThemeDarkLegacy,
      FluxerThemeMode.coal => l10n.lookAndFeelThemeCoal,
      FluxerThemeMode.light => l10n.lookAndFeelThemeLight,
      FluxerThemeMode.system => l10n.lookAndFeelThemeSystem,
    };
  }

  String _groupTitle(FluxerLocalizations l10n, ThemeColorEditorGroupId id) {
    return switch (id) {
      ThemeColorEditorGroupId.brandButtons =>
        l10n.lookAndFeelThemeColorsGroupBrandButtons,
      ThemeColorEditorGroupId.chatSurfaces =>
        l10n.lookAndFeelThemeColorsGroupChatSurfaces,
      ThemeColorEditorGroupId.sidebars =>
        l10n.lookAndFeelThemeColorsGroupSidebars,
      ThemeColorEditorGroupId.text => l10n.lookAndFeelThemeColorsGroupText,
      ThemeColorEditorGroupId.headers =>
        l10n.lookAndFeelThemeColorsGroupHeaders,
      ThemeColorEditorGroupId.status => l10n.lookAndFeelThemeColorsGroupStatus,
      ThemeColorEditorGroupId.embedsMarkup =>
        l10n.lookAndFeelThemeColorsGroupEmbedsMarkup,
      ThemeColorEditorGroupId.accentsAlerts =>
        l10n.lookAndFeelThemeColorsGroupAccentsAlerts,
      ThemeColorEditorGroupId.controls =>
        l10n.lookAndFeelThemeColorsGroupControls,
    };
  }
}
