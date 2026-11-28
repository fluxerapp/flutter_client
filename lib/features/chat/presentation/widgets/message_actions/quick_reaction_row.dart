import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/ui/desktop_surface/fluxer_desktop_surface.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_image_cache.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_registry.dart';
import 'package:fluxer_app/shared/utils/emoji/emoji_utils.dart';
import 'package:fluxer_app/shared/utils/fluxer_haptics.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';

sealed class QuickReactionItem {
  const QuickReactionItem();
}

class UnicodeQuickReaction extends QuickReactionItem {
  const UnicodeQuickReaction(this.emoji);
  final String emoji;
}

class CustomQuickReaction extends QuickReactionItem {
  const CustomQuickReaction(this.emoji);
  final GuildEmojiEntry emoji;
}

String? quickReactionUsageKey(QuickReactionItem item) => switch (item) {
  UnicodeQuickReaction(:final emoji) => switch (EmojiRegistry.entryBySurrogates(
    emoji,
  )) {
    final EmojiEntry entry => unicodeEmojiFavoriteKey(entry),
    null => null,
  },
  CustomQuickReaction(:final emoji) => emoji.favoriteKey,
};

String quickReactionShortcode(QuickReactionItem item) => switch (item) {
  UnicodeQuickReaction(:final emoji) => switch (EmojiRegistry.entryBySurrogates(
    emoji,
  )) {
    final EmojiEntry entry => ':${entry.primaryName}:',
    null => emoji,
  },
  CustomQuickReaction(:final emoji) => ':${emoji.name}:',
};

const List<QuickReactionItem> kQuickReactionDefaults = [
  UnicodeQuickReaction('\u{1F44D}'),
  UnicodeQuickReaction('\u{1F44C}'),
  UnicodeQuickReaction('\u{1F389}'),
  UnicodeQuickReaction('\u{2764}\u{FE0F}'),
];

const List<String> kQuickReactionMenuShortcuts = <String>['1', '2', '3', '4'];

class QuickReactionRow extends StatelessWidget {
  final List<QuickReactionItem> items;
  final ValueChanged<QuickReactionItem> onReaction;
  final VoidCallback? onAddMore;
  final bool menuShortcuts;

