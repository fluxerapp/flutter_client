import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_tag_chip.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_toggle_switch.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

Future<void> showForumTagEditSheet(
  BuildContext context, {
  required Channel forum,
  ForumTagResponse? tag,
}) => FluxerBottomSheet.show<void>(
  context,
  title: tag == null
      ? FluxerLocalizations.of(context).forumCreateTag
      : FluxerLocalizations.of(context).forumEditTag,
  builder: (BuildContext sheetContext, VoidCallback close) =>
      _ForumTagEditor(forum: forum, tag: tag, close: close),
);

class _ForumTagEditor extends ConsumerStatefulWidget {
  const _ForumTagEditor({required this.forum, required this.close, this.tag});

  final Channel forum;
  final ForumTagResponse? tag;
  final VoidCallback close;

  @override
  ConsumerState<_ForumTagEditor> createState() => _ForumTagEditorState();
}

class _ForumTagEditorState extends ConsumerState<_ForumTagEditor> {
  late final TextEditingController _name = TextEditingController(
    text: widget.tag?.name ?? '',
  );
  late bool _moderated = widget.tag?.moderated ?? false;
  late String? _emojiId = widget.tag?.emojiId;
  late String? _emojiName = widget.tag?.emojiName;
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function(ForumRepository repo) action) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    setState(() => _busy = true);
    try {
      await action(ref.read(forumRepositoryProvider));
    } on Object catch (error) {
      if (mounted) {
        setState(() => _busy = false);
        showThreadToast(
          ref,
          threadErrorText(l10n, error),
          variant: FluxerToastVariant.danger,
        );
      }
      return;
    }
    if (mounted) {
      widget.close();
    }
  }

  ForumTagDraft get _draft => ForumTagDraft(
    name: _name.text.trim(),
    moderated: _moderated,
    emojiId: _emojiId,
    emojiName: _emojiName,
  );

  Future<void> _save() {
    final ForumTagResponse? tag = widget.tag;
    return _run(
      (ForumRepository repo) => tag == null
          ? repo.createTag(
              guildId: widget.forum.guildId,
              forumId: widget.forum.id,
              tag: _draft,
            )
          : repo.updateTag(
              guildId: widget.forum.guildId,
              forumId: widget.forum.id,
              tagId: tag.id,
              tag: _draft,
            ),
    );
  }

  Future<void> _delete(String tagId) => _run(
    (ForumRepository repo) => repo.deleteTag(
      guildId: widget.forum.guildId,
      forumId: widget.forum.id,
      tagId: tagId,
    ),
  );

  void _pickEmoji() {
    unawaited(
      FluxerEmojiPickerSheet.show(
        context,
        title: FluxerLocalizations.of(context).forumTagEmoji,
        visibleTabs: const <ExpressionPickerTab>[ExpressionPickerTab.emojis],
        onEmojiSelected: (FluxerSelectedEmoji emoji) => setState(() {
          _emojiId = emoji.emojiId;
          _emojiName = emoji.isCustom ? emoji.name : emoji.surrogates;
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final ForumTagResponse? tag = widget.tag;
    final bool hasEmoji = _emojiId != null || (_emojiName ?? '').isNotEmpty;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FluxerInput(
            label: l10n.forumTagName,
            hint: l10n.forumTagName,
            controller: _name,
            maxLength: forumTagNameMaxLength,
            autofocus: tag == null,
            onChanged: (_) => setState(() {}),
          ),
          SizedBox(height: layout.s3),
          Row(
            children: <Widget>[
              if (hasEmoji) ...<Widget>[
                ForumEmoji(emojiId: _emojiId, emojiName: _emojiName, size: 24),
                SizedBox(width: layout.s3),
              ],
              FluxerButton.secondary(
                onPressed: _busy ? null : _pickEmoji,
                label: l10n.forumTagEmoji,
                fitContent: true,
              ),
              if (hasEmoji) ...<Widget>[
                SizedBox(width: layout.s2),
                FluxerButton.ghost(
                  onPressed: _busy
                      ? null
                      : () => setState(() {
                          _emojiId = null;
                          _emojiName = null;
                        }),
                  label: l10n.forumTagRemoveEmoji,
                  fitContent: true,
                ),
              ],
            ],
          ),
          SizedBox(height: layout.s3),
          FluxerToggleSwitch(
            value: _moderated,
            label: l10n.forumTagModerated,
            description: l10n.forumTagModeratedDescription,
            onChanged: (bool value) => setState(() => _moderated = value),
          ),
          SizedBox(height: layout.s4),
          FluxerButton.primary(
            onPressed: _busy || _name.text.trim().isEmpty
                ? null
                : () => unawaited(_save()),
            isLoading: _busy,
            label: tag == null ? l10n.forumCreateTag : l10n.forumSaveTag,
          ),
          if (tag != null) ...<Widget>[
            SizedBox(height: layout.s2),
            FluxerButton.dangerSecondary(
              onPressed: _busy ? null : () => unawaited(_delete(tag.id)),
              label: l10n.forumDeleteTag,
            ),
          ],
          SizedBox(height: layout.s4),
        ],
      ),
    );
  }
}
