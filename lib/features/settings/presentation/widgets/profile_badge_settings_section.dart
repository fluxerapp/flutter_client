import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/domain/profile_badge_variant_field.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/profile_badge_image.dart';
import 'package:fluxer_app/features/profile/providers/own_profile_badges_provider.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/user_settings/profile_badge_settings_config.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_dart/export.dart';

class ProfileBadgeSettingsSection extends ConsumerWidget {
  const ProfileBadgeSettingsSection({required this.state, super.key});

  final UserSettingsViewState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final FluxerLayoutTheme layout = context.layout;
    final UserSettingsViewModel vm = ref.read(
      userSettingsViewModelProvider.notifier,
    );
    final String premiumProductName = ref.watch(
      instanceRuntimeConfigProvider.select(
        (config) => config.premiumProductName,
      ),
    );
    final AsyncValue<ProfileBadgePreviewResponse?> previewAsync = ref.watch(
      ownProfileBadgesSettingsPreviewProvider,
    );

    final List<Widget> sectionChildren;
    if (previewAsync.isLoading && !previewAsync.hasValue) {
      sectionChildren = <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Center(child: FluxerLoadingSpinner()),
        ),
      ];
    } else if (previewAsync.hasError) {
      sectionChildren = <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FluxerHintText(l10n.profileBadgesSettingsLoadFailed),
            SizedBox(height: layout.s2),
            FluxerButton.secondary(
              onPressed: () =>
                  ref.invalidate(ownProfileBadgesSettingsPreviewProvider),
              label: l10n.gatewayReconnectTryAgain,
              size: FluxerButtonSize.small,
            ),
          ],
        ),
      ];
    } else {
      final List<OwnProfileBadgeResponse> ownBadges =
          previewAsync.value?.ownBadges ?? const <OwnProfileBadgeResponse>[];
      if (ownBadges.isEmpty) {
        sectionChildren = <Widget>[
          FluxerHintText(l10n.profileBadgesSettingsEmpty),
        ];
      } else {
        sectionChildren = _badgeSettingCards(
          context: context,
          ownBadges: ownBadges,
          hiddenKeys: state.effectiveHiddenProfileBadges,
          state: state,
          premiumProductName: premiumProductName,
          onToggleHidden: vm.setProfileBadgeHidden,
          onToggleVariant: vm.setProfileBadgeVariant,
        );
      }
    }

    return FluxerSettingsSection(
      title: l10n.profileBadgesSettingsTitle,
      description: l10n.profileBadgesSettingsDescription,
      children: sectionChildren,
    );
  }
}

List<Widget> _badgeSettingCards({
  required BuildContext context,
  required List<OwnProfileBadgeResponse> ownBadges,
  required List<String> hiddenKeys,
  required UserSettingsViewState state,
  required String premiumProductName,
  required void Function({required String key, required bool hidden})
  onToggleHidden,
  required void Function(ProfileBadgeVariantField field, {required bool value})
  onToggleVariant,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final FluxerLayoutTheme layout = context.layout;
  final Set<String> hidden = hiddenKeys.toSet();

  return ownBadges.map((OwnProfileBadgeResponse badge) {
    final bool shown = !hidden.contains(badge.key);
    final bool numberHasNoEffect =
        profileBadgeSettingsVisionaryNumberHasNoEffect(
          badgeKey: badge.key,
          hiddenBadgeKeys: hidden,
          state: state,
        );
    final List<ProfileBadgeSettingsVariantConfig> variants =
        profileBadgeSettingsVariantsForBadge(
          badgeKey: badge.key,
          badgeShown: shown,
        );

    final List<Widget> rows = <Widget>[
      FluxerBottomSheetMenuItem(
        label: badge.label,
        leading: _BadgeArt(badge: badge),
        onTap: () {
          if (numberHasNoEffect) {
            return;
          }
          FluxerHaptics.selection();
          onToggleHidden(key: badge.key, hidden: shown);
        },
        enabled: !numberHasNoEffect,
        toggled: shown,
        trailing: FluxerSwitchControl(
          value: shown,
          enabled: !numberHasNoEffect,
        ),
      ),
      for (final ProfileBadgeSettingsVariantConfig variant in variants)
        FluxerSwitchGroupItem(
          label: variant.label(l10n, premiumProductName),
          description: variant.description?.call(l10n, premiumProductName),
          value: effectiveProfileBadgeVariantValue(state, variant.field),
          onChanged: (bool value) =>
              onToggleVariant(variant.field, value: value),
        ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        FluxerMenuGroup(children: rows),
        if (numberHasNoEffect) ...[
          SizedBox(height: layout.s2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: layout.s1),
            child: FluxerHintText(l10n.profileBadgesVisionaryNumberNote),
          ),
        ],
      ],
    );
  }).toList();
}

class _BadgeArt extends StatelessWidget {
  const _BadgeArt({required this.badge});

  final OwnProfileBadgeResponse badge;
  static const double _height = 24;

  @override
  Widget build(BuildContext context) {
    if (badge.caption != null && badge.caption!.isNotEmpty) {
      return Text(
        badge.caption!,
        style: context.textStyles.bodySmall,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      );
    }
    final String? imageUrl = ownProfileBadgeDisplayImageUrl(
      badge,
      displayHeight: _height,
    );
    if (imageUrl == null) {
      return const SizedBox.shrink();
    }
    final double width = badge.aspectRatio != null && badge.aspectRatio! > 0
        ? _height * badge.aspectRatio!.toDouble()
        : _height;
    return SizedBox(
      width: width,
      height: _height,
      child: ProfileBadgeImage(
        hash: badge.asset,
        imageUrl: imageUrl,
        height: _height,
        aspectRatio: badge.aspectRatio,
      ),
    );
  }
}
