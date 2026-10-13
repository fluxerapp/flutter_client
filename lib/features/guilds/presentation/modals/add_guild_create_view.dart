import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/image_crop_sheet.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_acronym.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/text/fluxer_hint_text.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/image_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<String?> pickAddGuildIconDataUri({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final ({Uint8List bytes, String name})? picked = await ImageUtils.pickImage();
  if (picked == null || !context.mounted) {
    return null;
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
    return null;
  }
  final AnimationCheckResult animCheck = ImageUtils.checkAnimated(picked.bytes);
  if (animCheck.isAnimated) {
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: l10n.addGuildCreateAnimatedIconUnsupported,
            variant: FluxerToastVariant.warning,
          ),
        );
    return null;
  }
  if (!context.mounted) {
    return null;
  }
  final Uint8List? croppedBytes = await showImageCropSheet(
    context,
    imageBytes: picked.bytes,
    aspectRatio: 1,
    title: l10n.cropAvatar,
    maskShape: CropMaskShape.circle,
  );
  if (croppedBytes == null) {
    return null;
  }
  return ImageUtils.toDataUri(croppedBytes);
}

class AddGuildCreateView extends ConsumerStatefulWidget {
  const AddGuildCreateView({
    required this.nameController,
    required this.centered,
    this.errorText,
    this.enabled = true,
    super.key,
  });

  final TextEditingController nameController;
  final bool centered;
  final String? errorText;
  final bool enabled;

  @override
  ConsumerState<AddGuildCreateView> createState() => AddGuildCreateViewState();
}

class AddGuildCreateViewState extends ConsumerState<AddGuildCreateView> {
  String? _iconDataUri;

  String? get iconDataUri => _iconDataUri;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Widget? gate = buildAddGuildCreateGate(context, ref);
    if (gate != null) {
      return gate;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AddGuildIconField(
          nameController: widget.nameController,
          iconDataUri: _iconDataUri,
          centered: widget.centered,
          enabled: widget.enabled,
          removeLabel: l10n.guildSettingsOverviewRemoveImage,
          onChanged: (String? dataUri) =>
              setState(() => _iconDataUri = dataUri),
        ),
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
        const AddGuildGuidelines(),
      ],
    );
  }
}

Widget? buildAddGuildCreateGate(BuildContext context, WidgetRef ref) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final UserSettingsViewState settings = ref.watch(
    userSettingsViewModelProvider,
  );
  if (!settings.isProfileLoaded) {
    return const Center(child: FluxerLoadingSpinner());
  }
  if (!settings.isClaimed) {
    return AddGuildCreateGate(
      icon: PhosphorIconsFill.shieldWarning,
      title: l10n.addGuildCreateClaimTitle,
      description: l10n.addGuildCreateClaimDescription,
      actionLabel: l10n.claimAccount,
      onAction: () => ClaimAccountSheet.show(context, ref),
    );
  }
  if (!settings.isVerified) {
    return AddGuildCreateGate(
      icon: PhosphorIconsFill.envelopeSimple,
      title: l10n.addGuildCreateVerifyTitle,
      description: l10n.addGuildCreateVerifyDescription,
      actionLabel: l10n.addFriendVerifyEmail,
      onAction: () =>
          UserSettingsModal.show(context, openSecuritySection: true),
    );
  }
  return null;
}

class AddGuildIconField extends ConsumerWidget {
  const AddGuildIconField({
    required this.nameController,
    required this.iconDataUri,
    required this.centered,
    required this.enabled,
    required this.removeLabel,
    required this.onChanged,
    super.key,
  });

  final TextEditingController nameController;
  final String? iconDataUri;
  final bool centered;
  final bool enabled;
  final String removeLabel;
  final ValueChanged<String?> onChanged;

