import 'dart:async';
import 'dart:math' show max;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/service/composer_autocomplete_trigger.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/domain/guild_asset_mode.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/fluxer_tag_change_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/profile_preview_card.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const int _kMaxDisplayNameLength = 32;
const int _kMaxPronounsLength = 40;
const int _kMaxBioLength = 320;

class UserProfile extends ConsumerStatefulWidget {
  const UserProfile({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends ConsumerState<UserProfile> {
  late final TextEditingController _displayNameController;
  late final TextEditingController _pronounsController;
  late final EmojiTextEditingController _bioController;
  late final TextEditingController _nickController;
  late final TextEditingController _guildPronounsController;
  late final EmojiTextEditingController _guildBioController;
  final _expressionPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();

  bool _controllersInitialized = false;
  final FocusNode _bioFocusNode = FocusNode();
  final GlobalKey<ComposerAutocompleteFieldState> _bioFieldKey =
      GlobalKey<ComposerAutocompleteFieldState>();
  final GlobalKey<FluxerInputClipboardScopeState> _bioClipboardKey =
      GlobalKey<FluxerInputClipboardScopeState>();

  @override
  void initState() {
    super.initState();
    _displayNameController = TextEditingController();
    _pronounsController = TextEditingController();
    _bioController = EmojiTextEditingController();
    _nickController = TextEditingController();
    _guildPronounsController = TextEditingController();
    _guildBioController = EmojiTextEditingController();
    _bioFocusNode.onKeyEvent = (FocusNode node, KeyEvent event) {
      final KeyEventResult clipboardResult =
          _bioClipboardKey.currentState?.handleKeyboardShortcut(event) ??
          KeyEventResult.ignored;
      if (clipboardResult == KeyEventResult.handled) {
        return clipboardResult;
      }
      return handleComposerAutocompleteKey(_bioFieldKey.currentState, event);
    };
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _pronounsController.dispose();
    _bioController.dispose();
    _nickController.dispose();
    _guildPronounsController.dispose();
    _guildBioController.dispose();
    _bioFocusNode.dispose();
    super.dispose();
  }

  void _syncControllers(UserSettingsViewState state) {
    if (!_controllersInitialized && state.isProfileLoaded) {
      _resetControllers(state);
      _controllersInitialized = true;
    }
  }

  void _resetControllers(UserSettingsViewState state) {
    _displayNameController.text = state.isEditedDisplayNameSet
        ? (state.editedDisplayName ?? '')
        : state.displayName;
    _pronounsController.text = state.isEditedPronounsSet
        ? (state.editedPronouns ?? '')
        : (state.pronouns ?? '');
    _bioController.loadWithTokens(
      state.isEditedBioSet ? (state.editedBio ?? '') : (state.bio ?? ''),
    );
    _nickController.text = state.isEditedNickSet
        ? (state.editedNick ?? '')
        : (state.guildNick ?? '');
    _guildPronounsController.text = state.isEditedGuildPronounsSet
        ? (state.editedGuildPronouns ?? '')
        : (state.guildPronouns ?? '');
    _guildBioController.loadWithTokens(
      state.isEditedGuildBioSet
          ? (state.editedGuildBio ?? '')
          : (state.guildBio ?? ''),
    );
  }

  void _notifyBioChanged() {
    final vm = ref.read(userSettingsViewModelProvider.notifier);
    final state = ref.read(userSettingsViewModelProvider);
    if (state.isPerGuildProfile) {
      vm.updateGuildBio(_guildBioController.actualText);
    } else {
      vm.updateBio(_bioController.actualText);
    }
  }

  void _onSmileyTap() {
    if (isMobileLayout(context)) {
      final state = ref.read(userSettingsViewModelProvider);
      final controller = state.isPerGuildProfile
          ? _guildBioController
          : _bioController;
      unawaited(
        FluxerEmojiPickerSheet.show(
          context,
          title: FluxerLocalizations.of(context).emojiPickerTitle,
          maxHeight: 0.88,
          onEmojiSelected: (emoji) {
            controller.insertEmoji(
              emoji.name,
              emoji.surrogates,
              maxActualLength: _kMaxBioLength,
            );
            _notifyBioChanged();
          },
          visibleTabs: const [ExpressionPickerTab.emojis],
        ),
      );
    } else {
      _expressionPickerKey.currentState?.toggle();
    }
  }

  Widget _buildUnclaimedAccountBar(
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondaryAlt,
        border: Border(top: BorderSide(color: colors.accentWarning, width: 2)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: layout.s4,
          right: layout.s4,
          top: layout.s3,
          bottom: bottomPadding > 0 ? bottomPadding : layout.s3,
        ),
        child: Row(
          children: [
            PhosphorIcon(
              PhosphorIconsBold.warning,
              color: colors.accentWarning,
              size: 20,
            ),
            SizedBox(width: layout.s2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    l10n.unclaimedAccountTitle,
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: layout.s1),
                  Text(
                    l10n.unclaimedAccountDescription,
                    style: textStyles.smallText.copyWith(
                      color: colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPlutoniumSheet(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    unawaited(
      FluxerBottomSheet.show<void>(
        context,
        title: l10n.plutoniumNotAvailableTitle,
        builder: (sheetContext, _) => Padding(
          padding: EdgeInsets.all(sheetContext.layout.s4),
          child: Text(
            l10n.plutoniumNotAvailableBody,
            style: sheetContext.textStyles.bodyMedium.copyWith(
              color: sheetContext.colors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleImageUpload({required bool isAvatar}) async {
    final picked = await ImageUtils.pickImage();
    if (picked == null || !mounted) {
      return;
    }

    if (ImageUtils.isOverSizeLimit(picked.bytes)) {
      if (!mounted) {
        return;
      }
      final l10n = FluxerLocalizations.of(context);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.imageFileTooLarge,
              variant: FluxerToastVariant.danger,
            ),
          );
      return;
    }

    final animCheck = ImageUtils.checkAnimated(picked.bytes);

    if (animCheck.isAnimated) {
      final bool hasAnimatedEntitlement = isAvatar
          ? ref.read(
              instanceFeatureEnabledProvider(LimitKeys.featureAnimatedAvatar),
            )
          : ref.read(
              instanceFeatureEnabledProvider(LimitKeys.featureAnimatedBanner),
            );
      if (!hasAnimatedEntitlement) {
        if (!mounted) {
          return;
        }
        final l10n = FluxerLocalizations.of(context);
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: isAvatar
                    ? l10n.animatedAvatarsRequirePlutonium
                    : l10n.animatedBannersRequirePlutonium,
                variant: FluxerToastVariant.warning,
              ),
            );
        return;
      }

      if (animCheck.format == 'avif') {
        if (!mounted) {
          return;
        }
        final l10n = FluxerLocalizations.of(context);
        final confirmed = await FluxerBottomSheet.show<bool>(
          context,
          title: l10n.animatedAvifNotSupported,
          builder: (sheetContext, _) => Padding(
            padding: EdgeInsets.all(sheetContext.layout.s4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.animatedAvifNotSupportedBody,
                  style: sheetContext.textStyles.bodyMedium.copyWith(
                    color: sheetContext.colors.textSecondary,
                  ),
                ),
                SizedBox(height: sheetContext.layout.s4),
                FluxerButton.primary(
                  onPressed: () => Navigator.of(sheetContext).pop(true),
                  label: l10n.uploadAsIs,
                ),
                SizedBox(height: sheetContext.layout.s2),
                FluxerButton.secondary(
                  onPressed: () => Navigator.of(sheetContext).pop(false),
                  label: l10n.cancel,
                ),
              ],
            ),
          ),
        );
        if (confirmed != true || !mounted) {
          return;
        }
      } else {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: FluxerLocalizations.of(
                  context,
                ).croppingAnimatedNotSupported,
              ),
            );
      }

      final dataUri = ImageUtils.toDataUri(picked.bytes);
      final vm = ref.read(userSettingsViewModelProvider.notifier);
      if (ref.read(userSettingsViewModelProvider).isPerGuildProfile) {
        if (isAvatar) {
          vm.setGuildAvatar(dataUri);
        } else {
          vm.setGuildBanner(dataUri);
        }
      } else {
        if (isAvatar) {
          vm.setAvatar(dataUri);
        } else {
          vm.setBanner(dataUri);
        }
      }
      return;
    }

    if (!mounted) {
      return;
    }
    final croppedBytes = await showImageCropSheet(
      context,
      imageBytes: picked.bytes,
      aspectRatio: isAvatar ? 1.0 : 17.0 / 6.0,
      title: isAvatar
          ? FluxerLocalizations.of(context).cropAvatar
          : FluxerLocalizations.of(context).cropBanner,
      maskShape: isAvatar ? CropMaskShape.circle : CropMaskShape.rectangle,
    );

    if (croppedBytes == null || !mounted) {
      return;
    }

    final dataUri = ImageUtils.toDataUri(croppedBytes);
    final vm = ref.read(userSettingsViewModelProvider.notifier);
    if (ref.read(userSettingsViewModelProvider).isPerGuildProfile) {
      if (isAvatar) {
        vm.setGuildAvatar(dataUri);
      } else {
        vm.setGuildBanner(dataUri);
      }
    } else {
      if (isAvatar) {
        vm.setAvatar(dataUri);
      } else {
        vm.setBanner(dataUri);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userSettingsViewModelProvider);
    final bool hasPerGuildProfiles = ref.watch(
      instanceFeatureEnabledProvider(LimitKeys.featurePerGuildProfiles),
    );
    final bool shouldShowPremiumCommerce = ref.watch(
      shouldShowPremiumCommerceProvider,
    );
    _syncControllers(state);

    ref
      ..listen(userSettingsViewModelProvider.select((s) => s.isDirty), (
        prev,
        next,
      ) {
        if ((prev ?? false) && !next) {
          _resetControllers(ref.read(userSettingsViewModelProvider));
        }
      })
      ..listen(
        userSettingsViewModelProvider.select((s) => s.isLoadingGuildProfile),
        (prev, next) {
          if ((prev ?? false) && !next) {
            final currentState = ref.read(userSettingsViewModelProvider);
            _nickController.text = currentState.guildNick ?? '';
            _guildPronounsController.text = currentState.guildPronouns ?? '';
            _guildBioController.loadWithTokens(currentState.guildBio ?? '');
          }
        },
      )
      ..listen(
        userSettingsViewModelProvider.select(
          (s) => (s.bio, s.pronouns, s.displayName),
        ),
        (prev, next) {
          final s = ref.read(userSettingsViewModelProvider);
          if (!s.isDirty && !s.isPerGuildProfile) {
            _displayNameController.text = s.displayName;
            _pronounsController.text = s.pronouns ?? '';
            _bioController.loadWithTokens(s.bio ?? '');
          }
        },
      )
      ..listen(userSettingsViewModelProvider.select((s) => s.isSaving), (
        prev,
        next,
      ) {
        if ((prev ?? false) && !next) {
          final s = ref.read(userSettingsViewModelProvider);
          if (s.error == null) {
            ref
                .read(toastProvider.notifier)
                .show(
                  FluxerToast(
                    message: FluxerLocalizations.of(context).profileSavedToast,
                    variant: FluxerToastVariant.success,
                  ),
                );
          }
        }
      });

    if (!state.isProfileLoaded) {
      return const Center(child: FluxerLoadingSpinner());
    }

    final vm = ref.read(userSettingsViewModelProvider.notifier);
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            behavior: HitTestBehavior.translucent,
            child: SingleChildScrollView(
              controller: widget.scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.all(layout.s4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FluxerSettingsSection(
                    title: l10n.profileCustomizationTitle,
                    description: l10n.profileCustomizationDescription,
                    isFirst: true,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildProfileTypeSelector(state, vm, layout, l10n),
                          if (state.isLoadingGuildProfile) ...[
                            SizedBox(height: layout.s6),
                            const Center(child: FluxerLoadingSpinner()),
                          ],
                          if (!state.isPerGuildProfile) ...[
                            SizedBox(height: layout.s6),
                            _buildUsernameSection(state, layout, l10n),
                          ],
                          if (!state.isPerGuildProfile) ...[
                            SizedBox(height: layout.s6),
                            FluxerInput(
                              controller: _displayNameController,
                              label: l10n.displayNameLabel,
                              hint: state.username,
                              maxLength: _kMaxDisplayNameLength,
                              onChanged: vm.updateDisplayName,
                            ),
                          ],
                          if (state.isPerGuildProfile &&
                              !state.isLoadingGuildProfile) ...[
                            SizedBox(height: layout.s6),
                            FluxerInput(
                              controller: _nickController,
                              label: l10n.communityNicknameLabel,
                              hint: state.username,
                              maxLength: _kMaxDisplayNameLength,
                              enabled: state.canChangeNickname,
                              onChanged: vm.updateNick,
                            ),
                          ],
                          SizedBox(height: layout.s6),
                          FluxerInput(
                            controller: state.isPerGuildProfile
                                ? _guildPronounsController
                                : _pronounsController,
                            label: l10n.pronounsLabel,
                            maxLength: _kMaxPronounsLength,
                            onChanged: state.isPerGuildProfile
                                ? vm.updateGuildPronouns
                                : vm.updatePronouns,
                          ),
                          if (state.isPerGuildProfile &&
                              !hasPerGuildProfiles &&
                              shouldShowPremiumCommerce &&
                              !state.isLoadingGuildProfile) ...[
                            SizedBox(height: layout.s6),
                            _buildPerGuildPremiumUpsell(layout, l10n),
                          ],
                          if (!state.isPerGuildProfile) ...[
                            SizedBox(height: layout.s6),
                            _buildAvatarSection(state, vm, layout, l10n),
                            SizedBox(height: layout.s6),
                            _buildBannerSection(state, vm, layout, l10n),
                          ] else if (!state.isLoadingGuildProfile) ...[
                            SizedBox(height: layout.s6),
                            Opacity(
                              opacity: hasPerGuildProfiles ? 1.0 : 0.5,
                              child: IgnorePointer(
                                ignoring: !hasPerGuildProfiles,
                                child: _buildGuildAvatarSection(
                                  state,
                                  vm,
                                  layout,
                                  l10n,
                                ),
                              ),
                            ),
                            SizedBox(height: layout.s6),
                            Opacity(
                              opacity: hasPerGuildProfiles ? 1.0 : 0.5,
                              child: IgnorePointer(
                                ignoring: !hasPerGuildProfiles,
                                child: _buildGuildBannerSection(
                                  state,
                                  vm,
                                  layout,
                                  l10n,
                                ),
                              ),
                            ),
                          ],
                          SizedBox(height: layout.s6),
                          Opacity(
                            opacity:
                                state.isPerGuildProfile && !hasPerGuildProfiles
                                ? 0.5
                                : 1.0,
                            child: IgnorePointer(
                              ignoring:
                                  state.isPerGuildProfile &&
                                  !hasPerGuildProfiles,
                              child: FluxerColorPickerField(
                                label: l10n.accentColorLabel,
                                description: l10n.accentColorDescription,
                                value: state.isPerGuildProfile
                                    ? (state.isEditedGuildAccentColorSet
                                          ? (state.editedGuildAccentColor ?? 0)
                                          : (state.guildAccentColor ??
                                                state.accentColor ??
                                                0))
                                    : (state.isEditedAccentColorSet
                                          ? (state.editedAccentColor ?? 0)
                                          : (state.accentColor ?? 0)),
                                onChanged: state.isPerGuildProfile
                                    ? vm.updateGuildAccentColor
                                    : vm.updateAccentColor,
                                defaultValue: 0x4641D9,
                              ),
                            ),
                          ),
                          SizedBox(height: layout.s6),
                          Opacity(
                            opacity:
                                state.isPerGuildProfile && !hasPerGuildProfiles
                                ? 0.5
                                : 1.0,
                            child: IgnorePointer(
                              ignoring:
                                  state.isPerGuildProfile &&
                                  !hasPerGuildProfiles,
                              child: _buildBioSection(state, vm, layout, l10n),
                            ),
                          ),
                          SizedBox(height: layout.s8),
                          ProfilePreviewCard(state: state),
                          if (state.isPremium && !state.isPerGuildProfile) ...[
                            SizedBox(height: layout.s8),
                            _buildPremiumBadgeSection(state, vm, layout, l10n),
                          ],
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!state.hasVerifiedEmail) _buildUnclaimedAccountBar(layout, l10n),
      ],
    );
  }

  Widget _buildProfileTypeSelector(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final guilds = ref.watch(
      guildListViewModelProvider.select((s) => s.guilds),
    );

    final items = <FluxerSelectItem<String>>[
      FluxerSelectItem(value: '', label: l10n.profileTypeGlobal),
      for (final guild in guilds)
        FluxerSelectItem(
          value: guild.id,
          label: guild.name,
          leading: FluxerAvatar.guild(
            imageUrl: guild.iconUrl,
            fallbackText: guild.name,
            size: 20,
          ),
        ),
    ];

    return FluxerSelect<String>(
      label: l10n.profileTypeLabel,
      items: items,
      value: state.selectedGuildId ?? '',
      enabled: !state.isDirty,
      description: state.isPerGuildProfile
          ? l10n.profileTypeGuildDescription
          : null,
      onChanged: (guildId) {
        unawaited(vm.selectGuild(guildId.isEmpty ? null : guildId));
      },
    );
  }

  Widget _buildPerGuildPremiumUpsell(
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final colors = context.colors;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.brandPrimary,
        borderRadius: layout.radiusMd,
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PhosphorIcon(
              PhosphorIconsFill.crown,
              color: colors.textOnBrandPrimary,
              size: 16,
            ),
            SizedBox(width: layout.s2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.perGuildPremiumUpsellText,
                    style: TextStyle(
                      color: colors.textOnBrandPrimary,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: layout.s2),
                  FluxerButton.inverted(
                    onPressed: () => _showPlutoniumSheet(context),
                    label: l10n.getPlutonium,
                    size: FluxerButtonSize.small,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAssetModeSelector({
    required GuildAssetMode value,
    required ValueChanged<GuildAssetMode> onChanged,
    required FluxerLocalizations l10n,
  }) {
    return FluxerRadioGroup<GuildAssetMode>(
      value: value,
      onChanged: onChanged,
      items: [
        FluxerRadioItem(
          value: GuildAssetMode.inherit,
          label: l10n.avatarModeInherit,
        ),
        FluxerRadioItem(
          value: GuildAssetMode.custom,
          label: l10n.avatarModeCustom,
        ),
        FluxerRadioItem(
          value: GuildAssetMode.unset,
          label: l10n.avatarModeUnset,
        ),
      ],
    );
  }

  Widget _buildGuildAvatarSection(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.avatarLabel,
          style: context.textStyles.label.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: layout.s2),
        _buildAssetModeSelector(
          value: state.guildAvatarMode,
          onChanged: vm.setGuildAvatarMode,
          l10n: l10n,
        ),
        if (state.guildAvatarMode == GuildAssetMode.custom) ...[
          SizedBox(height: layout.s3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FluxerButton.primary(
                onPressed: () => _handleImageUpload(isAvatar: true),
                label: l10n.changeAvatar,
              ),
              if (state.guildAvatar != null ||
                  state.editedGuildAvatarBase64 != null) ...[
                SizedBox(height: layout.s2),
                FluxerButton.secondary(
                  onPressed: vm.clearGuildAvatar,
                  label: l10n.removeAvatar,
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildGuildBannerSection(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.bannerLabel,
          style: context.textStyles.label.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: layout.s2),
        _buildAssetModeSelector(
          value: state.guildBannerMode,
          onChanged: vm.setGuildBannerMode,
          l10n: l10n,
        ),
        if (state.guildBannerMode == GuildAssetMode.custom) ...[
          SizedBox(height: layout.s3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FluxerButton.primary(
                onPressed: () => _handleImageUpload(isAvatar: false),
                label: l10n.changeBanner,
              ),
              if (state.guildBanner != null ||
                  state.editedGuildBannerBase64 != null) ...[
                SizedBox(height: layout.s2),
                FluxerButton.secondary(
                  onPressed: vm.clearGuildBanner,
                  label: l10n.removeBanner,
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildBioSection(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final colors = context.colors;
    final controller = state.isPerGuildProfile
        ? _guildBioController
        : _bioController;
    final onChanged = state.isPerGuildProfile
        ? () => vm.updateGuildBio(controller.actualText)
        : () => vm.updateBio(controller.actualText);

    return FluxerInputClipboardScope(
      key: _bioClipboardKey,
      controller: controller,
      builder:
          (
            BuildContext context,
            FluxerInputClipboardScopeState clipboardScope,
          ) {
            return ComposerAutocompleteField(
              key: _bioFieldKey,
              controller: controller,
              focusNode: _bioFocusNode,
              allowedTriggers: const <ComposerAutocompleteTriggerKind>{
                ComposerAutocompleteTriggerKind.emoji,
              },
              maxActualLength: _kMaxBioLength,
              onApplied: onChanged,
              child: ListenableBuilder(
                listenable: controller,
                builder: (context, _) {
                  final bioDisplayMaxLength = max(
                    0,
                    controller.text.length +
                        _kMaxBioLength -
                        controller.actualTextLength,
                  );
                  return FluxerInput.multiline(
                    controller: controller,
                    contextMenuBuilder: clipboardScope.buildContextMenu,
                    textCapitalization: TextCapitalization.sentences,
                    focusNode: _bioFocusNode,
                    label: l10n.aboutMeLabel,
                    maxLength: bioDisplayMaxLength,
                    maxLines: 6,
                    showCounter: true,
                    counterLength: () => controller.actualTextLength,
                    counterMax: _kMaxBioLength,
                    helperText: l10n.aboutMeHelperText,
                    onChanged: (_) => onChanged(),
                    suffixIcon: FluxerEmojiPickerPopout(
                      key: _expressionPickerKey,
                      visibleTabs: const [ExpressionPickerTab.emojis],
                      onEmojiSelected: (emoji) {
                        controller.insertEmoji(
                          emoji.name,
                          emoji.surrogates,
                          maxActualLength: _kMaxBioLength,
                        );
                        onChanged();
                      },
                      child: PhosphorIcon(
                        PhosphorIconsFill.smiley,
                        size: 20,
                        color: colors.textTertiary,
                      ),
                    ),
                    onSuffixTap: _onSmileyTap,
                  );
                },
              ),
            );
          },
    );
  }

  Widget _buildUsernameSection(
    UserSettingsViewState state,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final bool hasCustomDiscriminator = ref.watch(
      instanceFeatureEnabledProvider(LimitKeys.featureCustomDiscriminator),
    );
    final bool shouldShowPremiumCommerce = ref.watch(
      shouldShowPremiumCommerceProvider,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FluxerFieldLabel(l10n.usernameLabel),
        SizedBox(height: layout.s2),
        Wrap(
          spacing: layout.s2,
          runSpacing: layout.s2,
          children: [
            if (!state.hasVerifiedEmail)
              FluxerTooltip(
                message: l10n.claimAccountToChangeFluxerTag,
                child: FluxerButton.primary(
                  label: l10n.changeFluxerTag,
                  size: FluxerButtonSize.small,
                ),
              )
            else
              FluxerButton.primary(
                onPressed: () => showFluxerTagChangeSheet(context),
                label: l10n.changeFluxerTag,
                size: FluxerButtonSize.small,
              ),
            if (!hasCustomDiscriminator &&
                shouldShowPremiumCommerce &&
                !isMobileLayout(context))
              FluxerTooltip(
                message: l10n.customizeTagWithPlutoniumTooltip(
                  state.discriminator,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colors.brandPrimary,
                    borderRadius: layout.radiusSm,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: layout.s2,
                      vertical: layout.s1_5,
                    ),
                    child: PhosphorIcon(
                      PhosphorIconsFill.crown,
                      size: 16,
                      color: colors.textOnBrandPrimary,
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: layout.s3),
        FluxerHintText(l10n.changeUsernameAndTagHint),
        if (state.premiumDiscriminator &&
            shouldShowPremiumCommerce &&
            !state.hasLifetimePremium) ...[
          SizedBox(height: layout.s2),
          Text(
            l10n.customTagSubscriptionWarning(state.discriminator),
            style: textStyles.bodySmall.copyWith(color: colors.accentWarning),
          ),
        ],
      ],
    );
  }

  Widget _buildAvatarSection(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final hasAvatar =
        (state.avatarUrl != null || state.editedAvatarBase64 != null) &&
        !state.avatarCleared;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FluxerFieldLabel(l10n.avatarLabel),
        SizedBox(height: layout.s2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerButton.primary(
              onPressed: () => _handleImageUpload(isAvatar: true),
              label: l10n.changeAvatar,
              size: FluxerButtonSize.small,
            ),
            if (hasAvatar) ...[
              SizedBox(height: layout.s2),
              FluxerButton.secondary(
                onPressed: vm.clearAvatar,
                label: l10n.removeAvatar,
                size: FluxerButtonSize.small,
              ),
            ],
          ],
        ),
        SizedBox(height: layout.s3),
        FluxerHintText(
          state.isPremium
              ? l10n.avatarDescription
              : l10n.avatarDescriptionNonPremium,
        ),
      ],
    );
  }

  Widget _buildBannerSection(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    if (!state.isPremium) {
      if (!ref.watch(shouldShowPremiumCommerceProvider)) {
        return const SizedBox.shrink();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerFieldLabel(l10n.bannerLabel),
          SizedBox(height: layout.s2),
          DecoratedBox(
            decoration: BoxDecoration(
              color: colors.brandPrimary,
              borderRadius: layout.radiusMd,
            ),
            child: Padding(
              padding: EdgeInsets.all(layout.s3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 2, right: layout.s2),
                    child: PhosphorIcon(
                      PhosphorIconsFill.crown,
                      size: 16,
                      color: colors.textOnBrandPrimary,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.bannerPlutoniumUpsell,
                          style: textStyles.bodySmall.copyWith(
                            color: colors.textOnBrandPrimary,
                          ),
                        ),
                        SizedBox(height: layout.s2),
                        FluxerButton.inverted(
                          onPressed: () => _showPlutoniumSheet(context),
                          label: l10n.getPlutonium,
                          size: FluxerButtonSize.small,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    final hasBanner =
        (state.bannerUrl != null || state.editedBannerBase64 != null) &&
        !state.bannerCleared;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FluxerFieldLabel(l10n.bannerLabel),
        SizedBox(height: layout.s2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerButton.primary(
              onPressed: () => _handleImageUpload(isAvatar: false),
              label: l10n.changeBanner,
              size: FluxerButtonSize.small,
            ),
            if (hasBanner) ...[
              SizedBox(height: layout.s2),
              FluxerButton.secondary(
                onPressed: vm.clearBanner,
                label: l10n.removeBanner,
                size: FluxerButtonSize.small,
              ),
            ],
          ],
        ),
        SizedBox(height: layout.s3),
        FluxerHintText(l10n.bannerDescription),
      ],
    );
  }

  Widget _buildPremiumBadgeSection(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final badgeHidden = state.effectivePremiumBadgeHidden;
    final badgeMasked = state.effectivePremiumBadgeMasked;

    String timestampLabel = l10n.hidePlutoniumPurchaseDate;
    if (state.premiumSince != null) {
      final date = DateTime.tryParse(state.premiumSince!);
      if (date != null) {
        final formatted = formatUserMediumDate(date.toLocal(), l10n.localeName);
        timestampLabel = l10n.hidePlutoniumPurchaseDateWithDate(formatted);
      }
    }

    String sequenceLabel = l10n.hideVisionaryIdBadge;
    if (state.premiumLifetimeSequence != null) {
      sequenceLabel = l10n.hideVisionaryIdBadgeWithSequence(
        state.premiumLifetimeSequence!,
      );
    }

    return FluxerSettingsSection(
      title: l10n.plutoniumBadgePrivacyTitle,
      description: l10n.plutoniumBadgePrivacyDescription,
      children: [
        FluxerSettingsSubsection(
          children: [
            FluxerSwitchGroupItem(
              label: l10n.hidePlutoniumBadgeLabel,
              description: l10n.hidePlutoniumBadgeDescription,
              value: badgeHidden,
              onChanged: (value) => vm.setPremiumBadgeHidden(value: value),
            ),
            FluxerSwitchGroupItem(
              label: timestampLabel,
              description: l10n.hidePurchaseDateDescription,
              value: state.effectivePremiumBadgeTimestampHidden,
              enabled: !badgeHidden,
              onChanged: (value) =>
                  vm.setPremiumBadgeTimestampHidden(value: value),
            ),
            if (state.hasLifetimePremium) ...[
              FluxerSwitchGroupItem(
                label: l10n.maskVisionaryAsSubscription,
                description: l10n.maskVisionaryDescription,
                value: badgeMasked,
                enabled: !badgeHidden,
                onChanged: (value) => vm.setPremiumBadgeMasked(value: value),
              ),
              FluxerSwitchGroupItem(
                label: sequenceLabel,
                description: l10n.hideVisionaryIdDescription,
                value: state.effectivePremiumBadgeSequenceHidden,
                enabled: !badgeHidden && !badgeMasked,
                onChanged: (value) =>
                    vm.setPremiumBadgeSequenceHidden(value: value),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
