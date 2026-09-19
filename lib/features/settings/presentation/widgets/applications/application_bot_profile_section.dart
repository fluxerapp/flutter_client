import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_read_only_input.dart';
import 'package:fluxer_app/features/settings/utils/bot_username.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ApplicationBotProfileSection extends StatelessWidget {
  const ApplicationBotProfileSection({
    required this.usernameController,
    required this.discriminator,
    required this.bioController,
    required this.usernameError,
    required this.displayAvatarUrl,
    required this.fallbackLetter,
    required this.hasAvatar,
    required this.displayBannerUrl,
    required this.hasBanner,
    required this.friendlyBot,
    required this.manualApproval,
    required this.onChangeAvatar,
    required this.onClearAvatar,
    required this.onChangeBanner,
    required this.onClearBanner,
    required this.onFriendlyBotChanged,
    required this.onManualApprovalChanged,
    super.key,
  });

  final TextEditingController usernameController;
  final String discriminator;
  final TextEditingController bioController;
  final String? usernameError;
  final String? displayAvatarUrl;
  final String fallbackLetter;
  final bool hasAvatar;
  final String? displayBannerUrl;
  final bool hasBanner;
  final bool friendlyBot;
  final bool manualApproval;
  final VoidCallback onChangeAvatar;
  final VoidCallback onClearAvatar;
  final VoidCallback onChangeBanner;
  final VoidCallback onClearBanner;
  final ValueChanged<bool> onFriendlyBotChanged;
  final ValueChanged<bool> onManualApprovalChanged;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;

    return FluxerSettingsSection(
      title: l10n.applicationsBotProfileTitle,
      description: l10n.applicationsBotProfileDescription,
      sectionId: 'applications-bot-profile',
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ClipOval(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: _mediaImage(
                    url: displayAvatarUrl,
                    fallback: _letterAvatar(colors, fallbackLetter),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: layout.s3),
            FluxerFieldLabel(l10n.avatarLabel),
            SizedBox(height: layout.s2),
            FluxerButton.primary(
              onPressed: onChangeAvatar,
              label: l10n.changeAvatar,
              size: FluxerButtonSize.small,
            ),
            if (hasAvatar) ...[
              SizedBox(height: layout.s2),
              FluxerButton.secondary(
                onPressed: onClearAvatar,
                label: l10n.removeAvatar,
                size: FluxerButtonSize.small,
              ),
            ],
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final Widget username = FluxerInput(
                  controller: usernameController,
                  label: l10n.usernameLabel,
                  hint: kExampleBotName,
                  maxLength: kBotUsernameMaxLength,
                  errorText: usernameError,
                );
                final Widget tag = ApplicationReadOnlyInput(
                  text: discriminator,
                  label: l10n.applicationsDiscriminator,
                  enabled: false,
                );
                if (constraints.maxWidth < 420) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      username,
                      SizedBox(height: layout.s3),
                      tag,
                    ],
                  );
                }
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: username),
                    SizedBox(width: layout.s2),
                    Expanded(flex: 2, child: tag),
                  ],
                );
              },
            ),
            SizedBox(height: layout.s2),
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: usernameController,
              builder: (context, value, _) {
                return _UsernameValidationRules(username: value.text);
              },
            ),
          ],
        ),
        FluxerInput.multiline(
          controller: bioController,
          label: l10n.applicationsBotBio,
          hint: l10n.applicationsBotBioHint,
          maxLength: 1024,
          maxLines: 6,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerFieldLabel(l10n.bannerLabel),
            SizedBox(height: layout.s2),
            if (displayBannerUrl != null)
              ClipRRect(
                borderRadius: layout.radiusMd,
                child: AspectRatio(
                  aspectRatio: 17 / 6,
                  child: _mediaImage(
                    url: displayBannerUrl,
                    fallback: _bannerPlaceholder(context, l10n),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              _bannerPlaceholder(context, l10n),
            SizedBox(height: layout.s3),
            FluxerButton.primary(
              onPressed: onChangeBanner,
              label: l10n.changeBanner,
              size: FluxerButtonSize.small,
            ),
            if (hasBanner) ...[
              SizedBox(height: layout.s2),
              FluxerButton.secondary(
                onPressed: onClearBanner,
                label: l10n.removeBanner,
                size: FluxerButtonSize.small,
              ),
            ],
          ],
        ),
        FluxerSwitchGroup(
          children: [
            FluxerSwitchGroupItem(
              label: l10n.applicationsFriendlyBot,
              description: l10n.applicationsFriendlyBotDescription,
              value: friendlyBot,
              onChanged: onFriendlyBotChanged,
            ),
            FluxerSwitchGroupItem(
              label: l10n.applicationsManualFriendApproval,
              description: l10n.applicationsManualFriendApprovalDescription,
              value: manualApproval,
              enabled: friendlyBot,
              onChanged: onManualApprovalChanged,
            ),
          ],
        ),
      ],
    );
  }

  Widget _mediaImage({
    required String? url,
    required Widget fallback,
    required BoxFit fit,
  }) {
    if (url == null || url.isEmpty) {
      return fallback;
    }
    if (url.startsWith('data:')) {
      final bytes = ImageUtils.decodeDataUri(url);
      if (bytes == null) {
        return fallback;
      }
      return Image.memory(bytes, fit: fit);
    }
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      errorBuilder: (_, _, _) => fallback,
    );
  }

  Widget _letterAvatar(FluxerColorTheme colors, String letter) {
    return ColoredBox(
      color: colors.backgroundTertiary,
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            color: colors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
    );
  }

  Widget _bannerPlaceholder(BuildContext context, FluxerLocalizations l10n) {
    return Container(
      height: 88,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colors.backgroundTertiary,
        borderRadius: context.layout.radiusMd,
        border: Border.all(color: context.colors.borderColor),
      ),
      child: Text(
        l10n.applicationsNoBotBanner,
        style: context.textStyles.bodySmall.copyWith(
          color: context.colors.textPrimaryMuted,
        ),
      ),
    );
  }
}

class _UsernameValidationRules extends StatelessWidget {
  const _UsernameValidationRules({required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final BotUsernameRules rules = botUsernameRules(username);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _UsernameRule(
          label: l10n.validationLengthRange(
            kBotUsernameMinLength,
            kBotUsernameMaxLength,
          ),
          isValid: rules.validLength,
        ),
        _UsernameRule(
          label: l10n.validationAllowedChars,
          isValid: rules.validCharacters,
        ),
      ],
    );
  }
}

class _UsernameRule extends StatelessWidget {
  const _UsernameRule({required this.label, required this.isValid});

  final String label;
  final bool isValid;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = isValid ? colors.accentSuccess : colors.textTertiary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          PhosphorIcon(
            isValid ? PhosphorIconsBold.check : PhosphorIconsBold.x,
            size: 16,
            color: color,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: context.textStyles.bodySmall.copyWith(color: color),
            ),
          ),
        ],
      ),
    );
  }
}
