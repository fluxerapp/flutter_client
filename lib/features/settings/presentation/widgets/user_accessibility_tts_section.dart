import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/tts/fluxer_tts_provider.dart';
import 'package:fluxer_app/features/voice/tts/tts_locale_utils.dart';
import 'package:fluxer_app/features/voice/tts/tts_rate_utils.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserAccessibilityTtsSection extends ConsumerStatefulWidget {
  const UserAccessibilityTtsSection({super.key});

  @override
  ConsumerState<UserAccessibilityTtsSection> createState() =>
      _UserAccessibilityTtsSectionState();
}

class _UserAccessibilityTtsSectionState
    extends ConsumerState<UserAccessibilityTtsSection> {
  bool _previewSpeaking = false;
  bool _previewUnsupported = false;
  bool _previewFailed = false;

  @override
  Widget build(BuildContext context) {
    final appearance = ref.watch(appearancePreferencesProvider);
    final appearanceNotifier = ref.read(appearancePreferencesProvider.notifier);
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;
    final double selectedRate = clampTtsRate(appearance.ttsRate);
    final String sampleDescription = _previewUnsupported
        ? l10n.accessibilityTtsUnsupportedDescription
        : _previewFailed
        ? l10n.accessibilityTtsPlaybackFailedDescription
        : l10n.accessibilityTtsSampleDescription;

    return FluxerSettingsSection(
      sectionId: 'tts',
      title: l10n.accessibilityTtsGroupTitle,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TtsRateRow(
              label: l10n.accessibilityTtsSpeechPlaybackSpeedLabel,
              description: l10n.accessibilityTtsGroupDescription,
              rate: selectedRate,
              onRateChanged: (double value) async {
                if (_previewSpeaking) {
                  await ref.read(fluxerTtsServiceProvider.notifier).stop();
                  if (mounted) {
                    setState(() => _previewSpeaking = false);
                  }
                }
                await appearanceNotifier.setTtsRate(value);
              },
            ),
            SizedBox(height: layout.s4),
            Row(
              children: [
                FluxerButton.primary(
                  size: FluxerButtonSize.compact,
                  fitContent: true,
                  icon: _previewSpeaking
                      ? PhosphorIconsFill.pause
                      : PhosphorIconsFill.play,
                  label: _previewSpeaking
                      ? l10n.accessibilityTtsSilenceSampleLabel
                      : l10n.accessibilityTtsPlaySampleLabel,
                  onPressed: _previewUnsupported && !_previewSpeaking
                      ? null
                      : () => unawaited(_togglePreview(l10n, selectedRate)),
                ),
                SizedBox(width: layout.s4),
                Expanded(
                  child: Text(
                    sampleDescription,
                    style: textStyles.smallText.copyWith(
                      color: colors.textTertiary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _togglePreview(FluxerLocalizations l10n, double rate) async {
    final FluxerTtsService notifier = ref.read(
      fluxerTtsServiceProvider.notifier,
    );
    if (_previewSpeaking) {
      await notifier.stop();
      if (mounted) {
        setState(() => _previewSpeaking = false);
      }
      return;
    }
    final bool supported = await notifier.isSupported();
    if (!supported) {
      if (mounted) {
        setState(() {
          _previewUnsupported = true;
          _previewFailed = false;
        });
      }
      return;
    }
    if (mounted) {
      setState(() {
        _previewSpeaking = true;
        _previewUnsupported = false;
        _previewFailed = false;
      });
    }
    await notifier.speakPreview(
      text: l10n.accessibilityTtsSampleText,
      rate: rate,
      locale: formatTtsLocaleTag(ref.read(effectiveAppLocaleProvider)),
      onEnd: () {
        if (!mounted) {
          return;
        }
        setState(() => _previewSpeaking = false);
      },
      onError: () {
        if (!mounted) {
          return;
        }
        setState(() {
          _previewSpeaking = false;
          _previewFailed = true;
        });
      },
    );
  }
}

class _TtsRateRow extends StatelessWidget {
  const _TtsRateRow({
    required this.label,
    required this.description,
    required this.rate,
    required this.onRateChanged,
  });

  final String label;
  final String description;
  final double rate;
  final ValueChanged<double> onRateChanged;

  static const double _compactBreakpoint = 640;
  static const double _controlMinWidth = 128;
  static const double _controlMaxWidth = 192;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;

    final Widget text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textStyles.bodySmall.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w500,
            height: 1.4,
          ),
        ),
        SizedBox(height: layout.s1),
        Text(
          description,
          style: textStyles.smallText.copyWith(
            color: colors.textPrimaryMuted,
            height: 1.4,
          ),
        ),
      ],
    );

    final Widget control = _TtsRateCombobox(
      rate: rate,
      onChanged: onRateChanged,
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final bool stackVertically = constraints.maxWidth < _compactBreakpoint;

        if (stackVertically) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              text,
              SizedBox(height: layout.s3),
              control,
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: text),
            SizedBox(width: layout.s4),
            ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: _controlMinWidth,
                maxWidth: _controlMaxWidth,
              ),
              child: control,
            ),
          ],
        );
      },
    );
  }
}

