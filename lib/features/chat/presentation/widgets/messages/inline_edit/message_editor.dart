import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/inline_message_edit.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_input_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/inline_edit/edit_footer.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/inline_message_edit_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_app/features/chat/services/composer_autocomplete_trigger.dart';
import 'package:fluxer_app/features/chat/services/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/services/composer_slash_session.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_enter_send.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_keyboard_actions.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_limit_toast.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_markdown_wrap.dart';
import 'package:fluxer_app/features/input/providers/composer_focus_coordinator_provider.dart';
import 'package:fluxer_app/features/settings/utils/commerce/open_user_billing_settings.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

const Set<ComposerAutocompleteTriggerKind> _kEditTriggers =
    <ComposerAutocompleteTriggerKind>{
      ComposerAutocompleteTriggerKind.mention,
      ComposerAutocompleteTriggerKind.channel,
      ComposerAutocompleteTriggerKind.emoji,
    };

class InlineMessageEditor extends ConsumerStatefulWidget {
  const InlineMessageEditor({required this.message, super.key});

  final Message message;

  @override
  ConsumerState<InlineMessageEditor> createState() =>
      _InlineMessageEditorState();
}

class _InlineMessageEditorState extends ConsumerState<InlineMessageEditor> {
  static const double _kTopGap = 8;
  static const double _kRadius = 6;
  static const double _kPaddingY = 8;
  static const double _kPaddingStart = 16;
  static const double _kPaddingEnd = 11;
  static const double _kContentGap = 12;
  static const double _kMaxViewportFraction = 0.5;
  static const int _kMaxLines = 1000;

  late final ComposerMentionController _controller;
  final FocusNode _focusNode = FocusNode(debugLabel: 'InlineMessageEditor');
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ComposerAutocompleteFieldState> _fieldKey =
      GlobalKey<ComposerAutocompleteFieldState>();
  final GlobalKey<FluxerEmojiPickerPopoutState> _pickerKey =
      GlobalKey<FluxerEmojiPickerPopoutState>();
  final ComposerSlashSession _slashSession = ComposerSlashSession();
  final ValueNotifier<bool> _showCounter = ValueNotifier<bool>(false);
  bool _applying = true;
  bool _focused = false;
  bool _pickerOpen = false;
  bool _ending = false;

  String get _channelId => widget.message.channelId;
  String get _messageId => widget.message.id;

  @override
  void initState() {
    super.initState();
    _controller = ComposerMentionController(ref: ref);
    _focusNode
      ..onKeyEvent = _handleKeyEvent
      ..addListener(_onFocusChanged);
    final String initial =
        ref.read(inlineMessageEditProvider)[_channelId]?.text ??
        widget.message.content;
    unawaited(_applyInitial(stripPrivateUseCharacters(initial)));
  }

