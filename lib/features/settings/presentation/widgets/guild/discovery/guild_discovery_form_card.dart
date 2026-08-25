import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_settings_state.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_form_utils.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_surfaces.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_tags_field.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildDiscoveryFormCard extends StatelessWidget {
  const GuildDiscoveryFormCard({
    required this.state,
    required this.descriptionController,
    required this.tagInputController,
    required this.categoryType,
    required this.primaryLanguage,
    required this.customTags,
    required this.descriptionError,
    required this.onDescriptionErrorCleared,
    required this.onCategoryChanged,
    required this.onPrimaryLanguageChanged,
    required this.onTagsChanged,
    required this.onSubmit,
    required this.onWithdraw,
    super.key,
  });

  final GuildDiscoverySettingsState state;
  final TextEditingController descriptionController;
  final TextEditingController tagInputController;
  final int categoryType;
  final String primaryLanguage;
  final List<String> customTags;
  final String? descriptionError;
  final VoidCallback onDescriptionErrorCleared;
  final ValueChanged<int> onCategoryChanged;
  final ValueChanged<String> onPrimaryLanguageChanged;
  final ValueChanged<List<String>> onTagsChanged;
  final VoidCallback onSubmit;
  final VoidCallback onWithdraw;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool disabled = state.isFormDisabled;
    return Container(
      padding: EdgeInsets.all(context.layout.s4),
      decoration: guildDiscoveryCardDecoration(context.colors, context.layout),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildFieldLabel(
            context,
            l10n.guildSettingsDiscoveryDescriptionField,
          ),
          FluxerInput.multiline(
            controller: descriptionController,
            hint: l10n.guildSettingsDiscoveryDescriptionPlaceholder,
            errorText: descriptionError,
            enabled: !disabled,
            maxLength: DiscoveryConstants.descriptionMaxLength,
            showCounter: true,
            counterLength: () => descriptionController.text.length,
            maxLines: 6,
            onChanged: (_) {
              if (descriptionError != null) {
                onDescriptionErrorCleared();
              }
            },
          ),
          SizedBox(height: context.layout.s4),
          _buildFieldLabel(context, l10n.guildSettingsDiscoveryCategory),
          FluxerSelect<int>(
            value: categoryType,
            items: discoveryCategorySelectItems(l10n),
            enabled: !disabled,
            enableSearch: false,
            stretch: true,
            onChanged: onCategoryChanged,
          ),
          SizedBox(height: context.layout.s2),
          Text(
            l10n.guildSettingsDiscoveryCategoryHelp,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
          SizedBox(height: context.layout.s4),
          _buildFieldLabel(context, l10n.guildSettingsDiscoveryPrimaryLanguage),
          FluxerSelect<String>(
            value: primaryLanguage,
            items: discoveryLanguageSelectItems(),
            enabled: !disabled,
            scrollableSheet: true,
            stretch: true,
            onChanged: onPrimaryLanguageChanged,
          ),
          SizedBox(height: context.layout.s2),
          Text(
            l10n.guildSettingsDiscoveryPrimaryLanguageHelp,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
          SizedBox(height: context.layout.s4),
          _buildFieldLabel(context, l10n.guildSettingsDiscoveryTags),
          GuildDiscoveryTagsField(
            tagInputController: tagInputController,
            customTags: customTags,
            disabled: disabled,
            onTagsChanged: onTagsChanged,
          ),
          SizedBox(height: context.layout.s2),
          Text(
            l10n.guildSettingsDiscoveryTagsHelp(DiscoveryConstants.maxTags),
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
          ),
          SizedBox(height: context.layout.s4),
          Wrap(
            alignment: WrapAlignment.end,
            spacing: context.layout.s2,
            runSpacing: context.layout.s2,
            children: <Widget>[
              if (state.hasActiveApplication)
                FluxerButton.dangerSecondary(
                  label: l10n.guildSettingsDiscoveryWithdraw,
                  isLoading: state.isWithdrawing,
                  fitContent: true,
                  onPressed: disabled ? null : onWithdraw,
                ),
              FluxerButton.primary(
                label: state.hasActiveApplication
                    ? l10n.guildSettingsDiscoverySave
                    : l10n.guildSettingsDiscoveryApply,
                isLoading: state.isSubmitting,
                fitContent: true,
                onPressed: disabled ? null : onSubmit,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFieldLabel(BuildContext context, String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.layout.s2),
      child: Text(
        label,
        style: context.textStyles.bodySmall.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
