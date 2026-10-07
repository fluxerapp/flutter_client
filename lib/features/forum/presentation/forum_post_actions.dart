import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_post_card.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_tag_chip.dart';
import 'package:fluxer_app/features/forum/providers/forum_first_messages_provider.dart';
import 'package:fluxer_app/features/threads/presentation/thread_menu_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> openForumPost(BuildContext context, WidgetRef ref, Channel post) =>
    openThread(context, ref, post);

Future<void> toggleForumDefaultReaction(
  BuildContext context,
  WidgetRef ref,
  Channel forum,
  ForumPostCardData data,
) async {
  final DefaultReactionEmojiResponse? reaction = forumDefaultReaction(forum);
  final Message? message = data.firstMessage;
  if (reaction == null || message == null) {
    return;
  }
  final Reaction? current = forumDefaultReactionState(message, reaction);
  final bool add = !(current?.hasReacted ?? false);
  final String? emojiId = reaction.emojiId;
  final String? storedName =
      emojiId != null &&
          (current?.emoji ?? '').isEmpty &&
          (reaction.emojiName ?? '').isEmpty
      ? (await ref.read(fluxerDatabaseProvider).guildEmojiDao.getById(emojiId))
            ?.name
      : null;
  if (!context.mounted) {
    return;
  }
  final String key = forumReactionKey(
    emojiId: emojiId,
    emojiName: reaction.emojiName,
    reactedName: current?.emoji,
    storedName: storedName,
  );
  final ForumFirstMessages firstMessages = ref.read(
    forumFirstMessagesProvider.notifier,
  );
  void apply({required bool value}) => firstMessages.applyOwnReaction(
    postId: data.post.id,
    emojiId: reaction.emojiId,
    emojiName: reaction.emojiName ?? '',
    add: value,
  );
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  apply(value: add);
  try {
    await ref
        .read(forumRepositoryProvider)
        .reactToPost(
          guildId: forum.guildId,
          postId: data.post.id,
          emoji: key,
          add: add,
        );
  } on Object catch (error) {
    apply(value: !add);
    showThreadToast(
      ref,
      threadErrorText(l10n, error),
      variant: FluxerToastVariant.danger,
    );
  }
}

