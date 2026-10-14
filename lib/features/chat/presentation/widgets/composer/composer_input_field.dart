import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' show BoxWidthStyle;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_clipboard_scope.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/message_character_counter.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/slash_command_composer.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/services/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/services/composer_slash_session.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_validator.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_clipboard_paste.dart';
import 'package:fluxer_app/features/ui/input/emoji_inline_token.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

class ComposerInputField extends ConsumerWidget {
  const ComposerInputField({
    required this.channelId,
    required this.controller,
    required this.focusNode,
    required this.composerScrollController,
    required this.composerFieldKey,
    required this.slashSession,
    required this.perms,
    required this.maxMessageLength,
    required this.premiumMaxLength,
    required this.decoration,
    required this.minLines,
    required this.maxLines,
    required this.enterSends,
    required this.showComposerCounter,
    required this.sendableWireLength,
    required this.hintSemanticsLabel,
    required this.onSendPressed,
    required this.onComposerFieldTap,
    required this.onPasteExceedsLimit,
    required this.onPasteLostContent,
    required this.onValidationResult,
    required this.onUpgradePressed,
    this.textAlignVertical,
    this.cursorColor,
    this.fitLinesToHeight = false,
    super.key,
  });

  final String channelId;
  final ComposerMentionController controller;
  final FocusNode focusNode;
  final ScrollController composerScrollController;
  final GlobalKey<ComposerAutocompleteFieldState> composerFieldKey;
  final ComposerSlashSession slashSession;
  final ChannelMessagePermissions perms;
  final int maxMessageLength;
  final int premiumMaxLength;
  final InputDecoration decoration;
  final int minLines;
  final int maxLines;
  final bool enterSends;
  final ValueNotifier<bool> showComposerCounter;
  final int sendableWireLength;
  final String hintSemanticsLabel;
  final VoidCallback onSendPressed;
  final VoidCallback onComposerFieldTap;
  final void Function(String pastedText) onPasteExceedsLimit;
  final VoidCallback onPasteLostContent;
  final void Function(FileUploadValidationResult result) onValidationResult;
  final VoidCallback onUpgradePressed;
  final TextAlignVertical? textAlignVertical;
  final Color? cursorColor;
  final bool fitLinesToHeight;

