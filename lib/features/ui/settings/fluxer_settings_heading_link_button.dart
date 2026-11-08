import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';

enum FluxerSettingsHeadingLinkTarget { section, page }

class FluxerSettingsHeadingLinkButton extends StatefulWidget {
  const FluxerSettingsHeadingLinkButton({
    required this.href,
    this.target = FluxerSettingsHeadingLinkTarget.section,
    super.key,
  });

  final String href;
  final FluxerSettingsHeadingLinkTarget target;

  @override
  State<FluxerSettingsHeadingLinkButton> createState() =>
      _FluxerSettingsHeadingLinkButtonState();
}

class _FluxerSettingsHeadingLinkButtonState
    extends State<FluxerSettingsHeadingLinkButton> {
  static const Duration _copiedFeedbackDuration = Duration(seconds: 2);

  final ValueNotifier<bool> _copied = ValueNotifier<bool>(false);
  Timer? _copiedReset;

  @override
  void dispose() {
    _copiedReset?.cancel();
    _copied.dispose();
    super.dispose();
  }

  String _copyLabel(FluxerLocalizations l10n) {
    return switch (widget.target) {
      FluxerSettingsHeadingLinkTarget.section =>
        l10n.userSettingsCopyLinkToSection,
      FluxerSettingsHeadingLinkTarget.page => l10n.userSettingsCopyLinkToPage,
    };
  }

  Future<void> _copy(BuildContext context) async {
    await copyToClipboard(context: context, value: widget.href);
    if (!mounted) {
      return;
    }
    _copiedReset?.cancel();
    _copied.value = true;
    _copiedReset = Timer(_copiedFeedbackDuration, () {
      if (mounted) {
        _copied.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;

    return ValueListenableBuilder<bool>(
      valueListenable: _copied,
      builder: (context, copied, _) {
        final String label = copied
            ? l10n.giftSettingsCopied
            : _copyLabel(l10n);
        final Color iconColor = copied
            ? colors.textPrimary
            : colors.textTertiary;

        return FluxerTooltip(
          message: label,
          child: FluxerFocusRing(
            focused: false,
            child: Semantics(
              button: true,
              label: label,
              child: InkWell(
                onTap: () => unawaited(_copy(context)),
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: Center(
                    child: PhosphorIcon(
                      copied ? PhosphorIconsBold.check : PhosphorIconsBold.link,
                      size: 15,
                      color: iconColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
