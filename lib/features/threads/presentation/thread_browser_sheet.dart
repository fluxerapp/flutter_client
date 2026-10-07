import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/picker_search_input.dart';
import 'package:fluxer_app/features/threads/data/threads_repository.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';
import 'package:fluxer_app/features/threads/presentation/thread_menu_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_search_provider.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showThreadBrowserSheet(
  BuildContext context,
  WidgetRef hostRef,
  Channel parent,
) {
  return FluxerBottomSheet.showScrollable<void>(
    context,
    title: FluxerLocalizations.of(context).threadBrowserTitle,
    subtitle: Text(
      '#${parent.name}',
      style: context.textStyles.bodySmall.copyWith(
        color: context.colors.textSecondary,
      ),
    ),
    trailing: _CreateThreadButton(
      parent: parent,
      hostContext: context,
      hostRef: hostRef,
    ),
    builder: (sheetContext, scrollController, close) => _ThreadBrowserBody(
      parent: parent,
      hostContext: context,
      hostRef: hostRef,
      scrollController: scrollController,
      close: close,
    ),
  );
}

Future<void> showThreadBrowserForChannel(
  BuildContext context,
  WidgetRef ref,
  String channelId,
) async {
  final row = await ref
      .read(fluxerDatabaseProvider)
      .channelDao
      .getChannelById(channelId);
  if (row == null || !context.mounted) {
    return;
  }
  await showThreadBrowserSheet(context, ref, Channel.fromRow(row));
}

ThreadActorContext threadContextFor(
  ThreadActor actor,
  Channel thread, {
  required bool isMember,
  required String? currentUserId,
}) => ThreadActorContext(
  permissions: actor.permissions,
  isOwner: actor.isOwner,
  timedOut: actor.timedOut,
  thread: threadFactsOf(thread),
  isThreadOwner: currentUserId != null && thread.ownerId == currentUserId,
  isMember: isMember,
);

enum _BrowserTab { active, archived }

class _CreateThreadButton extends ConsumerWidget {
  const _CreateThreadButton({
    required this.parent,
    required this.hostContext,
    required this.hostRef,
  });

  final Channel parent;
  final BuildContext hostContext;
  final WidgetRef hostRef;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThreadActor? actor = ref.watch(
      parentThreadActorProvider(parent.guildId, parent.id),
    );
    if (!canStartThreadIn(parent, actor)) {
      return const SizedBox.shrink();
    }
    return FluxerButton.primary(
      icon: PhosphorIconsBold.plus,
      label: FluxerLocalizations.of(context).threadCreate,
      size: FluxerButtonSize.compact,
      fitContent: true,
      onPressed: () {
        Navigator.of(context).pop();
        unawaited(showCreateThreadSheet(hostContext, hostRef, parent: parent));
      },
    );
  }
}

class _ThreadBrowserBody extends ConsumerStatefulWidget {
  const _ThreadBrowserBody({
    required this.parent,
    required this.hostContext,
    required this.hostRef,
    required this.scrollController,
    required this.close,
  });

  final Channel parent;
  final BuildContext hostContext;
  final WidgetRef hostRef;
  final ScrollController scrollController;
  final VoidCallback close;

  @override
  ConsumerState<_ThreadBrowserBody> createState() => _ThreadBrowserBodyState();
}

class _ThreadBrowserBodyState extends ConsumerState<_ThreadBrowserBody> {
  _BrowserTab _tab = _BrowserTab.active;
  bool _privateArchive = false;
  final List<Channel> _archived = <Channel>[];
  bool _hasMore = true;
  bool _loading = false;
  Object? _error;
  int _generation = 0;
  final TextEditingController _searchController = TextEditingController();

