import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_sheet.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/text/fluxer_hint_text.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/guild_name_abbreviation.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddGuildCreateView extends ConsumerStatefulWidget {
  const AddGuildCreateView({
    required this.nameController,
    this.errorText,
    this.enabled = true,
    super.key,
  });

  final TextEditingController nameController;
  final String? errorText;
  final bool enabled;

  @override
  ConsumerState<AddGuildCreateView> createState() => AddGuildCreateViewState();
}

class AddGuildCreateViewState extends ConsumerState<AddGuildCreateView> {
  String? _iconDataUri;

  @override
  void initState() {
    super.initState();
    widget.nameController.addListener(_onNameControllerChanged);
  }

  @override
  void didUpdateWidget(AddGuildCreateView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.nameController != widget.nameController) {
      oldWidget.nameController.removeListener(_onNameControllerChanged);
      widget.nameController.addListener(_onNameControllerChanged);
    }
  }

  @override
  void dispose() {
    widget.nameController.removeListener(_onNameControllerChanged);
    super.dispose();
  }

  void _onNameControllerChanged() {
    setState(() {});
  }

  String? get iconDataUri => _iconDataUri;

  Future<void> _handleIconUpload() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ({Uint8List bytes, String name})? picked =
        await ImageUtils.pickImage();
    if (picked == null || !mounted) {
      return;
    }
    if (ImageUtils.isOverSizeLimit(picked.bytes)) {
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
    final AnimationCheckResult animCheck = ImageUtils.checkAnimated(
      picked.bytes,
    );
    if (animCheck.isAnimated) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.addGuildCreateAnimatedIconUnsupported,
              variant: FluxerToastVariant.warning,
            ),
          );
      return;
    }
    if (!mounted) {
      return;
    }
    final Uint8List? croppedBytes = await showImageCropSheet(
      context,
      imageBytes: picked.bytes,
      aspectRatio: 1,
      title: l10n.cropAvatar,
      maskShape: CropMaskShape.circle,
    );
    if (croppedBytes == null || !mounted) {
      return;
    }
    setState(() => _iconDataUri = ImageUtils.toDataUri(croppedBytes));
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
      return _AddGuildCreateGate(
        icon: PhosphorIconsFill.shieldWarning,
        title: l10n.addGuildCreateClaimTitle,
        description: l10n.addGuildCreateClaimDescription,
        actionLabel: l10n.claimAccount,
        onAction: () => ClaimAccountSheet.show(context, ref),
      );
    }
    if (!settings.verified) {
      return _AddGuildCreateGate(
        icon: PhosphorIconsFill.envelopeSimple,
        title: l10n.addGuildCreateVerifyTitle,
        description: l10n.addGuildCreateVerifyDescription,
        actionLabel: l10n.addFriendVerifyEmail,
        onAction: () =>
            UserSettingsModal.show(context, openSecuritySection: true),
      );
    }
    final AsyncValue<WellKnownFluxerResponse> wellKnown = ref.watch(
      wellKnownProvider,
    );
    final String productName = wellKnown.maybeWhen(
      data: (WellKnownFluxerResponse response) =>
          response.appPublic.branding.productName,
      orElse: () => 'Fluxer',
    );
    final String? guidelinesUrl = wellKnown.maybeWhen(
      data: (WellKnownFluxerResponse response) {
        final String marketing = response.endpoints.marketing.trim();
        if (marketing.isEmpty) {
          return null;
        }
        return '${marketing.replaceAll(RegExp(r'/+$'), '')}/guidelines';
      },
      orElse: () => null,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          l10n.addGuildCreateDescription,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        _buildIconSection(context, l10n),
        const SizedBox(height: 16),
        FluxerInput(
          controller: widget.nameController,
          label: l10n.addGuildCreateNameLabel,
          errorText: widget.errorText,
          autofocus: true,
          maxLength: 100,
          enabled: widget.enabled,
        ),
        const SizedBox(height: 12),
        _buildGuidelines(context, l10n, productName, guidelinesUrl),
      ],
    );
  }

  Widget _buildIconSection(BuildContext context, FluxerLocalizations l10n) {
    final String name = widget.nameController.text;
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
            _CreateGuildIconPreview(name: name, iconDataUri: _iconDataUri),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Wrap(
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
                          label: l10n.guildSettingsOverviewRemoveImage,
                          size: FluxerButtonSize.small,
                          fitContent: true,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  FluxerHintText(l10n.addGuildCreateIconHint),
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

class _CreateGuildIconPreview extends StatelessWidget {
  const _CreateGuildIconPreview({
    required this.name,
    required this.iconDataUri,
  });

  static const double _size = 80;

  final String name;
  final String? iconDataUri;

  @override
  Widget build(BuildContext context) {
    final Uint8List? bytes = _decodeDataUri(iconDataUri);
    if (bytes != null) {
      return _buildCircle(
        context,
        child: Image.memory(
          bytes,
          width: _size,
          height: _size,
          fit: BoxFit.cover,
        ),
      );
    }
    final String initials = abbreviateGuildName(name);
    final int initialsLength = guildNameInitialsLength(name);
    return _buildCircle(
      context,
      child: initials.isEmpty || initials == '?'
          ? null
          : Center(
              child: Text(
                initials,
                style: context.textStyles.smallText.copyWith(
                  color: context.colors.textPrimary,
                  fontSize: _initialsFontSize(initialsLength),
                  height: 1,
                ),
              ),
            ),
    );
  }

  Widget _buildCircle(BuildContext context, {Widget? child}) {
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: context.colors.backgroundTertiary,
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.backgroundModifierAccent),
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
  }

  double _initialsFontSize(int initialsLength) {
    if (initialsLength <= 2) {
      return 22;
    }
    if (initialsLength == 3) {
      return 18;
    }
    return 15;
  }

  Uint8List? _decodeDataUri(String? dataUri) {
    if (dataUri == null) {
      return null;
    }
    final int commaIndex = dataUri.indexOf(',');
    if (commaIndex < 0) {
      return null;
    }
    try {
      return base64Decode(dataUri.substring(commaIndex + 1));
    } on FormatException {
      return null;
    }
  }
}

class _AddGuildCreateGate extends StatelessWidget {
  const _AddGuildCreateGate({
    required this.icon,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onAction,
  });

  final IconData icon;
  final String title;
  final String description;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        PhosphorIcon(icon, size: 48, color: context.colors.textPrimaryMuted),
        const SizedBox(height: 16),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textStyles.heading.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textSecondary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        FluxerButton.primary(label: actionLabel, onPressed: onAction),
      ],
    );
  }
}
