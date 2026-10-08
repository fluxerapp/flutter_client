import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/read_state_repository_provider.dart';
import 'package:fluxer_app/features/channels/providers/unread_provider.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/presentation/forum_post_actions.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_desktop_toolbar.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_guidelines.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_new_post_fab.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_post_card.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_tag_chip.dart';
import 'package:fluxer_app/features/forum/providers/forum_first_messages_provider.dart';
import 'package:fluxer_app/features/forum/providers/forum_post_unreads_provider.dart';
import 'package:fluxer_app/features/forum/providers/forum_posts_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:fluxer_dart/gateway.dart' show GatewayState;
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForumChannelView extends ConsumerStatefulWidget {
  const ForumChannelView({
    required this.guildId,
    required this.channelId,
    super.key,
  });

  final String guildId;
  final String channelId;

  @override
  ConsumerState<ForumChannelView> createState() => _ForumChannelViewState();
}

class _ForumChannelViewState extends ConsumerState<ForumChannelView> {
  final TextEditingController _searchController = TextEditingController();
  String? _snapshotAckId;
  bool _snapshotTaken = false;
  String _prefetchKey = '';
  StreamSubscription<GatewayState>? _gatewayStates;

  @override
  void initState() {
    super.initState();
    _gatewayStates = ref
        .read(gatewayConnectionProvider)
        .stateChanges
        .listen(_onGatewayState);
    _searchController.text = ref
        .read(forumPostsProvider(widget.channelId))
        .query;
    _searchController.addListener(_onSearchChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(_begin()));
  }

  void _onSearchChanged() {
    final String query = _searchController.text;
    if (query != ref.read(forumPostsProvider(widget.channelId)).query) {
      ref.read(forumPostsProvider(widget.channelId).notifier).setQuery(query);
    }
  }

