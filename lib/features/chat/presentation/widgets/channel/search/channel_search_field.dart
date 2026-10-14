import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/channel_search_token.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_token_chip.dart';
import 'package:fluxer_app/features/ui/input/fluxer_clipboard_scope.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double kChannelSearchFieldHeight = 42;

class ChannelSearchField extends StatefulWidget {
  const ChannelSearchField({
    required this.controller,
    required this.focusNode,
    required this.tokens,
    required this.guildId,
    required this.hintText,
    required this.isSearching,
    required this.onSubmitted,
    required this.onRemoveToken,
    required this.onClear,
    super.key,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final List<ChannelSearchToken> tokens;
  final String? guildId;
  final String hintText;
  final bool isSearching;
  final ValueChanged<String> onSubmitted;
  final ValueChanged<ChannelSearchToken> onRemoveToken;
  final VoidCallback onClear;

  @override
  State<ChannelSearchField> createState() => _ChannelSearchFieldState();
}

class _ChannelSearchFieldState extends State<ChannelSearchField> {
  final ScrollController _tokenScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(ChannelSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode.removeListener(_onFocusChanged);
      widget.focusNode.addListener(_onFocusChanged);
    }
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChanged);
    _tokenScroll.dispose();
    super.dispose();
  }

  void _onFocusChanged() => setState(() {});

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }
    if (event.logicalKey != LogicalKeyboardKey.backspace ||
        widget.tokens.isEmpty) {
      return KeyEventResult.ignored;
    }
    final TextSelection selection = widget.controller.selection;
    final bool atStart =
        widget.controller.text.isEmpty ||
        (selection.isValid && selection.isCollapsed && selection.start == 0);
    if (!atStart) {
      return KeyEventResult.ignored;
    }
    widget.onRemoveToken(widget.tokens.last);
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool focused = widget.focusNode.hasFocus;
    final Color fill = Theme.of(context).brightness == Brightness.light
        ? Color.lerp(colors.backgroundPrimary, Colors.black, 0.06)!
        : Color.lerp(colors.backgroundSecondaryAlt, Colors.black, 0.12)!;
    return AnimatedContainer(
      duration: context.motion.fast,
      curve: context.motion.curve,
      height: kChannelSearchFieldHeight,
      decoration: BoxDecoration(
        color: fill,
        borderRadius: layout.radiusLg,
        border: Border.all(
          color: focused
              ? colors.brandPrimary
              : colors.backgroundModifierAccent,
        ),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(width: 13),
          SizedBox.square(
            dimension: 16,
            child: widget.isSearching
                ? const FittedBox(
                    key: ValueKey<String>('search-field-spinner'),
                    child: FluxerLoadingSpinner(
                      size: FluxerLoadingSpinnerSize.small,
                    ),
                  )
                : PhosphorIcon(
                    PhosphorIconsBold.magnifyingGlass,
                    size: 16,
                    color: colors.textTertiary,
                  ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Row(
                  children: <Widget>[
                    if (widget.tokens.isNotEmpty) ...<Widget>[
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth * 0.7,
                        ),
                        child: SingleChildScrollView(
                          controller: _tokenScroll,
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Row(
                            children: <Widget>[
                              for (final (int index, ChannelSearchToken token)
                                  in widget.tokens.indexed) ...<Widget>[
                                if (index > 0) const SizedBox(width: 4),
                                ChannelSearchTokenChip(
                                  key: ValueKey<String>(
                                    'search-token-${token.signature}',
                                  ),
                                  token: token,
                                  guildId: widget.guildId,
                                  onRemove: () => widget.onRemoveToken(token),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                    Expanded(child: _textField(context)),
                  ],
                );
              },
            ),
          ),
          ValueListenableBuilder<TextEditingValue>(
            valueListenable: widget.controller,
            builder: (BuildContext context, TextEditingValue value, _) {
              if (value.text.isEmpty && widget.tokens.isEmpty) {
                return const SizedBox(width: 12);
              }
              return FluxerGestureDetector(
                key: const ValueKey<String>('search-field-clear'),
                behavior: HitTestBehavior.opaque,
                onTap: widget.onClear,
                child: Semantics(
                  button: true,
                  label: l10n.channelDetailsSearchClearFilter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 12, 12),
                    child: PhosphorIcon(
                      PhosphorIconsFill.xCircle,
                      size: 16,
                      color: colors.textTertiary,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _textField(BuildContext context) {
    final colors = context.colors;
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: _onKeyEvent,
      child: FluxerClipboardScope(
        controller: widget.controller,
        focusNode: widget.focusNode,
        builder:
            (
              BuildContext context,
              FluxerClipboardScopeState clipboardScope,
              FocusNode focusNode,
            ) => TextField(
              controller: widget.controller,
              focusNode: focusNode,
              textInputAction: TextInputAction.search,
              autocorrect: false,
              enableSuggestions: false,
              cursorColor: colors.textPrimary,
              onSubmitted: widget.onSubmitted,
              contextMenuBuilder: clipboardScope.buildContextMenu,
              style: context.textStyles.inputText.copyWith(
                color: colors.textPrimary,
                height: 1.25,
              ),
              decoration: InputDecoration(
                isCollapsed: true,
                filled: false,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: widget.tokens.isEmpty ? widget.hintText : null,
                hintStyle: context.textStyles.inputHint.copyWith(
                  color: colors.textTertiary,
                  height: 1.25,
                ),
              ),
            ),
      ),
    );
  }
}
