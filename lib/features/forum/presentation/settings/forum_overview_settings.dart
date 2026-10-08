import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/tabs/channel_overview_mature_content_section.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/forum/data/forum_repository.dart';
import 'package:fluxer_app/features/forum/domain/forum_channel.dart';
import 'package:fluxer_app/features/forum/domain/forum_settings.dart';
import 'package:fluxer_app/features/forum/presentation/settings/forum_tag_edit_sheet.dart';
import 'package:fluxer_app/features/forum/presentation/widgets/forum_tag_chip.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/threads/utils/thread_actions.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_selected_emoji.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/list/fluxer_list_row.dart';
import 'package:fluxer_app/features/ui/list/fluxer_list_section.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_sheet.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_toggle_switch.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForumOverviewSettings extends ConsumerStatefulWidget {
  const ForumOverviewSettings({
    required this.forum,
    required this.permissions,
    this.scrollController,
    super.key,
  });

  final Channel forum;
  final int permissions;
  final ScrollController? scrollController;

  @override
  ConsumerState<ForumOverviewSettings> createState() =>
      _ForumOverviewSettingsState();
}

class _ForumOverviewSettingsState extends ConsumerState<ForumOverviewSettings> {
  late ForumSettingsForm _original;
  late ForumSettingsForm _current;
  late final TextEditingController _nameController;
  late final TextEditingController _topicController;
  late final TextEditingController _warningTextController;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _original = ForumSettingsForm.fromChannel(widget.forum);
    _current = _original;
    _nameController = TextEditingController(text: _current.name);
    _topicController = TextEditingController(text: _current.topic);
    _warningTextController = TextEditingController(
      text: _current.contentWarningText,
    );
  }

  @override
  void didUpdateWidget(covariant ForumOverviewSettings oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.forum.id != widget.forum.id ||
        (oldWidget.forum != widget.forum && !_dirty)) {
      _reset();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _topicController.dispose();
    _warningTextController.dispose();
    super.dispose();
  }

  bool get _dirty => buildForumSettingsPatch(
    forum: widget.forum,
    original: _original,
    current: _current,
  ).isNotEmpty;

  void _reset() {
    setState(() {
      _original = ForumSettingsForm.fromChannel(widget.forum);
      _current = _original;
      _nameController.text = _current.name;
      _topicController.text = _current.topic;
      _warningTextController.text = _current.contentWarningText;
    });
  }

  void _update(ForumSettingsForm next) => setState(() => _current = next);

  Future<void> _save() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Map<String, Object?> patch = buildForumSettingsPatch(
      forum: widget.forum,
      original: _original,
      current: _current,
    );
    if (patch.isEmpty || _saving) {
      return;
    }
    setState(() => _saving = true);
    try {
      await ref
          .read(forumRepositoryProvider)
          .updateForum(
            guildId: widget.forum.guildId,
            forumId: widget.forum.id,
            patch: patch,
          );
      if (!mounted) {
        return;
      }
      _original = _current;
      showThreadToast(ref, l10n.channelSettingsChannelUpdated);
    } on Object catch (error) {
      if (mounted) {
        showThreadToast(
          ref,
          threadErrorText(l10n, error),
          variant: FluxerToastVariant.danger,
        );
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  void _pickReaction() {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    unawaited(
      FluxerEmojiPickerSheet.show(
        context,
        title: l10n.forumDefaultReaction,
        visibleTabs: const <ExpressionPickerTab>[ExpressionPickerTab.emojis],
        onEmojiSelected: (FluxerSelectedEmoji emoji) => _update(
          _current.copyWith(
            reactionEmojiId: emoji.emojiId,
            reactionEmojiName: emoji.isCustom ? emoji.name : emoji.surrogates,
          ),
        ),
      ),
    );
  }

  String _slowmodeLabel(FluxerLocalizations l10n, int seconds) {
    if (seconds == 0) {
      return l10n.channelSettingsSlowmodeOff;
    }
    if (seconds < 60) {
      return l10n.channelSettingsSlowmodeSeconds(seconds);
    }
    if (seconds < 3600) {
      final int minutes = seconds ~/ 60;
      return minutes == 1
          ? l10n.channelSettingsSlowmodeOneMinute(minutes)
          : l10n.channelSettingsSlowmodeMinutes(minutes);
    }
    final int hours = seconds ~/ 3600;
    return hours == 1
        ? l10n.channelSettingsSlowmodeOneHour(hours)
        : l10n.channelSettingsSlowmodeHours(hours);
  }

  List<FluxerSelectItem<int>> _slowmodeItems(
    FluxerLocalizations l10n,
    int current,
  ) => <FluxerSelectItem<int>>[
    for (final int seconds in <int>{
      ...kSlowmodeOptionsSeconds,
      current,
    }.toList()..sort())
      FluxerSelectItem<int>(
        value: seconds,
        label: _slowmodeLabel(l10n, seconds),
      ),
  ];

  Widget _label(String text) => Padding(
    padding: EdgeInsets.only(bottom: context.layout.s2),
    child: Text(
      text,
      style: context.textStyles.label.copyWith(
        color: context.colors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel forum = widget.forum;
    final bool media = isMediaChannel(forum);
    final layout = context.layout;
    final List<ForumTagResponse> tags = forumAvailableTags(forum);
    final bool hasReaction =
        _current.reactionEmojiId != null ||
        (_current.reactionEmojiName ?? '').isNotEmpty;
    final String bypass = permissionTitle(l10n, Permission.bypassSlowmode);
    return FluxerSettingsSheet(
      hasUnsavedChanges: _dirty,
      isSaving: _saving,
      onReset: _reset,
      onSave: () => unawaited(_save()),
      child: ListView(
        controller: widget.scrollController,
        padding: EdgeInsets.fromLTRB(
          layout.s6,
          layout.s4,
          layout.s6,
          layout.s20,
        ),
        children: <Widget>[
          FluxerInput(
            label: l10n.channelSettingsChannelName,
            hint: l10n.channelSettingsChannelNamePlaceholder,
            controller: _nameController,
            maxLength: kMaxChannelNameLength,
            onChanged: (String value) =>
                _update(_current.copyWith(name: value)),
          ),
          SizedBox(height: layout.s6),
          FluxerInput.multiline(
            label: l10n.forumPostGuidelines,
            hint: l10n.forumGuidelinesPlaceholder,
            controller: _topicController,
            maxLines: 6,
            maxLength: forumTopicMaxLength,
            showCounter: true,
            counterMax: forumTopicMaxLength,
            onChanged: (String value) =>
                _update(_current.copyWith(topic: value)),
          ),
          SizedBox(height: layout.s6),
          FluxerSelect<int>(
            label: l10n.forumPostSlowmode,
            description: l10n.forumPostSlowmodeDescription(bypass),
            value: _current.rateLimitPerUser,
            stretch: true,
            enableSearch: false,
            items: _slowmodeItems(l10n, _current.rateLimitPerUser),
            onChanged: (int value) =>
                _update(_current.copyWith(rateLimitPerUser: value)),
          ),
          SizedBox(height: layout.s4),
          FluxerSelect<int>(
            label: l10n.forumMessageSlowmode,
            description: l10n.forumMessageSlowmodeDescription,
            value: _current.defaultThreadRateLimitPerUser,
            stretch: true,
            enableSearch: false,
            items: _slowmodeItems(l10n, _current.defaultThreadRateLimitPerUser),
            onChanged: (int value) => _update(
              _current.copyWith(defaultThreadRateLimitPerUser: value),
            ),
          ),
          SizedBox(height: layout.s4),
          FluxerSelect<int>(
            label: l10n.forumDefaultAutoArchive,
            description: l10n.forumDefaultAutoArchiveDescription,
            value:
                _current.defaultAutoArchiveDuration ??
                defaultThreadAutoArchiveDuration,
            stretch: true,
            enableSearch: false,
            items: <FluxerSelectItem<int>>[
              for (final int minutes in threadAutoArchiveDurations)
                FluxerSelectItem<int>(
                  value: minutes,
                  label: threadAutoArchiveLabel(l10n, minutes),
                ),
            ],
            onChanged: (int value) =>
                _update(_current.copyWith(defaultAutoArchiveDuration: value)),
          ),
          SizedBox(height: layout.s6),
          _label(l10n.forumDefaultReaction),
          Row(
            children: <Widget>[
              if (hasReaction) ...<Widget>[
                ForumEmoji(
                  emojiId: _current.reactionEmojiId,
                  emojiName: _current.reactionEmojiName,
                  size: 24,
                ),
                SizedBox(width: layout.s3),
              ],
              FluxerButton.secondary(
                onPressed: _pickReaction,
                label: hasReaction
                    ? l10n.forumChangeDefaultReaction
                    : l10n.forumSetDefaultReaction,
                fitContent: true,
              ),
              if (hasReaction) ...<Widget>[
                SizedBox(width: layout.s2),
                FluxerButton.ghost(
                  onPressed: () => _update(
                    _current.copyWith(
                      reactionEmojiId: null,
                      reactionEmojiName: null,
                    ),
                  ),
                  label: l10n.forumRemoveDefaultReaction,
                  fitContent: true,
                ),
              ],
            ],
          ),
          SizedBox(height: layout.s6),
          FluxerSelect<int>(
            label: l10n.forumDefaultSortOrder,
            value:
                _current.sortOrder ?? ForumSortOrder.latestActivity.wireValue,
            stretch: true,
            enableSearch: false,
            items: <FluxerSelectItem<int>>[
              FluxerSelectItem<int>(
                value: ForumSortOrder.latestActivity.wireValue,
                label: l10n.forumSortLatestActivity,
              ),
              FluxerSelectItem<int>(
                value: ForumSortOrder.creationTime.wireValue,
                label: l10n.forumSortCreationTime,
              ),
            ],
            onChanged: (int value) =>
                _update(_current.copyWith(sortOrder: value)),
          ),
          if (!media) ...<Widget>[
            SizedBox(height: layout.s4),
            FluxerSelect<int>(
              label: l10n.forumDefaultLayout,
              value: _current.layout == ForumLayout.gallery.wireValue
                  ? ForumLayout.gallery.wireValue
                  : ForumLayout.list.wireValue,
              stretch: true,
              enableSearch: false,
              items: <FluxerSelectItem<int>>[
                FluxerSelectItem<int>(
                  value: ForumLayout.list.wireValue,
                  label: l10n.forumLayoutList,
                ),
                FluxerSelectItem<int>(
                  value: ForumLayout.gallery.wireValue,
                  label: l10n.forumLayoutGallery,
                ),
              ],
              onChanged: (int value) =>
                  _update(_current.copyWith(layout: value)),
            ),
          ],
          SizedBox(height: layout.s4),
          FluxerSelect<String>(
            label: l10n.forumTagMatchSetting,
            value: _current.tagMatch ?? ForumTagMatch.some.wireValue,
            stretch: true,
            enableSearch: false,
            items: <FluxerSelectItem<String>>[
              FluxerSelectItem<String>(
                value: ForumTagMatch.some.wireValue,
                label: l10n.forumTagMatchSome,
              ),
              FluxerSelectItem<String>(
                value: ForumTagMatch.all.wireValue,
                label: l10n.forumTagMatchAll,
              ),
            ],
            onChanged: (String value) =>
                _update(_current.copyWith(tagMatch: value)),
          ),
          SizedBox(height: layout.s6),
          FluxerToggleSwitch(
            value: _current.requireTag,
            label: l10n.forumRequireTag,
            description: l10n.forumRequireTagDescription,
            onChanged: (bool value) =>
                _update(_current.copyWith(requireTag: value)),
          ),
          if (media) ...<Widget>[
            SizedBox(height: layout.s4),
            FluxerToggleSwitch(
              value: _current.hideMediaDownloads,
              label: l10n.forumHideMediaDownloads,
              description: l10n.forumHideMediaDownloadsDescription,
              onChanged: (bool value) =>
                  _update(_current.copyWith(hideMediaDownloads: value)),
            ),
          ],
          SizedBox(height: layout.s6),
          _ForumTagsSection(forum: forum, tags: tags),
          SizedBox(height: layout.s6),
          ChannelOverviewMatureContentSection(
            channel: forum,
            guild: ref.watch(guildByIdProvider(forum.guildId)).value,
            nsfwOverride: _current.nsfwOverride,
            contentWarningLevel: _current.contentWarningLevel,
            contentWarningText: _current.contentWarningText,
            warningTextController: _warningTextController,
            onNsfwOverrideChanged: (bool? value) =>
                _update(_current.copyWith(nsfwOverride: value)),
            onContentWarningLevelChanged: (int value) =>
                _update(_current.copyWith(contentWarningLevel: value)),
            onContentWarningTextChanged: (String value) =>
                _update(_current.copyWith(contentWarningText: value)),
          ),
        ],
      ),
    );
  }
}

class _ForumTagsSection extends StatelessWidget {
  const _ForumTagsSection({required this.forum, required this.tags});

  final Channel forum;
  final List<ForumTagResponse> tags;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                l10n.forumTagsTitle(tags.length, maxForumTagsPerChannel),
                style: context.textStyles.label.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FluxerButton.secondary(
              onPressed: tags.length >= maxForumTagsPerChannel
                  ? null
                  : () =>
                        unawaited(showForumTagEditSheet(context, forum: forum)),
              icon: PhosphorIconsBold.plus,
              label: l10n.forumCreateTag,
              fitContent: true,
            ),
          ],
        ),
        SizedBox(height: layout.s1),
        Text(
          l10n.forumTagsDescription,
          style: context.textStyles.bodySmall.copyWith(
            color: colors.textTertiary,
          ),
        ),
        SizedBox(height: layout.s3),
        if (tags.isNotEmpty)
          FluxerListSection(
            children: <Widget>[
              for (final ForumTagResponse tag in tags)
                FluxerListRow(
                  leading: SizedBox.square(
                    dimension: 20,
                    child: Center(
                      child:
                          tag.emojiId != null ||
                              (tag.emojiName ?? '').isNotEmpty
                          ? ForumEmoji(
                              emojiId: tag.emojiId,
                              emojiName: tag.emojiName,
                              size: 20,
                            )
                          : PhosphorIcon(
                              PhosphorIconsBold.tag,
                              size: 20,
                              color: colors.textSecondary,
                            ),
                    ),
                  ),
                  title: tag.name,
                  subtitle: tag.moderated ? l10n.forumTagModeratedBadge : null,
                  trailing: PhosphorIcon(
                    PhosphorIconsBold.caretRight,
                    size: 16,
                    color: colors.textTertiary,
                  ),
                  onTap: () => unawaited(
                    showForumTagEditSheet(context, forum: forum, tag: tag),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
