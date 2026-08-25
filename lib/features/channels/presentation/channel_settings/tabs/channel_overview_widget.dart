import 'dart:async';
import 'dart:math' show max;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_overview_update.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/tabs/channel_overview_mature_content_section.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_overview_voice_section.dart';
import 'package:fluxer_app/features/channels/providers/channel_settings_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_popout.dart';
import 'package:fluxer_app/features/ui/emoji_picker/fluxer_emoji_picker_sheet.dart';
import 'package:fluxer_app/features/ui/input/emoji_text_editing_controller.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_sheet.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelOverviewWidget extends ConsumerStatefulWidget {
  const ChannelOverviewWidget({
    required this.channel,
    required this.permissions,
    this.scrollController,
    super.key,
  });

  final Channel channel;
  final int permissions;
  final ScrollController? scrollController;

  @override
  ConsumerState<ChannelOverviewWidget> createState() =>
      _ChannelOverviewWidgetState();
}

class _ChannelOverviewWidgetState extends ConsumerState<ChannelOverviewWidget> {
  late ChannelOverviewFormState _original;
  late ChannelOverviewFormState _current;
  late final TextEditingController _nameController;
  late final EmojiTextEditingController _topicController;
  late final TextEditingController _urlController;
  late final TextEditingController _warningTextController;
  final FocusNode _topicFocusNode = FocusNode();
  final GlobalKey<FluxerEmojiPickerPopoutState> _topicExpressionPickerKey =
      GlobalKey<FluxerEmojiPickerPopoutState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _original = ChannelOverviewFormState.fromChannel(widget.channel);
    _current = _original;
    _nameController = TextEditingController(text: _current.name);
    _topicController = EmojiTextEditingController()
      ..loadWithTokens(_current.topic);
    _urlController = TextEditingController(text: _current.url);
    _warningTextController = TextEditingController(
      text: _current.contentWarningText,
    );
  }

  @override
  void didUpdateWidget(covariant ChannelOverviewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channel.id != widget.channel.id) {
      _resetFromChannel(widget.channel);
    } else if (oldWidget.channel != widget.channel && !_isDirty) {
      _resetFromChannel(widget.channel);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _topicController.dispose();
    _urlController.dispose();
    _warningTextController.dispose();
    _topicFocusNode.dispose();
    super.dispose();
  }

  void _resetFromChannel(Channel channel) {
    _original = ChannelOverviewFormState.fromChannel(channel);
    _current = _original;
    _nameController.text = _current.name;
    _topicController.loadWithTokens(_current.topic);
    _urlController.text = _current.url;
    _warningTextController.text = _current.contentWarningText;
    setState(() {});
  }

  void _updateTopic(String actualTopic) {
    _updateCurrent(_current.copyWith(topic: actualTopic));
  }

  void _onTopicEmojiTap() {
    if (isMobileLayout(context)) {
      final FluxerLocalizations l10n = FluxerLocalizations.of(context);
      unawaited(
        FluxerEmojiPickerSheet.show(
          context,
          title: l10n.emojiPickerTitle,
          maxHeight: 0.88,
          visibleTabs: const <ExpressionPickerTab>[ExpressionPickerTab.emojis],
          onEmojiSelected: (emoji) {
            _topicController.insertEmoji(
              emoji.name,
              emoji.surrogates,
              maxActualLength: kMaxChannelTopicLength,
            );
            _updateTopic(_topicController.actualText);
          },
        ),
      );
    } else {
      _topicExpressionPickerKey.currentState?.toggle();
    }
  }

  bool get _isDirty => _current.isDirtyComparedTo(_original);

  bool get _canManageChannel =>
      hasPermission(widget.permissions, Permission.manageChannels);

  bool get _canUpdateRtcRegion =>
      widget.channel.type == ChannelType.guildVoice &&
      hasPermission(widget.permissions, Permission.updateRtcRegion);

  void _updateCurrent(ChannelOverviewFormState next) {
    setState(() => _current = next);
  }

  Future<void> _showVoiceRegionsLoadFailedModal() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerModal.show<void>(
      context,
      title: l10n.channelSettingsVoiceRegionsLoadFailed,
      centered: true,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return Text(
          l10n.channelSettingsVoiceRegionsLoadFailedDescription,
          style: dialogContext.textStyles.bodySmall,
        );
      },
      actionsBuilder: (void Function([void]) pop) => <Widget>[
        FluxerButton.primary(onPressed: () => pop(), label: l10n.uiConfirm),
      ],
    );
  }

  Future<void> _showTopicTooLongModal() async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerModal.show<void>(
      context,
      title: l10n.channelSettingsTopicTooLongTitle,
      centered: true,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return Text(
          l10n.channelSettingsTopicTooLongMessage,
          style: dialogContext.textStyles.bodySmall,
        );
      },
      actionsBuilder: (void Function([void]) pop) => <Widget>[
        FluxerButton.primary(onPressed: () => pop(), label: l10n.uiConfirm),
      ],
    );
  }

  Future<void> _handleSave() async {
    if (_isSaving || !_isDirty) {
      return;
    }
    if (isChannelTopicTooLong(_current.topic)) {
      await _showTopicTooLongModal();
      return;
    }
    setState(() => _isSaving = true);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    try {
      await ref
          .read(channelSettingsActionsProvider(widget.channel.id).notifier)
          .updateOverview(
            channel: widget.channel,
            current: _current,
            original: _original,
            canManageChannel: _canManageChannel,
            canUpdateRtcRegion: _canUpdateRtcRegion,
          );
      if (!mounted) {
        return;
      }
      _original = _current;
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.channelSettingsChannelUpdated,
              variant: FluxerToastVariant.success,
            ),
          );
    } on Object catch (error) {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: userFacingErrorMessage(error, l10n.networkErrorMessage),
              variant: FluxerToastVariant.danger,
            ),
          );
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  void _handleReset() {
    _resetFromChannel(widget.channel);
  }

  List<FluxerSelectItem<int>> _slowmodeItems(FluxerLocalizations l10n) {
    return <FluxerSelectItem<int>>[
      FluxerSelectItem<int>(value: 0, label: l10n.channelSettingsSlowmodeOff),
      for (final int seconds in kSlowmodeOptionsSeconds.where((int s) => s > 0))
        FluxerSelectItem<int>(
          value: seconds,
          label: _slowmodeLabel(l10n, seconds),
        ),
    ];
  }

  String _slowmodeLabel(FluxerLocalizations l10n, int seconds) {
    if (seconds < 60) {
      return l10n.channelSettingsSlowmodeSeconds(seconds);
    }
    if (seconds < 3600) {
      final int minutes = seconds ~/ 60;
      if (minutes == 1) {
        return l10n.channelSettingsSlowmodeOneMinute(minutes);
      }
      return l10n.channelSettingsSlowmodeMinutes(minutes);
    }
    final int hours = seconds ~/ 3600;
    if (hours == 1) {
      return l10n.channelSettingsSlowmodeOneHour(hours);
    }
    return l10n.channelSettingsSlowmodeHours(hours);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Channel channel = widget.channel;
    final bool isCategory = channel.isCategory;
    final bool isLink = channel.type == ChannelType.guildLink;
    final bool isVoice = channel.type == ChannelType.guildVoice;
    final bool showMessaging =
        _canManageChannel && isGuildTextBasedChannelType(channel.type);
    final bool showVoice =
        isVoice && (_canManageChannel || _canUpdateRtcRegion);
    final bool showSafety =
        _canManageChannel &&
        (isGuildTextBasedChannelType(channel.type) ||
            isVoice ||
            isLink ||
            isCategory);
    if (showVoice && _canUpdateRtcRegion) {
      ref.listen(channelRtcRegionsProvider(channel.id), (
        AsyncValue<List<RtcRegionResponse>>? previous,
        AsyncValue<List<RtcRegionResponse>> next,
      ) {
        if (next.hasError && !next.isLoading) {
          unawaited(_showVoiceRegionsLoadFailedModal());
        }
      });
    }
    final AsyncValue<List<RtcRegionResponse>> rtcRegionsAsync =
        showVoice && _canUpdateRtcRegion
        ? ref.watch(channelRtcRegionsProvider(channel.id))
        : const AsyncValue<List<RtcRegionResponse>>.data(<RtcRegionResponse>[]);
    return FluxerSettingsSheet(
      hasUnsavedChanges: _isDirty,
      isSaving: _isSaving,
      onReset: _handleReset,
      onSave: _handleSave,
      child: ListView(
        controller: widget.scrollController,
        padding: EdgeInsets.fromLTRB(
          context.layout.s6,
          context.layout.s4,
          context.layout.s6,
          context.layout.s20,
        ),
        children: <Widget>[
          if (_canManageChannel) ...<Widget>[
            FluxerInput(
              label: isCategory
                  ? l10n.channelSettingsCategoryName
                  : l10n.channelSettingsChannelName,
              hint: isCategory
                  ? l10n.channelSettingsMyCategory
                  : l10n.channelSettingsChannelNamePlaceholder,
              controller: _nameController,
              maxLength: kMaxChannelNameLength,
              onChanged: (String value) {
                _updateCurrent(_current.copyWith(name: value));
              },
            ),
            if (isLink) ...<Widget>[
              SizedBox(height: context.layout.s4),
              FluxerInput(
                label: l10n.channelSettingsUrl,
                hint: l10n.channelSettingsUrlPlaceholder,
                controller: _urlController,
                onChanged: (String value) {
                  _updateCurrent(_current.copyWith(url: value));
                },
              ),
            ],
          ],
          if (showMessaging) ...<Widget>[
            SizedBox(height: context.layout.s6),
            ListenableBuilder(
              listenable: _topicController,
              builder: (BuildContext context, Widget? child) {
                final int topicDisplayMaxLength = max(
                  0,
                  _topicController.text.length +
                      kMaxChannelTopicLength -
                      _topicController.actualTextLength,
                );
                return FluxerInput.multiline(
                  label: l10n.channelSettingsTopic,
                  hint: l10n.channelSettingsTopicPlaceholder,
                  controller: _topicController,
                  focusNode: _topicFocusNode,
                  maxLines: 4,
                  maxLength: topicDisplayMaxLength,
                  showCounter: true,
                  counterLength: () => _topicController.actualTextLength,
                  counterMax: kMaxChannelTopicLength,
                  onChanged: (_) => _updateTopic(_topicController.actualText),
                  suffixSemanticLabel: l10n.channelSettingsInsertEmoji,
                  suffixIcon: FluxerEmojiPickerPopout(
                    key: _topicExpressionPickerKey,
                    visibleTabs: const <ExpressionPickerTab>[
                      ExpressionPickerTab.emojis,
                    ],
                    onEmojiSelected: (emoji) {
                      _topicController.insertEmoji(
                        emoji.name,
                        emoji.surrogates,
                        maxActualLength: kMaxChannelTopicLength,
                      );
                      _updateTopic(_topicController.actualText);
                    },
                    child: PhosphorIcon(
                      PhosphorIconsFill.smiley,
                      size: 20,
                      color: context.colors.textTertiary,
                    ),
                  ),
                  onSuffixTap: _onTopicEmojiTap,
                );
              },
            ),
            SizedBox(height: context.layout.s4),
            FluxerSelect<int>(
              label: l10n.channelSettingsSlowmode,
              description: l10n.channelSettingsSlowmodeDescription(
                permissionTitle(l10n, Permission.bypassSlowmode),
              ),
              value: _current.slowmode,
              stretch: true,
              items: _slowmodeItems(l10n),
              enableSearch: false,
              onChanged: (int value) {
                _updateCurrent(_current.copyWith(slowmode: value));
              },
            ),
          ],
          if (showVoice) ...<Widget>[
            SizedBox(height: context.layout.s6),
            ChannelOverviewVoiceSection(
              l10n: l10n,
              bitrateKbps: _current.bitrateKbps,
              userLimit: _current.userLimit,
              voiceConnectionLimit: _current.voiceConnectionLimit,
              rtcRegion: _current.rtcRegion,
              canManageChannel: _canManageChannel,
              canUpdateRtcRegion: _canUpdateRtcRegion,
              rtcRegionsAsync: rtcRegionsAsync,
              onBitrateChanged: (int value) {
                _updateCurrent(_current.copyWith(bitrateKbps: value));
              },
              onUserLimitChanged: (int value) {
                _updateCurrent(_current.copyWith(userLimit: value));
              },
              onVoiceConnectionLimitChanged: (int value) {
                _updateCurrent(_current.copyWith(voiceConnectionLimit: value));
              },
              onRtcRegionChanged: (String? value) {
                _updateCurrent(_current.copyWith(rtcRegion: value));
              },
            ),
          ],
          if (showSafety) ...<Widget>[
            SizedBox(height: context.layout.s6),
            ChannelOverviewMatureContentSection(
              channel: channel,
              guild: ref.watch(guildByIdProvider(channel.guildId)).value,
              nsfwOverride: _current.nsfwOverride,
              contentWarningLevel: _current.contentWarningLevel,
              contentWarningText: _current.contentWarningText,
              warningTextController: _warningTextController,
              onNsfwOverrideChanged: (bool? value) {
                _updateCurrent(_current.copyWith(nsfwOverride: value));
              },
              onContentWarningLevelChanged: (int value) {
                _updateCurrent(_current.copyWith(contentWarningLevel: value));
              },
              onContentWarningTextChanged: (String value) {
                _updateCurrent(_current.copyWith(contentWarningText: value));
              },
            ),
          ],
        ],
      ),
    );
  }
}
