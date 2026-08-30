import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/gateway_reconnect_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/native_markdown_tester.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';

class UserDeveloperTools extends ConsumerStatefulWidget {
  const UserDeveloperTools({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserDeveloperTools> createState() => _UserDeveloperToolsState();
}

class _UserDeveloperToolsState extends ConsumerState<UserDeveloperTools> {
  static const String _sendAhapAsset = 'assets/haptics/message_send.ahap';
  static const String _emptyMessage = 'Paste AHAP JSON before playing.';
  static const String _invalidMessage =
      'AHAP must be valid JSON with a Pattern array.';
  static const String _unsupportedMessage =
      'Custom haptics are only available on iOS and Android devices.';

  static const Duration _previewHold = Duration(seconds: 3);

  late final TextEditingController _ahapController;
  String? _inputError;
  Timer? _bannerPreviewTimer;

  @override
  void initState() {
    super.initState();
    _ahapController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      unawaited(_loadSendSample(showToast: false));
    });
  }

  @override
  void dispose() {
    _cancelBannerPreview();
    _ahapController.dispose();
    super.dispose();
  }

  GatewayReconnectBanner get _banner {
    return ref.read(gatewayReconnectBannerProvider.notifier);
  }

  void _cancelBannerPreview() {
    _bannerPreviewTimer?.cancel();
    _bannerPreviewTimer = null;
  }

  void _showReconnectBanner() {
    _cancelBannerPreview();
    _banner.showReconnecting();
  }

  void _showConnectedBanner() {
    _cancelBannerPreview();
    _banner.showConnected();
  }

  void _hideReconnectBanner() {
    _cancelBannerPreview();
    _banner.hide();
  }

  void _playReconnectBannerSequence() {
    _cancelBannerPreview();
    _banner.showReconnecting();
    _bannerPreviewTimer = Timer(_previewHold, () {
      if (!mounted) {
        return;
      }
      _banner.showConnected();
    });
  }

  String _bannerPhaseLabel(GatewayReconnectBannerPhase phase) {
    return switch (phase) {
      GatewayReconnectBannerPhase.hidden => 'Hidden',
      GatewayReconnectBannerPhase.reconnecting => 'Reconnecting',
      GatewayReconnectBannerPhase.connected => 'Connected',
    };
  }

  void _showToast(String message, {FluxerToastVariant? variant}) {
    ref
        .read(toastProvider.notifier)
        .show(
          FluxerToast(
            message: message,
            variant: variant ?? FluxerToastVariant.danger,
          ),
        );
  }

  Future<void> _loadSendSample({bool showToast = true}) async {
    try {
      final String data = await rootBundle.loadString(_sendAhapAsset);
      if (!mounted) {
        return;
      }
      setState(() {
        _ahapController.text = data;
        _inputError = null;
      });
    } on Object {
      if (!mounted || !showToast) {
        return;
      }
      _showToast(_invalidMessage);
    }
  }

  bool _validateAhap(String raw) {
    final String trimmed = raw.trim();
    if (trimmed.isEmpty) {
      setState(() => _inputError = _emptyMessage);
      _showToast(_emptyMessage);
      return false;
    }
    try {
      final Object? decoded = jsonDecode(trimmed);
      if (decoded is! Map<String, dynamic> || decoded['Pattern'] is! List) {
        setState(() => _inputError = _invalidMessage);
        _showToast(_invalidMessage);
        return false;
      }
    } on FormatException {
      setState(() => _inputError = _invalidMessage);
      _showToast(_invalidMessage);
      return false;
    }
    setState(() => _inputError = null);
    return true;
  }

  void _play() {
    if (!FluxerHaptics.supportsExpressive) {
      _showToast(_unsupportedMessage);
      return;
    }
    final String raw = _ahapController.text;
    if (!_validateAhap(raw)) {
      return;
    }
    FluxerHaptics.pattern(raw.trim());
  }

  void _stop() {
    FluxerHaptics.stop();
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            sectionId: 'developer-tools-haptics',
            title: 'Haptic AHAP tester',
            description:
                'Paste AHAP JSON and play it on this device. Requires iOS or Android with haptic support.',
            isFirst: true,
            children: [
              FluxerInput.multiline(
                controller: _ahapController,
                label: 'AHAP JSON',
                hint: 'Paste an AHAP JSON pattern here',
                errorText: _inputError,
                minLines: 10,
                maxLines: 20,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                autocorrect: false,
                enableSuggestions: false,
                onChanged: (_) {
                  if (_inputError != null) {
                    setState(() => _inputError = null);
                  }
                },
              ),
              Wrap(
                spacing: layout.s2,
                runSpacing: layout.s2,
                children: [
                  FluxerButton.primary(
                    onPressed: _play,
                    label: 'Play',
                    fitContent: true,
                  ),
                  FluxerButton.secondary(
                    onPressed: _stop,
                    label: 'Stop',
                    fitContent: true,
                  ),
                  FluxerButton.secondary(
                    onPressed: () => unawaited(_loadSendSample()),
                    label: 'Load send sample',
                    fitContent: true,
                  ),
                ],
              ),
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'developer-tools-reconnect-banner',
            title: 'Gateway reconnect banner',
            description:
                'Preview the overlay without dropping the gateway socket. '
                'Play sequence holds reconnecting for 3 seconds, then the connected animation.',
            children: [
              Text(
                'Phase: ${_bannerPhaseLabel(ref.watch(gatewayReconnectBannerProvider))}',
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              Wrap(
                spacing: layout.s2,
                runSpacing: layout.s2,
                children: [
                  FluxerButton.primary(
                    onPressed: _showReconnectBanner,
                    label: 'Show reconnecting',
                    fitContent: true,
                  ),
                  FluxerButton.secondary(
                    onPressed: _showConnectedBanner,
                    label: 'Show connected',
                    fitContent: true,
                  ),
                  FluxerButton.secondary(
                    onPressed: _playReconnectBannerSequence,
                    label: 'Play sequence',
                    fitContent: true,
                  ),
                  FluxerButton.secondary(
                    onPressed: _hideReconnectBanner,
                    label: 'Hide',
                    fitContent: true,
                  ),
                ],
              ),
            ],
          ),
          const FluxerSettingsSection(
            sectionId: 'developer-tools-native-markdown',
            title: 'Native markdown parser',
            description:
                'Parses input with the experimental Rust parser bundled via '
                'native assets and shows the canonical AST plus timing.',
            children: [NativeMarkdownTester()],
          ),
        ],
      ),
    );
  }
}
