import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/utils/content_warning_utils.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/features/ui/switch_group/fluxer_switch_group.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ChannelOverviewMatureContentSection extends ConsumerWidget {
  const ChannelOverviewMatureContentSection({
    required this.channel,
    required this.guild,
    required this.nsfwOverride,
    required this.contentWarningLevel,
    required this.contentWarningText,
    required this.warningTextController,
    required this.onNsfwOverrideChanged,
    required this.onContentWarningLevelChanged,
    required this.onContentWarningTextChanged,
    super.key,
  });

  final Channel channel;
  final Guild? guild;
  final bool? nsfwOverride;
  final int contentWarningLevel;
  final String contentWarningText;
  final TextEditingController warningTextController;
  final ValueChanged<bool?> onNsfwOverrideChanged;
  final ValueChanged<int> onContentWarningLevelChanged;
  final ValueChanged<String> onContentWarningTextChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool showWarningText =
        contentWarningLevel == contentWarningLevelContentWarning;
    final Channel? parentCategory = _resolveParentCategory(ref, channel);
    final Channel inheritStub = Channel(
      id: channel.id,
      guildId: channel.guildId,
      name: channel.name,
      parentId: channel.parentId,
      type: channel.type,
    );
    final EffectiveMatureContentResult inheritedMatureContent =
        resolveEffectiveChannelMatureContent(
          channel: inheritStub,
          guild: guild,
          parentCategory: parentCategory,
        );
    final String inheritedSourceLabel = switch (inheritedMatureContent.source) {
      EffectiveMatureSource.parent =>
        l10n.channelSettingsMatureContentCategoryScope,
      EffectiveMatureSource.guild =>
        l10n.channelSettingsMatureContentCommunityScope,
      _ => l10n.channelSettingsMatureContentCommunityScope,
    };
    final String scopeLevel = parentCategory != null
        ? l10n.channelSettingsMatureContentCategoryScope
        : l10n.channelSettingsMatureContentCommunityScope;
    final String inheritedDescription = inheritedMatureContent.value
        ? l10n.channelSettingsMatureContentInheritsOn(inheritedSourceLabel)
        : l10n.channelSettingsMatureContentInheritsOff(inheritedSourceLabel);
    final Channel warningStub = Channel(
      id: channel.id,
      guildId: channel.guildId,
      name: channel.name,
      parentId: channel.parentId,
      type: channel.type,
    );
    final EffectiveContentWarning inheritedWarning =
        getEffectiveChannelContentWarning(
          channel: warningStub,
          guild: guild,
          parentCategory: parentCategory,
        );
    final String warningTextPlaceholder =
        inheritedWarning.text ?? l10n.channelSettingsContentWarningDefault;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          l10n.matureContentTitle,
          style: context.textStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: context.layout.s1),
        Text(
          l10n.channelSettingsMatureContentSectionDescription(scopeLevel),
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: context.layout.s2),
        FluxerRadioGroup<String>(
          value: _matureOverrideKey(nsfwOverride),
          items: <FluxerRadioItem<String>>[
            FluxerRadioItem<String>(
              value: 'inherit',
              label: l10n.channelSettingsMatureContentInherit,
              description: inheritedDescription,
            ),
            FluxerRadioItem<String>(
              value: 'on',
              label: l10n.channelSettingsMatureContentOn,
              description: l10n.channelSettingsMatureContentOnDescription,
            ),
            FluxerRadioItem<String>(
              value: 'off',
              label: l10n.channelSettingsMatureContentOff,
              description: l10n.channelSettingsMatureContentOffDescription,
            ),
          ],
          onChanged: (String value) {
            onNsfwOverrideChanged(_nsfwOverrideFromKey(value));
          },
        ),
        SizedBox(height: context.layout.s4),
        FluxerSettingsSwitchItem(
          label: l10n.channelSettingsContentWarningToggle,
          description: l10n.channelSettingsContentWarningToggleDescription,
          value: contentWarningLevel == contentWarningLevelContentWarning,
          onChanged: (bool value) {
            onContentWarningLevelChanged(
              value
                  ? contentWarningLevelContentWarning
                  : contentWarningLevelInherit,
            );
          },
        ),
        if (showWarningText) ...<Widget>[
          SizedBox(height: context.layout.s4),
          FluxerInput.multiline(
            label: l10n.channelSettingsContentWarningText,
            hint: warningTextPlaceholder,
            controller: warningTextController,
            maxLength: kMaxContentWarningTextLength,
            showCounter: true,
            counterMax: kMaxContentWarningTextLength,
            onChanged: onContentWarningTextChanged,
          ),
        ],
      ],
    );
  }

  Channel? _resolveParentCategory(WidgetRef ref, Channel channel) {
    final String? parentId = channel.parentId;
    if (parentId == null || channel.isCategory) {
      return null;
    }
    final Channel? parent = ref.watch(channelByIdProvider(parentId)).value;
    if (parent == null || !parent.isCategory) {
      return null;
    }
    return parent;
  }

  String _matureOverrideKey(bool? value) {
    if (value == null) {
      return 'inherit';
    }
    return value ? 'on' : 'off';
  }

  bool? _nsfwOverrideFromKey(String key) {
    return switch (key) {
      'on' => true,
      'off' => false,
      _ => null,
    };
  }
}
