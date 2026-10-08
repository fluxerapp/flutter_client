import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/presentation/sheets/forum_post_composer_sheet.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_sort_view_panel.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_tag_chip.dart';
import 'package:fluxer_app/features/forum/providers/forum_posts_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/popout/fluxer_popout.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForumDesktopToolbar extends ConsumerWidget {
  const ForumDesktopToolbar({
    required this.forum,
    required this.canPost,
    required this.searchController,
    super.key,
  });

  final Channel forum;
  final bool canPost;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _ForumSearchCard(
          forum: forum,
          canPost: canPost,
          searchController: searchController,
          onCreatePost: () =>
              unawaited(showForumPostComposerSheet(context, ref, forum: forum)),
        ),
        SizedBox(height: context.layout.s3),
        _ForumFilterRow(forum: forum),
      ],
    );
  }
}

class _ForumSearchCard extends ConsumerWidget {
  const _ForumSearchCard({
    required this.forum,
    required this.canPost,
    required this.searchController,
    required this.onCreatePost,
  });

  final Channel forum;
  final bool canPost;
  final TextEditingController searchController;
  final VoidCallback onCreatePost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ForumViewState view = ref.watch(forumPostsProvider(forum.id));
    final colors = context.colors;
    final bool unavailable = view.searchUnavailable;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.backgroundModifierAccent),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 6, 6, 6),
        child: Row(
          children: <Widget>[
            if (unavailable)
              const Expanded(child: SizedBox.shrink())
            else ...<Widget>[
              PhosphorIcon(
                PhosphorIconsBold.magnifyingGlass,
                size: 18,
                color: colors.textTertiary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ListenableBuilder(
                  listenable: searchController,
                  builder: (BuildContext context, Widget? child) {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            controller: searchController,
                            maxLength: forumPostNameMaxLength,
                            style: context.textStyles.bodyMedium.copyWith(
                              color: colors.textPrimary,
                            ),
                            decoration: InputDecoration(
                              counterText: '',
                              isDense: true,
                              hintText: l10n.forumSearchPosts,
                              hintStyle: context.textStyles.bodyMedium.copyWith(
                                color: colors.textTertiary,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                            ),
                          ),
                        ),
                        if (searchController.text.isNotEmpty)
                          FluxerGestureDetector(
                            onTap: searchController.clear,
                            child: Padding(
                              padding: const EdgeInsets.all(6),
                              child: PhosphorIcon(
                                PhosphorIconsBold.x,
                                size: 14,
                                color: colors.textTertiary,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ],
            if (canPost) ...<Widget>[
              const SizedBox(width: 8),
              FluxerButton.primary(
                onPressed: onCreatePost,
                icon: PhosphorIconsBold.plus,
                label: l10n.forumNewPost,
                fitContent: true,
                size: FluxerButtonSize.small,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ForumFilterRow extends ConsumerWidget {
  const _ForumFilterRow({required this.forum});

  final Channel forum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ForumViewState view = ref.watch(forumPostsProvider(forum.id));
    final ForumPostsController controller = ref.read(
      forumPostsProvider(forum.id).notifier,
    );
    final List<ForumTagResponse> tags = forumAvailableTags(forum);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FluxerPopout(
          anchorBuilder: (BuildContext context, VoidCallback toggle) {
            return FluxerButton.secondary(
              onPressed: toggle,
              icon: PhosphorIconsBold.sortAscending,
              label: l10n.forumViewOptions,
              fitContent: true,
              size: FluxerButtonSize.small,
            );
          },
          contentBuilder: (BuildContext context, VoidCallback close) {
            return Material(
              color: context.colors.backgroundFloating,
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAlias,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 220),
                child: ForumSortViewPanel(forum: forum),
              ),
            );
          },
        ),
        if (tags.isNotEmpty) ...<Widget>[
          Container(
            width: 1,
            height: 32,
            margin: EdgeInsets.symmetric(horizontal: context.layout.s3),
            color: context.colors.backgroundModifierAccent,
          ),
          Expanded(
            child: Wrap(
              spacing: context.layout.s2,
              runSpacing: context.layout.s2,
              children: <Widget>[
                for (final ForumTagResponse tag in tags)
                  ForumTagChip(
                    tag: tag,
                    selected: view.tagFilter.contains(tag.id),
                    onTap: () => controller.toggleTag(tag.id),
                  ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