  Future<void> _pick(BuildContext context, WidgetRef ref) async {
    final String? dataUri = await pickAddGuildIconDataUri(
      context: context,
      ref: ref,
    );
    if (dataUri == null) {
      return;
    }
    onChanged(dataUri);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Widget preview = ListenableBuilder(
      listenable: nameController,
      builder: (BuildContext context, Widget? child) {
        return AddGuildIconPreview(
          name: nameController.text,
          iconDataUri: iconDataUri,
        );
      },
    );
    final Widget removeButton = FluxerButton.secondary(
      onPressed: enabled ? () => onChanged(null) : null,
      label: removeLabel,
      size: FluxerButtonSize.small,
      fitContent: true,
    );
    if (centered) {
      return Column(
        children: <Widget>[
          FluxerTappable(
            enabled: enabled,
            onTap: () => unawaited(_pick(context, ref)),
            semanticLabel: iconDataUri == null
                ? l10n.guildSettingsOverviewUploadIcon
                : l10n.addGuildCreateChangeIcon,
            builder: (BuildContext context, Set<WidgetState> states) {
              return Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  ListenableBuilder(
                    listenable: nameController,
                    builder: (BuildContext context, Widget? child) {
                      final bool empty =
                          iconDataUri == null &&
                          nameController.text.trim().isEmpty;
                      return empty
                          ? const _AddGuildIconPlaceholder()
                          : AddGuildIconPreview(
                              name: nameController.text,
                              iconDataUri: iconDataUri,
                            );
                    },
                  ),
                  PositionedDirectional(
                    top: -4,
                    end: -4,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: context.colors.brandPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: PhosphorIcon(
                          iconDataUri == null
                              ? PhosphorIconsBold.plus
                              : PhosphorIconsBold.pencilSimple,
                          size: 16,
                          color: context.colors.brandPrimaryFill,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          if (iconDataUri != null) ...<Widget>[
            const SizedBox(height: 12),
            removeButton,
          ],
        ],
      );
    }
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
            preview,
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
                        onPressed: enabled
                            ? () => unawaited(_pick(context, ref))
                            : null,
                        label: iconDataUri == null
                            ? l10n.guildSettingsOverviewUploadIcon
                            : l10n.addGuildCreateChangeIcon,
                        size: FluxerButtonSize.small,
                        fitContent: true,
                      ),
                      if (iconDataUri != null) removeButton,
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
}

class _AddGuildIconPlaceholder extends StatelessWidget {
  const _AddGuildIconPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AddGuildIconPreview.size,
      height: AddGuildIconPreview.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.textPrimaryMuted, width: 2),
      ),
      child: Center(
        child: PhosphorIcon(
          PhosphorIconsFill.camera,
          size: 28,
          color: context.colors.textPrimary,
        ),
      ),
    );
  }
}

class AddGuildGuidelines extends ConsumerStatefulWidget {
  const AddGuildGuidelines({super.key});

  @override
  ConsumerState<AddGuildGuidelines> createState() => _AddGuildGuidelinesState();
}

class _AddGuildGuidelinesState extends ConsumerState<AddGuildGuidelines> {
  final TapGestureRecognizer _recognizer = TapGestureRecognizer();

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final WellKnownFluxerResponse? wellKnown = ref
        .watch(wellKnownProvider)
        .asData
        ?.value;
    final String productName = wellKnown == null
        ? InstanceConstants.defaultProductName
        : InstanceRuntimeConfig.fromWellKnown(wellKnown).productName;
    final String marketing =
        wellKnown?.endpoints.marketing.trim().replaceAll(RegExp(r'/+$'), '') ??
        '';
    final String? guidelinesUrl = marketing.isEmpty
        ? null
        : '$marketing/guidelines';
    final TextStyle style = context.textStyles.bodySmall.copyWith(
      color: context.colors.textSecondary,
      height: 1.4,
    );
    _recognizer.onTap = guidelinesUrl == null
        ? null
        : () => unawaited(handleExternalLinkTap(context, guidelinesUrl));
    return Text.rich(
      TextSpan(
        style: style,
        children: <InlineSpan>[
          TextSpan(text: l10n.addGuildCreateGuidelinesBefore),
          TextSpan(
            text: l10n.addGuildCreateGuidelinesLink(productName),
            style: guidelinesUrl == null
                ? null
                : TextStyle(color: context.colors.textLink),
            mouseCursor: guidelinesUrl == null
                ? null
                : SystemMouseCursors.click,
            recognizer: guidelinesUrl == null ? null : _recognizer,
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}

class AddGuildIconPreview extends StatelessWidget {
  const AddGuildIconPreview({
    required this.name,
    required this.iconDataUri,
    super.key,
  });

  static const double size = 80;

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
          width: size,
          height: size,
          fit: BoxFit.cover,
        ),
      );
    }
    return _buildCircle(
      context,
      child: name.trim().isEmpty ? null : FluxerGuildAcronym(name: name),
    );
  }

  Widget _buildCircle(BuildContext context, {Widget? child}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: context.colors.backgroundTertiary,
        shape: BoxShape.circle,
        border: Border.all(color: context.colors.backgroundModifierAccent),
      ),
      clipBehavior: Clip.hardEdge,
      child: child,
    );
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

class AddGuildCreateGate extends StatelessWidget {
  const AddGuildCreateGate({
    required this.icon,
    required this.title,
    required this.description,
    required this.actionLabel,
    required this.onAction,
    super.key,
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