  const QuickReactionRow({
    required this.onReaction,
    this.items = kQuickReactionDefaults,
    this.onAddMore,
    this.menuShortcuts = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.only(
        left: layout.s1_5,
        right: layout.s1_5,
        top: layout.s1,
        bottom: layout.s1_5,
      ),
      child: Row(
        spacing: layout.s1,
        children: [
          for (int i = 0; i < items.length; i++)
            Expanded(
              child: _QuickReactionButton(
                onTap: () => onReaction(items[i]),
                label: quickReactionShortcode(items[i]),
                shortcut:
                    menuShortcuts && i < kQuickReactionMenuShortcuts.length
                    ? kQuickReactionMenuShortcuts[i]
                    : null,
                child: QuickReactionGlyph(item: items[i]),
              ),
            ),
          if (onAddMore != null)
            Expanded(
              child: _QuickReactionButton(
                onTap: onAddMore!,
                child: PhosphorIcon(
                  PhosphorIconsBold.plus,
                  size: 24,
                  color: context.colors.textPrimary,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class QuickReactionGlyph extends StatelessWidget {
  const QuickReactionGlyph({required this.item, this.size = 24, super.key});

  final QuickReactionItem item;
  final double size;

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      UnicodeQuickReaction(:final emoji) => UnicodeEmojiWidget(
        emoji: emoji,
        size: size,
      ),
      CustomQuickReaction(:final emoji) => CachedEmojiImage(
        emojiId: emoji.id,
        animated: false,
        requestSize: kCustomEmojiFetchSize,
        size: size,
      ),
    };
  }
}

class _QuickReactionButton extends ConsumerStatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final String? label;
  final String? shortcut;

  const _QuickReactionButton({
    required this.child,
    required this.onTap,
    this.label,
    this.shortcut,
  });

  @override
  ConsumerState<_QuickReactionButton> createState() =>
      _QuickReactionButtonState();
}

class _QuickReactionButtonState extends ConsumerState<_QuickReactionButton>
    implements FluxerDesktopMenuEntry {
  final FocusNode _focusNode = FocusNode(debugLabel: 'QuickReactionButton');
  FluxerDesktopMenuNavigatorState? _navigator;
  var _isHovered = false;
  var _isFocused = false;

  @override
  FocusNode get menuFocusNode => _focusNode;

  @override
  String get menuLabel => widget.label ?? '';

  @override
  String? get menuShortcut => widget.shortcut;

  @override
  bool get menuEnabled => widget.shortcut != null;

  @override
  BuildContext get menuContext => context;

  @override
  FluxerDesktopSubmenuHandle? get menuSubmenu => null;

  @override
  void menuActivate() => _activate();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final FluxerDesktopMenuNavigatorState? navigator = widget.shortcut == null
        ? null
        : FluxerDesktopMenuNavigator.maybeOf(context);
    if (navigator != _navigator) {
      _navigator?.unregister(this);
      _navigator = navigator?..register(this);
    }
  }

  @override
  void dispose() {
    _navigator?.unregister(this);
    _focusNode.dispose();
    super.dispose();
  }

  void _activate() {
    FluxerHaptics.selection();
    widget.onTap();
  }

  KeyEventResult _handleKeyEvent(FocusNode _, KeyEvent event) {
    if (event is KeyUpEvent) {
      return KeyEventResult.ignored;
    }
    final LogicalKeyboardKey key = event.logicalKey;
    if (key == LogicalKeyboardKey.enter ||
        key == LogicalKeyboardKey.numpadEnter ||
        key == LogicalKeyboardKey.space) {
      _activate();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    final bool inMenu = FluxerDesktopSurfaceScope.isMenu(context);
    final bool highlighted = _isHovered || _isFocused;
    final String? shortcut = widget.shortcut;
    final bool showBadge =
        shortcut != null &&
        !isTouchPrimaryInput(ref) &&
        ref.watch(
          appearancePreferencesProvider.select(
            (AppearancePreferencesState s) => s.showContextMenuShortcuts,
          ),
        );
    Widget button = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: FluxerGestureDetector(
        onTap: _activate,
        child: AspectRatio(
          aspectRatio: 1,
          child: inMenu
              ? AnimatedContainer(
                  duration: context.motion.normal,
                  decoration: BoxDecoration(
                    color: highlighted
                        ? context.colors.backgroundModifierAccent
                        : context.colors.backgroundModifierSelected,
                    borderRadius: context.layout.radiusMd,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(child: widget.child),
                      if (showBadge)
                        PositionedDirectional(
                          top: 4,
                          end: 5,
                          child: IgnorePointer(
                            child: Text(
                              shortcut,
                              style: context.textStyles.label.copyWith(
                                fontSize: 10,
                                height: 1,
                                color: context.colors.textPrimaryMuted,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
              : DecoratedBox(
                  decoration: BoxDecoration(
                    color: highlighted
                        ? context.colors.backgroundModifierSelected
                        : context.colors.backgroundModifierHover,
                    borderRadius: context.layout.radiusLg,
                  ),
                  child: Center(child: widget.child),
                ),
        ),
      ),
    );
    if (shortcut != null) {
      button = Focus(
        focusNode: _focusNode,
        onKeyEvent: _handleKeyEvent,
        onFocusChange: (bool focused) => setState(() => _isFocused = focused),
        child: button,
      );
      final String? label = widget.label;
      if (label != null) {
        button = FluxerTooltip(
          richMessage: _QuickReactionTooltip(
            shortcode: label,
            hint: FluxerLocalizations.of(
              context,
            ).chatMessagePressShortcutToReact(shortcut),
          ),
          child: button,
        );
      }
    }
    return button;
  }
}

class _QuickReactionTooltip extends StatelessWidget {
  const _QuickReactionTooltip({required this.shortcode, required this.hint});

  final String shortcode;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 2,
      children: <Widget>[
        Text(shortcode, textAlign: TextAlign.center),
        Text(
          hint,
          textAlign: TextAlign.center,
          style: context.textStyles.label.copyWith(
            fontSize: 12,
            height: 1.33,
            color: context.colors.textSecondary,
          ),
        ),
      ],
    );
  }
}
