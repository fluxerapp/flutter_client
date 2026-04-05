import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/expression_picker.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:intl/intl.dart';
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
  final _expressionPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();

  bool _controllersInitialized = false;

  @override
  void initState() {
    super.initState();
    _displayNameController = TextEditingController();
    _pronounsController = TextEditingController();
    _bioController = EmojiTextEditingController();
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _pronounsController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _syncControllers(UserSettingsViewState state) {
    if (!_controllersInitialized && state.isProfileLoaded) {
      _displayNameController.text = state.displayName;
      _pronounsController.text = state.pronouns ?? '';
      _bioController.loadWithTokens(state.bio ?? '');
      _controllersInitialized = true;
    }
  }

  void _onSmileyTap() {
    if (isMobileLayout(context)) {
      unawaited(
        FluxerEmojiPickerSheet.show(
          context,
          title: 'Emoji',
          maxHeight: 0.88,
          onEmojiSelected: (emoji) =>
              _bioController.insertEmoji(emoji.name, emoji.surrogates),
          visibleTabs: const [ExpressionPickerTab.emojis],
        ),
      );
    } else {
      _expressionPickerKey.currentState?.toggle();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userSettingsViewModelProvider);
    _syncControllers(state);

    if (!state.isProfileLoaded) {
      return const Center(child: FluxerLoadingSpinner());
    }

    final vm = ref.read(userSettingsViewModelProvider.notifier);
    final layout = context.layout;
    final colors = context.colors;

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FluxerSectionHeading(
            title: 'Profile Customization',
            description: 'Edit your profile appearance and see a live preview',
          ),
          if (state.isOutOfBandTrialActive) ...[
            SizedBox(height: layout.s6),
            _buildPremiumTrialBanner(state, layout),
          ],
          SizedBox(height: layout.s6),
          _buildUsernameSection(state, layout),
          SizedBox(height: layout.s6),
          FluxerInput(
            controller: _displayNameController,
            label: 'Display Name',
            hint: state.username,
            maxLength: _kMaxDisplayNameLength,
            onChanged: vm.updateDisplayName,
          ),
          SizedBox(height: layout.s6),
          FluxerInput(
            controller: _pronounsController,
            label: 'Pronouns',
            maxLength: _kMaxPronounsLength,
            onChanged: vm.updatePronouns,
          ),
          SizedBox(height: layout.s6),
          _buildAvatarSection(state, vm, layout),
          SizedBox(height: layout.s6),
          _buildBannerSection(state, vm, layout),
          SizedBox(height: layout.s6),
          FluxerColorPickerField(
            label: 'Accent Color',
            description:
                'Customizes the border and banner color on '
                'your profile',
            value: state.isEditedAccentColorSet
                ? (state.editedAccentColor ?? 0)
                : (state.accentColor ?? 0),
            onChanged: vm.updateAccentColor,
            defaultValue: 0x4641D9,
          ),
          SizedBox(height: layout.s6),
          FluxerInput.multiline(
            controller: _bioController,
            label: 'About Me',
            maxLength: _kMaxBioLength,
            maxLines: 6,
            showCounter: true,
            helperText: 'You can use links, emoji, and Markdown.',
            onChanged: (_) => vm.updateBio(_bioController.actualText),
            suffixIcon: FluxerEmojiPickerPopout(
              key: _expressionPickerKey,
              visibleTabs: const [ExpressionPickerTab.emojis],
              onEmojiSelected: (emoji) =>
                  _bioController.insertEmoji(emoji.name, emoji.surrogates),
              child: PhosphorIcon(
                PhosphorIconsFill.smiley,
                size: 20,
                color: colors.textTertiary,
              ),
            ),
            onSuffixTap: _onSmileyTap,
          ),
          if (state.isPremium) ...[
            SizedBox(height: layout.s8),
            _buildPremiumBadgeSection(state, vm, layout),
          ],
          SizedBox(height: layout.s8),
        ],
      ),
    );
  }

  Widget _buildUsernameSection(
    UserSettingsViewState state,
    FluxerLayoutTheme layout,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    final isMobile = isMobileLayout(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FluxerFieldLabel('Username'),
        SizedBox(height: layout.s2),
        Wrap(
          spacing: layout.s2,
          runSpacing: layout.s2,
          children: [
            if (!state.hasVerifiedEmail)
              const FluxerTooltip(
                message: 'Claim your account to change your FluxerTag',
                child: FluxerButton.primary(
                  onPressed: null,
                  label: 'Change FluxerTag',
                  size: FluxerButtonSize.small,
                ),
              )
            else
              const FluxerButton.primary(
                onPressed: null,
                label: 'Change FluxerTag',
                size: FluxerButtonSize.small,
              ),
            if (!isMobile && !state.isPremium)
              FluxerTooltip(
                message: 'Customize your 4-digit tag '
                    '(#${state.discriminator}) with Plutonium',
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
                    child: const PhosphorIcon(
                      PhosphorIconsFill.crown,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: layout.s3),
        const FluxerHintText('Change your username and 4-digit tag'),
        if (state.premiumDiscriminator && !state.hasLifetimePremium) ...[
          SizedBox(height: layout.s2),
          Text(
            'Your custom tag (#${state.discriminator}) is tied to your '
            'Plutonium subscription and will revert to a random '
            'tag if it expires.',
            style: textStyles.bodySmall.copyWith(
              color: colors.accentWarning,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPremiumTrialBanner(
    UserSettingsViewState state,
    FluxerLayoutTheme layout,
  ) {
    final colors = context.colors;
    final textStyles = context.textStyles;

    final expiryDate = state.premiumOutOfBandTrialEndsAt;
    final expiryLabel = expiryDate != null
        ? DateFormat.yMMMd().format(expiryDate)
        : null;
    final hasActiveSubscription = state.premiumBillingCycle != null;

    final String title;
    final String? description;

    if (hasActiveSubscription && expiryLabel != null) {
      title = "You're on a Plutonium trial — your subscription "
          'starts on $expiryLabel';
      description = 'Your subscription will automatically begin when '
          'your trial ends. No action needed.';
    } else {
      title = expiryLabel != null
          ? "You're on a Plutonium trial that expires on "
              '$expiryLabel'
          : "You're on a Plutonium trial";
      description = null;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.brandPrimary,
        borderRadius: layout.radiusMd,
      ),
      child: Padding(
        padding: EdgeInsets.all(layout.s3),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: layout.s3),
              child: const PhosphorIcon(
                PhosphorIconsFill.crown,
                size: 32,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textStyles.bodySmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (description != null) ...[
                    SizedBox(height: layout.s1),
                    Text(
                      description,
                      style: textStyles.bodySmall.copyWith(
                        color: const Color.fromRGBO(255, 255, 255, 0.9),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
  ) {
    final hasAvatar =
        (state.avatarUrl != null || state.editedAvatarBase64 != null) &&
        !state.avatarCleared;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FluxerFieldLabel('Avatar'),
        SizedBox(height: layout.s2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerButton.primary(
              onPressed: () {},
              label: 'Upload Avatar',
              size: FluxerButtonSize.small,
            ),
            if (hasAvatar) ...[
              SizedBox(height: layout.s2),
              FluxerButton.secondary(
                onPressed: vm.clearAvatar,
                label: 'Remove Avatar',
                size: FluxerButtonSize.small,
              ),
            ],
          ],
        ),
        SizedBox(height: layout.s3),
        const FluxerHintText(
          'Recommended: 512×512 or larger, PNG or '
          'JPG under 10 MB',
        ),
      ],
    );
  }

  Widget _buildBannerSection(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
  ) {
    final hasBanner =
        (state.bannerUrl != null || state.editedBannerBase64 != null) &&
        !state.bannerCleared;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const FluxerFieldLabel('Banner'),
        SizedBox(height: layout.s2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerButton.primary(
              onPressed: () {},
              label: 'Upload Banner',
              size: FluxerButtonSize.small,
            ),
            if (hasBanner) ...[
              SizedBox(height: layout.s2),
              FluxerButton.secondary(
                onPressed: vm.clearBanner,
                label: 'Remove Banner',
                size: FluxerButtonSize.small,
              ),
            ],
          ],
        ),
        SizedBox(height: layout.s3),
        const FluxerHintText(
          'Recommended: 1500×500 or larger, PNG or '
          'JPG under 10 MB',
        ),
      ],
    );
  }

  Widget _buildPremiumBadgeSection(
    UserSettingsViewState state,
    UserSettingsViewModel vm,
    FluxerLayoutTheme layout,
  ) {
    final badgeHidden = state.effectivePremiumBadgeHidden;
    final badgeMasked = state.effectivePremiumBadgeMasked;

    String timestampLabel = 'Hide Plutonium purchase date';
    if (state.premiumSince != null) {
      final date = DateTime.tryParse(state.premiumSince!);
      if (date != null) {
        final formatted = DateFormat.yMMMd().format(date);
        timestampLabel = 'Hide Plutonium purchase date ($formatted)';
      }
    }

    String sequenceLabel = 'Hide Visionary ID badge';
    if (state.premiumLifetimeSequence != null) {
      sequenceLabel =
          'Hide Visionary ID badge (#${state.premiumLifetimeSequence})';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const FluxerSectionHeading(
          title: 'Plutonium Badge Privacy',
          description:
              'Control how your Plutonium badge is displayed to others',
        ),
        SizedBox(height: layout.s4),
        FluxerSwitchGroupItem(
          label: 'Hide Plutonium badge entirely',
          description: 'Completely hide your Plutonium badge from other users',
          value: badgeHidden,
          onChanged: (value) =>
              vm.togglePremiumBadge('premium_badge_hidden', value: value),
        ),
        FluxerSwitchGroupItem(
          label: timestampLabel,
          description: 'Remove when you first bought Plutonium from your badge',
          value: state.effectivePremiumBadgeTimestampHidden,
          enabled: !badgeHidden,
          onChanged: (value) => vm.togglePremiumBadge(
            'premium_badge_timestamp_hidden',
            value: value,
          ),
        ),
        if (state.hasLifetimePremium) ...[
          FluxerSwitchGroupItem(
            label: 'Mask Visionary as subscription',
            description:
                'Show your Visionary as a regular subscription instead',
            value: badgeMasked,
            enabled: !badgeHidden,
            onChanged: (value) =>
                vm.togglePremiumBadge('premium_badge_masked', value: value),
          ),
          FluxerSwitchGroupItem(
            label: sequenceLabel,
            description: 'Remove your Visionary ID badge',
            value: state.effectivePremiumBadgeSequenceHidden,
            enabled: !badgeHidden && !badgeMasked,
            onChanged: (value) => vm.togglePremiumBadge(
              'premium_badge_sequence_hidden',
              value: value,
            ),
          ),
        ],
      ],
    );
  }
}