  ThreadSearchParent get _searchParent =>
      (guildId: widget.parent.guildId, parentId: widget.parent.id);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(
      () => ref
          .read(threadSearchProvider(_searchParent).notifier)
          .setQuery(_searchController.text),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  ArchivedThreadScope _scope(ThreadActor? actor) {
    if (!_privateArchive) {
      return ArchivedThreadScope.public;
    }
    final bool moderator = actor != null && isThreadModeratorFor(actor);
    return moderator
        ? ArchivedThreadScope.private
        : ArchivedThreadScope.joinedPrivate;
  }

  void _resetArchive() {
    _generation++;
    _archived.clear();
    _hasMore = true;
    _error = null;
    _loading = false;
  }

  String? _cursor(ArchivedThreadScope scope) {
    if (_archived.isEmpty) {
      return null;
    }
    final Channel last = _archived.last;
    return scope == ArchivedThreadScope.joinedPrivate
        ? last.id
        : last.threadArchiveTimestamp;
  }

  Future<void> _loadMore() async {
    if (_loading || !_hasMore) {
      return;
    }
    final Channel parent = widget.parent;
    final ArchivedThreadScope scope = _scope(
      ref.read(parentThreadActorProvider(parent.guildId, parent.id)),
    );
    final int generation = _generation;
    setState(() => _loading = true);
    try {
      final ArchivedThreadsResponse response = await ref
          .read(threadsRepositoryProvider)
          .listArchived(
            guildId: parent.guildId,
            parentId: parent.id,
            scope: scope,
            before: _cursor(scope),
          );
      if (!mounted || generation != _generation) {
        return;
      }
      setState(() {
        for (final ThreadChannelResponse thread in response.threads) {
          _archived.add(threadFromResponse(thread, parent.guildId));
        }
        _hasMore = response.hasMore;
        _loading = false;
      });
    } on Object catch (error) {
      if (!mounted || generation != _generation) {
        return;
      }
      setState(() {
        _error = error;
        _loading = false;
      });
    }
  }

  Future<void> _open(Channel thread) async {
    final WidgetRef hostRef = widget.hostRef;
    final BuildContext hostContext = widget.hostContext;
    widget.close();
    final channelDao = hostRef.read(fluxerDatabaseProvider).channelDao;
    if (await channelDao.getChannelById(thread.id) == null) {
      await channelDao.upsertChannel(thread.toCompanion());
    }
    if (hostContext.mounted) {
      await openThread(hostContext, hostRef, thread);
    }
  }

  Widget _row(Channel thread, {bool joined = false}) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerListRow(
      leading: PhosphorIcon(
        thread.type == ChannelType.privateThread
            ? PhosphorIconsFill.lockSimple
            : PhosphorIconsFill.chatsCircle,
        size: 20,
        color: context.colors.textPrimaryMuted,
      ),
      title: thread.name,
      subtitle: l10n.threadMessageCount(thread.messageCount ?? 0),
      trailing: joined
          ? PhosphorIcon(
              PhosphorIconsFill.checkCircle,
              size: 16,
              color: context.colors.textPrimaryMuted,
            )
          : null,
      onTap: () => unawaited(_open(thread)),
      onLongPress: () => unawaited(
        showThreadMenuSheet(widget.hostContext, widget.hostRef, thread),
      ),
    );
  }

