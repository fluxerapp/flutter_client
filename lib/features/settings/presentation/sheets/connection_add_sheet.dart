import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/connections_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

enum _AddStep { initiate, verify }

enum _ConnectionType { bluesky, domain }

extension _ConnectionTypeApi on _ConnectionType {
  String get apiValue => sdkType.toJson();

  ConnectionResponseTypeType get sdkType => this == _ConnectionType.bluesky
      ? ConnectionResponseTypeType.bsky
      : ConnectionResponseTypeType.domain;
}

class ConnectionAddSheet {
  const ConnectionAddSheet._();

  static Future<void> _show(
    BuildContext context,
    WidgetRef ref, {
    _ConnectionType? defaultType,
  }) {
    final l10n = FluxerLocalizations.of(context);
    final blueskyEnabled = AppBuildConfig.isBlueskyEnabled;
    final initialType =
        defaultType ??
        (blueskyEnabled ? _ConnectionType.bluesky : _ConnectionType.domain);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.connectionAddTitle,
      useRootNavigator: true,
      builder: (sheetContext, close) => _ConnectionAddBody(
        initialType: initialType,
        blueskyEnabled: blueskyEnabled,
        close: close,
      ),
    );
  }

  static Future<void> showForBluesky(BuildContext context, WidgetRef ref) =>
      _show(context, ref, defaultType: _ConnectionType.bluesky);

  static Future<void> showForDomain(BuildContext context, WidgetRef ref) =>
      _show(context, ref, defaultType: _ConnectionType.domain);
}

class _ConnectionAddBody extends ConsumerStatefulWidget {
  const _ConnectionAddBody({
    required this.initialType,
    required this.blueskyEnabled,
    required this.close,
  });

  final _ConnectionType initialType;
  final bool blueskyEnabled;
  final VoidCallback close;

  @override
  ConsumerState<_ConnectionAddBody> createState() => _ConnectionAddBodyState();
}

class _ConnectionAddBodyState extends ConsumerState<_ConnectionAddBody> {
  late _ConnectionType _type = widget.initialType;
  _AddStep _step = _AddStep.initiate;
  final TextEditingController _identifierCtrl = TextEditingController();
  TextEditingController? _hostCtrl;
  TextEditingController? _valueCtrl;

  String? _error;
  ConnectionVerificationResponse? _verification;
  bool _hostCopied = false;
  bool _valueCopied = false;

  @override
  void dispose() {
    _identifierCtrl.dispose();
    _hostCtrl?.dispose();
    _valueCtrl?.dispose();
    super.dispose();
  }

  void _setVerification(ConnectionVerificationResponse v) {
    _hostCtrl?.dispose();
    _valueCtrl?.dispose();
    _hostCtrl = TextEditingController(text: '_fluxer.${v.id}');
    _valueCtrl = TextEditingController(text: 'fluxer-verification=${v.token}');
    setState(() {
      _verification = v;
      _step = _AddStep.verify;
      _error = null;
    });
  }

  void _returnToInitiateStep() {
    setState(() {
      _step = _AddStep.initiate;
      _error = null;
    });
  }

