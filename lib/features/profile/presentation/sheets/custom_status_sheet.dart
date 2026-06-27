import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/domain/time_window_presets.dart';
import 'package:fluxer_app/features/profile/providers/user_status_service.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/emoji_image_cache.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomStatusSheet {
  CustomStatusSheet._();

  static Future<void> show(
    BuildContext context, {
    required CustomStatusResponse? existing,
    VoidCallback? onSaved,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.customStatusSetTitle,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return FluxerBottomSheetContent(
          scrollable: false,
          child: CustomStatusSheetBody(
            existing: existing,
            onClose: close,
            onSaved: onSaved,
          ),
        );
      },
    );
  }
}

class CustomStatusSheetBody extends ConsumerStatefulWidget {
  const CustomStatusSheetBody({
    required this.existing,
    required this.onClose,
    this.onSaved,
    super.key,
  });

  final CustomStatusResponse? existing;
  final VoidCallback onClose;
  final VoidCallback? onSaved;

  @override
  ConsumerState<CustomStatusSheetBody> createState() =>
      _CustomStatusSheetBodyState();
}

class _CustomStatusSheetBodyState extends ConsumerState<CustomStatusSheetBody> {
  late final TextEditingController _textController;
  String? _emojiId;
  String? _emojiName;
  bool _emojiAnimated = false;
  late TimeWindowKey _selectedExpiry;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final CustomStatusResponse? existing = widget.existing;
    _textController = TextEditingController(text: existing?.text ?? '');
    _emojiId = existing?.emojiId?.toString();
    _emojiName = existing?.emojiName;
    _emojiAnimated = existing?.emojiAnimated ?? false;
    final bool includeDeveloperOptions = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    _selectedExpiry = getTimeWindowKeyForExpiresAt(
      existing?.expiresAt,
      includeDeveloperOptions: includeDeveloperOptions,
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pickEmoji() async {
    await FluxerEmojiPickerSheet.show(
      context,
      title: FluxerLocalizations.of(context).customStatusChooseEmoji,
      visibleTabs: const <ExpressionPickerTab>[ExpressionPickerTab.emojis],
      maxHeight: 0.75,
      trackEmojiUsageOnSelect: false,
      onEmojiSelected: (FluxerSelectedEmoji emoji) {
        setState(() {
          if (emoji.isCustom) {
            _emojiId = emoji.emojiId;
            _emojiName = null;
            _emojiAnimated = emoji.animated;
          } else {
            _emojiId = null;
            _emojiName = emoji.surrogates;
            _emojiAnimated = false;
          }
        });
      },
    );
  }

  Future<void> _save() async {
    if (_isSaving) {
      return;
    }
    setState(() => _isSaving = true);
    final bool includeDeveloperOptions = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    final List<TimeWindowPreset> presets = getTimeWindowPresets(
      includeDeveloperOptions: includeDeveloperOptions,
    );
    final TimeWindowPreset selectedPreset = presets.firstWhere(
      (TimeWindowPreset preset) => preset.key == _selectedExpiry,
    );
    final DateTime? expiresAt = selectedPreset.minutes == null
        ? null
        : DateTime.now().toUtc().add(
            minutesToDuration(selectedPreset.minutes)!,
          );
    final CustomStatusPayload payload = buildCustomStatusPayload(
      text: _textController.text,
      emojiId: _emojiId,
      emojiName: _emojiName,
      expiresAt: expiresAt,
    );
    try {
      await ref.read(userStatusServiceProvider).setCustomStatus(payload);
      widget.onSaved?.call();
      if (mounted) {
        widget.onClose();
      }
    } on Object {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  Future<void> _showExpiryPicker() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool includeDeveloperOptions = ref
        .read(userSettingsViewModelProvider)
        .developerMode;
    final List<TimeWindowPreset> presets = getTimeWindowPresets(
      includeDeveloperOptions: includeDeveloperOptions,
    );
    final TimeWindowKey? picked = await FluxerBottomSheet.show<TimeWindowKey>(
      context,
      title: l10n.customStatusClearAfter,
      variant: FluxerBottomSheetVariant.menu,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return FluxerBottomSheetContent(
          scrollable: false,
          child: FluxerBottomSheetGroupColumn(
            children: [
              FluxerMenuGroup(
                children: [
                  for (final TimeWindowPreset preset in presets)
                    FluxerBottomSheetMenuItem(
                      label: customStatusExpiryLabel(preset.key, l10n),
                      isSelected: preset.key == _selectedExpiry,
                      onTap: () {
                        Navigator.of(sheetContext).pop(preset.key);
                      },
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
    if (picked != null && mounted) {
      setState(() => _selectedExpiry = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return AbsorbPointer(
      absorbing: _isSaving,
      child: AnimatedOpacity(
        opacity: _isSaving ? 0.6 : 1.0,
        duration: context.motion.fast,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildEmojiPickerButton(l10n),
                SizedBox(width: layout.s3),
                Expanded(
                  child: FluxerInput(
                    controller: _textController,
                    textCapitalization: TextCapitalization.sentences,
                    hint: l10n.customStatusPlaceholder,
                    maxLength: kCustomStatusTextLimit,
                    onChanged: (_) => setState(() {}),
                  ),
                ),
              ],
            ),
            SizedBox(height: layout.s3),
            FluxerBottomSheetSubmenuItem(
              label: l10n.customStatusClearAfter,
              hint: customStatusExpiryLabel(_selectedExpiry, l10n),
              onTap: _showExpiryPicker,
            ),
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: _save,
              label: l10n.customStatusSave,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiPickerButton(FluxerLocalizations l10n) {
    final Widget? emojiPreview = _buildEmojiPreview();
    if (emojiPreview != null) {
      return FluxerButton.secondary(
        onPressed: _pickEmoji,
        fitContent: true,
        semanticLabel: l10n.customStatusChooseEmoji,
        child: SizedBox(
          width: 24,
          height: 24,
          child: Center(child: emojiPreview),
        ),
      );
    }
    return FluxerButton.secondary(
      onPressed: _pickEmoji,
      label: l10n.customStatusChooseEmoji,
      icon: PhosphorIconsRegular.smiley,
      fitContent: true,
    );
  }

  Widget? _buildEmojiPreview() {
    final String? emojiId = _emojiId;
    if (emojiId != null) {
      return CachedEmojiImage(
        emojiId: emojiId,
        animated: _emojiAnimated,
        requestSize: kCustomStatusEmojiRequestSize,
        size: 24,
      );
    }
    final String? emojiName = _emojiName;
    if (emojiName != null && emojiName.isNotEmpty) {
      return UnicodeEmojiWidget(emoji: emojiName, size: 24);
    }
    return null;
  }
}