  TextMagnifierConfiguration get _magnifierConfiguration =>
      TextMagnifierConfiguration(
        shouldDisplayHandlesInMagnifier: TextMagnifier
            .adaptiveMagnifierConfiguration
            .shouldDisplayHandlesInMagnifier,
        magnifierBuilder:
            (
              BuildContext context,
              MagnifierController magnifierController,
              ValueNotifier<MagnifierInfo> magnifierInfo,
            ) {
              if (controller.text.isEmpty) {
                return null;
              }
              return TextMagnifier.adaptiveMagnifierConfiguration
                  .magnifierBuilder(
                    context,
                    magnifierController,
                    magnifierInfo,
                  );
            },
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EdgeInsets basePadding = decoration.contentPadding is EdgeInsets
        ? decoration.contentPadding! as EdgeInsets
        : const EdgeInsets.symmetric(horizontal: 12, vertical: 10);
    final bool canUpgrade =
        maxMessageLength < premiumMaxLength &&
        ref.watch(shouldShowPremiumCommerceProvider);

    return ComposerClipboardScope(
      channelId: channelId,
      controller: controller,
      focusNode: focusNode,
      isAttachEnabled: perms.isAttachEnabled,
      maxMessageLength: maxMessageLength,
      canAttachOnExceed: () =>
          perms.canShowAttachControls && perms.isAttachEnabled,
      onPasteExceedsLimit: onPasteExceedsLimit,
      onPasteLostContent: onPasteLostContent,
      onValidationResult: onValidationResult,
      builder:
          (
            BuildContext context,
            FluxerClipboardScopeState clipboardScope,
            FocusNode fieldFocusNode,
          ) {
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Semantics(
                  label: hintSemanticsLabel,
                  textField: true,
                  child: wrapBoundedTextClip(
                    maxLines: maxLines,
                    child: slashSession.isActive
                        ? SlashCommandComposer(
                            session: slashSession,
                            enabled: perms.isComposerEnabled,
                            style: context.textStyles.inputText,
                            enterSends: enterSends,
                            onKeyEvent: (KeyEvent event) =>
                                handleComposerAutocompleteKey(
                                  composerFieldKey.currentState,
                                  event,
                                ),
                            onSubmit: onSendPressed,
                          )
                        : ValueListenableBuilder<bool>(
                            valueListenable: showComposerCounter,
                            builder: (BuildContext context, bool showCounter, Widget? _) {
                              final EdgeInsets padding = showCounter
                                  ? basePadding +
                                        const EdgeInsets.only(
                                          right: 28,
                                          bottom: 18,
                                        )
                                  : basePadding;
                              Widget field(int lines) {
                                return TextField(
                                  key: const ValueKey<String>(
                                    'channel-composer-field',
                                  ),
                                  controller: controller,
                                  focusNode: fieldFocusNode,
                                  scrollController: composerScrollController,
                                  enabled: perms.isComposerEnabled,
                                  style: context.textStyles.inputText,
                                  strutStyle: boundedStrutFor(
                                    context.textStyles.inputText.copyWith(
                                      height: kInlineEmojiLineHeight,
                                    ),
                                  ),
                                  minLines: math.min(minLines, lines),
                                  maxLines: lines,
                                  selectionWidthStyle: BoxWidthStyle.tight,
                                  magnifierConfiguration:
                                      _magnifierConfiguration,
                                  decoration: decoration.copyWith(
                                    contentPadding: padding,
                                  ),
                                  textAlignVertical: textAlignVertical,
                                  cursorColor: cursorColor,
                                  textCapitalization:
                                      TextCapitalization.sentences,
                                  autocorrect: true,
                                  enableInlinePrediction: true,
                                  contextMenuBuilder:
                                      clipboardScope.buildContextMenu,
                                  contentInsertionConfiguration:
                                      perms.isAttachEnabled
                                      ? ContentInsertionConfiguration(
                                          onContentInserted:
                                              (
                                                KeyboardInsertedContent content,
                                              ) {
                                                unawaited(() async {
                                                  final FileUploadValidationResult?
                                                  result =
                                                      await handleComposerContentInserted(
                                                        ref: ref,
                                                        channelId: channelId,
                                                        content: content,
                                                        isAttachEnabled: perms
                                                            .isAttachEnabled,
                                                      );
                                                  if (result != null) {
                                                    onValidationResult(result);
                                                  }
                                                }());
                                              },
                                        )
                                      : null,
                                  onTap: onComposerFieldTap,
                                );
                              }

                              if (!fitLinesToHeight) {
                                return field(maxLines);
                              }
                              return LayoutBuilder(
                                builder:
                                    (
                                      BuildContext context,
                                      BoxConstraints constraints,
                                    ) => field(
                                      composerLinesThatFit(
                                        maxHeight: constraints.maxHeight,
                                        verticalPadding: padding.vertical,
                                        lineHeight: composerLineHeight(context),
                                        maxLines: maxLines,
                                      ),
                                    ),
                              );
                            },
                          ),
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: ListenableBuilder(
                    listenable: controller,
                    builder: (BuildContext context, Widget? _) {
                      return MessageCharacterCounter(
                        currentLength: sendableWireLength,
                        maxLength: maxMessageLength,
                        canUpgrade: canUpgrade,
                        premiumMaxLength: premiumMaxLength,
                        onUpgradePressed: onUpgradePressed,
                      );
                    },
                  ),
                ),
              ],
            );
          },
    );
  }
}

double composerLineHeight(BuildContext context) {
  final double fontSize = context.textStyles.inputText.fontSize ?? 16;
  return MediaQuery.textScalerOf(context).scale(fontSize) *
      kInlineEmojiLineHeight;
}

int composerLinesThatFit({
  required double maxHeight,
  required double verticalPadding,
  required double lineHeight,
  required int maxLines,
}) {
  if (!maxHeight.isFinite || lineHeight <= 0) {
    return maxLines;
  }
  final int fit = ((maxHeight - verticalPadding + 0.01) / lineHeight).floor();
  return fit.clamp(1, maxLines);
}
