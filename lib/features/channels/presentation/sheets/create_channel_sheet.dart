import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_add_override_popout.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/channel_icon.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/threads/providers/thread_guild_gate_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/features/ui/text/fluxer_field_label.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_toggle_switch.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
    List<CreateChannelOverwrite> overwrites = const <CreateChannelOverwrite>[],
  }) {
    return switch (selectedType) {
      2 => ChannelCreateRequest2(
        name: name,
        type: GuildVoiceChannelCreateRequestTypeType.guildVoice,
        parentId: parentId,
        bitrate: 64000,
        userLimit: 0,
        voiceConnectionLimit: kDefaultVoiceConnectionLimit,
        permissionOverwrites: <GuildVoiceChannelCreateRequestPermissionOverwrites>[
          for (final CreateChannelOverwrite o in overwrites)
            GuildVoiceChannelCreateRequestPermissionOverwrites(
              id: o.id,
              type:
                  GuildVoiceChannelCreateRequestPermissionOverwritesTypeType.fromJson(
                    o.type,
                  ),
              allow: o.allow,
              deny: o.deny,
            ),
        ],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      5 => ChannelCreateRequest5(
        name: name,
        type: GuildAnnouncementChannelCreateRequestTypeType.guildAnnouncement,
        parentId: parentId,
        permissionOverwrites: overwrites.isEmpty
            ? null
            : <GuildAnnouncementChannelCreateRequestPermissionOverwrites>[
                for (final CreateChannelOverwrite o in overwrites)
                  GuildAnnouncementChannelCreateRequestPermissionOverwrites(
                    id: o.id,
                    type:
                        GuildAnnouncementChannelCreateRequestPermissionOverwritesTypeType.fromJson(
                          o.type,
                        ),
                    allow: o.allow,
                    deny: o.deny,
                  ),
              ],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      15 => ChannelCreateRequest15(
        name: name,
        type: GuildForumChannelCreateRequestTypeType.guildForum,
        parentId: parentId,
        permissionOverwrites: <GuildForumChannelCreateRequestPermissionOverwrites>[
          for (final CreateChannelOverwrite o in overwrites)
            GuildForumChannelCreateRequestPermissionOverwrites(
              id: o.id,
              type:
                  GuildForumChannelCreateRequestPermissionOverwritesTypeType.fromJson(
                    o.type,
                  ),
              allow: o.allow,
              deny: o.deny,
            ),
        ],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      16 => ChannelCreateRequest16(
        name: name,
        type: GuildMediaChannelCreateRequestTypeType.guildMedia,
        parentId: parentId,
        permissionOverwrites: <GuildMediaChannelCreateRequestPermissionOverwrites>[
          for (final CreateChannelOverwrite o in overwrites)
            GuildMediaChannelCreateRequestPermissionOverwrites(
              id: o.id,
              type:
                  GuildMediaChannelCreateRequestPermissionOverwritesTypeType.fromJson(
                    o.type,
                  ),
              allow: o.allow,
              deny: o.deny,
            ),
        ],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      998 => ChannelCreateRequest998(
        name: name,
        type: GuildLinkChannelCreateRequestTypeType.guildLink,
        url: url.trim(),
        parentId: parentId,
        permissionOverwrites: <GuildLinkChannelCreateRequestPermissionOverwrites>[
          for (final CreateChannelOverwrite o in overwrites)
            GuildLinkChannelCreateRequestPermissionOverwrites(
              id: o.id,
              type:
                  GuildLinkChannelCreateRequestPermissionOverwritesTypeType.fromJson(
                    o.type,
                  ),
              allow: o.allow,
              deny: o.deny,
            ),
        ],
        contentWarningLevel: ContentWarningLevelInput.inherit,
      ),
      _ => ChannelCreateRequest0(
        name: name,
        type: GuildTextChannelCreateRequestTypeType.guildText,
        parentId: parentId,
        permissionOverwrites: <GuildTextChannelCreateRequestPermissionOverwrites>[
          for (final CreateChannelOverwrite o in overwrites)
            GuildTextChannelCreateRequestPermissionOverwrites(
              id: o.id,
              type:
                  GuildTextChannelCreateRequestPermissionOverwritesTypeType.fromJson(
                    o.type,
                  ),
              allow: o.allow,
              deny: o.deny,
            ),
        ],
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
    final ProviderContainer container = ProviderScope.containerOf(
      context,
      listen: false,
    );
    final _ChannelDraft draft = _ChannelDraft(
      guildId: guildId,
      currentUserId: container.read(currentUserIdProvider),
      threadChannelsActive: container
          .read(threadsGateProvider)
          .isActive(guildId),
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

typedef CreateChannelOverwrite = ({
  String id,
  int type,
  String? allow,
  String? deny,
});

class _ChannelDraft extends ChangeNotifier {
  _ChannelDraft({
    required this.guildId,
    required this.currentUserId,
    required this.threadChannelsActive,
  });

  final String? guildId;
  final String? currentUserId;
  final bool threadChannelsActive;
  String _name = '';
  String _url = '';
  int _type = ChannelType.guildText.wireValue;
  bool _isPrivate = false;
  final Map<String, int> _access = <String, int>{};

  String get name => _name;
  String get url => _url;
  int get type => _type;
  bool get isPrivate => _isPrivate;
  bool get canBePrivate => guildId != null;
  Set<String> get accessIds => _access.keys.toSet();
  bool get hasAccess => _access.isNotEmpty;

  bool get valid {
    final bool nameOk = _name.trim().isNotEmpty;
    final bool urlOk =
        !isGuildLinkChannelType(_type) || CreateChannelSheet.isValidUrl(_url);
    return nameOk && urlOk;
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  set url(String value) {
    _url = value;
    notifyListeners();
  }

  set type(int value) {
    _type = value;
    notifyListeners();
  }

  set isPrivate(bool value) {
    _isPrivate = value;
    notifyListeners();
  }

  void toggleAccess(String id, int overwriteType) {
    if (_access.remove(id) == null) {
      _access[id] = overwriteType;
    }
    notifyListeners();
  }

  List<CreateChannelOverwrite> get _overwrites {
    final String? everyoneId = guildId;
    if (!_isPrivate || everyoneId == null) {
      return const <CreateChannelOverwrite>[];
    }
    final String view = Permission.viewChannel.value.toString();
    final Map<String, int> viewers = <String, int>{
      ..._access,
      if (currentUserId case final String selfId) selfId: 1,
    };
    return <CreateChannelOverwrite>[
      (id: everyoneId, type: 0, allow: null, deny: view),
      for (final MapEntry<String, int>(:String key, :int value)
          in viewers.entries)
        (id: key, type: value, allow: view, deny: null),
    ];
  }

  ChannelCreateRequest request(String? parentId) {
    return CreateChannelSheet.buildRequest(
      name: _name.trim(),
      selectedType: _type,
      url: _url,
      parentId: parentId,
      overwrites: _overwrites,
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
    final Widget fields = ListenableBuilder(
      listenable: widget.draft,
      builder: (BuildContext _, Widget? _) =>
          _CreateChannelFields(draft: widget.draft),
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
  const _CreateChannelFields({required this.draft});

  final _ChannelDraft draft;

  FluxerRadioItem<int> _typeItem(
    BuildContext context,
    ChannelType type,
    String label,
    String description,
  ) {
    final bool selected = draft.type == type.wireValue;
    return FluxerRadioItem<int>(
      value: type.wireValue,
      label: label,
      description: description,
      leading: Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colors.backgroundTertiary,
          borderRadius: context.layout.radiusLg,
        ),
        child: ChannelIcon(
          type: type,
          color: selected
              ? context.colors.textPrimary
              : context.colors.textSecondary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final ChannelType selectedType = ChannelType.fromWire(draft.type);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FluxerFieldLabel(l10n.guildNavbarChannelType),
        SizedBox(height: layout.s2),
        Semantics(
          label: l10n.guildNavbarChannelTypeSelection,
          child: _FieldCard(
            child: FluxerRadioGroup<int>(
              value: draft.type,
              itemSpacing: layout.s2,
              onChanged: (int value) => draft.type = value,
              items: <FluxerRadioItem<int>>[
                _typeItem(
                  context,
                  ChannelType.guildText,
                  l10n.guildNavbarTextChannel,
                  l10n.guildNavbarTextChannelDescription,
                ),
                _typeItem(
                  context,
                  ChannelType.guildVoice,
                  l10n.guildNavbarVoiceChannel,
                  l10n.guildNavbarVoiceChannelDescription,
                ),
                _typeItem(
                  context,
                  ChannelType.guildAnnouncement,
                  l10n.guildNavbarAnnouncementChannel,
                  l10n.guildNavbarAnnouncementChannelDescription,
                ),
                if (draft.threadChannelsActive) ...<FluxerRadioItem<int>>[
                  _typeItem(
                    context,
                    ChannelType.guildForum,
                    l10n.forumChannelTypeForum,
                    l10n.forumChannelTypeForumDescription,
                  ),
                  _typeItem(
                    context,
                    ChannelType.guildMedia,
                    l10n.forumChannelTypeMedia,
                    l10n.forumChannelTypeMediaDescription,
                  ),
                ],
                _typeItem(
                  context,
                  ChannelType.guildLink,
                  l10n.guildNavbarLinkChannel,
                  l10n.guildNavbarLinkChannelDescription,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: layout.s4),
        FluxerInput(
          label: l10n.channelSettingsChannelName,
          hint: l10n.guildNavbarNewChannelHint,
          prefixIcon: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: ChannelIcon(type: selectedType, size: 18),
          ),
          maxLength: 100,
          autofocus: true,
          onChanged: (String value) => draft.name = value,
        ),
        if (isGuildLinkChannelType(draft.type)) ...<Widget>[
          SizedBox(height: layout.s4),
          FluxerInput(
            label: l10n.guildNavbarUrlLabel,
            hint: l10n.guildNavbarUrlHint,
            maxLength: 1024,
            keyboardType: TextInputType.url,
            onChanged: (String value) => draft.url = value,
          ),
        ],
        if (draft.canBePrivate) ...<Widget>[
          SizedBox(height: layout.s4),
          _FieldCard(
            child: FluxerToggleSwitch(
              value: draft.isPrivate,
              onChanged: (bool value) => draft.isPrivate = value,
              icon: PhosphorIconsBold.lock,
              label: l10n.guildNavbarPrivateChannel,
              description: l10n.guildNavbarPrivateChannelDescription,
            ),
          ),
        ],
      ],
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

  Future<void> _chooseAccess(BuildContext context) async {
    final bool? create = await _ChannelAccessStep.show(
      context,
      draft: draft,
      useRootNavigator: useRootNavigator,
    );
    if ((create ?? false) && context.mounted) {
      Navigator.of(
        context,
        rootNavigator: useRootNavigator,
      ).pop(draft.request(parentId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ListenableBuilder(
      listenable: draft,
      builder: (BuildContext _, Widget? _) {
        final bool isPrivate = draft.isPrivate;
        return _FooterRow(
          secondary: FluxerButton.secondary(
            onPressed: () =>
                Navigator.of(context, rootNavigator: useRootNavigator).pop(),
            label: l10n.cancel,
          ),
          primary: FluxerButton.primary(
            onPressed: !draft.valid
                ? null
                : isPrivate
                ? () => unawaited(_chooseAccess(context))
                : () => Navigator.of(
                    context,
                    rootNavigator: useRootNavigator,
                  ).pop(draft.request(parentId)),
            label: isPrivate ? l10n.next : l10n.guildNavbarCreateChannel,
          ),
        );
      },
    );
  }
}

class _ChannelAccessStep {
  _ChannelAccessStep._();

  static Future<bool?> show(
    BuildContext context, {
    required _ChannelDraft draft,
    required bool useRootNavigator,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    if (isMobileLayout(context)) {
      return FluxerBottomSheet.showScrollable<bool>(
        context,
        title: l10n.guildNavbarAddMembersOrRoles,
        useRootNavigator: true,
        builder:
            (
              BuildContext sheetContext,
              ScrollController scrollController,
              VoidCallback close,
            ) {
              return _ChannelAccessPicker(
                draft: draft,
                onClose: close,
                scrollController: scrollController,
                footer: FluxerBottomSheetFooter(
                  child: _ChannelAccessActions(
                    draft: draft,
                    useRootNavigator: true,
                  ),
                ),
              );
            },
      );
    }
    return FluxerModal.show<bool>(
      context,
      title: l10n.guildNavbarAddMembersOrRoles,
      builder: (BuildContext _, VoidCallback close) {
        return SizedBox(
          height: 360,
          child: _ChannelAccessPicker(draft: draft, onClose: close),
        );
      },
      actions: <Widget>[_ChannelAccessActions(draft: draft)],
    );
  }
}

class _ChannelAccessPicker extends ConsumerWidget {
  const _ChannelAccessPicker({
    required this.draft,
    required this.onClose,
    this.scrollController,
    this.footer,
  });

  final _ChannelDraft draft;
  final VoidCallback onClose;
  final ScrollController? scrollController;
  final Widget? footer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String guildId = draft.guildId!;
    final Map<String, db.Role> rolesById =
        ref.watch(guildRolesByIdProvider(guildId)).value ??
        const <String, db.Role>{};
    return ListenableBuilder(
      listenable: draft,
      builder: (BuildContext context, Widget? _) {
        return ChannelAddOverridePickerContent(
          guildId: guildId,
          rolesById: rolesById,
          existingOverwriteIds: const <String>{},
          selectedIds: draft.accessIds,
          searchHint: FluxerLocalizations.of(
            context,
          ).guildNavbarAddMembersOrRolesHint,
          scrollController: scrollController,
          isBottomSheet: true,
          footer: footer,
          onSelect: (String id, int type, String _) =>
              draft.toggleAccess(id, type),
          onClose: onClose,
        );
      },
    );
  }
}

class _ChannelAccessActions extends StatelessWidget {
  const _ChannelAccessActions({
    required this.draft,
    this.useRootNavigator = false,
  });

  final _ChannelDraft draft;
  final bool useRootNavigator;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ListenableBuilder(
      listenable: draft,
      builder: (BuildContext _, Widget? _) {
        return _FooterRow(
          secondary: FluxerButton.secondary(
            onPressed: () =>
                Navigator.of(context, rootNavigator: useRootNavigator).pop(),
            label: l10n.back,
          ),
          primary: FluxerButton.primary(
            onPressed: () => Navigator.of(
              context,
              rootNavigator: useRootNavigator,
            ).pop(true),
            label: draft.hasAccess ? l10n.guildNavbarCreateChannel : l10n.skip,
          ),
        );
      },
    );
  }
}

class _FieldCard extends StatelessWidget {
  const _FieldCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondaryAlt,
        borderRadius: layout.radiusXl,
      ),
      child: Padding(padding: EdgeInsets.all(layout.s3), child: child),
    );
  }
}

class _FooterRow extends StatelessWidget {
  const _FooterRow({required this.secondary, required this.primary});

  final Widget secondary;
  final Widget primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: secondary),
        SizedBox(width: context.layout.s2),
        Expanded(child: primary),
      ],
    );
  }
}