  Future<void> _applyInitial(String wire) async {
    await _controller.applyWireText(wire, force: true);
    if (!mounted) {
      return;
    }
    _applying = false;
    _controller
      ..selection = TextSelection.collapsed(offset: _controller.text.length)
      ..addListener(_onTextChanged);
    _syncCounter();
    _focusIfPending();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTextChanged)
      ..dispose();
    _focusNode
      ..removeListener(_onFocusChanged)
      ..dispose();
    _scrollController.dispose();
    _slashSession.dispose();
    _showCounter.dispose();
    super.dispose();
  }

  String _wireText() =>
      stripPrivateUseCharacters(_controller.toAcceptedWireText());

  int _contentLength() => _wireText().trim().length;

  void _onTextChanged() {
    if (_applying) {
      return;
    }
    ref
        .read(inlineMessageEditProvider.notifier)
        .updateText(_channelId, _messageId, _wireText());
    _syncCounter();
  }

  void _syncCounter() {
    final int max = ref.read(maxMessageLengthProvider);
    final bool show = _contentLength() > (max * 0.8).floor();
    if (show != _showCounter.value) {
      _showCounter.value = show;
    }
  }

  void _onFocusChanged() {
    if (_focused != _focusNode.hasFocus) {
      setState(() => _focused = _focusNode.hasFocus);
    }
  }

  void _focusIfPending() {
    if (_applying ||
        !ref
            .read(inlineMessageEditProvider.notifier)
            .consumeFocus(_channelId, _messageId)) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _focusNode.canRequestFocus) {
        _focusNode.requestFocus();
      }
    });
  }

  bool _isImeComposing() => composerValueIsComposing(_controller.value);

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    final KeyEventResult autocomplete = handleComposerAutocompleteKey(
      _fieldKey.currentState,
      event,
    );
    if (autocomplete == KeyEventResult.handled) {
      return autocomplete;
    }
    final LogicalKeyboardKey key = event.logicalKey;
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    if (key == LogicalKeyboardKey.escape) {
      if (event is KeyDownEvent &&
          !keyboard.isShiftPressed &&
          !_isImeComposing()) {
        _cancel();
        return KeyEventResult.handled;
      }
      return KeyEventResult.ignored;
    }
    final String? wrapper = composerMarkdownWrapperFor(
      _controller.value,
      event,
    );
    if (wrapper != null) {
      _controller.value = toggleMarkdownWrap(_controller.value, wrapper);
      return KeyEventResult.handled;
    }
    if (!isComposerSubmitKey(key) || keyboard.isShiftPressed) {
      return KeyEventResult.ignored;
    }
    final bool commandEnter =
        keyboard.isControlPressed || keyboard.isMetaPressed;
    if (!commandEnter && composerSelectionInCodeBlock(_controller.value)) {
      return KeyEventResult.ignored;
    }
    if (_isImeComposing()) {
      return KeyEventResult.ignored;
    }
    if (event is KeyDownEvent) {
      unawaited(_save());
    }
    return KeyEventResult.handled;
  }

  bool get _isOverLimit =>
      _contentLength() > ref.read(maxMessageLengthProvider);

  void _cancel() {
    if (_ending) {
      return;
    }
    _ending = true;
    _pickerKey.currentState?.close();
    ref.read(inlineMessageEditProvider.notifier).end(_channelId, _messageId);
  }

  Future<void> _save() async {
    if (_ending) {
      return;
    }
    if (_isOverLimit) {
      showComposerTooLongToast(ref, FluxerLocalizations.of(context));
      return;
    }
    _ending = true;
    _pickerKey.currentState?.close();
    await ref
        .read(chatViewModelProvider.notifier)
        .saveInlineEdit(message: widget.message, text: _wireText());
    if (mounted) {
      _ending = false;
    }
  }

  void _insertEmoji(String name, String surrogates) {
    _controller.insertEmoji(name, surrogates);
    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }
  }

  void _togglePicker() {
    final FluxerEmojiPickerPopoutState? picker = _pickerKey.currentState;
    if (picker == null) {
      return;
    }
    picker.toggle();
    setState(() => _pickerOpen = picker.isOpen);
  }

  ChannelMessagePermissions _editPermissions() {
    final ChannelMessagePermissions base =
        watchChannelMessagePermissionsForComposer(ref, _channelId);
    return ChannelMessagePermissions(
      isResolved: true,
      canSendMessages: true,
      canAttachFiles: false,
      canEmbedLinks: base.canEmbedLinks,
      canUseExternalEmojis: base.canUseExternalEmojis,
      canUseExternalStickers: base.canUseExternalStickers,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(
      inlineMessageEditProvider.select(
        (Map<String, InlineMessageEdit> edits) =>
            edits[_channelId]?.messageId == _messageId,
      ),
      (bool? previous, bool next) {
        if ((previous ?? false) && !next && _focusNode.hasFocus) {
          ref.read(composerFocusCoordinatorProvider).requestComposerFocus();
        }
      },
    );
    ref.listen<bool>(
      inlineMessageEditProvider.select(
        (Map<String, InlineMessageEdit> edits) =>
            edits[_channelId]?.messageId == _messageId &&
            (edits[_channelId]?.focusPending ?? false),
      ),
      (bool? previous, bool next) {
        if (next) {
          _focusIfPending();
        }
      },
    );
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int maxMessageLength = ref.watch(maxMessageLengthProvider);
    final int premiumMaxLength = ref.watch(premiumMaxMessageLengthProvider);
    final ChannelMessagePermissions perms = _editPermissions();
    final double maxHeight =
        MediaQuery.sizeOf(context).height * _kMaxViewportFraction;
    final Widget field = ComposerInputField(
      channelId: _channelId,
      controller: _controller,
      focusNode: _focusNode,
      composerScrollController: _scrollController,
      composerFieldKey: _fieldKey,
      slashSession: _slashSession,
      perms: perms,
      maxMessageLength: maxMessageLength,
      premiumMaxLength: premiumMaxLength,
      decoration: InputDecoration(
        filled: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical:
              ((WideComposerLayout.actionButtonExtent -
                          composerLineHeight(context)) /
                      2)
                  .clamp(0, WideComposerLayout.actionButtonExtent),
        ),
      ),
      minLines: 1,
      maxLines: _kMaxLines,
      enterSends: true,
      showComposerCounter: _showCounter,
      sendableWireLength: _contentLength,
      hintSemanticsLabel: l10n.chatEditMessageHint,
      onSendPressed: () => unawaited(_save()),
      onComposerFieldTap: () {},
      onPasteExceedsLimit: (_) {},
      onPasteLostContent: () {},
      onValidationResult: (_) {},
      onUpgradePressed: () => unawaited(openPlutoniumCommerce(context, ref)),
      onSlashKeyEvent: (_) => KeyEventResult.ignored,
      fitLinesToHeight: true,
    );
    return Padding(
      padding: const EdgeInsets.only(top: _kTopGap),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AnimatedContainer(
            duration: WideComposerLayout.ringTransition,
            curve: Curves.easeInOut,
            padding: const EdgeInsetsDirectional.only(
              start: _kPaddingStart,
              end: _kPaddingEnd,
              top: _kPaddingY,
              bottom: _kPaddingY,
            ),
            decoration: BoxDecoration(
              color: context.colors.backgroundTextarea,
              borderRadius: BorderRadius.circular(_kRadius),
              border: Border.all(
                color: _focused
                    ? context.colors.backgroundModifierAccentFocus
                    : context.colors.backgroundModifierAccent,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: maxHeight),
                    child: ComposerAutocompleteField(
                      key: _fieldKey,
                      controller: _controller,
                      focusNode: _focusNode,
                      channelId: _channelId,
                      allowedTriggers: _kEditTriggers,
                      child: field,
                    ),
                  ),
                ),
                const SizedBox(width: _kContentGap),
                FluxerEmojiPickerPopout(
                  key: _pickerKey,
                  visibleTabs: const <ExpressionPickerTab>[
                    ExpressionPickerTab.emojis,
                  ],
                  channelId: _channelId,
                  onEmojiSelected: (emoji) =>
                      _insertEmoji(emoji.name, emoji.surrogates),
                  onClose: () {
                    if (mounted && _pickerOpen) {
                      setState(() => _pickerOpen = false);
                    }
                  },
                  child: WideComposerMouseButton(
                    icon: PhosphorIconsFill.smiley,
                    tooltip: l10n.emojiTabEmojis,
                    active: _pickerOpen,
                    onPressed: _togglePicker,
                  ),
                ),
              ],
            ),
          ),
          InlineEditFooter(onCancel: _cancel, onSave: () => unawaited(_save())),
        ],
      ),
    );
  }
}