class _TtsRateCombobox extends StatefulWidget {
  const _TtsRateCombobox({required this.rate, required this.onChanged});

  final double rate;
  final ValueChanged<double> onChanged;

  @override
  State<_TtsRateCombobox> createState() => _TtsRateComboboxState();
}

class _TtsRateComboboxState extends State<_TtsRateCombobox> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _menuOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: formatTtsRateLabel(widget.rate));
    _focusNode = FocusNode()..addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(covariant _TtsRateCombobox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.rate != widget.rate && !_focusNode.hasFocus) {
      _controller.text = formatTtsRateLabel(widget.rate);
    }
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_handleFocusChange)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      _commitInput();
    }
  }

  void _commitInput() {
    final double? parsed = parseTtsRateInput(_controller.text);
    final double next = parsed ?? widget.rate;
    _controller.text = formatTtsRateLabel(next);
    if (next != widget.rate) {
      widget.onChanged(next);
    }
  }

  Future<void> _openPresets() async {
    if (_menuOpen) {
      return;
    }
    _focusNode.unfocus();
    setState(() => _menuOpen = true);
    final double? selected = await FluxerBottomSheet.show<double>(
      context,
      title: FluxerLocalizations.of(
        context,
      ).accessibilityTtsSpeechPlaybackSpeedLabel,
      maxHeight: 0.5,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return Padding(
          padding: EdgeInsets.only(bottom: sheetContext.layout.s4),
          child: FluxerBottomSheetSection(
            child: FluxerMenuGroup(
              children: [
                for (final double option in kTtsRateOptions)
                  FluxerBottomSheetMenuItem(
                    label: formatTtsRateLabel(option),
                    isSelected: option == nearestTtsRate(widget.rate),
                    onTap: () => Navigator.of(sheetContext).pop(option),
                  ),
              ],
            ),
          ),
        );
      },
    );
    if (!mounted) {
      return;
    }
    setState(() => _menuOpen = false);
    if (selected != null) {
      _controller.text = formatTtsRateLabel(selected);
      widget.onChanged(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final ThemeData theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundTertiary,
        borderRadius: layout.radiusLg,
        border: Border.all(color: colors.backgroundModifierAccent),
      ),
      child: ClipRRect(
        borderRadius: layout.radiusLg,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Theme(
                  data: theme.copyWith(
                    inputDecorationTheme: const InputDecorationTheme(
                      filled: false,
                      isDense: true,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    textInputAction: TextInputAction.done,
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                    ),
                    cursorColor: colors.textPrimary,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp('[0-9.xX]')),
                    ],
                    decoration: const InputDecoration(
                      isDense: true,
                      filled: false,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    onTapOutside: (_) => _focusNode.unfocus(),
                    onSubmitted: (_) {
                      _commitInput();
                      _focusNode.unfocus();
                    },
                  ),
                ),
              ),
              SizedBox(width: layout.s2),
              FluxerTappable(
                onTap: _openPresets,
                semanticLabel: FluxerLocalizations.of(
                  context,
                ).accessibilityTtsSpeechPlaybackSpeedLabel,
                expanded: _menuOpen,
                builder: (BuildContext context, Set<WidgetState> states) {
                  return Icon(
                    PhosphorIconsBold.caretDown,
                    size: 16,
                    color: colors.textSecondary,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
