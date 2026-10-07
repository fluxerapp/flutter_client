import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

const int kDefaultVoiceConnectionLimit = 5;

class CreateChannelSheet {
  CreateChannelSheet._();

  static bool isValidUrl(String url) {
    if (url.isEmpty) {
      return false;
    }
    final Uri? uri = Uri.tryParse(url);
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

  static ChannelCreateRequest buildRequest({
    required String name,
    required int selectedType,
    required String url,
    String? parentId,
  }) {
    return switch (selectedType) {
      2 => ChannelCreateRequest2(
        name: name,
        type: GuildVoiceChannelCreateRequestTypeType.guildVoice,
        parentId: parentId,
        bitrate: 64000,
        userLimit: 0,
        voiceConnectionLimit: kDefaultVoiceConnectionLimit,
        permissionOverwrites: [],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      5 => ChannelCreateRequest5(
        name: name,
        type: GuildAnnouncementChannelCreateRequestTypeType.guildAnnouncement,
        parentId: parentId,
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      15 => ChannelCreateRequest15(
        name: name,
        type: GuildForumChannelCreateRequestTypeType.guildForum,
        parentId: parentId,
        permissionOverwrites: [],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      16 => ChannelCreateRequest16(
        name: name,
        type: GuildMediaChannelCreateRequestTypeType.guildMedia,
        parentId: parentId,
        permissionOverwrites: [],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      998 => ChannelCreateRequest998(
        name: name,
        type: GuildLinkChannelCreateRequestTypeType.guildLink,
        url: url.trim(),
        parentId: parentId,
        permissionOverwrites: [],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      _ => ChannelCreateRequest0(
        name: name,
        type: GuildTextChannelCreateRequestTypeType.guildText,
        parentId: parentId,
        permissionOverwrites: [],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
    };
  }

  static Future<ChannelCreateRequest?> show(
    BuildContext context, {
    String? parentId,
    String? guildId,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final _ChannelDraft draft = _ChannelDraft(
      threadChannelsActive: ProviderScope.containerOf(
        context,
        listen: false,
      ).read(threadsGateProvider).isActive(guildId),
    );
    final Future<ChannelCreateRequest?> result;
    if (isMobileLayout(context)) {
      result = FluxerBottomSheet.show<ChannelCreateRequest>(
        context,
        title: l10n.guildNavbarCreateChannel,
        useRootNavigator: true,
        builder: (BuildContext _, VoidCallback _) {
          return _CreateChannelForm(
            draft: draft,
            actions: _CreateChannelActions(
              draft: draft,
              parentId: parentId,
              useRootNavigator: true,
            ),
          );
        },
      );
    } else {
      result = FluxerModal.show<ChannelCreateRequest>(
        context,
        title: l10n.guildNavbarCreateChannel,
        builder: (BuildContext _, VoidCallback _) {
          return _CreateChannelForm(draft: draft);
        },
        actions: <Widget>[
          _CreateChannelActions(draft: draft, parentId: parentId),
        ],
      );
    }
    return result;
  }
}

class _ChannelDraft {
  _ChannelDraft({required this.threadChannelsActive});

  final bool threadChannelsActive;
  String name = '';
  String url = '';
  int type = ChannelType.guildText.wireValue;
  final ValueNotifier<bool> valid = ValueNotifier<bool>(false);

  void sync() {
    final bool nameOk = name.trim().isNotEmpty;
    final bool urlOk =
        !isGuildLinkChannelType(type) || CreateChannelSheet.isValidUrl(url);
    valid.value = nameOk && urlOk;
  }

  void dispose() => valid.dispose();

  ChannelCreateRequest request(String? parentId) {
    return CreateChannelSheet.buildRequest(
      name: name.trim(),
      selectedType: type,
      url: url,
      parentId: parentId,
    );
  }
}

class _CreateChannelForm extends StatefulWidget {
  const _CreateChannelForm({required this.draft, this.actions});

  final _ChannelDraft draft;
  final Widget? actions;

  @override
  State<_CreateChannelForm> createState() => _CreateChannelFormState();
}

class _CreateChannelFormState extends State<_CreateChannelForm> {
  @override
  void dispose() {
    widget.draft.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget fields = _CreateChannelFields(
      draft: widget.draft,
      onTypeChanged: (int value) {
        setState(() => widget.draft.type = value);
        widget.draft.sync();
      },
    );
    final Widget? actions = widget.actions;
    if (actions == null) {
      return fields;
    }

    final layout = context.layout;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s2),
            child: fields,
          ),
        ),
        FluxerBottomSheetFooter(child: actions),
      ],
    );
  }
}

class _CreateChannelFields extends StatelessWidget {
  const _CreateChannelFields({
    required this.draft,
    required this.onTypeChanged,
  });

  final _ChannelDraft draft;
  final ValueChanged<int> onTypeChanged;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final textStyles = context.textStyles;
    return Semantics(
      label: l10n.guildNavbarChannelTypeSelection,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: layout.s2),
            child: Text(
              l10n.guildNavbarChannelType,
              style: textStyles.label.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          FluxerRadioGroup<int>(
            value: draft.type,
            onChanged: onTypeChanged,
            items: <FluxerRadioItem<int>>[
              FluxerRadioItem<int>(
                value: ChannelType.guildText.wireValue,
                label: l10n.guildNavbarTextChannel,
                description: l10n.guildNavbarTextChannelDescription,
              ),
              FluxerRadioItem<int>(
                value: ChannelType.guildAnnouncement.wireValue,
                label: l10n.guildNavbarAnnouncementChannel,
                description: l10n.guildNavbarAnnouncementChannelDescription,
              ),
              FluxerRadioItem<int>(
                value: ChannelType.guildVoice.wireValue,
                label: l10n.guildNavbarVoiceChannel,
                description: l10n.guildNavbarVoiceChannelDescription,
              ),
              FluxerRadioItem<int>(
                value: ChannelType.guildLink.wireValue,
                label: l10n.guildNavbarLinkChannel,
                description: l10n.guildNavbarLinkChannelDescription,
              ),
              if (draft.threadChannelsActive) ...<FluxerRadioItem<int>>[
                FluxerRadioItem<int>(
                  value: ChannelType.guildForum.wireValue,
                  label: l10n.forumChannelTypeForum,
                  description: l10n.forumChannelTypeForumDescription,
                ),
                FluxerRadioItem<int>(
                  value: ChannelType.guildMedia.wireValue,
                  label: l10n.forumChannelTypeMedia,
                  description: l10n.forumChannelTypeMediaDescription,
                ),
              ],
            ],
          ),
          SizedBox(height: layout.s4),
          FluxerInput(
            label: l10n.guildNavbarNameLabel,
            hint: l10n.guildNavbarNewChannelHint,
            maxLength: 100,
            autofocus: true,
            onChanged: (String value) {
              draft.name = value;
              draft.sync();
            },
          ),
          if (isGuildLinkChannelType(draft.type)) ...<Widget>[
            SizedBox(height: layout.s4),
            FluxerInput(
              label: l10n.guildNavbarUrlLabel,
              hint: l10n.guildNavbarUrlHint,
              maxLength: 1024,
              keyboardType: TextInputType.url,
              onChanged: (String value) {
                draft.url = value;
                draft.sync();
              },
            ),
          ],
        ],
      ),
    );
  }
}

class _CreateChannelActions extends StatelessWidget {
  const _CreateChannelActions({
    required this.draft,
    required this.parentId,
    this.useRootNavigator = false,
  });

  final _ChannelDraft draft;
  final String? parentId;
  final bool useRootNavigator;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ValueListenableBuilder<bool>(
          valueListenable: draft.valid,
          builder: (BuildContext _, bool isValid, Widget? _) {
            return FluxerButton.primary(
              onPressed: isValid
                  ? () {
                      Navigator.of(
                        context,
                        rootNavigator: useRootNavigator,
                      ).pop(draft.request(parentId));
                    }
                  : null,
              label: l10n.guildNavbarCreateChannel,
            );
          },
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(
          onPressed: () =>
              Navigator.of(context, rootNavigator: useRootNavigator).pop(),
          label: l10n.cancel,
        ),
      ],
    );
  }
}
