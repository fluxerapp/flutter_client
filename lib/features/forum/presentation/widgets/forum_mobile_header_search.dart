import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/providers/forum_header_search_provider.dart';
import 'package:fluxer_app/features/forum/providers/forum_posts_provider.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForumMobileHeaderSearch extends ConsumerStatefulWidget {
  const ForumMobileHeaderSearch({required this.channelId, super.key});

  final String channelId;

  @override
  ConsumerState<ForumMobileHeaderSearch> createState() =>
      _ForumMobileHeaderSearchState();
}

class _ForumMobileHeaderSearchState
    extends ConsumerState<ForumMobileHeaderSearch> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(forumPostsProvider(widget.channelId)).query,
    );
    _focusNode = FocusNode();
    _controller.addListener(_onQueryChanged);
  }

  void _onQueryChanged() {
    final String query = _controller.text;
    if (query != ref.read(forumPostsProvider(widget.channelId)).query) {
      ref.read(forumPostsProvider(widget.channelId).notifier).setQuery(query);
    }
  }

  @override
  void didUpdateWidget(ForumMobileHeaderSearch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId) {
      _controller.text = ref.read(forumPostsProvider(widget.channelId)).query;
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onQueryChanged);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _close() {
    _focusNode.unfocus();
    ref.read(forumHeaderSearchProvider(widget.channelId).notifier).collapse();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(forumHeaderSearchProvider(widget.channelId), (
      ForumHeaderSearchState? previous,
      ForumHeaderSearchState next,
    ) {
      if (next.expanded && previous?.expanded != true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _focusNode.requestFocus();
          }
        });
      }
    });
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool unavailable = ref
        .watch(forumPostsProvider(widget.channelId))
        .searchUnavailable;
    final colors = context.colors;
    if (unavailable) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          l10n.forumSearchPosts,
          style: context.textStyles.channelName,
        ),
      );
    }
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      maxLength: forumPostNameMaxLength,
      textInputAction: TextInputAction.search,
      style: context.textStyles.inputText.copyWith(color: colors.textPrimary),
      decoration: InputDecoration(
        counterText: '',
        isDense: true,
        hintText: l10n.forumSearchPosts,
        hintStyle: context.textStyles.inputText.copyWith(
          color: colors.textTertiary,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: PhosphorIcon(
            PhosphorIconsBold.magnifyingGlass,
            size: 18,
            color: colors.textTertiary,
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 32,
          minHeight: 32,
        ),
        suffixIcon: FluxerGestureDetector(
          onTap: _close,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: PhosphorIcon(
              PhosphorIconsBold.x,
              size: 16,
              color: colors.textTertiary,
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 36,
          minHeight: 36,
        ),
        filled: true,
        fillColor: colors.backgroundSecondary,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.backgroundModifierAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.backgroundModifierAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.backgroundModifierAccentFocus),
        ),
      ),
    );
  }
}
