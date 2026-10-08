import 'dart:async';
import 'dart:ui' as ui;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/recovery_kit/domain/recovery_kit.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/qr_code/fluxer_qr_code.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_app/shared/utils/user_tag.dart';
import 'package:fluxer_dart/export.dart';
import 'package:gal/gal.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RecoveryKitSheet extends ConsumerStatefulWidget {
  const RecoveryKitSheet({
    required this.kit,
    required this.canDismissNotifier,
    super.key,
  });

  final RecoveryKit kit;
  final ValueNotifier<bool> canDismissNotifier;

  static Future<void> show(BuildContext context, RecoveryKit kit) async {
    final ValueNotifier<bool> canDismissNotifier = ValueNotifier<bool>(false);
    try {
      await FluxerBottomSheet.show<void>(
        context,
        title: FluxerLocalizations.of(context).recoveryKitTitle,
        useRootNavigator: true,
        canDismissNotifier: canDismissNotifier,
        builder: (_, _) =>
            RecoveryKitSheet(kit: kit, canDismissNotifier: canDismissNotifier),
      );
    } finally {
      canDismissNotifier.dispose();
    }
  }

  @override
  ConsumerState<RecoveryKitSheet> createState() => _RecoveryKitSheetState();
}

class _RecoveryKitSheetState extends ConsumerState<RecoveryKitSheet> {
  final GlobalKey _documentKey = GlobalKey();
  bool _acknowledged = false;
  bool _includeBackupCodes = false;
  bool _loadingBackupCodes = false;
  bool _saving = false;
  List<String>? _backupCodes;

  String get _accountTag {
    final RecoveryKit kit = widget.kit;
    final UserSettingsViewState settings = ref.read(
      userSettingsViewModelProvider,
    );
    final String username = kit.username ?? settings.username;
    final String? discriminator =
        kit.discriminator ??
        (kit.username == null ? settings.discriminator : null);
    if (discriminator == null || discriminator.isEmpty) {
      return username;
    }
    return formatUserTag(
      username,
      discriminator,
      uniqueUsernames: ref.read(uniqueUsernamesProvider),
    );
  }

  String _description(FluxerLocalizations l10n) {
    return switch (widget.kit.reason) {
      RecoveryKitReason.created => l10n.recoveryKitCreatedDescription,
      RecoveryKitReason.replaced => l10n.recoveryKitReplacedDescription,
      RecoveryKitReason.recovered => l10n.recoveryKitRecoveredDescription,
    };
  }

  void _setAcknowledged(bool value) {
    setState(() => _acknowledged = value);
    widget.canDismissNotifier.value = value;
  }