Future<bool> updateForumPost(
  BuildContext context,
  WidgetRef ref,
  Channel post,
  Map<String, Object?> patch, {
  String? successMessage,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  try {
    await ref
        .read(forumRepositoryProvider)
        .updatePost(guildId: post.guildId, postId: post.id, patch: patch);
  } on Object catch (error) {
    showThreadToast(
      ref,
      threadErrorText(l10n, error),
      variant: FluxerToastVariant.danger,
    );
    return false;
  }
  if (successMessage != null) {
    showThreadToast(ref, successMessage);
  }
  return true;
}

Future<void> showForumPostActionsSheet(
  BuildContext context,
  WidgetRef hostRef, {
  required Channel forum,
  required Channel post,
}) => FluxerBottomSheet.show<void>(
  context,
  title: post.name,
  variant: FluxerBottomSheetVariant.menu,
  builder: (BuildContext sheetContext, VoidCallback close) => _ForumPostActions(
    hostContext: context,
    hostRef: hostRef,
    forum: forum,
    post: post,
    close: close,
  ),
);

class _ForumPostActions extends ConsumerWidget {
  const _ForumPostActions({
    required this.hostContext,
    required this.hostRef,
    required this.forum,
    required this.post,
    required this.close,
  });

  final BuildContext hostContext;
  final WidgetRef hostRef;
  final Channel forum;
  final Channel post;
  final VoidCallback close;

  void _run(Future<void> Function() action) {
    close();
    unawaited(action());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ThreadActorContext? actor = ref.watch(
      threadActorContextProvider(post.id),
    );
    final bool moderator = actor != null && isThreadModeratorFor(actor);
    final bool pinned = isPinnedPost(post);
    final bool canPin =
        moderator &&
        !isPostArchived(post) &&
        threadPatchRequirement(
              ThreadPatch(
                flags: pinned
                    ? (post.flags ?? 0) & ~channelFlagPinned
                    : (post.flags ?? 0) | channelFlagPinned,
              ),
              post.flags ?? 0,
              actor,
            ) ==
            null;
    final bool canEditTags =
        actor != null &&
        forumAvailableTags(forum).isNotEmpty &&
        canSetTags(actor, touchesModeratedTag: false) == null;
    final List<List<Widget>> threadGroups = buildThreadMenuGroups(
      context: context,
      ref: ref,
      thread: post,
      hostContext: hostContext,
      hostRef: hostRef,
      run: _run,
      includeMarkRead: false,
    );
    return FluxerBottomSheetDismissDragTarget(
      onDismiss: close,
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: FluxerBottomSheet.scrollViewPadding(
          context,
          padding: EdgeInsets.fromLTRB(
            context.layout.s4,
            0,
            context.layout.s4,
            context.layout.s2,
          ),
        ),
        children: <Widget>[
          FluxerBottomSheetGroupColumn(
            children: <Widget>[
              FluxerMenuGroup(
                children: <Widget>[
                  FluxerBottomSheetMenuItem(
                    icon: PhosphorIconsBold.arrowSquareOut,
                    label: l10n.forumOpenPost,
                    onTap: () =>
                        _run(() => openForumPost(hostContext, hostRef, post)),
                  ),
                  if (canEditTags)
                    FluxerBottomSheetMenuItem(
                      icon: PhosphorIconsBold.tag,
                      label: l10n.forumEditTags,
                      onTap: () => _run(
                        () => showForumPostTagsSheet(
                          hostContext,
                          forum: forum,
                          post: post,
                          moderator: moderator,
                        ),
                      ),
                    ),
                  if (canPin)
                    FluxerBottomSheetMenuItem(
                      icon: pinned
                          ? PhosphorIconsBold.pushPinSlash
                          : PhosphorIconsBold.pushPin,
                      label: pinned ? l10n.forumUnpinPost : l10n.forumPinPost,
                      onTap: () => _run(
                        () => updateForumPost(
                          hostContext,
                          hostRef,
                          post,
                          <String, Object?>{
                            'flags': pinned
                                ? (post.flags ?? 0) & ~channelFlagPinned
                                : (post.flags ?? 0) | channelFlagPinned,
                          },
                        ),
                      ),
                    ),
                  FluxerBottomSheetMenuItem(
                    icon: PhosphorIconsBold.checks,
                    label: l10n.forumMarkPostRead,
                    onTap: () => _run(() => markThreadRead(hostRef, post)),
                  ),
                ],
              ),
              for (final List<Widget> group in threadGroups)
                if (group.isNotEmpty) FluxerMenuGroup(children: group),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> showForumPostTagsSheet(
  BuildContext context, {
  required Channel forum,
  required Channel post,
  required bool moderator,
}) => FluxerBottomSheet.show<void>(
  context,
  title: FluxerLocalizations.of(context).forumEditTags,
  builder: (BuildContext sheetContext, VoidCallback close) =>
      _ForumPostTagsEditor(
        hostContext: context,
        forum: forum,
        post: post,
        moderator: moderator,
        close: close,
      ),
);

class _ForumPostTagsEditor extends ConsumerStatefulWidget {
  const _ForumPostTagsEditor({
    required this.hostContext,
    required this.forum,
    required this.post,
    required this.moderator,
    required this.close,
  });

  final BuildContext hostContext;
  final Channel forum;
  final Channel post;
  final bool moderator;
  final VoidCallback close;

  @override
  ConsumerState<_ForumPostTagsEditor> createState() =>
      _ForumPostTagsEditorState();
}

class _ForumPostTagsEditorState extends ConsumerState<_ForumPostTagsEditor> {
  late List<String> _selected = postAppliedTags(widget.post);
  bool _saving = false;

  Future<void> _save() async {
    setState(() => _saving = true);
    final bool ok = await updateForumPost(
      widget.hostContext,
      ref,
      widget.post,
      <String, Object?>{'applied_tags': _selected},
    );
    if (!mounted) {
      return;
    }
    setState(() => _saving = false);
    if (ok) {
      widget.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<ForumTagResponse> tags = <ForumTagResponse>[
      for (final ForumTagResponse tag in forumAvailableTags(widget.forum))
        if (widget.moderator ||
            !tag.moderated ||
            postAppliedTags(widget.post).contains(tag.id))
          tag,
    ];
    final List<String> original = postAppliedTags(widget.post);
    final bool requiresTag = forumRequiresTag(widget.forum);
    final bool changed =
        _selected.length != original.length ||
        !_selected.every(original.contains);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            l10n.forumTagsLimitHint(maxAppliedTagsPerPost),
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textTertiary,
            ),
          ),
          SizedBox(height: context.layout.s3),
          ForumTagSelector(
            tags: tags,
            selected: _selected,
            maxSelected: maxAppliedTagsPerPost,
            onToggle: (String id) => setState(() {
              _selected = _selected.contains(id)
                  ? <String>[
                      for (final String tag in _selected)
                        if (tag != id) tag,
                    ]
                  : <String>[..._selected, id];
            }),
          ),
          SizedBox(height: context.layout.s4),
          FluxerButton.primary(
            onPressed:
                changed &&
                    !_saving &&
                    (!requiresTag || _selected.isNotEmpty || widget.moderator)
                ? () => unawaited(_save())
                : null,
            isLoading: _saving,
            label: l10n.forumSaveTags,
          ),
          SizedBox(height: context.layout.s4),
        ],
      ),
    );
  }
}