  @override
  void didUpdateWidget(ForumChannelView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId) {
      _snapshotTaken = false;
      _snapshotAckId = null;
      _prefetchKey = '';
      _searchController.text = ref
          .read(forumPostsProvider(widget.channelId))
          .query;
      WidgetsBinding.instance.addPostFrameCallback((_) => unawaited(_begin()));
    }
  }

  void _onGatewayState(GatewayState state) {
    if (!mounted || state != GatewayState.connected) {
      return;
    }
    ref.read(forumPostUnreadsProvider.notifier).resetRequests();
    setState(() => _prefetchKey = '');
  }

  @override
  void dispose() {
    unawaited(_gatewayStates?.cancel());
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _begin() async {
    if (!mounted || !ref.read(threadsGateProvider).isActive(widget.guildId)) {
      return;
    }
    final String forumId = widget.channelId;
    ref.read(forumPostsProvider(forumId).notifier).ensureLoaded();
    ref.read(forumPostUnreadsProvider.notifier).resetRequests();
    final String? ack =
        (await ref
                .read(fluxerDatabaseProvider)
                .readStateDao
                .getReadState(forumId))
            ?.lastMessageId;
    if (!mounted || forumId != widget.channelId) {
      return;
    }
    setState(() {
      _snapshotAckId = ack;
      _snapshotTaken = true;
    });
    await ref.read(readStateRepositoryProvider).ackLatest(forumId);
  }

  void _prefetch(Channel forum, List<Channel> posts) {
    final List<String> ids = <String>[
      for (final Channel post in posts) post.id,
    ];
    final String key = ids.join(',');
    if (key.isEmpty || key == _prefetchKey) {
      return;
    }
    _prefetchKey = key;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref
          .read(forumFirstMessagesProvider.notifier)
          .request(guildId: forum.guildId, forumId: forum.id, postIds: ids);
      unawaited(
        ref
            .read(forumPostUnreadsProvider.notifier)
            .request(guildId: forum.guildId, forumId: forum.id, postIds: ids),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(threadChannelsActiveProvider(widget.guildId), (
      bool? previous,
      bool next,
    ) {
      if (next && previous != true && !_snapshotTaken) {
        unawaited(_begin());
      }
    });
    final bool active = ref.watch(threadChannelsActiveProvider(widget.guildId));
    final Channel? forum = ref
        .watch(channelByIdProvider(widget.channelId))
        .value;
    if (!active || forum == null || !forum.isThreadOnly) {
      return const SizedBox.shrink();
    }
    ref.listen<AsyncValue<UnreadState>>(channelUnreadProvider(forum.id), (
      AsyncValue<UnreadState>? previous,
      AsyncValue<UnreadState> next,
    ) {
      if (_snapshotTaken && (next.value?.hasUnread ?? false)) {
        unawaited(ref.read(readStateRepositoryProvider).ackLatest(forum.id));
      }
    });
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ForumViewState view = ref.watch(forumPostsProvider(forum.id));
    final ForumPostsController controller = ref.read(
      forumPostsProvider(forum.id).notifier,
    );
    final ForumStoredPosts storedPosts =
        ref.watch(forumStoredPostsProvider(forum.id)).value ??
        const ForumStoredPosts();
    final List<Channel> stored = storedPosts.posts;
    final Map<String, Channel> byId = <String, Channel>{
      for (final Channel post in stored) post.id: post,
    };
    final ThreadActor? actor = ref.watch(
      parentThreadActorProvider(forum.guildId, forum.id),
    );
    final bool? mayCreateForumPost = actor == null
        ? null
        : canCreateThread(actor, ThreadCreateKind.forumPost) == null;
    final bool canPost = mayCreateForumPost ?? false;
    final bool showNewPostFab = mayCreateForumPost ?? true;
    final bool canAddReactions =
        actor != null &&
        (actor.permissions & Permission.addReactions.value) != 0;
    final List<ForumTagResponse> tags = forumAvailableTags(forum);
    final ForumLayout layout = view.layout(forum);
    final ForumListKind kind = view.isSearching
        ? ForumListKind.search
        : ForumListKind.archived;
    final ForumListState list = view.list(kind);
    final ForumPostList posts = view.isSearching
        ? ForumPostList(
            pinned: null,
            active: <Channel>[
              for (final String id in list.ids)
                if (byId[id] case final Channel post) post,
            ],
            archived: const <Channel>[],
          )
        : buildForumPostList(
            forumId: forum.id,
            active: stored.where((Channel post) => !isPostArchived(post)),
            extra: <Channel>[
              for (final String id in list.ids)
                if (byId[id] case final Channel post) post,
            ],
            sortOrder: view.sortOrder(forum),
            tagIds: view.tagFilter,
            tagMatch: forumTagMatch(forum),
            lastMessageIds: storedPosts.lastMessageIds,
          );
    final List<Channel> ordered = <Channel>[
      ?posts.pinned,
      ...posts.active,
      ...posts.archived,
    ];
    _prefetch(forum, ordered);

    final bool handheldLayout = isForumHandheldLayout(context);
    final EdgeInsets contentPadding = EdgeInsets.fromLTRB(
      context.layout.s4,
      handheldLayout ? context.layout.s2 : context.layout.s4,
      context.layout.s4,
      context.layout.s2,
    );
    final Color listBackground = context.colors.backgroundPrimary;

    final Widget scrollView = NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification.metrics.extentAfter < 600) {
          controller.loadMore(kind);
        }
        return false;
      },
      child: ColoredBox(
        color: listBackground,
        child: CustomScrollView(
          slivers: <Widget>[
            if (!handheldLayout)
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 960),
                    child: Padding(
                      padding: contentPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          ForumGuidelines(forum: forum),
                          if (forum.topic?.trim().isNotEmpty ?? false)
                            SizedBox(height: context.layout.s3),
                          ForumDesktopToolbar(
                            forum: forum,
                            canPost: canPost,
                            searchController: _searchController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (handheldLayout && tags.isNotEmpty)
              SliverPersistentHeader(
                pinned: true,
                delegate: _ForumTagFilterHeaderDelegate(
                  extent: ForumTagChip.pinnedHeaderExtent(context),
                  tags: tags,
                  selectedIds: view.tagFilter,
                  backgroundColor: listBackground,
                  onToggle: controller.toggleTag,
                ),
              ),
            if (list.indexing)
              SliverToBoxAdapter(
                child: _ForumNotice(
                  icon: PhosphorIconsBold.hourglassMedium,
                  text: l10n.forumSearchIndexing,
                ),
              ),
            if (ordered.isEmpty &&
                list.loaded &&
                !list.loading &&
                !list.indexing)
              SliverFillRemaining(
                hasScrollBody: false,
                child: _ForumEmptyState(
                  searching: view.isSearching || view.tagFilter.isNotEmpty,
                ),
              )
            else if (layout == ForumLayout.gallery)
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.layout.s4,
                  vertical: context.layout.s1,
                ),
                sliver: SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: ordered.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _ForumPostItem(
                        forum: forum,
                        post: ordered[index],
                        lastMessageId:
                            storedPosts.lastMessageIds[ordered[index].id],
                        snapshotAckId: _snapshotTaken ? _snapshotAckId : null,
                        canAddReactions: canAddReactions,
                        gallery: true,
                      ),
                ),
              )
            else
              SliverList.builder(
                itemCount: ordered.length,
                itemBuilder: (BuildContext context, int index) {
                  final Channel post = ordered[index];
                  final bool firstArchived =
                      posts.archived.isNotEmpty &&
                      post.id == posts.archived.first.id;
                  final Widget item = _ForumPostItem(
                    forum: forum,
                    post: post,
                    lastMessageId: storedPosts.lastMessageIds[post.id],
                    snapshotAckId: _snapshotTaken ? _snapshotAckId : null,
                    canAddReactions: canAddReactions,
                    gallery: false,
                  );
                  if (!firstArchived || view.isSearching) {
                    return item;
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _ForumSectionHeader(text: l10n.forumOlderPosts),
                      item,
                    ],
                  );
                },
              ),
            SliverToBoxAdapter(
              child: _ForumListFooter(
                list: list,
                onRetry: () => controller.retry(kind),
              ),
            ),
            if (handheldLayout && showNewPostFab)
              SliverToBoxAdapter(child: SizedBox(height: context.layout.s10)),
          ],
        ),
      ),
    );

    if (!handheldLayout || !showNewPostFab) {
      return scrollView;
    }

    return Scaffold(
      backgroundColor: listBackground,
      extendBody: true,
      floatingActionButton: ForumNewPostFab(forum: forum),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: scrollView,
    );
  }
}

