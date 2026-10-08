import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/thread_permissions.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/utils/navigate_to_channel_content.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/attachments/attachment_native_pickers.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_upload_file.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_tag_chip.dart';
import 'package:fluxer_app/features/forum/providers/forum_first_messages_provider.dart';
import 'package:fluxer_app/features/threads/presentation/create_thread_sheet.dart';
import 'package:fluxer_app/features/threads/providers/thread_ui_providers.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:phosphor_flutter/phosphor_flutter.dart';

Future<void> showForumPostComposerSheet(
  BuildContext context,
  WidgetRef hostRef, {
  required Channel forum,
}) => FluxerBottomSheet.show<void>(
  context,
  title: isMediaChannel(forum)
      ? FluxerLocalizations.of(context).forumNewMediaPost
      : FluxerLocalizations.of(context).forumNewPost,
  builder: (BuildContext sheetContext, VoidCallback close) =>
      _ForumPostComposer(
        hostContext: context,
        hostRef: hostRef,
        forum: forum,
        close: close,
      ),
);

String? forumPostDraftError({
  required Channel forum,
  required String title,
  required String content,
  required List<String> tags,
  required int attachmentCount,
  required bool moderator,
  required FluxerLocalizations l10n,
}) {
  if (title.trim().isEmpty) {
    return l10n.forumPostTitleRequired;
  }
  final List<ForumTagResponse> available = forumAvailableTags(forum);
  if (forumRequiresTag(forum) && available.isNotEmpty && tags.isEmpty) {
    return moderator || available.any((ForumTagResponse tag) => !tag.moderated)
        ? l10n.threadErrorTagRequired
        : l10n.threadErrorNoTagsForEveryone;
  }
  if (isMediaChannel(forum) && attachmentCount == 0) {
    return l10n.forumPostMediaRequired;
  }
  if (content.trim().isEmpty && attachmentCount == 0) {
    return l10n.forumPostContentRequired;
  }
  return null;
}

class _ForumPostComposer extends ConsumerStatefulWidget {
  const _ForumPostComposer({
    required this.hostContext,
    required this.hostRef,
    required this.forum,
    required this.close,
  });

  final BuildContext hostContext;
  final WidgetRef hostRef;
  final Channel forum;
  final VoidCallback close;

  @override
  ConsumerState<_ForumPostComposer> createState() => _ForumPostComposerState();
}

