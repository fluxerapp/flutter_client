import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/accessibility/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/features/settings/utils/search_selection_context_menu.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

@immutable
class MessageMarkdownSettings {
  const MessageMarkdownSettings({
    required this.use12Hour,
    required this.alwaysUnderlineLinks,
    required this.dimStrikethroughText,
    required this.animateCustomEmoji,
    required this.enableTextSelection,
    required this.searchEngines,
    this.selectionContextMenuBuilder,
  });

  static const defaults = MessageMarkdownSettings(
    use12Hour: false,
    alwaysUnderlineLinks: false,
    dimStrikethroughText: true,
    animateCustomEmoji: true,
    enableTextSelection: false,
    searchEngines: SearchEnginesState(),
  );

  final bool use12Hour;
  final bool alwaysUnderlineLinks;
  final bool dimStrikethroughText;
  final bool animateCustomEmoji;
  final bool enableTextSelection;
  final SearchEnginesState searchEngines;
  final FluxerSelectionContextMenuBuilder? selectionContextMenuBuilder;

  factory MessageMarkdownSettings.watch(WidgetRef ref, BuildContext context) {
    final SearchEnginesState searchEngines = ref.watch(
      advancedPreferencesProvider.select((s) => s.searchEngines),
    );
    return MessageMarkdownSettings(
      use12Hour: ref.watch(use12HourTimeFormatProvider),
      alwaysUnderlineLinks: ref.watch(
        appearancePreferencesProvider.select((s) => s.alwaysUnderlineLinks),
      ),
      dimStrikethroughText: ref.watch(
        appearancePreferencesProvider.select((s) => s.dimStrikethroughText),
      ),
      animateCustomEmoji: effectiveMotionOf(ref, context).effectiveAnimateEmoji,
      enableTextSelection: ref.watch(
        advancedPreferencesProvider.select((s) => s.enableTextSelection),
      ),
      searchEngines: searchEngines,
      selectionContextMenuBuilder: selectionMenuBuilderFor(searchEngines),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageMarkdownSettings &&
          use12Hour == other.use12Hour &&
          alwaysUnderlineLinks == other.alwaysUnderlineLinks &&
          dimStrikethroughText == other.dimStrikethroughText &&
          animateCustomEmoji == other.animateCustomEmoji &&
          enableTextSelection == other.enableTextSelection &&
          identical(searchEngines, other.searchEngines) &&
          identical(
            selectionContextMenuBuilder,
            other.selectionContextMenuBuilder,
          );

  @override
  int get hashCode => Object.hash(
    use12Hour,
    alwaysUnderlineLinks,
    dimStrikethroughText,
    animateCustomEmoji,
    enableTextSelection,
    searchEngines,
    selectionContextMenuBuilder,
  );
}

SearchEnginesState? _cachedSearchEngines;
FluxerSelectionContextMenuBuilder? _cachedSelectionMenuBuilder;

FluxerSelectionContextMenuBuilder selectionMenuBuilderFor(
  SearchEnginesState searchEngines,
) {
  if (!identical(_cachedSearchEngines, searchEngines) ||
      _cachedSelectionMenuBuilder == null) {
    _cachedSearchEngines = searchEngines;
    _cachedSelectionMenuBuilder = createSearchSelectionContextMenuBuilder(
      searchEngines: searchEngines,
    );
  }
  return _cachedSelectionMenuBuilder!;
}

class MessageMarkdownSettingsScope extends InheritedWidget {
  const MessageMarkdownSettingsScope({
    required this.settings,
    required super.child,
    super.key,
  });

  final MessageMarkdownSettings settings;

  static MessageMarkdownSettings? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MessageMarkdownSettingsScope>()
        ?.settings;
  }

  @override
  bool updateShouldNotify(MessageMarkdownSettingsScope oldWidget) {
    return oldWidget.settings != settings;
  }
}

class MessageMarkdownBinding extends InheritedWidget {
  const MessageMarkdownBinding({
    required this.channelId,
    required this.guildId,
    required this.mentionChannels,
    required super.child,
    super.key,
  });

  final String? channelId;
  final String? guildId;
  final List<MessageChannelMention> mentionChannels;

  static MessageMarkdownBinding? maybeOf(BuildContext context) {
    return context.getInheritedWidgetOfExactType<MessageMarkdownBinding>();
  }

  @override
  bool updateShouldNotify(MessageMarkdownBinding oldWidget) {
    return oldWidget.channelId != channelId ||
        oldWidget.guildId != guildId ||
        !identical(oldWidget.mentionChannels, mentionChannels);
  }
}
