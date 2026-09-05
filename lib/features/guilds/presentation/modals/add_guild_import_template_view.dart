import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_create_view.dart';
import 'package:fluxer_app/features/guilds/utils/discord_template_parser.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/stepped_carousel/fluxer_stepped_carousel.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum AddGuildImportStep { url, create }

const List<AddGuildImportStep> _importStepOrder = <AddGuildImportStep>[
  AddGuildImportStep.url,
  AddGuildImportStep.create,
];

class AddGuildImportTemplateView extends ConsumerStatefulWidget {
  const AddGuildImportTemplateView({
    required this.urlController,
    required this.nameController,
    required this.step,
    required this.onUrlSubmitted,
    this.template,
    this.urlErrorText,
    this.createErrorText,
    this.enabled = true,
    super.key,
  });

  final TextEditingController urlController;
  final TextEditingController nameController;
  final AddGuildImportStep step;
  final VoidCallback onUrlSubmitted;
  final DiscordGuildTemplate? template;
  final String? urlErrorText;
  final String? createErrorText;
  final bool enabled;

  @override
  ConsumerState<AddGuildImportTemplateView> createState() =>
      AddGuildImportTemplateViewState();
}

class AddGuildImportTemplateViewState
    extends ConsumerState<AddGuildImportTemplateView> {
  String? _iconDataUri;

  String? get iconDataUri => _iconDataUri;

  Future<void> _handleIconUpload() async {
    final String? dataUri = await pickAddGuildIconDataUri(
      context: context,
      ref: ref,
    );
    if (dataUri == null || !mounted) {
      return;
    }
    setState(() => _iconDataUri = dataUri);
  }

  void _clearIcon() {
    setState(() => _iconDataUri = null);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
    if (!settings.isProfileLoaded) {
      return const Center(child: FluxerLoadingSpinner());
    }
    if (!settings.hasVerifiedEmail) {
      return AddGuildCreateGate(
        icon: PhosphorIconsFill.shieldWarning,
        title: l10n.addGuildCreateClaimTitle,
        description: l10n.addGuildCreateClaimDescription,
        actionLabel: l10n.claimAccount,
        onAction: () => ClaimAccountSheet.show(context, ref),
      );
    }
    if (!settings.verified) {
      return AddGuildCreateGate(
        icon: PhosphorIconsFill.envelopeSimple,
        title: l10n.addGuildCreateVerifyTitle,
        description: l10n.addGuildCreateVerifyDescription,
        actionLabel: l10n.addFriendVerifyEmail,
        onAction: () =>
            UserSettingsModal.show(context, openSecuritySection: true),
      );
    }
    return FluxerSteppedCarousel<AddGuildImportStep>(
      step: widget.step,
      steps: _importStepOrder,
      child: switch (widget.step) {
        AddGuildImportStep.url => _buildUrlStep(context, l10n),
        AddGuildImportStep.create => _buildCreateStep(context, l10n),
      },
    );
  }

  Widget _buildUrlStep(BuildContext context, FluxerLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          l10n.addGuildImportDescription,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 12),
        FluxerInput(
          controller: widget.urlController,
          label: l10n.addGuildImportUrlLabel,
          hint: kDiscordTemplateExampleUrl,
          errorText: widget.urlErrorText,
          autofocus: true,
          enabled: widget.enabled,
          onSubmitted: (_) => widget.onUrlSubmitted(),
        ),
      ],
    );
  }

  Widget _buildCreateStep(BuildContext context, FluxerLocalizations l10n) {
    final WellKnownFluxerResponse? wellKnown = ref
        .watch(wellKnownProvider)
        .asData
        ?.value;
    final String productName = wellKnown == null
        ? InstanceConstants.defaultProductName
        : InstanceRuntimeConfig.fromWellKnown(wellKnown).productName;
    final DiscordGuildTemplate? template = widget.template;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (template != null) ...<Widget>[
          _TemplatePreviewCard(template: template),
          const SizedBox(height: 16),
        ],
        _buildIconSection(context, l10n),
        const SizedBox(height: 16),
        FluxerInput(
          controller: widget.nameController,
          label: l10n.addGuildCreateNameLabel,
          errorText: widget.createErrorText,
          autofocus: true,
          maxLength: 100,
          enabled: widget.enabled,
        ),
        const SizedBox(height: 12),
        _buildGuidelines(
          context,
          l10n,
          productName,
          _communityGuidelinesUrl(wellKnown),
        ),
      ],
    );
  }

  Widget _buildIconSection(BuildContext context, FluxerLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          l10n.addGuildCreateIconLabel,
          style: context.textStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListenableBuilder(
              listenable: widget.nameController,
              builder: (BuildContext context, Widget? child) {
                return AddGuildIconPreview(
                  name: widget.nameController.text,
                  iconDataUri: _iconDataUri,
                );
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: <Widget>[
                  FluxerButton.secondary(
                    onPressed: widget.enabled
                        ? () => unawaited(_handleIconUpload())
                        : null,
                    label: _iconDataUri == null
                        ? l10n.guildSettingsOverviewUploadIcon
                        : l10n.addGuildCreateChangeIcon,
                    size: FluxerButtonSize.small,
                    fitContent: true,
                  ),
                  if (_iconDataUri != null)
                    FluxerButton.secondary(
                      onPressed: widget.enabled ? _clearIcon : null,
                      label: l10n.addGuildImportRemoveIcon,
                      size: FluxerButtonSize.small,
                      fitContent: true,
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildGuidelines(
    BuildContext context,
    FluxerLocalizations l10n,
    String productName,
    String? guidelinesUrl,
  ) {
    final TextStyle style = context.textStyles.bodySmall.copyWith(
      color: context.colors.textSecondary,
      height: 1.4,
    );
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Text(l10n.addGuildCreateGuidelinesBefore, style: style),
        if (guidelinesUrl != null)
          FluxerTextLink(
            text: l10n.addGuildCreateGuidelinesLink(productName),
            url: guidelinesUrl,
            style: style,
          )
        else
          Text(l10n.addGuildCreateGuidelinesLink(productName), style: style),
        Text('.', style: style),
      ],
    );
  }
}

String? _communityGuidelinesUrl(WellKnownFluxerResponse? response) {
  if (response == null) {
    return null;
  }
  String marketing = response.endpoints.marketing.trim();
  if (marketing.isEmpty) {
    return null;
  }
  while (marketing.endsWith('/')) {
    marketing = marketing.substring(0, marketing.length - 1);
  }
  return '$marketing/guidelines';
}

class _TemplatePreviewCard extends StatelessWidget {
  const _TemplatePreviewCard({required this.template});

  final DiscordGuildTemplate template;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final DiscordTemplateStats stats = template.stats;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colors.backgroundModifierAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.addGuildImportTemplateLabel.toUpperCase(),
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.32,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            template.name,
            style: context.textStyles.label.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.addGuildImportTemplateStats(
              stats.textChannelCount,
              stats.voiceChannelCount,
              stats.categoryCount,
              stats.roleCount,
            ),
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