class _ForumPostComposerState extends ConsumerState<_ForumPostComposer> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();
  List<String> _tags = const <String>[];
  List<ComposerUploadFile> _files = const <ComposerUploadFile>[];
  String? _error;
  bool _submitting = false;
  Timer? _cooldownTicker;

  @override
  void initState() {
    super.initState();
    _cooldownTicker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _cooldownTicker?.cancel();
    _title.dispose();
    _content.dispose();
    super.dispose();
  }

  Future<void> _pick(Future<List<ComposerUploadFile>> Function() picker) async {
    final List<ComposerUploadFile> picked = await picker();
    if (!mounted || picked.isEmpty) {
      return;
    }
    setState(() {
      _files = <ComposerUploadFile>[
        ..._files,
        ...picked,
      ].take(kMaxAttachmentsPerMessage).toList(growable: false);
      _error = null;
    });
  }

  Future<void> _submit() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ThreadActor? actor = ref.read(
      parentThreadActorProvider(widget.forum.guildId, widget.forum.id),
    );
    final String? error = forumPostDraftError(
      forum: widget.forum,
      title: _title.text,
      content: _content.text,
      tags: _tags,
      attachmentCount: _files.length,
      moderator: actor != null && isThreadModeratorFor(actor),
      l10n: l10n,
    );
    if (error != null) {
      setState(() => _error = error);
      return;
    }
    setState(() {
      _submitting = true;
      _error = null;
    });
    final Channel forum = widget.forum;
    final String postId;
    try {
      final ({String postId, Message? firstMessage}) result = await ref
          .read(forumRepositoryProvider)
          .createPost(
            guildId: forum.guildId,
            forumId: forum.id,
            draft: ForumPostDraft(
              name: _title.text,
              content: _content.text,
              appliedTags: _tags,
              files: _files,
              autoArchiveDuration: forum.defaultAutoArchiveDuration,
            ),
          );
      postId = result.postId;
      final Message? firstMessage = result.firstMessage;
      if (firstMessage != null) {
        ref.read(forumFirstMessagesProvider.notifier).put(firstMessage);
      }
    } on Object catch (failure) {
      if (!mounted) {
        return;
      }
      setState(() {
        _submitting = false;
        _error = threadErrorText(l10n, failure);
      });
      return;
    }
    ref
        .read(threadCreateCooldownsProvider.notifier)
        .start(forum.id, forum.rateLimitPerUser);
    if (!mounted || !widget.hostContext.mounted) {
      return;
    }
    final BuildContext hostContext = widget.hostContext;
    final WidgetRef hostRef = widget.hostRef;
    widget.close();
    await navigateToChannelContent(
      context: hostContext,
      ref: hostRef,
      guildId: forum.guildId,
      channelId: postId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel forum = widget.forum;
    final ThreadActor? actor = ref.watch(
      parentThreadActorProvider(forum.guildId, forum.id),
    );
    ref.watch(threadCreateCooldownsProvider);
    final int cooldown = actor == null || bypassesThreadCreateCooldown(actor)
        ? 0
        : ref
              .read(threadCreateCooldownsProvider.notifier)
              .remainingSeconds(forum.id);
    final bool moderator = actor != null && isThreadModeratorFor(actor);
    final List<ForumTagResponse> tags = <ForumTagResponse>[
      for (final ForumTagResponse tag in forumAvailableTags(forum))
        if (moderator || !tag.moderated) tag,
    ];
    final String guidelines = forum.topic?.trim() ?? '';
    final layout = context.layout;
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (guidelines.isNotEmpty) ...<Widget>[
              Container(
                padding: EdgeInsets.all(layout.s3),
                decoration: BoxDecoration(
                  color: colors.backgroundSecondaryAlt,
                  borderRadius: layout.radiusXl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      l10n.forumPostGuidelines,
                      style: context.textStyles.label.copyWith(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: layout.s1),
                    Text(
                      guidelines,
                      style: context.textStyles.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: layout.s3),
            ],
            FluxerInput(
              label: l10n.forumPostTitle,
              hint: l10n.forumPostTitle,
              controller: _title,
              maxLength: forumPostNameMaxLength,
              autofocus: true,
              onChanged: (_) => setState(() => _error = null),
            ),
            SizedBox(height: layout.s3),
            FluxerInput.multiline(
              label: l10n.forumPostMessage,
              hint: isMediaChannel(forum)
                  ? l10n.forumPostMediaPlaceholder
                  : l10n.forumPostMessagePlaceholder,
              controller: _content,
              onChanged: (_) => setState(() => _error = null),
            ),
            if (tags.isNotEmpty) ...<Widget>[
              SizedBox(height: layout.s3),
              Text(
                forumRequiresTag(forum)
                    ? l10n.forumPostTagsRequired
                    : l10n.forumPostTags,
                style: context.textStyles.label.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: layout.s2),
              ForumTagSelector(
                tags: tags,
                selected: _tags,
                maxSelected: maxAppliedTagsPerPost,
                onToggle: (String id) => setState(() {
                  _error = null;
                  _tags = _tags.contains(id)
                      ? <String>[
                          for (final String tag in _tags)
                            if (tag != id) tag,
                        ]
                      : <String>[..._tags, id];
                }),
              ),
            ],
            SizedBox(height: layout.s3),
            Wrap(
              spacing: layout.s2,
              runSpacing: layout.s2,
              children: <Widget>[
                FluxerButton.secondary(
                  onPressed: _submitting
                      ? null
                      : () => unawaited(_pick(pickNativeGalleryUploads)),
                  icon: PhosphorIconsBold.image,
                  label: l10n.forumPostAddMedia,
                  fitContent: true,
                ),
                if (!isMediaChannel(forum))
                  FluxerButton.secondary(
                    onPressed: _submitting
                        ? null
                        : () => unawaited(_pick(pickNativeFileUploads)),
                    icon: PhosphorIconsBold.paperclip,
                    label: l10n.forumPostAddFile,
                    fitContent: true,
                  ),
              ],
            ),
            for (int i = 0; i < _files.length; i++)
              Padding(
                padding: EdgeInsets.only(top: layout.s2),
                child: Row(
                  children: <Widget>[
                    PhosphorIcon(
                      PhosphorIconsBold.file,
                      size: 16,
                      color: colors.textTertiary,
                    ),
                    SizedBox(width: layout.s2),
                    Expanded(
                      child: Text(
                        _files[i].displayFilename ?? _files[i].file.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.bodySmall,
                      ),
                    ),
                    FluxerButton.ghost(
                      onPressed: _submitting
                          ? null
                          : () => setState(() {
                              _files = <ComposerUploadFile>[
                                for (int j = 0; j < _files.length; j++)
                                  if (j != i) _files[j],
                              ];
                            }),
                      icon: PhosphorIconsBold.x,
                      isSquare: true,
                      semanticLabel: l10n.forumPostRemoveAttachment,
                    ),
                  ],
                ),
              ),
            if (_error != null) ...<Widget>[
              SizedBox(height: layout.s3),
              Text(
                _error!,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textDanger,
                ),
              ),
            ],
            if (cooldown > 0) ...<Widget>[
              SizedBox(height: layout.s3),
              Text(
                l10n.forumPostCooldown(cooldown),
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textWarning,
                ),
              ),
            ],
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              onPressed: _submitting || cooldown > 0
                  ? null
                  : () => unawaited(_submit()),
              isLoading: _submitting,
              label: l10n.forumPostSubmit,
            ),
            SizedBox(height: layout.s4),
          ],
        ),
      ),
    );
  }
}