  Future<void> _toggleBackupCodes(bool include) async {
    setState(() => _includeBackupCodes = include);
    if (!include || _backupCodes != null) {
      return;
    }
    setState(() => _loadingBackupCodes = true);
    try {
      final MfaBackupCodesResponse response = await ref
          .read(fluxerClientProvider)
          .users
          .getBackupCodesMfa(
            body: const MfaBackupCodesRequest(regenerate: false),
          );
      if (!mounted) {
        return;
      }
      setState(() {
        _backupCodes = response.backupCodes
            .where((code) => !code.consumed)
            .map((code) => code.code)
            .toList(growable: false);
      });
    } on Exception catch (e) {
      talker.warning('[RecoveryKitSheet] Backup codes failed: $e');
      if (!mounted) {
        return;
      }
      setState(() => _includeBackupCodes = false);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(
                context,
              ).recoveryKitBackupCodesFailed,
              variant: FluxerToastVariant.danger,
            ),
          );
    } finally {
      if (mounted) {
        setState(() => _loadingBackupCodes = false);
      }
    }
  }

  Future<Uint8List> _renderDocument() async {
    final RenderRepaintBoundary boundary =
        _documentKey.currentContext!.findRenderObject()!
            as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(pixelRatio: 3);
    try {
      final ByteData? data = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      return data!.buffer.asUint8List();
    } finally {
      image.dispose();
    }
  }

  String _fileName() {
    final String product = ref.read(instanceRuntimeConfigProvider).productName;
    final String slug = <String>[
      product,
      'recovery-kit',
      widget.kit.username ?? ref.read(userSettingsViewModelProvider).username,
    ].map(_slug).where((part) => part.isNotEmpty).join('-');
    return '$slug.png';
  }

  static String _slug(String value) {
    return value
        .toLowerCase()
        .replaceAll(RegExp('[^a-z0-9]+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '');
  }

  Future<void> _save() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    setState(() => _saving = true);
    try {
      await WidgetsBinding.instance.endOfFrame;
      final Uint8List bytes = await _renderDocument();
      final String fileName = _fileName();
      bool saved;
      if (isFluxerNativeMobileOs) {
        if (!await Gal.hasAccess()) {
          await Gal.requestAccess();
        }
        await Gal.putImageBytes(bytes, name: fileName);
        saved = true;
      } else {
        final Uri? path = await FilePicker.saveFile(
          dialogTitle: l10n.recoveryKitSaveImage,
          fileName: fileName,
          bytes: bytes,
        );
        saved = path != null;
      }
      if (saved && mounted) {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: isFluxerNativeMobileOs
                    ? l10n.recoveryKitSavedToPhotos
                    : l10n.recoveryKitSaved,
                variant: FluxerToastVariant.success,
              ),
            );
      }
    } on Object catch (e) {
      talker.warning('[RecoveryKitSheet] Save failed: $e');
      if (mounted) {
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.recoveryKitSaveFailed,
                variant: FluxerToastVariant.danger,
              ),
            );
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final bool mfaEnabled = ref.watch(
      userSettingsViewModelProvider.select((s) => s.mfaEnabled),
    );
    final bool canIncludeBackupCodes =
        mfaEnabled && widget.kit.reason != RecoveryKitReason.recovered;
    final List<String> keyGroups = widget.kit.recoveryKey.split(
      recoveryKeySeparator,
    );

    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _description(l10n),
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s4),
          Semantics(
            label: l10n.recoveryKitKeyLabel,
            child: Wrap(
              spacing: layout.s2,
              runSpacing: layout.s2,
              alignment: WrapAlignment.center,
              children: [
                for (final String group in keyGroups)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: colors.backgroundSecondaryAlt,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      group,
                      style: context.textStyles.codeText.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: colors.textPrimary,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: layout.s3),
          FluxerWarningAlert(
            variant: FluxerAlertVariant.danger,
            message: l10n.recoveryKitWarning,
          ),
          SizedBox(height: layout.s4),
          Wrap(
            spacing: layout.s2,
            runSpacing: layout.s2,
            children: [
              FluxerButton.primary(
                onPressed: _saving || _loadingBackupCodes ? null : _save,
                label: l10n.recoveryKitSaveImage,
                icon: PhosphorIconsBold.downloadSimple,
                size: FluxerButtonSize.small,
                isLoading: _saving,
                fitContent: true,
              ),
              FluxerButton.secondary(
                onPressed: () => unawaited(
                  copyToClipboard(
                    context: context,
                    value: widget.kit.recoveryKey,
                    message: l10n.recoveryKitCopied,
                  ),
                ),
                label: l10n.recoveryKitCopy,
                icon: PhosphorIconsBold.copy,
                size: FluxerButtonSize.small,
                fitContent: true,
              ),
            ],
          ),
          if (canIncludeBackupCodes) ...[
            SizedBox(height: layout.s3),
            FluxerCheckbox(
              value: _includeBackupCodes,
              enabled: !_loadingBackupCodes && !_saving,
              onChanged: (value) =>
                  unawaited(_toggleBackupCodes(value ?? false)),
              label: l10n.recoveryKitIncludeBackupCodes,
            ),
          ],
          SizedBox(height: layout.s4),
          RepaintBoundary(
            key: _documentKey,
            child: _RecoveryKitDocument(
              kit: widget.kit,
              accountTag: _accountTag,
              backupCodes: _includeBackupCodes ? _backupCodes : null,
            ),
          ),
          SizedBox(height: layout.s4),
          FluxerCheckbox(
            value: _acknowledged,
            onChanged: (value) => _setAcknowledged(value ?? false),
            label: l10n.recoveryKitAcknowledge,
          ),
          SizedBox(height: layout.s4),
          FluxerButton.primary(
            onPressed: _acknowledged ? () => Navigator.of(context).pop() : null,
            label: l10n.backupCodesDone,
          ),
        ],
      ),
    );
  }
}

