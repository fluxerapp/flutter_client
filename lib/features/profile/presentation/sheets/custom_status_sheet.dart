import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/domain/time_window_presets.dart';
import 'package:fluxer_app/features/profile/providers/user_status_service.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/features/ui/fullscreen_flow/fluxer_fullscreen_flow.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
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
    if (!isDesktopLayout(context)) {
      return FluxerFullscreenFlow.show<void>(
        context,
        builder: (BuildContext pageContext) => CustomStatusSheetBody(
          existing: existing,
          fullscreen: true,
          onClose: () => Navigator.of(pageContext).pop(),
          onSaved: onSaved,
        ),
      );
    }
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
    this.fullscreen = false,
    super.key,
  });

  final CustomStatusResponse? existing;
  final VoidCallback onClose;
  final VoidCallback? onSaved;
  final bool fullscreen;

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
  late final String _initialText;
  late final String? _initialEmojiId;
  late final String? _initialEmojiName;
  late final TimeWindowKey _initialExpiry;

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
    _initialText = _textController.text;
    _initialEmojiId = _emojiId;
    _initialEmojiName = _emojiName;
    _initialExpiry = _selectedExpiry;
  }

  bool get _isDirty =>
      _textController.text != _initialText ||
      _emojiId != _initialEmojiId ||
      _emojiName != _initialEmojiName ||
      _selectedExpiry != _initialExpiry;

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

  List<TimeWindowPreset> _presets() {
    return getTimeWindowPresets(
      includeDeveloperOptions: ref
          .read(userSettingsViewModelProvider)
          .developerMode,
    );
  }

  void _save() {
    final TimeWindowPreset selectedPreset = _presets().firstWhere(
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
    final UserStatusService service = ref.read(userStatusServiceProvider);
    widget.onClose();
    widget.onSaved?.call();
    unawaited(service.setCustomStatus(payload).catchError((Object _) {}));
  }

  void _clearInput() {
    setState(() {
      _textController.clear();
      _emojiId = null;
      _emojiName = null;
      _emojiAnimated = false;
    });
  }

  Future<void> _showExpiryPicker() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<TimeWindowPreset> presets = _presets();
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
    if (widget.fullscreen) {
      return _buildPage(context);
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Column(
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
        FluxerButton.primary(onPressed: _save, label: l10n.customStatusSave),
      ],
    );
  }

  Widget _buildPage(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final bool hasContent =
        _textController.text.isNotEmpty || _buildEmojiPreview() != null;
    return FluxerPushPage(
      title: l10n.customStatusSetTitle,
      closes: true,
      trailing: FluxerPushPageAction(
        label: l10n.customStatusSave,
        onPressed: _isDirty ? _save : null,
      ),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.fromLTRB(
          16,
          8,
          16,
          16 + MediaQuery.paddingOf(context).bottom,
        ),
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: colors.backgroundSecondaryAlt,
              borderRadius: layout.radiusXxl,
            ),
            child: Row(
              children: [
                FluxerTappable(
                  onTap: () => unawaited(_pickEmoji()),
                  semanticLabel: l10n.customStatusChooseEmoji,
                  builder: (BuildContext context, Set<WidgetState> states) {
                    return SizedBox(
                      width: 52,
                      height: 52,
                      child: Center(
                        child:
                            _buildEmojiPreview() ??
                            PhosphorIcon(
                              PhosphorIconsFill.smiley,
                              size: 24,
                              color: colors.textSecondary,
                            ),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _textController,
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    maxLength: kCustomStatusTextLimit,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) {
                      if (_isDirty) {
                        _save();
                      }
                    },
                    onChanged: (_) => setState(() {}),
                    style: context.textStyles.bodyMedium.copyWith(
                      fontSize: 16,
                      color: colors.textPrimary,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      filled: false,
                      counterText: '',
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: l10n.customStatusPlaceholder,
                      hintStyle: context.textStyles.bodyMedium.copyWith(
                        fontSize: 16,
                        color: colors.textTertiary,
                      ),
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: hasContent ? 1 : 0,
                  duration: context.motion.fast,
                  child: IgnorePointer(
                    ignoring: !hasContent,
                    child: IconButton(
                      onPressed: _clearInput,
                      tooltip: l10n.customStatusClear,
                      icon: PhosphorIcon(
                        PhosphorIconsFill.xCircle,
                        size: 20,
                        color: colors.textTertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          FluxerBottomSheetSection(
            title: l10n.customStatusClearAfter,
            padding: EdgeInsets.zero,
            child: FluxerMenuGroup(
              children: [
                for (final TimeWindowPreset preset in _presets())
                  FluxerBottomSheetMenuItem(
                    label: customStatusExpiryLabel(preset.key, l10n),
                    isSelected: preset.key == _selectedExpiry,
                    onTap: () => setState(() => _selectedExpiry = preset.key),
                  ),
              ],
            ),
          ),
        ],
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
      icon: PhosphorIconsBold.smiley,
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
