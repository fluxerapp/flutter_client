import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_parent_sync.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_permission_editor_panel.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_permissions_overrides_view.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_settings_providers.dart';
import 'package:fluxer_app/features/members/data/member_repository.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_sheet.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class ChannelPermissionsSettingsWidget extends ConsumerStatefulWidget {
  const ChannelPermissionsSettingsWidget({
    required this.channel,
    required this.permissions,
    this.scrollController,
    super.key,
  });

  final Channel channel;
  final int permissions;
  final ScrollController? scrollController;

  @override
  ConsumerState<ChannelPermissionsSettingsWidget> createState() =>
      _ChannelPermissionsSettingsWidgetState();
}

class _ChannelPermissionsSettingsWidgetState
    extends ConsumerState<ChannelPermissionsSettingsWidget> {
  List<ChannelPermissionOverwriteEntry> _originalEntries =
      const <ChannelPermissionOverwriteEntry>[];
  List<ChannelPermissionOverwriteEntry> _entries =
      const <ChannelPermissionOverwriteEntry>[];
  Map<String, String> _memberDisplayNames = const <String, String>{};
  String? _selectedId;
  bool _mobileShowEditor = false;
  bool _isSaving = false;
  bool _isSyncing = false;
  String? _loadedChannelId;

  bool get _canManageChannels =>
      hasPermission(widget.permissions, Permission.manageChannels);

  bool get _canManageRoles =>
      hasPermission(widget.permissions, Permission.manageRoles);

  bool get _canEdit => _canManageChannels && _canManageRoles;

  bool get _isDirty => !_entriesEqual(_entries, _originalEntries);

  @override
  void didUpdateWidget(covariant ChannelPermissionsSettingsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channel.id != widget.channel.id) {
      _loadedChannelId = null;
      _memberDisplayNames = const <String, String>{};
      _mobileShowEditor = false;
    } else if (oldWidget.channel != widget.channel && !_isDirty) {
      _loadedChannelId = null;
    }
  }

  bool _entriesEqual(
    List<ChannelPermissionOverwriteEntry> a,
    List<ChannelPermissionOverwriteEntry> b,
  ) {
    if (a.length != b.length) {
      return false;
    }
    for (int i = 0; i < a.length; i++) {
      if (a[i].id != b[i].id ||
          a[i].allow != b[i].allow ||
          a[i].deny != b[i].deny) {
        return false;
      }
    }
    return true;
  }

  void _initializeEntries({
    required Map<String, db.Role> rolesById,
    required FluxerLocalizations l10n,
    required bool preserveDirtyState,
  }) {
    final List<ChannelPermissionOverwriteEntry> nextOriginal =
        buildOrderedChannelPermissionOverwriteEntries(
          guildId: widget.channel.guildId,
          permissionOverwritesJson: widget.channel.permissionOverwritesJson,
          rolesById: rolesById,
          memberDisplayNames: _memberDisplayNames,
          l10n: l10n,
        );
    if (_loadedChannelId == widget.channel.id && preserveDirtyState) {
      final Map<String, ChannelPermissionOverwriteEntry> currentById =
          <String, ChannelPermissionOverwriteEntry>{
            for (final ChannelPermissionOverwriteEntry entry in _entries)
              entry.id: entry,
          };
      final List<ChannelPermissionOverwriteEntry> nextEntries = nextOriginal
          .map(
            (ChannelPermissionOverwriteEntry entry) =>
                currentById[entry.id]?.copyWith(
                  label: entry.label,
                  isEveryone: entry.isEveryone,
                ) ??
                entry,
          )
          .toList();
      setState(() {
        _originalEntries = nextOriginal;
        _entries = nextEntries;
        _selectedId ??= nextEntries.isNotEmpty ? nextEntries.first.id : null;
      });
      return;
    }
    setState(() {
      _loadedChannelId = widget.channel.id;
      _originalEntries = nextOriginal;
      _entries = List<ChannelPermissionOverwriteEntry>.from(nextOriginal);
      _selectedId = nextOriginal.isNotEmpty ? nextOriginal.first.id : null;
    });
    unawaited(_loadMemberDisplayNames());
  }

  Future<void> _loadMemberDisplayNames() async {
    final List<String> memberIds = _entries
        .where((ChannelPermissionOverwriteEntry entry) => entry.type == 1)
        .map((ChannelPermissionOverwriteEntry entry) => entry.id)
        .toList();
    if (memberIds.isEmpty) {
      return;
    }
    final MemberRepository repository = ref.read(memberRepositoryProvider);
    final List<Member> members = await repository.getMembersByUserIds(
      widget.channel.guildId,
      memberIds,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _memberDisplayNames = <String, String>{
        for (final Member member in members) member.id: member.displayName,
      };
    });
    final AsyncValue<Map<String, db.Role>> rolesAsync = ref.read(
      guildRolesByIdProvider(widget.channel.guildId),
    );
    final Map<String, db.Role>? rolesById = rolesAsync.value;
    if (rolesById == null) {
      return;
    }
    _initializeEntries(
      rolesById: rolesById,
      l10n: FluxerLocalizations.of(context),
      preserveDirtyState: true,
    );
  }

  Future<void> _handleSave() async {
    if (!_canEdit || !_isDirty || _isSaving) {
      return;
    }
    setState(() => _isSaving = true);
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<ChannelPermissionOverwriteEntry> overwritesToSave = _entries
        .where(
          (ChannelPermissionOverwriteEntry entry) =>
              !(entry.isEveryone &&
                  entry.allow == BigInt.zero &&
                  entry.deny == BigInt.zero),
        )
        .toList();
    try {
      await ref
          .read(channelSettingsActionsProvider(widget.channel.id).notifier)
          .updatePermissionOverwrites(
            channel: widget.channel,
            overwrites: overwritesToSave,
          );
      if (!mounted) {
        return;
      }
      _originalEntries = List<ChannelPermissionOverwriteEntry>.from(_entries);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.channelSettingsPermissionsChannelAccessUpdated,
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
              message: error.toString(),
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
    setState(() {
      _entries = List<ChannelPermissionOverwriteEntry>.from(_originalEntries);
      _selectedId = _entries.isNotEmpty ? _entries.first.id : null;
      _mobileShowEditor = false;
    });
  }

  ChannelPermissionOverwriteEntry? get _selectedEntry {
    if (_selectedId == null) {
      return null;
    }
    for (final ChannelPermissionOverwriteEntry entry in _entries) {
      if (entry.id == _selectedId) {
        return entry;
      }
    }
    return null;
  }

  Future<void> _handleSyncWithParent({
    required Channel parentChannel,
    required FluxerLocalizations l10n,
  }) async {
    if (!_canEdit || _isSyncing) {
      return;
    }
    setState(() => _isSyncing = true);
    try {
      final List<ChannelPermissionOverwriteEntry> parentOverwrites =
          parseChannelPermissionOverwriteEntries(
            parentChannel.permissionOverwritesJson,
          );
      await ref
          .read(channelSettingsActionsProvider(widget.channel.id).notifier)
          .updatePermissionOverwrites(
            channel: widget.channel,
            overwrites: parentOverwrites,
          );
      if (!mounted) {
        return;
      }
      final AsyncValue<Map<String, db.Role>> rolesAsync = ref.read(
        guildRolesByIdProvider(widget.channel.guildId),
      );
      final Map<String, db.Role>? rolesById = rolesAsync.value;
      if (rolesById != null) {
        final List<ChannelPermissionOverwriteEntry> syncedEntries =
            buildOrderedChannelPermissionOverwriteEntries(
              guildId: widget.channel.guildId,
              permissionOverwritesJson: parentChannel.permissionOverwritesJson,
              rolesById: rolesById,
              memberDisplayNames: _memberDisplayNames,
              l10n: l10n,
            );
        setState(() {
          _loadedChannelId = widget.channel.id;
          _originalEntries = syncedEntries;
          _entries = List<ChannelPermissionOverwriteEntry>.from(syncedEntries);
          _selectedId = syncedEntries.isNotEmpty
              ? syncedEntries.first.id
              : null;
        });
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.channelSettingsPermissionsSyncedWithParentToast,
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
              message: error.toString(),
              variant: FluxerToastVariant.danger,
            ),
          );
    } finally {
      if (mounted) {
        setState(() => _isSyncing = false);
      }
    }
  }

  void _handleAddOverride({
    required String id,
    required int type,
    required String name,
    required Map<String, db.Role> rolesById,
    required bool isMobile,
  }) {
    if (!_canEdit) {
      return;
    }
    final ChannelPermissionOverwriteEntry newEntry =
        ChannelPermissionOverwriteEntry(
          id: id,
          type: type,
          allow: BigInt.zero,
          deny: BigInt.zero,
          label: name,
        );
    setState(() {
      _entries = insertChannelPermissionOverwriteEntry(
        entries: _entries,
        newEntry: newEntry,
        rolesById: rolesById,
      );
      _selectedId = id;
      if (isMobile) {
        _mobileShowEditor = true;
      }
    });
  }

  Channel? _resolveParentCategory(WidgetRef ref) {
    final String? parentId = widget.channel.parentId;
    if (parentId == null || widget.channel.isCategory) {
      return null;
    }
    final Channel? parent = ref.watch(channelByIdProvider(parentId)).value;
    if (parent == null || !parent.isCategory) {
      return null;
    }
    return parent;
  }

  void _updateEntry(ChannelPermissionOverwriteEntry entry) {
    setState(() {
      _entries = _entries
          .map(
            (ChannelPermissionOverwriteEntry item) =>
                item.id == entry.id ? entry : item,
          )
          .toList();
    });
  }

  ChannelPermissionsOverridesView _buildOverridesView({
    required FluxerLocalizations l10n,
    required Map<String, db.Role> rolesById,
    required Channel? parentChannel,
    required bool? isSyncedWithParent,
    required bool openEditorOnSelect,
    required void Function(String id, int type, String name) onAddOverride,
  }) {
    return ChannelPermissionsOverridesView(
      guildId: widget.channel.guildId,
      entries: _entries,
      selectedId: _selectedId,
      rolesById: rolesById,
      canEdit: _canEdit,
      parentChannel: parentChannel,
      isSyncedWithParent: isSyncedWithParent,
      scrollController: widget.scrollController,
      onSyncWithParent: parentChannel == null
          ? null
          : () =>
                _handleSyncWithParent(parentChannel: parentChannel, l10n: l10n),
      onSelected: (String id) {
        setState(() {
          _selectedId = id;
          if (openEditorOnSelect) {
            _mobileShowEditor = true;
          }
        });
      },
      onAddOverride: onAddOverride,
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<Map<String, db.Role>> rolesAsync = ref.watch(
      guildRolesByIdProvider(widget.channel.guildId),
    );
    return rolesAsync.when(
      loading: () => const Center(child: FluxerLoadingSpinner()),
      error: (Object error, StackTrace stackTrace) =>
          Center(child: Text(error.toString())),
      data: (Map<String, db.Role> rolesById) {
        if (_loadedChannelId != widget.channel.id || _entries.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) {
              return;
            }
            if (_loadedChannelId != widget.channel.id || _entries.isEmpty) {
              _initializeEntries(
                rolesById: rolesById,
                l10n: l10n,
                preserveDirtyState: false,
              );
            }
          });
        }
        final bool isMobile = isMobileLayout(context);
        final ChannelPermissionOverwriteEntry? selected = _selectedEntry;
        final Channel? parentChannel = _resolveParentCategory(ref);
        final bool? isSyncedWithParent = parentChannel == null
            ? null
            : resolveChannelParentSyncStatus(
                channel: widget.channel,
                parentChannel: parentChannel,
              );
        if (isMobile && !_mobileShowEditor) {
          return FluxerSettingsSheet(
            hasUnsavedChanges: _isDirty,
            isSaving: _isSaving || _isSyncing,
            onReset: _handleReset,
            onSave: _handleSave,
            child: _buildOverridesView(
              l10n: l10n,
              rolesById: rolesById,
              parentChannel: parentChannel,
              isSyncedWithParent: isSyncedWithParent,
              openEditorOnSelect: true,
              onAddOverride: (String id, int type, String name) =>
                  _handleAddOverride(
                    id: id,
                    type: type,
                    name: name,
                    rolesById: rolesById,
                    isMobile: true,
                  ),
            ),
          );
        }
        if (isMobile) {
          return FluxerSettingsSheet(
            hasUnsavedChanges: _isDirty,
            isSaving: _isSaving || _isSyncing,
            onReset: _handleReset,
            onSave: _handleSave,
            child: selected == null
                ? const SizedBox.shrink()
                : ChannelPermissionEditorPanel(
                    channel: widget.channel,
                    entry: selected,
                    canEdit: _canEdit,
                    scrollController: widget.scrollController,
                    showMobileBack: true,
                    onMobileBack: () =>
                        setState(() => _mobileShowEditor = false),
                    onEntryChanged: _updateEntry,
                  ),
          );
        }
        return FluxerSettingsSheet(
          hasUnsavedChanges: _isDirty,
          isSaving: _isSaving || _isSyncing,
          onReset: _handleReset,
          onSave: _handleSave,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 260,
                child: _buildOverridesView(
                  l10n: l10n,
                  rolesById: rolesById,
                  parentChannel: parentChannel,
                  isSyncedWithParent: isSyncedWithParent,
                  openEditorOnSelect: false,
                  onAddOverride: (String id, int type, String name) =>
                      _handleAddOverride(
                        id: id,
                        type: type,
                        name: name,
                        rolesById: rolesById,
                        isMobile: false,
                      ),
                ),
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: context.colors.borderColor,
              ),
              Expanded(
                child: selected == null
                    ? const SizedBox.shrink()
                    : ChannelPermissionEditorPanel(
                        channel: widget.channel,
                        entry: selected,
                        canEdit: _canEdit,
                        scrollController: widget.scrollController,
                        onEntryChanged: _updateEntry,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
