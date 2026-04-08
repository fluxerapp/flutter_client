import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/emoji_search_bar.dart'
    show kSkinToneSurrogates, skinToneToName;
import 'package:fluxer_app/features/chat/presentation/widgets/reply_preview.dart';
import 'package:fluxer_app/features/chat/providers/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/expression_panel_provider.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/shared/utils/chat_context_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// The chat input bar at the bottom of the chat area.
class ChannelTextarea extends ConsumerStatefulWidget {
  const ChannelTextarea({super.key});

  @override
  ConsumerState<ChannelTextarea> createState() => _ChannelTextareaState();
}

class _ChannelTextareaState extends ConsumerState<ChannelTextarea> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _expressionPickerKey = GlobalKey<FluxerEmojiPickerPopoutState>();

  bool get _isDesktop =>
      !kIsWeb && (Platform.isLinux || Platform.isMacOS || Platform.isWindows);

  @override
  void initState() {
    super.initState();
    _focusNode.onKeyEvent = _handleKeyEvent;
    _controller.addListener(() {
      ref
          .read(chatViewModelProvider.notifier)
          .updateMessageText(_controller.text);
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  /// Enter sends, Shift+Enter inserts newline.
  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (!_isDesktop) {
      return KeyEventResult.ignored;
    }
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey != LogicalKeyboardKey.enter) {
      return KeyEventResult.ignored;
    }
    if (HardwareKeyboard.instance.isShiftPressed) {
      return KeyEventResult.ignored;
    }
    unawaited(ref.read(chatViewModelProvider.notifier).sendMessage());
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String>(
      chatViewModelProvider.select((state) => state.messageText),
      (_, messageText) {
        if (_controller.text == messageText) {
          return;
        }
        _controller.value = TextEditingValue(
          text: messageText,
          selection: TextSelection.collapsed(offset: messageText.length),
        );
      },
    );

    ref.listen<({String name, String surrogates})?>(
      pendingEmojiInsertProvider,
      (_, pending) {
        if (pending == null) {
          return;
        }
        ref.read(pendingEmojiInsertProvider.notifier)
          ..consume();
        _insertEmoji(pending.name, pending.surrogates);
      },
    );

    final vm = ref.watch(chatViewModelProvider);
    final chatNotifier = ref.read(chatViewModelProvider.notifier);
    final replyTo = vm.replyingTo;
    final forwardFrom = vm.forwardingFrom;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (replyTo != null)
          ReplyInputBar(replyTo: replyTo, onCancel: chatNotifier.cancelReply),
        if (forwardFrom != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: context.colors.chatInputBackground,
            child: Row(
              children: [
                PhosphorIcon(
                  PhosphorIconsFill.shareFat,
                  size: 16,
                  color: context.colors.textPrimaryMuted,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Forwarding message from '
                    '${forwardFrom.authorName}',
                    style: TextStyle(
                      color: context.colors.textPrimaryMuted,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const PhosphorIcon(PhosphorIconsFill.x, size: 16),
                  color: context.colors.textPrimaryMuted,
                  onPressed: chatNotifier.cancelForward,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 24,
                    minHeight: 24,
                  ),
                ),
              ],
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color: context.colors.chatInputBackground,
            border: Border(
              top: BorderSide(color: context.colors.userAreaDividerColor),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: ResponsiveLayout(
            builder: (context, mode) {
              switch (mode) {
                case LayoutMode.desktop:
                  return _buildLargeLayout(context, chatNotifier);
                case LayoutMode.tablet:
                  return _buildLargeLayout(context, chatNotifier);
                case LayoutMode.mobile:
                  return _buildMobileLayout(context, chatNotifier);
              }
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).padding.bottom,
          decoration: BoxDecoration(color: context.colors.chatInputBackground),
        ),
      ],
    );
  }

  String _resolveHintText() {
    final channelId = ref.read(
      chatViewModelProvider.select((s) => s.channelId),
    );
    final channelState = ref.read(channelListViewModelProvider);
    final channel = findChannelById(channelState, channelId);
    if (channel != null) {
      return 'Message #${channel.name}';
    }
    final conversations = ref.read(
      dmViewModelProvider.select((s) => s.conversations),
    );
    final dm = findDmById(conversations, channelId);
    if (dm != null) {
      return 'Message @${dm.recipientName}';
    }
    return 'Message';
  }

  Widget _buildLargeLayout(BuildContext context, ChatViewModel chatNotifier) {
    final hasText = ref.watch(
      chatViewModelProvider.select((s) => s.messageText.isNotEmpty),
    );
    return Row(
      children: [
        FluxerButton.secondary(
          icon: PhosphorIconsFill.plusCircle,
          isSquare: true,
          size: FluxerButtonSize.compact,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: context.textStyles.inputText,
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: _resolveHintText(),
              hintMaxLines: 1,
              hintStyle: TextStyle(
                color: context.colors.textTertiaryMuted,
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
              filled: true,
              fillColor: context.colors.backgroundTertiary,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        if (!hasText) ...[
          IconButton(
            icon: const PhosphorIcon(PhosphorIconsFill.gift, size: 24),
            color: context.colors.interactiveNormal,
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
          IconButton(
            icon: const PhosphorIcon(PhosphorIconsFill.gif, size: 24),
            color: context.colors.interactiveNormal,
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
          IconButton(
            icon: const PhosphorIcon(PhosphorIconsFill.image, size: 24),
            color: context.colors.interactiveNormal,
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
          IconButton(
            icon: const PhosphorIcon(PhosphorIconsFill.sticker, size: 24),
            color: context.colors.interactiveNormal,
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          ),
          FluxerEmojiPickerPopout(
            key: _expressionPickerKey,
            onEmojiSelected: (emoji) =>
                _insertEmoji(emoji.name, emoji.surrogates),
            child: IconButton(
              icon: const PhosphorIcon(PhosphorIconsFill.smiley, size: 24),
              color: context.colors.interactiveNormal,
              onPressed: () => _expressionPickerKey.currentState?.toggle(),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
            ),
          ),
        ],
        SizedBox(
          height: 24,
          child: VerticalDivider(
            color: context.colors.borderColor,
            width: 16,
            thickness: 1,
          ),
        ),
        _sendAndVoiceButton(context, chatNotifier, hasText: hasText),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, ChatViewModel chatNotifier) {
    final hasText = ref.watch(
      chatViewModelProvider.select((s) => s.messageText.isNotEmpty),
    );

    return Row(
      children: [
        FluxerButton.circle(
          icon: PhosphorIconsBold.plus,
          variant: FluxerButtonVariant.secondary,
          size: FluxerButtonSize.small,
          iconSize: 20,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            style: context.textStyles.inputText,
            minLines: 1,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: _resolveHintText(),
              hintMaxLines: 1,
              hintStyle: TextStyle(
                color: context.colors.textTertiaryMuted,
                fontSize: 16,
                overflow: TextOverflow.ellipsis,
              ),
              filled: true,
              fillColor: context.colors.backgroundTertiary,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
              isDense: true,
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 7,
                ),
                child: _buildMobilePickerButton(context),
              ),
              suffixIconConstraints: const BoxConstraints(),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsetsGeometry.only(bottom: 1),
          child: _sendAndVoiceButton(
            context,
            chatNotifier,
            hasText: hasText,
            size: FluxerButtonSize.small,
          ),
        ),
      ],
    );
  }

  void _insertEmoji(String name, String surrogates) {
    final String token;
    if (surrogates.startsWith('<')) {
      token = surrogates;
    } else {
      token = _buildUnicodeShortcode(name, surrogates);
    }
    final text = _controller.text;
    final sel = _controller.selection;
    final pos = sel.isValid ? sel.baseOffset : text.length;
    final newText = text.substring(0, pos) + token + text.substring(pos);
    _controller.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: pos + token.length),
    );
  }

  String _buildUnicodeShortcode(String name, String surrogates) {
    for (final tone in kSkinToneSurrogates) {
      if (surrogates.contains(tone)) {
        final toneName = skinToneToName(tone);
        if (toneName != null) {
          return ':$name::$toneName:';
        }
        break;
      }
    }
    return ':$name:';
  }

  Widget _buildMobilePickerButton(BuildContext context) {
    final isPanelOpen = ref.watch(expressionPanelProvider);

    return FluxerButton.ghost(
      icon: isPanelOpen
          ? PhosphorIconsFill.keyboard
          : PhosphorIconsFill.smiley,
      isSquare: true,
      size: FluxerButtonSize.compact,
      onPressed: () {
        if (isPanelOpen) {
          ref.read(expressionPanelProvider.notifier).close();
          _focusNode.requestFocus();
        } else {
          FocusScope.of(context).unfocus();
          ref.read(expressionPanelProvider.notifier).open();
        }
      },
    );
  }

  Widget _sendAndVoiceButton(
    BuildContext context,
    ChatViewModel chatNotifier, {
    required bool hasText,
    FluxerButtonSize size = FluxerButtonSize.compact,
  }) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: hasText
          ? FluxerButton.circle(
              key: const ValueKey('send'),
              icon: PhosphorIconsBold.arrowUp,
              iconSize: 20,
              size: size,
              onPressed: chatNotifier.sendMessage,
            )
          : FluxerButton.circle(
              key: const ValueKey('voice'),
              icon: PhosphorIconsFill.microphone,
              variant: FluxerButtonVariant.secondary,
              iconSize: 20,
              size: size,
              onPressed: () {},
            ),
    );
  }
}
