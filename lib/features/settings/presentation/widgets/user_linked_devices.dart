import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/current_auth_session_provider.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/linked_devices_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserLinkedDevices extends ConsumerStatefulWidget {
  const UserLinkedDevices({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserLinkedDevices> createState() => _UserLinkedDevicesState();
}

class _UserLinkedDevicesState extends ConsumerState<UserLinkedDevices> {
  bool _selectionMode = false;
  final Set<String> _selected = {};
  int _lastToggledIndex = -1;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(linkedDevicesViewModelProvider);
    final currentIdHash = ref.watch(currentAuthSessionIdHashProvider);
    final colors = context.colors;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    AuthSessionResponse? current;
    if (currentIdHash != null) {
      for (final session in state.sessions) {
        if (session.idHash == currentIdHash) {
          current = session;
          break;
        }
      }
    }

    final Widget body;
    if (state.isLoading) {
      body = const Center(child: FluxerLoadingSpinner());
    } else if (state.error != null || current == null) {
      // Mirrors the web client: if the gateway-supplied session id hash is
      // unavailable or does not match any returned session, refuse to render
      // the list (any revocation would risk targeting the wrong session).
      body = _buildLoadError(context, colors, layout, l10n);
    } else {
      final others = state.sessions.where((s) => s != current).toList();
      body = _buildContent(context, current, others, colors, layout, l10n);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final minHeight = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : 0.0;
        return SingleChildScrollView(
          controller: widget.scrollController,
          padding: settingsScrollPadding(context),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: minHeight),
            child: body,
          ),
        );
      },
    );
  }

  Widget _buildLoadError(
    BuildContext context,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    return Padding(
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            PhosphorIconsFill.networkSlash,
            size: 48,
            color: colors.textPrimaryMuted,
          ),
          SizedBox(height: layout.s3),
          Text(
            l10n.linkedDevicesLoadErrorTitle,
            style: context.textStyles.heading.copyWith(
              color: colors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s1),
          Text(
            l10n.linkedDevicesLoadErrorDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s4),
          FluxerButton.primary(
            label: l10n.retry,
            onPressedAsync: ref
                .read(linkedDevicesViewModelProvider.notifier)
                .load,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AuthSessionResponse current,
    List<AuthSessionResponse> others,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    final state = ref.watch(linkedDevicesViewModelProvider);
    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s4, layout.s4, layout.s4, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            title: l10n.linkedDevicesTitle,
            description: l10n.linkedDevicesDescription,
            isFirst: true,
            children: [
              _buildCurrentGroup(current, colors, layout, l10n),
              if (others.isNotEmpty)
                _buildOthersGroup(others, state, colors, layout, l10n),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentGroup(
    AuthSessionResponse current,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FluxerSubsectionLabel(l10n.linkedDevicesCurrentDevice),
        SizedBox(height: layout.s2),
        _AuthSessionCard(
          session: current,
          isCurrent: true,
          selectionMode: false,
          isSelected: false,
          isRevoking: false,
        ),
      ],
    );
  }

  Widget _buildOthersGroup(
    List<AuthSessionResponse> others,
    LinkedDevicesViewState state,
    FluxerColorTheme colors,
    FluxerLayoutTheme layout,
    FluxerLocalizations l10n,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: layout.s6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: FluxerSubsectionLabel(l10n.linkedDevicesOtherDevices),
              ),
              if (others.length > 1) _buildActionButtons(others, l10n, colors),
            ],
          ),
          SizedBox(height: layout.s2),
          for (int i = 0; i < others.length; i++) ...[
            _AuthSessionCard(
              session: others[i],
              isCurrent: false,
              selectionMode: _selectionMode,
              isSelected: _selected.contains(others[i].idHash),
              isRevoking: state.revokingIds.contains(others[i].idHash),
              onTap: _selectionMode ? () => _toggleSelection(others, i) : null,
              onRevoke: _selectionMode
                  ? null
                  : () => _handleSingleRevoke(others[i], l10n),
            ),
            if (i < others.length - 1) SizedBox(height: layout.s3),
          ],
          if (others.length > 1 ||
              (_selectionMode && _selected.isNotEmpty)) ...[
            SizedBox(height: layout.s4),
            _buildBulkButton(others, l10n),
            SizedBox(height: layout.s2),
            Text(
              l10n.linkedDevicesLogoutDisclaimer,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButtons(
    List<AuthSessionResponse> others,
    FluxerLocalizations l10n,
    FluxerColorTheme colors,
  ) {
    return Row(
      children: [
        FluxerTooltip(
          message: _selectionMode
              ? l10n.linkedDevicesExitSelection
              : l10n.linkedDevicesEnterSelection,
          child: _iconButton(
            icon: _selectionMode
                ? PhosphorIconsBold.x
                : PhosphorIconsFill.checkSquare,
            onTap: () => setState(() {
              _selectionMode = !_selectionMode;
              if (!_selectionMode) {
                _selected.clear();
                _lastToggledIndex = -1;
              }
            }),
            colors: colors,
          ),
        ),
        if (_selectionMode) ...[
          const SizedBox(width: 4),
          FluxerTooltip(
            message: _selected.length == others.length
                ? l10n.linkedDevicesClearSelection
                : l10n.linkedDevicesSelectAll,
            child: _iconButton(
              icon: _selected.length == others.length
                  ? PhosphorIconsBold.square
                  : PhosphorIconsFill.checkSquare,
              onTap: () => setState(() {
                if (_selected.length == others.length) {
                  _selected.clear();
                } else {
                  _selected
                    ..clear()
                    ..addAll(others.map((s) => s.idHash));
                }
              }),
              colors: colors,
            ),
          ),
        ],
      ],
    );
  }

  Widget _iconButton({
    required IconData icon,
    required VoidCallback onTap,
    required FluxerColorTheme colors,
  }) {
    return FluxerTappable(
      onTap: onTap,
      builder: (context, states) => Container(
        width: 32,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: states.contains(WidgetState.hovered)
              ? colors.backgroundModifierHover
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: PhosphorIcon(icon, size: 18, color: colors.textTertiary),
      ),
    );
  }

  Widget _buildBulkButton(
    List<AuthSessionResponse> others,
    FluxerLocalizations l10n,
  ) {
    final selectedCount = _selectionMode ? _selected.length : 0;
    final label = selectedCount > 0
        ? l10n.linkedDevicesSignOutN(selectedCount)
        : l10n.linkedDevicesSignOutAll;

    return SizedBox(
      width: double.infinity,
      child: FluxerButton.dangerSecondary(
        label: label,
        onPressedAsync: () => _handleBulkRevoke(others, l10n),
      ),
    );
  }

  void _toggleSelection(List<AuthSessionResponse> others, int index) {
    final id = others[index].idHash;
    final shiftHeld =
        HardwareKeyboard.instance.isLogicalKeyPressed(
          LogicalKeyboardKey.shiftLeft,
        ) ||
        HardwareKeyboard.instance.isLogicalKeyPressed(
          LogicalKeyboardKey.shiftRight,
        );

    setState(() {
      if (shiftHeld && _lastToggledIndex != -1) {
        final start = _lastToggledIndex < index ? _lastToggledIndex : index;
        final end = _lastToggledIndex < index ? index : _lastToggledIndex;
        final shouldAdd = !_selected.contains(id);
        for (var i = start; i <= end; i++) {
          if (shouldAdd) {
            _selected.add(others[i].idHash);
          } else {
            _selected.remove(others[i].idHash);
          }
        }
      } else {
        if (_selected.contains(id)) {
          _selected.remove(id);
        } else {
          _selected.add(id);
        }
      }
      _lastToggledIndex = index;
    });
  }

  Future<void> _handleSingleRevoke(
    AuthSessionResponse session,
    FluxerLocalizations l10n,
  ) async {
    await _showRevokeSheet(
      ids: [session.idHash],
      title: l10n.linkedDevicesSignOutSheetTitle(1),
      description: l10n.linkedDevicesSignOutSheetDescription(1),
      l10n: l10n,
    );
  }

  Future<void> _handleBulkRevoke(
    List<AuthSessionResponse> others,
    FluxerLocalizations l10n,
  ) async {
    final selectedCount = _selectionMode ? _selected.length : 0;
    final ids = selectedCount > 0
        ? _selected.toList()
        : others.map((s) => s.idHash).toList();

    if (selectedCount > 0) {
      await _showRevokeSheet(
        ids: ids,
        title: l10n.linkedDevicesSignOutSheetTitle(selectedCount),
        description: l10n.linkedDevicesSignOutSheetDescription(selectedCount),
        l10n: l10n,
      );
    } else {
      await _showRevokeSheet(
        ids: ids,
        title: l10n.linkedDevicesSignOutAllSheetTitle,
        description: l10n.linkedDevicesSignOutAllSheetDescription,
        l10n: l10n,
      );
    }
  }

  Future<void> _showRevokeSheet({
    required List<String> ids,
    required String title,
    required String description,
    required FluxerLocalizations l10n,
  }) async {
    final layout = context.layout;
    final colors = context.colors;

    await FluxerBottomSheet.show<void>(
      context,
      title: title,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                description,
                style: sheetContext.textStyles.bodySmall.copyWith(
                  color: colors.textPrimary,
                ),
              ),
              SizedBox(height: layout.s4),
              FluxerButton.dangerPrimary(
                label: l10n.linkedDevicesSignOutConfirm,
                onPressedAsync: () async {
                  final success = await _performRevoke(ids, l10n);
                  if (success && sheetContext.mounted) {
                    close();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> _performRevoke(
    List<String> ids,
    FluxerLocalizations l10n,
  ) async {
    try {
      await ref.read(linkedDevicesViewModelProvider.notifier).logout(ids);
      if (!mounted) {
        return false;
      }
      setState(() {
        _selectionMode = false;
        _selected.clear();
        _lastToggledIndex = -1;
      });
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.linkedDevicesRevokeSuccess(ids.length),
              variant: FluxerToastVariant.success,
            ),
          );
      return true;
    } on Object {
      if (!mounted) {
        return false;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.linkedDevicesRevokeError,
              variant: FluxerToastVariant.danger,
            ),
          );
      return false;
    }
  }
}

// ---------------------------------------------------------------------------
// Card
// ---------------------------------------------------------------------------

class _AuthSessionCard extends StatelessWidget {
  const _AuthSessionCard({
    required this.session,
    required this.isCurrent,
    required this.selectionMode,
    required this.isSelected,
    required this.isRevoking,
    this.onTap,
    this.onRevoke,
  });

  final AuthSessionResponse session;
  final bool isCurrent;
  final bool selectionMode;
  final bool isSelected;
  final bool isRevoking;
  final VoidCallback? onTap;
  final VoidCallback? onRevoke;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    final l10n = FluxerLocalizations.of(context);
    final card = Container(
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: Border.all(color: colors.borderColor),
        borderRadius: layout.radiusLg,
      ),
      padding: EdgeInsets.all(layout.s4),
      child: Row(
        children: [
          _iconBubble(colors),
          SizedBox(width: layout.s3),
          Expanded(child: _info(context, colors)),
          SizedBox(width: layout.s2),
          _trailing(colors, l10n),
        ],
      ),
    );

    if (selectionMode && !isCurrent && onTap != null) {
      return FluxerTappable(onTap: onTap, builder: (_, _) => card);
    }
    return card;
  }

  Widget _iconBubble(FluxerColorTheme colors) {
    final isMobile =
        session.clientInfo?.device ==
        AuthSessionResponseClientInfoDeviceDevice.mobile;
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: colors.backgroundTertiary,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: PhosphorIcon(
        isMobile ? PhosphorIconsBold.deviceMobile : PhosphorIconsBold.monitor,
        size: 22,
        color: colors.textTertiary,
      ),
    );
  }

  Widget _info(BuildContext context, FluxerColorTheme colors) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final clientOs = session.clientInfo?.os ?? l10n.linkedDevicesUnknownOs;
    final platformLabel =
        session.clientInfo?.platform ?? l10n.linkedDevicesUnknownPlatform;
    final location = _locationLabel(session.clientInfo?.location);
    final lastUsed = session.approxLastUsedAt;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DefaultTextStyle(
          style: context.textStyles.categoryName.copyWith(
            color: colors.textPrimary,
          ),
          child: Text(
            session.clientInfo?.browser == null
                ? platformLabel
                : '$clientOs · $platformLabel',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (!isCurrent && (location != null || lastUsed != null)) ...[
          SizedBox(height: layout.s1),
          DefaultTextStyle(
            style: context.textStyles.bodySmall.copyWith(fontSize: 13),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (location != null)
                  Flexible(
                    child: Text(
                      location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                if (location != null && lastUsed != null) _dotSeparator(colors),
                if (lastUsed != null) Text(relativeTimeShort(lastUsed, l10n)),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _dotSeparator(FluxerColorTheme colors) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6),
    child: Container(
      width: 3,
      height: 3,
      decoration: BoxDecoration(
        color: colors.textTertiaryMuted,
        shape: BoxShape.circle,
      ),
    ),
  );

  Widget _trailing(FluxerColorTheme colors, FluxerLocalizations l10n) {
    if (isCurrent) {
      return const SizedBox.shrink();
    }
    if (selectionMode) {
      return _SelectionCheckbox(checked: isSelected, colors: colors);
    }
    if (isRevoking) {
      return const SizedBox(
        width: 32,
        height: 32,
        child: Center(child: FluxerLoadingSpinner()),
      );
    }
    return FluxerTooltip(
      message: l10n.linkedDevicesRevokeTooltip,
      child: FluxerTappable(
        onTap: onRevoke,
        builder: (context, states) => Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: states.contains(WidgetState.hovered)
                ? colors.backgroundModifierHover
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: PhosphorIcon(
            PhosphorIconsBold.x,
            size: 16,
            color: colors.textTertiary,
          ),
        ),
      ),
    );
  }

  static String? _locationLabel(AuthSessionLocation? loc) {
    if (loc == null) {
      return null;
    }
    final parts = <String>[
      if (loc.city != null && loc.city!.isNotEmpty) loc.city!,
      if (loc.region != null && loc.region!.isNotEmpty) loc.region!,
      if (loc.country != null && loc.country!.isNotEmpty) loc.country!,
    ];
    return parts.isEmpty ? null : parts.join(', ');
  }
}

class _SelectionCheckbox extends StatelessWidget {
  const _SelectionCheckbox({required this.checked, required this.colors});

  final bool checked;
  final FluxerColorTheme colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: checked ? colors.textPrimary : Colors.transparent,
        border: Border.all(
          color: checked ? colors.textPrimary : colors.textTertiaryMuted,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.center,
      child: checked
          ? PhosphorIcon(
              PhosphorIconsBold.check,
              size: 14,
              color: colors.backgroundPrimary,
            )
          : null,
    );
  }
}