class _RecoveryKitDocument extends ConsumerWidget {
  const _RecoveryKitDocument({
    required this.kit,
    required this.accountTag,
    required this.backupCodes,
  });

  final RecoveryKit kit;
  final String accountTag;
  final List<String>? backupCodes;

  static const Color _paper = Color(0xFFFFFFFF);
  static const Color _ink = Color(0xFF111318);
  static const Color _muted = Color(0xFF4E5058);
  static const Color _rule = Color(0xFFD9DADF);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final textStyles = context.textStyles;
    final String productName = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.productName),
    );
    final String webAppBaseUrl = ref.watch(instanceWebAppBaseUrlProvider);
    final String locale = Localizations.localeOf(context).toString();
    final bool use12Hour = ref.watch(use12HourTimeFormatProvider);
    final String createdLabel = formatUserMediumDateTime(
      kit.createdAt.toLocal(),
      locale,
      use12Hour: use12Hour,
    );
    final Uri recoverPage = buildRecoverAccountUrl(
      webAppBaseUrl: webAppBaseUrl,
    );
    final Uri recoverUrl = buildRecoverAccountUrl(
      webAppBaseUrl: webAppBaseUrl,
      account: accountTag,
      recoveryKey: kit.recoveryKey,
    );
    final TextStyle body = textStyles.bodySmall.copyWith(
      color: _ink,
      height: 1.4,
    );
    final TextStyle label = textStyles.bodySmall.copyWith(
      color: _muted,
      fontSize: 12,
    );
    final TextStyle heading = textStyles.bodyMedium.copyWith(
      color: _ink,
      fontWeight: FontWeight.w700,
    );
    final List<String> steps = <String>[
      l10n.recoveryKitStepOpen(recoverPage.toString()),
      l10n.recoveryKitStepEnter,
      l10n.recoveryKitStepPassword,
    ];
    final List<String>? codes = backupCodes;

    Widget detail(String name, String value) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: label),
            Text(value, style: body.copyWith(fontWeight: FontWeight.w600)),
          ],
        ),
      );
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: _paper,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _rule),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.recoveryKitDocumentTitle(productName),
              style: textStyles.heading.copyWith(color: _ink),
            ),
            const SizedBox(height: 8),
            Text(l10n.recoveryKitDocumentIntro, style: body),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      detail(l10n.recoveryKitInstanceLabel, webAppBaseUrl),
                      detail(l10n.usernameLabel, accountTag),
                      detail(l10n.recoveryKitCreatedAtLabel, createdLabel),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  children: [
                    FluxerQrCode(
                      data: recoverUrl.toString(),
                      size: 128,
                      semanticLabel: l10n.recoveryKitQrCaption,
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 128,
                      child: Text(
                        l10n.recoveryKitQrCaption,
                        style: label.copyWith(fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(l10n.recoveryKitKeyLabel, style: heading),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(color: _ink, width: 1.5),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                kit.recoveryKey,
                textAlign: TextAlign.center,
                style: textStyles.codeText.copyWith(
                  color: _ink,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(l10n.recoveryKitStepsTitle, style: heading),
            const SizedBox(height: 6),
            for (int index = 0; index < steps.length; index++)
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                      child: Text('${index + 1}.', style: body),
                    ),
                    Expanded(child: Text(steps[index], style: body)),
                  ],
                ),
              ),
            if (codes != null && codes.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(l10n.recoveryKitBackupCodesTitle, style: heading),
              const SizedBox(height: 4),
              Text(l10n.recoveryKitBackupCodesNote, style: label),
              const SizedBox(height: 6),
              Wrap(
                spacing: 12,
                runSpacing: 4,
                children: [
                  for (final String code in codes)
                    Text(
                      code,
                      style: textStyles.codeText.copyWith(
                        color: _ink,
                        fontSize: 13,
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
