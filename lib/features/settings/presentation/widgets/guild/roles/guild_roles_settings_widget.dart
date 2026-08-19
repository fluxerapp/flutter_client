import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/settings/data/guild_role_settings_repository.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_hierarchy.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_order.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_update.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_mobile_role_list.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_role_editor.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_role_sidebar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_roles_settings_bridge.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_role_settings_repository_provider.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_sheet.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class GuildRolesSettingsWidget extends ConsumerStatefulWidget {
  const GuildRolesSettingsWidget({
    required this.guildId,
    this.bridge,
    this.embedSidebarInParent = false,
    super.key,
  });

  final String guildId;
  final GuildRolesSettingsBridge? bridge;
  final bool embedSidebarInParent;

  @override
  ConsumerState<GuildRolesSettingsWidget> createState() =>
      _GuildRolesSettingsWidgetState();
}

class _GuildRolesSettingsWidgetState
    extends ConsumerState<GuildRolesSettingsWidget> {
  String? _selectedRoleId;
  bool _mobileShowEditor = false;
  bool _hoistOrderMode = false;
  bool _isSaving = false;
  bool _pendingRoleCreation = false;
  int _roleCountBeforeCreate = 0;
  String _permissionSearchQuery = '';
  final Map<String, GuildRoleUpdate> _roleUpdates = <String, GuildRoleUpdate>{};
  List<String>? _pendingRoleOrder;
  List<String>? _pendingHoistOrder;

  bool get _hasUnsavedChanges =>
      _roleUpdates.isNotEmpty ||
      _pendingRoleOrder != null ||
      _pendingHoistOrder != null;

  GuildRoleSettingsRepository get _repository =>
      ref.read(guildRoleSettingsRepositoryProvider);

  @override
  void dispose() {
    widget.bridge?.clear();
    super.dispose();
  }

  void _showSuccessToast(String message) {
    ref.read(toastProvider.notifier).show(FluxerToast(message: message));
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<Map<String, db.Role>> rolesAsync = ref.watch(
      guildRolesByIdProvider(widget.guildId),
    );
    final AsyncValue<Guild?> guildAsync = ref.watch(
      guildByIdProvider(widget.guildId),
    );
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final Guild? guild = guildAsync.value;
    final bool canManageRoles = hasPermission(
      permissions,
      Permission.manageRoles,
    );
    return rolesAsync.when(
      loading: () {
        _scheduleEmbeddedSidebarPublish(
          () => const Center(child: FluxerLoadingSpinner()),
        );
        return const Center(child: FluxerLoadingSpinner());
      },
      error: (Object error, StackTrace stackTrace) {
        widget.bridge?.clear();
        return Center(
          child: Text(
            userFacingErrorMessage(error, l10n.networkErrorMessage),
            style: context.textStyles.bodySmall,
          ),
        );
      },
      data: (Map<String, db.Role> roleRows) {
        final Map<String, MemberRole> rolesById = <String, MemberRole>{
          for (final db.Role row in roleRows.values)
            row.id: MemberRole.fromRow(row),
        };
        final List<MemberRole> roles = resolveDisplayRoles(
          roles: rolesById.values.toList(),
          pendingRoleOrder: _pendingRoleOrder,
        );
        final List<MemberRole> hoistedRoles = resolveHoistedRoles(
          guildId: widget.guildId,
          roles: rolesById.values.toList(),
          pendingHoistOrder: _pendingHoistOrder,
        );
        _scheduleSelection(roles, isMobileLayout(context));
        _schedulePendingRoleCreationHandling(roles, isMobileLayout(context));
        final String? selectedRoleId = _selectedRoleId;
        final MemberRole? selectedRole = selectedRoleId == null
            ? null
            : rolesById[selectedRoleId];
        final MemberRole? selectedRoleWithUpdates = selectedRole == null
            ? null
            : applyGuildRoleUpdate(selectedRole, _roleUpdates[selectedRole.id]);
        final String currentUserId = ref.watch(
          userSettingsViewModelProvider.select((state) => state.userId),
        );
        final CurrentUserMemberIdentity? memberIdentity = ref
            .watch(currentUserMemberIdentityProvider(widget.guildId))
            .value;
        final Set<String> currentUserRoleIds = parseCurrentUserRoleIds(
          memberIdentity?.roleIdsJson,
        );
        final bool isGuildOwner =
            guild != null &&
            currentUserId.isNotEmpty &&
            guild.ownerId == currentUserId;
        final MemberRole? currentUserHighestRole =
            resolveCurrentUserHighestRole(
              guildId: widget.guildId,
              currentUserRoleIds: currentUserRoleIds,
              rolesById: rolesById,
            );
        final int currentUserPermissions = computeCurrentUserGuildPermissions(
          guildId: widget.guildId,
          currentUserRoleIds: currentUserRoleIds,
          rolesById: rolesById,
        );
        bool isRoleLocked(MemberRole role) => isGuildRoleLocked(
          role: role,
          guildId: widget.guildId,
          isGuildOwner: isGuildOwner,
          canManageRoles: canManageRoles,
          currentUserHighestRole: currentUserHighestRole,
        );
        final bool selectedRoleLocked =
            selectedRole != null && isRoleLocked(selectedRole);
        final String mentionEveryoneLabel = permissionTitle(
          l10n,
          Permission.mentionEveryone,
        );
        final List<GuildPermissionCategorySpec> permissionSpecs =
            generateGuildPermissionSpec(l10n);
        final List<GuildPermissionCategorySpec> filteredPermissionSpecs =
            filterGuildPermissionSpec(
              specs: permissionSpecs,
              query: _permissionSearchQuery,
            );
        final Widget body = isMobileLayout(context)
            ? _buildMobileBody(
                l10n: l10n,
                roles: roles,
                hoistedRoles: hoistedRoles,
                hasCustomHoistOrder: guildHasCustomHoistOrder(
                  rolesById.values.toList(),
                ),
                selectedRoleWithUpdates: selectedRoleWithUpdates,
                canManageRoles: canManageRoles,
                isRoleLocked: isRoleLocked,
                selectedRoleLocked: selectedRoleLocked,
                mentionEveryoneLabel: mentionEveryoneLabel,
                filteredPermissionSpecs: filteredPermissionSpecs,
                currentUserPermissions: currentUserPermissions,
                currentUserRoleIds: currentUserRoleIds,
                isGuildOwner: isGuildOwner,
                rolesById: rolesById,
                currentUserId: currentUserId,
              )
            : _buildDesktopBody(
                l10n: l10n,
                roles: roles,
                hoistedRoles: hoistedRoles,
                hasCustomHoistOrder: guildHasCustomHoistOrder(
                  rolesById.values.toList(),
                ),
                selectedRoleWithUpdates: selectedRoleWithUpdates,
                canManageRoles: canManageRoles,
                isRoleLocked: isRoleLocked,
                selectedRoleLocked: selectedRoleLocked,
                mentionEveryoneLabel: mentionEveryoneLabel,
                filteredPermissionSpecs: filteredPermissionSpecs,
                currentUserPermissions: currentUserPermissions,
                currentUserRoleIds: currentUserRoleIds,
                isGuildOwner: isGuildOwner,
                rolesById: rolesById,
                currentUserId: currentUserId,
              );
        return FluxerSettingsSheet(
          hasUnsavedChanges: _hasUnsavedChanges,
          isSaving: _isSaving,
          onReset: _reset,
          onSave: () => _save(
            l10n: l10n,
            canManageRoles: canManageRoles,
            isRoleLocked: (String roleId) {
              final MemberRole? role = rolesById[roleId];
              return role == null || isRoleLocked(role);
            },
          ),
          child: body,
        );
      },
    );
  }

  MemberRole? _findNewestRole(List<MemberRole> roles) {
    MemberRole? newest;
    for (final MemberRole role in roles) {
      if (newest == null || BigInt.parse(role.id) > BigInt.parse(newest.id)) {
        newest = role;
      }
    }
    return newest;
  }

  void _scheduleSelection(List<MemberRole> roles, bool isMobile) {
    if (roles.isEmpty) {
      return;
    }
    if (_selectedRoleId != null &&
        roles.any((MemberRole role) => role.id == _selectedRoleId)) {
      return;
    }
    if (isMobile) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() => _selectedRoleId = roles.first.id);
    });
  }

  void _schedulePendingRoleCreationHandling(
    List<MemberRole> roles,
    bool isMobile,
  ) {
    if (!_pendingRoleCreation || roles.length <= _roleCountBeforeCreate) {
      return;
    }
    final MemberRole? newest = _findNewestRole(roles);
    if (newest == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _pendingRoleCreation = false;
        _selectedRoleId = newest.id;
        if (isMobile) {
          _mobileShowEditor = true;
        }
      });
    });
  }

  Widget _buildRoleEditor({
    required FluxerLocalizations l10n,
    required MemberRole selectedRoleWithUpdates,
    required bool canManageRoles,
    required bool selectedRoleLocked,
    required String mentionEveryoneLabel,
    required List<GuildPermissionCategorySpec> filteredPermissionSpecs,
    required int currentUserPermissions,
    required Set<String> currentUserRoleIds,
    required bool isGuildOwner,
    required Map<String, MemberRole> rolesById,
    required String currentUserId,
    required List<MemberRole> roles,
    required bool Function(MemberRole role) isRoleLocked,
    bool showMobileBack = false,
    VoidCallback? onMobileBack,
  }) {
    return GuildRoleEditor(
      guildId: widget.guildId,
      role: selectedRoleWithUpdates,
      isLocked: selectedRoleLocked,
      canManageRoles: canManageRoles,
      mentionEveryonePermissionLabel: mentionEveryoneLabel,
      filteredPermissionSpecs: filteredPermissionSpecs,
      showMobileBack: showMobileBack,
      onMobileBack: onMobileBack,
      onRoleUpdate:
          ({
            String? name,
            int? color,
            bool? hoist,
            bool? mentionable,
            int? permissions,
          }) => _handleRoleUpdate(
            roleId: selectedRoleWithUpdates.id,
            rolesById: rolesById,
            isRoleLocked: isRoleLocked,
            name: name,
            color: color,
            hoist: hoist,
            mentionable: mentionable,
            permissions: permissions,
          ),
      onDeleteRole: () => _deleteRole(
        l10n: l10n,
        role: selectedRoleWithUpdates,
        roles: roles,
        isRoleLocked: isRoleLocked,
      ),
      onClearPermissions: () => _handleRoleUpdate(
        roleId: selectedRoleWithUpdates.id,
        rolesById: rolesById,
        isRoleLocked: isRoleLocked,
        permissions: 0,
      ),
      onPermissionToggle: (Permission permission) => _handlePermissionToggle(
        role: selectedRoleWithUpdates,
        rolesById: rolesById,
        isRoleLocked: isRoleLocked,
        permission: permission,
      ),
      onPermissionSearchQueryChange: (String query) =>
          setState(() => _permissionSearchQuery = query),
      permissionDisabledReason: (Permission permission) =>
          _permissionDisabledReason(
            l10n: l10n,
            permission: permission,
            roleId: selectedRoleWithUpdates.id,
            selectedRoleLocked: selectedRoleLocked,
            canManageRoles: canManageRoles,
            currentUserPermissions: currentUserPermissions,
            currentUserRoleIds: currentUserRoleIds,
            isGuildOwner: isGuildOwner,
            rolesById: rolesById,
            currentUserId: currentUserId,
          ),
    );
  }

  Widget _buildDesktopBody({
    required FluxerLocalizations l10n,
    required List<MemberRole> roles,
    required List<MemberRole> hoistedRoles,
    required bool hasCustomHoistOrder,
    required MemberRole? selectedRoleWithUpdates,
    required bool canManageRoles,
    required bool Function(MemberRole role) isRoleLocked,
    required bool selectedRoleLocked,
    required String mentionEveryoneLabel,
    required List<GuildPermissionCategorySpec> filteredPermissionSpecs,
    required int currentUserPermissions,
    required Set<String> currentUserRoleIds,
    required bool isGuildOwner,
    required Map<String, MemberRole> rolesById,
    required String currentUserId,
  }) {
    if (widget.embedSidebarInParent) {
      _publishEmbeddedSidebar(
        l10n: l10n,
        roles: roles,
        hoistedRoles: hoistedRoles,
        hasCustomHoistOrder: hasCustomHoistOrder,
        canManageRoles: canManageRoles,
        isRoleLocked: isRoleLocked,
      );
      if (selectedRoleWithUpdates == null) {
        return const SizedBox.shrink();
      }
      return _buildRoleEditor(
        l10n: l10n,
        selectedRoleWithUpdates: selectedRoleWithUpdates,
        canManageRoles: canManageRoles,
        selectedRoleLocked: selectedRoleLocked,
        mentionEveryoneLabel: mentionEveryoneLabel,
        filteredPermissionSpecs: filteredPermissionSpecs,
        currentUserPermissions: currentUserPermissions,
        currentUserRoleIds: currentUserRoleIds,
        isGuildOwner: isGuildOwner,
        rolesById: rolesById,
        currentUserId: currentUserId,
        roles: roles,
        isRoleLocked: isRoleLocked,
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 260,
          child: GuildRoleSidebar(
            guildId: widget.guildId,
            roles: roles,
            hoistedRoles: hoistedRoles,
            selectedRoleId: _selectedRoleId,
            canManageRoles: canManageRoles,
            hoistOrderMode: _hoistOrderMode,
            hasCustomHoistOrder: hasCustomHoistOrder,
            isRoleLocked: isRoleLocked,
            onSelectRole: (String roleId) =>
                setState(() => _selectedRoleId = roleId),
            onCreateRole: () => _createRole(l10n),
            isCreatingRole: _pendingRoleCreation,
            onEnterHoistOrderMode: () => setState(() => _hoistOrderMode = true),
            onExitHoistOrderMode: () => setState(() => _hoistOrderMode = false),
            onResetHoistOrder: () => _resetHoistOrder(l10n),
            onReorder: (int oldIndex, int newIndex) => _handleReorder(
              items: _hoistOrderMode ? hoistedRoles : roles,
              oldIndex: oldIndex,
              newIndex: newIndex,
              isHoist: _hoistOrderMode,
            ),
          ),
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
          color: context.colors.borderColor,
        ),
        Expanded(
          child: selectedRoleWithUpdates == null
              ? const SizedBox.shrink()
              : _buildRoleEditor(
                  l10n: l10n,
                  selectedRoleWithUpdates: selectedRoleWithUpdates,
                  canManageRoles: canManageRoles,
                  selectedRoleLocked: selectedRoleLocked,
                  mentionEveryoneLabel: mentionEveryoneLabel,
                  filteredPermissionSpecs: filteredPermissionSpecs,
                  currentUserPermissions: currentUserPermissions,
                  currentUserRoleIds: currentUserRoleIds,
                  isGuildOwner: isGuildOwner,
                  rolesById: rolesById,
                  currentUserId: currentUserId,
                  roles: roles,
                  isRoleLocked: isRoleLocked,
                ),
        ),
      ],
    );
  }

  void _publishEmbeddedSidebar({
    required FluxerLocalizations l10n,
    required List<MemberRole> roles,
    required List<MemberRole> hoistedRoles,
    required bool hasCustomHoistOrder,
    required bool canManageRoles,
    required bool Function(MemberRole role) isRoleLocked,
  }) {
    _scheduleEmbeddedSidebarPublish(
      () => GuildRoleSidebar(
        guildId: widget.guildId,
        roles: roles,
        hoistedRoles: hoistedRoles,
        selectedRoleId: _selectedRoleId,
        canManageRoles: canManageRoles,
        hoistOrderMode: _hoistOrderMode,
        hasCustomHoistOrder: hasCustomHoistOrder,
        isRoleLocked: isRoleLocked,
        onSelectRole: (String roleId) =>
            setState(() => _selectedRoleId = roleId),
        onCreateRole: () => _createRole(l10n),
        isCreatingRole: _pendingRoleCreation,
        onEnterHoistOrderMode: () => setState(() => _hoistOrderMode = true),
        onExitHoistOrderMode: () => setState(() => _hoistOrderMode = false),
        onResetHoistOrder: () => _resetHoistOrder(l10n),
        onReorder: (int oldIndex, int newIndex) => _handleReorder(
          items: _hoistOrderMode ? hoistedRoles : roles,
          oldIndex: oldIndex,
          newIndex: newIndex,
          isHoist: _hoistOrderMode,
        ),
      ),
    );
  }

  void _scheduleEmbeddedSidebarPublish(Widget Function() buildSidebar) {
    if (!widget.embedSidebarInParent) {
      return;
    }
    final GuildRolesSettingsBridge? bridge = widget.bridge;
    if (bridge == null) {
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      bridge.publish(buildSidebar());
    });
  }

  Widget _buildMobileBody({
    required FluxerLocalizations l10n,
    required List<MemberRole> roles,
    required List<MemberRole> hoistedRoles,
    required bool hasCustomHoistOrder,
    required MemberRole? selectedRoleWithUpdates,
    required bool canManageRoles,
    required bool Function(MemberRole role) isRoleLocked,
    required bool selectedRoleLocked,
    required String mentionEveryoneLabel,
    required List<GuildPermissionCategorySpec> filteredPermissionSpecs,
    required int currentUserPermissions,
    required Set<String> currentUserRoleIds,
    required bool isGuildOwner,
    required Map<String, MemberRole> rolesById,
    required String currentUserId,
  }) {
    if (!_mobileShowEditor || selectedRoleWithUpdates == null) {
      return GuildMobileRoleList(
        guildId: widget.guildId,
        roles: roles,
        hoistedRoles: hoistedRoles,
        canManageRoles: canManageRoles,
        hoistOrderMode: _hoistOrderMode,
        hasCustomHoistOrder: hasCustomHoistOrder,
        isRoleLocked: isRoleLocked,
        onCreateRole: () => _createRole(l10n),
        isCreatingRole: _pendingRoleCreation,
        onSelectRole: (String roleId) {
          if (_hoistOrderMode) {
            return;
          }
          setState(() {
            _selectedRoleId = roleId;
            _mobileShowEditor = true;
          });
        },
        onEnterHoistOrderMode: () => setState(() => _hoistOrderMode = true),
        onExitHoistOrderMode: () => setState(() => _hoistOrderMode = false),
        onResetHoistOrder: () => _resetHoistOrder(l10n),
        onReorder: (int oldIndex, int newIndex) => _handleReorder(
          items: _hoistOrderMode ? hoistedRoles : roles,
          oldIndex: oldIndex,
          newIndex: newIndex,
          isHoist: _hoistOrderMode,
        ),
      );
    }
    return _buildRoleEditor(
      l10n: l10n,
      selectedRoleWithUpdates: selectedRoleWithUpdates,
      canManageRoles: canManageRoles,
      selectedRoleLocked: selectedRoleLocked,
      mentionEveryoneLabel: mentionEveryoneLabel,
      filteredPermissionSpecs: filteredPermissionSpecs,
      currentUserPermissions: currentUserPermissions,
      currentUserRoleIds: currentUserRoleIds,
      isGuildOwner: isGuildOwner,
      rolesById: rolesById,
      currentUserId: currentUserId,
      roles: roles,
      isRoleLocked: isRoleLocked,
      showMobileBack: true,
      onMobileBack: () => setState(() => _mobileShowEditor = false),
    );
  }

  void _handleReorder({
    required List<MemberRole> items,
    required int oldIndex,
    required int newIndex,
    required bool isHoist,
  }) {
    final List<MemberRole> reordered = List<MemberRole>.from(items);
    final MemberRole moved = reordered.removeAt(oldIndex);
    reordered.insert(newIndex, moved);
    if (!isHoist &&
        !isValidGuildRoleHierarchyOrder(
          guildId: widget.guildId,
          orderedRoleIds: reordered.map((MemberRole role) => role.id).toList(),
        )) {
      return;
    }
    final List<String> order = reordered.map((MemberRole r) => r.id).toList();
    setState(() {
      if (isHoist) {
        _pendingHoistOrder = order;
      } else {
        _pendingRoleOrder = order;
      }
    });
  }

  void _handleRoleUpdate({
    required String roleId,
    required Map<String, MemberRole> rolesById,
    required bool Function(MemberRole role) isRoleLocked,
    String? name,
    int? color,
    bool? hoist,
    bool? mentionable,
    int? permissions,
  }) {
    final MemberRole? original = rolesById[roleId];
    if (original == null || isRoleLocked(original)) {
      return;
    }
    final GuildRoleUpdate incoming = GuildRoleUpdate(
      id: roleId,
      name: name,
      color: color,
      hoist: hoist,
      mentionable: mentionable,
      permissions: permissions,
    );
    setState(() {
      final GuildRoleUpdate? merged = mergeGuildRoleUpdate(
        original: original,
        existing: _roleUpdates[roleId],
        incoming: incoming,
      );
      if (merged == null) {
        _roleUpdates.remove(roleId);
      } else {
        _roleUpdates[roleId] = merged;
      }
    });
  }

  void _handlePermissionToggle({
    required MemberRole role,
    required Map<String, MemberRole> rolesById,
    required bool Function(MemberRole role) isRoleLocked,
    required Permission permission,
  }) {
    if (isRoleLocked(role)) {
      return;
    }
    final GuildRoleUpdate? update = _roleUpdates[role.id];
    final MemberRole current = applyGuildRoleUpdate(role, update);
    final int nextPermissions = hasPermission(current.permissions, permission)
        ? current.permissions & ~permission.value
        : current.permissions | permission.value;
    _handleRoleUpdate(
      roleId: role.id,
      rolesById: rolesById,
      isRoleLocked: isRoleLocked,
      permissions: nextPermissions,
    );
  }

  String? _permissionDisabledReason({
    required FluxerLocalizations l10n,
    required Permission permission,
    required String roleId,
    required bool selectedRoleLocked,
    required bool canManageRoles,
    required int currentUserPermissions,
    required Set<String> currentUserRoleIds,
    required bool isGuildOwner,
    required Map<String, MemberRole> rolesById,
    required String currentUserId,
  }) {
    if (!canManageRoles) {
      return l10n.guildSettingsRolesNeedManageRolesPermission(
        permissionTitle(l10n, Permission.manageRoles),
      );
    }
    if (isGuildOwner) {
      return null;
    }
    if (selectedRoleLocked) {
      return l10n.guildSettingsRolesCannotEditHigherRole;
    }
    final MemberRole? original = rolesById[roleId];
    final MemberRole current = applyGuildRoleUpdate(
      original ?? rolesById.values.first,
      _roleUpdates[roleId],
    );
    final bool willEnable = !hasPermission(current.permissions, permission);
    if (willEnable &&
        !canGrantGuildRolePermission(
          isGuildOwner: isGuildOwner,
          currentUserPermissions: currentUserPermissions,
          permission: permission,
        )) {
      return l10n.guildSettingsRolesCannotGrantPermission;
    }
    if (!willEnable &&
        wouldRemoveOwnGuildRolePermission(
          guildId: widget.guildId,
          currentUserId: currentUserId,
          isGuildOwner: isGuildOwner,
          currentUserRoleIds: currentUserRoleIds,
          rolesById: rolesById,
          roleId: roleId,
          permission: permission,
        )) {
      return l10n.guildSettingsRolesCannotRemoveOwnPermission;
    }
    return null;
  }

  void _reset() {
    setState(() {
      _roleUpdates.clear();
      _pendingRoleOrder = null;
      _pendingHoistOrder = null;
      _hoistOrderMode = false;
      _permissionSearchQuery = '';
    });
  }

  Future<void> _save({
    required FluxerLocalizations l10n,
    required bool canManageRoles,
    required bool Function(String roleId) isRoleLocked,
  }) async {
    if (!canManageRoles || _isSaving) {
      return;
    }
    for (final GuildRoleUpdate update in _roleUpdates.values) {
      if (update.name != null && update.name!.trim().isEmpty) {
        await _showErrorModal(
          title: l10n.guildSettingsRolesNameRequiredTitle,
          message: l10n.guildSettingsRolesNameRequiredBody,
        );
        return;
      }
    }
    setState(() => _isSaving = true);
    try {
      if (_pendingRoleOrder != null) {
        final List<String> submittable = createSubmittableGuildRoleOrderIds(
          guildId: widget.guildId,
          orderedRoleIds: _pendingRoleOrder!,
          isRoleLocked: isRoleLocked,
        );
        if (submittable.isNotEmpty) {
          await _repository.updateRolePositions(
            guildId: widget.guildId,
            items: createGuildRoleOrderPayload(
              guildId: widget.guildId,
              orderedRoleIds: _pendingRoleOrder!,
            ),
          );
        }
      }
      if (_pendingHoistOrder != null) {
        final List<String> submittable = createSubmittableGuildRoleOrderIds(
          guildId: widget.guildId,
          orderedRoleIds: _pendingHoistOrder!,
          isRoleLocked: isRoleLocked,
        );
        if (submittable.isNotEmpty) {
          await _repository.updateRoleHoistPositions(
            guildId: widget.guildId,
            items: createGuildRoleHoistOrderPayload(
              guildId: widget.guildId,
              orderedRoleIds: _pendingHoistOrder!,
            ),
          );
        }
      }
      for (final MapEntry<String, GuildRoleUpdate> entry
          in _roleUpdates.entries) {
        if (isRoleLocked(entry.key)) {
          continue;
        }
        final GuildRoleUpdate update = entry.value;
        await _repository.updateRole(
          guildId: widget.guildId,
          roleId: entry.key,
          name: update.name,
          color: update.color,
          hoist: update.hoist,
          mentionable: update.mentionable,
          permissions: update.permissions,
        );
      }
      if (!mounted) {
        return;
      }
      setState(() {
        _roleUpdates.clear();
        _pendingRoleOrder = null;
        _pendingHoistOrder = null;
        _isSaving = false;
      });
      _showSuccessToast(l10n.guildSettingsRolesUpdatedSuccess);
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() => _isSaving = false);
      await _showErrorModal(
        title: l10n.guildSettingsRolesUpdateFailedTitle,
        message: l10n.guildSettingsRolesTryAgainInAMoment,
      );
    }
  }

  Future<void> _createRole(FluxerLocalizations l10n) async {
    setState(() {
      _pendingRoleCreation = true;
      _roleCountBeforeCreate =
          ref.read(guildRolesByIdProvider(widget.guildId)).value?.length ?? 0;
    });
    try {
      await _repository.createRole(
        guildId: widget.guildId,
        name: l10n.guildSettingsRolesNewRole,
      );
      if (!mounted) {
        return;
      }
      _showSuccessToast(l10n.guildSettingsRolesCreatedSuccess);
    } on Object {
      if (!mounted) {
        return;
      }
      setState(() => _pendingRoleCreation = false);
      await _showErrorModal(
        title: l10n.guildSettingsRolesCreateFailedTitle,
        message: l10n.guildSettingsRolesTryAgainInAMoment,
      );
    }
  }

  Future<void> _deleteRole({
    required FluxerLocalizations l10n,
    required MemberRole role,
    required List<MemberRole> roles,
    required bool Function(MemberRole role) isRoleLocked,
  }) async {
    if (role.isEveryoneRole(widget.guildId) || isRoleLocked(role)) {
      return;
    }
    final int currentIndex = roles.indexWhere(
      (MemberRole item) => item.id == role.id,
    );
    final MemberRole? nextRole =
        currentIndex >= 0 && currentIndex + 1 < roles.length
        ? roles[currentIndex + 1]
        : roles.isNotEmpty
        ? roles.first
        : null;
    await FluxerModal.show<void>(
      context,
      title: l10n.guildSettingsRolesDeleteRole,
      centered: true,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return Text(
          l10n.guildSettingsRolesDeleteConfirm(role.name),
          style: dialogContext.textStyles.bodySmall,
        );
      },
      actionsBuilder: (void Function([void]) pop) => <Widget>[
        FluxerButton.dangerPrimary(
          onPressed: () async {
            pop();
            await _performDeleteRole(
              l10n: l10n,
              role: role,
              nextRoleId: nextRole?.id,
            );
          },
          label: l10n.guildSettingsRolesDeleteRole,
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(onPressed: () => pop(), label: l10n.cancel),
      ],
    );
  }

  Future<void> _performDeleteRole({
    required FluxerLocalizations l10n,
    required MemberRole role,
    required String? nextRoleId,
  }) async {
    try {
      await _repository.deleteRole(guildId: widget.guildId, roleId: role.id);
      if (!mounted) {
        return;
      }
      setState(() {
        _selectedRoleId = nextRoleId;
        _roleUpdates.remove(role.id);
        _mobileShowEditor = false;
      });
      _showSuccessToast(l10n.guildSettingsRolesDeletedSuccess);
    } on Object {
      if (!mounted) {
        return;
      }
      await _showErrorModal(
        title: l10n.guildSettingsRolesDeleteFailedTitle,
        message: l10n.guildSettingsRolesDeleteFailedBody(role.name),
      );
    }
  }

  Future<void> _resetHoistOrder(FluxerLocalizations l10n) async {
    try {
      await _repository.resetRoleHoistPositions(guildId: widget.guildId);
      if (!mounted) {
        return;
      }
      setState(() => _pendingHoistOrder = null);
      _showSuccessToast(l10n.guildSettingsRolesHoistResetSuccess);
    } on Object {
      if (!mounted) {
        return;
      }
      await _showErrorModal(
        title: l10n.guildSettingsRolesResetHoistFailedTitle,
        message: l10n.guildSettingsRolesTryAgainInAMoment,
      );
    }
  }

  Future<void> _showErrorModal({
    required String title,
    required String message,
  }) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await FluxerModal.show<void>(
      context,
      title: title,
      centered: true,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return Text(message, style: dialogContext.textStyles.bodySmall);
      },
      actionsBuilder: (void Function([void]) pop) => <Widget>[
        FluxerButton.primary(onPressed: () => pop(), label: l10n.uiConfirm),
      ],
    );
  }
}