class _ForumPostItem extends ConsumerWidget {
  const _ForumPostItem({
    required this.forum,
    required this.post,
    required this.lastMessageId,
    required this.snapshotAckId,
    required this.canAddReactions,
    required this.gallery,
  });

  final Channel forum;
  final Channel post;
  final String? lastMessageId;
  final String? snapshotAckId;
  final bool canAddReactions;
  final bool gallery;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, Message?> firstMessages = ref.watch(
      forumFirstMessagesProvider,
    );
    final bool joined =
        ref.watch(threadMembershipProvider(post.id)).value != null;
    final String? postAck = ref.watch(postReadStateAckProvider(post.id)).value;
    final int unreadCount = joined
        ? 0
        : forumPostUnreadCount(
            ref.watch(forumPostUnreadsProvider),
            postId: post.id,
            currentAckMessageId: postAck,
          );
    final bool hasUnread = joined
        ? ref.watch(channelUnreadProvider(post.id)).value?.hasUnread ?? false
        : unreadCount > 0;
    final ForumPostCardData data = ForumPostCardData(
      forum: forum,
      post: post,
      lastMessageId: lastMessageId,
      firstMessageLoaded: firstMessages.containsKey(post.id),
      firstMessage: firstMessages[post.id],
      isNew: isNewForumPost(
        post: post,
        snapshotAckId: snapshotAckId,
        currentUserId: ref.watch(currentUserIdProvider),
      ),
      unreadCount: unreadCount,
      hasUnread: hasUnread,
    );
    void open() => unawaited(openForumPost(context, ref, post));
    void actions() => unawaited(
      showForumPostActionsSheet(context, ref, forum: forum, post: post),
    );
    if (gallery) {
      return ForumPostTile(data: data, onTap: open, onLongPress: actions);
    }
    final DefaultReactionEmojiResponse? reaction = forumDefaultReaction(forum);
    final Reaction? current = reaction == null || data.firstMessage == null
        ? null
        : forumDefaultReactionState(data.firstMessage!, reaction);
    final bool canReact =
        !isPostArchived(post) &&
        (canAddReactions ||
            (current?.hasReacted ?? false) ||
            (current?.count ?? 0) > 0);
    return ForumPostCard(
      data: data,
      onTap: open,
      onLongPress: actions,
      showReaction: reaction != null,
      onToggleReaction: canReact
          ? () =>
                unawaited(toggleForumDefaultReaction(context, ref, forum, data))
          : null,
    );
  }
}