  Widget _empty(
    String text, {
    IconData icon = PhosphorIconsBold.chatsCircle,
    String? detail,
  }) => Padding(
    padding: EdgeInsets.all(context.layout.s6),
    child: Column(
      children: <Widget>[
        PhosphorIcon(icon, size: 48, color: context.colors.textPrimaryMuted),
        SizedBox(height: context.layout.s3),
        Text(
          text,
          textAlign: TextAlign.center,
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
        ),
        if (detail != null) ...<Widget>[
          SizedBox(height: context.layout.s1),
          Text(
            detail,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textTertiary,
            ),
          ),
        ],
      ],
    ),
  );

  Widget get _spinner => Padding(
    padding: EdgeInsets.all(context.layout.s4),
    child: const Center(child: FluxerLoadingSpinner()),
  );

  List<Widget> _searchRows(ThreadSearchState search) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    switch (search.status) {
      case ThreadSearchStatus.idle || ThreadSearchStatus.loading:
        return <Widget>[_spinner];
      case ThreadSearchStatus.indexing:
        return <Widget>[
          _empty(
            l10n.threadBrowserSearchIndexing,
            icon: PhosphorIconsBold.hourglassMedium,
          ),
        ];
      case ThreadSearchStatus.failed:
        return <Widget>[
          _empty(
            l10n.threadBrowserSearchFailed,
            icon: PhosphorIconsBold.warningCircle,
          ),
          FluxerButton.secondary(
            label: l10n.retry,
            onPressed: ref
                .read(threadSearchProvider(_searchParent).notifier)
                .retry,
          ),
        ];
      case ThreadSearchStatus.done:
        break;
    }
    if (search.threadIds.isEmpty) {
      return <Widget>[
        _empty(
          l10n.threadBrowserSearchEmpty,
          icon: PhosphorIconsBold.magnifyingGlass,
          detail: l10n.threadBrowserSearchEmptyHint,
        ),
      ];
    }
    final Channel parent = widget.parent;
    final List<Channel> threads =
        ref.watch(parentThreadsProvider(parent.guildId, parent.id)).value ??
        const <Channel>[];
    final Map<String, Channel> byId = <String, Channel>{
      for (final Channel thread in threads) thread.id: thread,
    };
    final Set<String> joined =
        ref.watch(joinedThreadIdsProvider).value ?? const <String>{};
    return <Widget>[
      FluxerListSection(
        children: <Widget>[
          for (final String id in search.threadIds)
            if (byId[id] case final Channel thread)
              _row(thread, joined: joined.contains(thread.id)),
        ],
      ),
    ];
  }

  List<Widget> _activeRows(ThreadActor? actor) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel parent = widget.parent;
    final List<Channel> threads =
        ref.watch(parentThreadsProvider(parent.guildId, parent.id)).value ??
        const <Channel>[];
    final Set<String> joined =
        ref.watch(joinedThreadIdsProvider).value ?? const <String>{};
    final String? userId = ref.watch(currentUserIdProvider);
    final List<Channel> visible = <Channel>[
      for (final Channel thread in threads.reversed)
        if (!thread.isArchivedThread &&
            actor != null &&
            canViewThread(
                  threadContextFor(
                    actor,
                    thread,
                    isMember: joined.contains(thread.id),
                    currentUserId: userId,
                  ),
                ) ==
                null)
          thread,
    ];
    if (visible.isEmpty) {
      return <Widget>[_empty(l10n.threadBrowserEmpty)];
    }
    final List<Channel> mine = <Channel>[
      for (final Channel t in visible)
        if (joined.contains(t.id)) t,
    ];
    final List<Channel> others = <Channel>[
      for (final Channel t in visible)
        if (!joined.contains(t.id)) t,
    ];
    return <Widget>[
      if (mine.isNotEmpty)
        FluxerListSection(
          header: l10n.threadBrowserJoined,
          children: <Widget>[for (final Channel t in mine) _row(t)],
        ),
      if (others.isNotEmpty)
        FluxerListSection(
          header: l10n.threadBrowserOtherActive,
          children: <Widget>[for (final Channel t in others) _row(t)],
        ),
    ];
  }

  List<Widget> _archivedRows(ThreadActor? actor) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool canPublic =
        actor != null &&
        canListArchivedThreads(actor, privateThreads: false) == null;
    if (!canPublic) {
      return <Widget>[_empty(l10n.threadBrowserArchivedEmpty)];
    }
    if (_archived.isEmpty && _hasMore && !_loading && _error == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          unawaited(_loadMore());
        }
      });
    }
    final Set<String> joined =
        ref.watch(joinedThreadIdsProvider).value ?? const <String>{};
    return <Widget>[
      if (allowsPrivateThreads(widget.parent)) ...<Widget>[
        FluxerSelect<bool>(
          value: _privateArchive,
          stretch: true,
          enableSearch: false,
          items: <FluxerSelectItem<bool>>[
            FluxerSelectItem<bool>(
              value: false,
              label: l10n.threadBrowserPublic,
              icon: PhosphorIconsBold.chatsCircle,
            ),
            FluxerSelectItem<bool>(
              value: true,
              label: l10n.threadBrowserPrivate,
              icon: PhosphorIconsBold.lockSimple,
            ),
          ],
          onChanged: (bool private) {
            if (private == _privateArchive) {
              return;
            }
            setState(() {
              _privateArchive = private;
              _resetArchive();
            });
          },
        ),
        SizedBox(height: context.layout.s3),
      ],
      if (_archived.isNotEmpty)
        FluxerListSection(
          children: <Widget>[
            for (final Channel t in _archived)
              _row(t, joined: joined.contains(t.id)),
          ],
        ),
      if (_archived.isEmpty && !_hasMore && _error == null)
        _empty(l10n.threadBrowserArchivedEmpty),
      if (_error != null)
        Padding(
          padding: EdgeInsets.all(context.layout.s4),
          child: Text(
            threadErrorText(l10n, _error!),
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textDanger,
            ),
          ),
        ),
      if (_loading)
        _spinner
      else if ((_hasMore && _archived.isNotEmpty) || _error != null)
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.layout.s4),
          child: FluxerButton.secondary(
            label: l10n.threadBrowserLoadMore,
            onPressed: () {
              setState(() => _error = null);
              unawaited(_loadMore());
            },
          ),
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel parent = widget.parent;
    final ThreadActor? actor = ref.watch(
      parentThreadActorProvider(parent.guildId, parent.id),
    );
    final ThreadSearchState search = ref.watch(
      threadSearchProvider(_searchParent),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        PickerSearchInput(
          controller: _searchController,
          hintText: l10n.threadBrowserSearch,
          horizontalPadding: context.layout.s4,
          topPadding: 0,
          bottomPadding: context.layout.s3,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: 2,
                  color: context.colors.backgroundModifierAccent,
                ),
              ),
              FluxerTabs(
                tabs: <FluxerTab>[
                  FluxerTab(label: l10n.threadBrowserActive),
                  FluxerTab(label: l10n.threadBrowserArchived),
                ],
                selectedIndex: _tab.index,
                onChanged: (int index) {
                  setState(() => _tab = _BrowserTab.values[index]);
                  ref
                      .read(threadSearchProvider(_searchParent).notifier)
                      .setArchived(archived: _tab == _BrowserTab.archived);
                },
              ),
            ],
          ),
        ),
        SizedBox(height: context.layout.s3),
        Expanded(
          child: ListView(
            controller: widget.scrollController,
            padding: FluxerBottomSheet.scrollViewPadding(
              context,
              padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
            ),
            children: search.isSearching
                ? _searchRows(search)
                : switch (_tab) {
                    _BrowserTab.active => _activeRows(actor),
                    _BrowserTab.archived => _archivedRows(actor),
                  },
          ),
        ),
      ],
    );
  }
}