  void _handleSystemBack() {
    switch (_step) {
      case _AddStep.verify:
        _returnToInitiateStep();
      case _AddStep.initiate:
        widget.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, _) {
        if (!didPop) {
          _handleSystemBack();
        }
      },
      child: Padding(
        padding: settingsSheetScrollPadding(context),
        child: _step == _AddStep.initiate ? _buildInitiate() : _buildVerify(),
      ),
    );
  }

  // ---------------- STEP 1 ----------------

  Widget _buildInitiate() {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FluxerSelect<_ConnectionType>(
          label: l10n.connectionTypeLabel,
          items: [
            if (widget.blueskyEnabled)
              FluxerSelectItem(
                value: _ConnectionType.bluesky,
                label: l10n.connectionsAddBluesky,
              ),
            FluxerSelectItem(
              value: _ConnectionType.domain,
              label: l10n.connectionsAddDomain,
            ),
          ],
          value: _type,
          onChanged: (type) {
            setState(() {
              _type = type;
              _error = null;
            });
          },
        ),
        SizedBox(height: layout.s3),
        FluxerInput(
          controller: _identifierCtrl,
          label: _type == _ConnectionType.bluesky
              ? l10n.connectionHandleLabel
              : l10n.connectionDomainLabel,
          hint: _type == _ConnectionType.bluesky
              ? l10n.connectionHandlePlaceholder
              : l10n.connectionDomainPlaceholder,
          autofocus: true,
          errorText: _error,
        ),
        SizedBox(height: layout.s4),
        FluxerButton.primary(
          label: _type == _ConnectionType.bluesky
              ? l10n.connectionConnectBluesky
              : l10n.connectionContinue,
          onPressedAsync: _onContinue,
        ),
      ],
    );
  }

  Future<void> _onContinue() async {
    final l10n = FluxerLocalizations.of(context);
    var identifier = _identifierCtrl.text.trim();
    if (_type == _ConnectionType.bluesky) {
      identifier = identifier
          .replaceFirst(
            RegExp(r'^https?://bsky\.app/profile/', caseSensitive: false),
            '',
          )
          .replaceFirst(RegExp('^@'), '')
          .toLowerCase();
    } else {
      identifier = identifier
          .replaceFirst(RegExp('^https?://', caseSensitive: false), '')
          .replaceFirst(RegExp(r'/+$'), '')
          .toLowerCase();
    }
    if (identifier.isEmpty) {
      setState(
        () => _error = _type == _ConnectionType.bluesky
            ? l10n.connectionEnterHandle
            : l10n.connectionEnterDomain,
      );
      return;
    }
    final existing = ref.read(connectionsViewModelProvider).connections;
    final sdkType = _type.sdkType;
    final isDuplicate = existing.any(
      (c) => c.type == sdkType && c.name.toLowerCase() == identifier,
    );
    if (isDuplicate) {
      setState(() => _error = l10n.connectionAlreadyExists);
      return;
    }

    final vm = ref.read(connectionsViewModelProvider.notifier);
    setState(() => _error = null);

    if (_type == _ConnectionType.bluesky) {
      try {
        final url = await vm.authorizeBluesky(identifier);
        final launched = await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        );
        if (!launched) {
          setState(() => _error = l10n.connectionBlueskyAuthorizeFailed);
          return;
        }
        if (mounted) {
          widget.close();
        }
      } on Object catch (_) {
        setState(() => _error = l10n.connectionBlueskyAuthorizeFailed);
      }
      return;
    }

    try {
      final data = await vm.initiate(
        type: _ConnectionType.domain.apiValue,
        identifier: identifier,
      );
      _setVerification(data);
    } on Object catch (_) {
      setState(() => _error = l10n.connectionInitiateFailed);
    }
  }

  // ---------------- STEP 2 ----------------

  String get _dnsUrl => _verification == null
      ? ''
      : 'https://${_verification!.id}/.well-known/fluxer-verification';

  Widget _buildVerify() {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            FluxerTappable(
              onTap: _returnToInitiateStep,
              builder: (context, _) => Container(
                padding: EdgeInsets.all(layout.s2),
                child: PhosphorIcon(
                  PhosphorIconsBold.caretLeft,
                  size: 20,
                  color: colors.textPrimary,
                ),
              ),
            ),
            SizedBox(width: layout.s2),
            Text(
              l10n.connectionVerifyTitle,
              style: textStyles.heading.copyWith(color: colors.textPrimary),
            ),
          ],
        ),
        SizedBox(height: layout.s3),
        Text(
          l10n.connectionVerifyInstructions,
          style: textStyles.bodySmall.copyWith(color: colors.textSecondary),
        ),
        SizedBox(height: layout.s4),
        if (_error != null) ...[
          FluxerWarningAlert(
            message: _error!,
            variant: FluxerAlertVariant.danger,
          ),
          SizedBox(height: layout.s3),
        ],
        _buildDnsCard(),
        SizedBox(height: layout.s4),
        _buildTokenCard(),
        SizedBox(height: layout.s4),
        Row(
          children: [
            Expanded(
              child: FluxerButton.secondary(
                label: l10n.connectionBack,
                onPressed: _returnToInitiateStep,
                fitContent: true,
              ),
            ),
            SizedBox(width: layout.s2),
            Expanded(
              child: FluxerButton.primary(
                label: l10n.connectionVerifyButton,
                onPressedAsync: _onVerify,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDnsCard() {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Container(
      padding: EdgeInsets.all(layout.s3),
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: Border.all(color: colors.backgroundModifierAccent),
        borderRadius: layout.radiusMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.connectionDnsRecordTitle,
            style: textStyles.label.copyWith(color: colors.textPrimary),
          ),
          SizedBox(height: layout.s3),
          FluxerInput(
            label: l10n.connectionDnsHostLabel,
            controller: _hostCtrl,
            readOnly: true,
            trailing: _copyButton(
              copied: _hostCopied,
              onPressed: _copyHost,
              semanticLabel: _hostCopied
                  ? l10n.connectionCopied
                  : l10n.connectionCopyHost,
            ),
          ),
          SizedBox(height: layout.s2),
          FluxerInput(
            label: l10n.connectionDnsValueLabel,
            controller: _valueCtrl,
            readOnly: true,
            trailing: _copyButton(
              copied: _valueCopied,
              onPressed: _copyValue,
              semanticLabel: _valueCopied
                  ? l10n.connectionCopied
                  : l10n.connectionCopyValue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _copyButton({
    required bool copied,
    required VoidCallback onPressed,
    required String semanticLabel,
  }) {
    final colors = context.colors;
    return FluxerTappable(
      onTap: onPressed,
      semanticLabel: semanticLabel,
      builder: (context, _) => Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        child: PhosphorIcon(
          copied ? PhosphorIconsFill.checkCircle : PhosphorIconsBold.clipboard,
          size: 16,
          color: copied ? colors.accentSuccess : colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildTokenCard() {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;

    return Container(
      padding: EdgeInsets.all(layout.s3),
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: Border.all(color: colors.backgroundModifierAccent),
        borderRadius: layout.radiusMd,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.connectionTokenFileTitle,
            style: textStyles.label.copyWith(color: colors.textPrimary),
          ),
          SizedBox(height: layout.s2),
          _inlineCodeText(
            l10n.connectionTokenFileDescription,
            colors,
            textStyles.bodySmall,
          ),
          SizedBox(height: layout.s3),
          FluxerButton.secondary(
            label: l10n.connectionTokenFileDownload,
            size: FluxerButtonSize.compact,
            onPressedAsync: _saveTokenFile,
          ),
          SizedBox(height: layout.s2),
          _inlineCodeText(
            l10n.connectionTokenFileMeta(_dnsUrl),
            colors,
            textStyles.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _inlineCodeText(
    String template,
    FluxerColorTheme colors,
    TextStyle baseStyle,
  ) {
    final spans = <TextSpan>[];
    final regex = RegExp(r'\*\*(.+?)\*\*');
    var cursor = 0;
    for (final match in regex.allMatches(template)) {
      if (match.start > cursor) {
        spans.add(
          TextSpan(
            text: template.substring(cursor, match.start),
            style: baseStyle.copyWith(color: colors.textSecondary),
          ),
        );
      }
      spans.add(
        TextSpan(
          text: match.group(1),
          style: baseStyle.copyWith(
            fontFamily: 'monospace',
            color: colors.textPrimary,
            backgroundColor: colors.backgroundTertiary,
          ),
        ),
      );
      cursor = match.end;
    }
    if (cursor < template.length) {
      spans.add(
        TextSpan(
          text: template.substring(cursor),
          style: baseStyle.copyWith(color: colors.textSecondary),
        ),
      );
    }
    return RichText(text: TextSpan(children: spans));
  }

  Future<void> _copyHost() async {
    if (_hostCtrl == null) {
      return;
    }
    await copyToClipboard(context: context, value: _hostCtrl!.text);
    setState(() => _hostCopied = true);
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() => _hostCopied = false);
    }
  }

  Future<void> _copyValue() async {
    if (_valueCtrl == null) {
      return;
    }
    await copyToClipboard(context: context, value: _valueCtrl!.text);
    setState(() => _valueCopied = true);
    await Future<void>.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() => _valueCopied = false);
    }
  }

  Future<void> _saveTokenFile() async {
    if (_verification == null) {
      return;
    }
    final l10n = FluxerLocalizations.of(context);
    try {
      final bytes = utf8.encode(_verification!.token);
      final Uri? savedUri = await FilePicker.saveFile(
        dialogTitle: l10n.connectionSaveTokenDialogTitle,
        fileName: 'fluxer-verification',
        bytes: bytes,
      );
      if (savedUri != null) {
        final String? filePath = savedUri.scheme == 'file'
            ? savedUri.toFilePath()
            : null;
        if (filePath != null) {
          final file = File(filePath);
          if (!file.existsSync() || file.lengthSync() == 0) {
            await file.writeAsString(_verification!.token);
          }
        }
        ref
            .read(toastProvider.notifier)
            .show(
              FluxerToast(
                message: l10n.connectionTokenSavedToast,
                variant: FluxerToastVariant.success,
              ),
            );
      }
    } on Object catch (_) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.connectionTokenSaveFailedToast,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Future<void> _onVerify() async {
    if (_verification == null) {
      return;
    }
    final l10n = FluxerLocalizations.of(context);
    try {
      await ref
          .read(connectionsViewModelProvider.notifier)
          .verifyAndCreate(_verification!.initiationToken);
      if (mounted) {
        widget.close();
      }
    } on Object catch (_) {
      setState(() => _error = l10n.connectionVerifyFailed);
    }
  }
}