class _ForumNotice extends StatelessWidget {
  const _ForumNotice({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.layout.s4,
        vertical: context.layout.s2,
      ),
      child: Row(
        children: <Widget>[
          PhosphorIcon(icon, size: 16, color: colors.textTertiary),
          SizedBox(width: context.layout.s2),
          Expanded(
            child: Text(
              text,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ForumSectionHeader extends StatelessWidget {
  const _ForumSectionHeader({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        context.layout.s4,
        context.layout.s4,
        context.layout.s4,
        context.layout.s1,
      ),
      child: Text(
        text,
        style: context.textStyles.categoryName.copyWith(
          color: context.colors.textTertiary,
        ),
      ),
    );
  }
}

class _ForumEmptyState extends StatelessWidget {
  const _ForumEmptyState({required this.searching});

  final bool searching;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.layout.s4,
          vertical: context.layout.s12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            PhosphorIcon(
              PhosphorIconsFill.chatsTeardrop,
              size: 48,
              color: colors.textTertiary,
            ),
            SizedBox(height: context.layout.s2),
            Text(
              searching ? l10n.forumNoSearchResults : l10n.forumNoPosts,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colors.textPrimary,
              ),
            ),
            SizedBox(height: context.layout.s2),
            Text(
              searching ? l10n.forumNoSearchResultsHint : l10n.forumNoPostsHint,
              textAlign: TextAlign.center,
              style: context.textStyles.bodyMedium.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ForumListFooter extends StatelessWidget {
  const _ForumListFooter({required this.list, required this.onRetry});

  final ForumListState list;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (list.loading || (!list.loaded && !list.failed)) {
      return Padding(
        padding: EdgeInsets.all(context.layout.s4),
        child: const Center(
          child: SizedBox(width: 24, height: 24, child: FluxerLoadingSpinner()),
        ),
      );
    }
    if (list.failed) {
      return Padding(
        padding: EdgeInsets.all(context.layout.s4),
        child: Column(
          children: <Widget>[
            Text(
              l10n.forumPostsLoadFailed,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textTertiary,
              ),
            ),
            SizedBox(height: context.layout.s2),
            FluxerButton.secondary(
              onPressed: onRetry,
              label: l10n.forumRetry,
              fitContent: true,
            ),
          ],
        ),
      );
    }
    return SizedBox(height: context.layout.s8);
  }
}

class _ForumTagFilterHeaderDelegate extends SliverPersistentHeaderDelegate {
  _ForumTagFilterHeaderDelegate({
    required this.extent,
    required this.tags,
    required this.selectedIds,
    required this.backgroundColor,
    required this.onToggle,
  });

  final double extent;
  final List<ForumTagResponse> tags;
  final List<String> selectedIds;
  final Color backgroundColor;
  final ValueChanged<String> onToggle;

  @override
  double get minExtent => extent;

  @override
  double get maxExtent => extent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double horizontal = context.layout.s4;
    final double gap = context.layout.s2;
    final double top = context.layout.s2;
    final double bottom = context.layout.s2;
    return SizedBox(
      height: extent,
      child: ColoredBox(
        color: backgroundColor,
        child: Padding(
          padding: EdgeInsets.fromLTRB(horizontal, top, horizontal, bottom),
          child: Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for (final (int index, ForumTagResponse tag)
                      in tags.indexed) ...<Widget>[
                    if (index > 0) SizedBox(width: gap),
                    ForumTagChip(
                      tag: tag,
                      selected: selectedIds.contains(tag.id),
                      onTap: () => onToggle(tag.id),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _ForumTagFilterHeaderDelegate oldDelegate) {
    return extent != oldDelegate.extent ||
        backgroundColor != oldDelegate.backgroundColor ||
        tags.length != oldDelegate.tags.length ||
        selectedIds.length != oldDelegate.selectedIds.length ||
        !_sameTagIds(tags, oldDelegate.tags) ||
        !_sameIds(selectedIds, oldDelegate.selectedIds);
  }

  bool _sameTagIds(List<ForumTagResponse> a, List<ForumTagResponse> b) {
    if (a.length != b.length) {
      return false;
    }
    for (int i = 0; i < a.length; i++) {
      if (a[i].id != b[i].id) {
        return false;
      }
    }
    return true;
  }

  bool _sameIds(List<String> a, List<String> b) {
    if (a.length != b.length) {
      return false;
    }
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }
}
