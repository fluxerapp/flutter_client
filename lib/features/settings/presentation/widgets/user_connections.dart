import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/connection_add_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/connection_edit_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/connection_remove_sheet.dart';
import 'package:fluxer_app/features/settings/providers/connections_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_bluesky_icon.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_unverified_connection_icon.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_verified_badge_icon.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_section.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserConnections extends ConsumerStatefulWidget {
  const UserConnections({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  ConsumerState<UserConnections> createState() => _UserConnectionsState();
}

class _UserConnectionsState extends ConsumerState<UserConnections>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(
        ref.read(connectionsViewModelProvider.notifier).load(silent: true),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(connectionsViewModelProvider);
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return SingleChildScrollView(
      controller: widget.scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.all(layout.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            title: l10n.connectionsTitle,
            description: l10n.connectionsDescription,
            isFirst: true,
            density: FluxerSettingsSectionDensity.compact,
            children: [
              _AddConnectionRow(blueskyEnabled: state.blueskyEnabled),
              SizedBox(height: layout.s3),
              _Body(state: state),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddConnectionRow extends ConsumerWidget {
  const _AddConnectionRow({required this.blueskyEnabled});

  final bool blueskyEnabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return Row(
      children: [
        if (blueskyEnabled) ...[
          _AddTile(
            tooltip: l10n.connectionsAddBluesky,
            semanticLabel: l10n.connectionsAddBlueskyAriaLabel,
            icon: const FluxerBlueskyIcon(size: 28),
            onTap: () => ConnectionAddSheet.showForBluesky(context, ref),
          ),
          SizedBox(width: layout.s3),
        ],
        _AddTile(
          tooltip: l10n.connectionsAddDomain,
          semanticLabel: l10n.connectionsAddDomainAriaLabel,
          icon: const PhosphorIcon(
            PhosphorIconsBold.globeSimple,
            size: 28,
            color: Colors.black,
          ),
          onTap: () => ConnectionAddSheet.showForDomain(context, ref),
        ),
      ],
    );
  }
}

class _AddTile extends StatelessWidget {
  const _AddTile({
    required this.tooltip,
    required this.semanticLabel,
    required this.icon,
    required this.onTap,
  });

  final String tooltip;
  final String semanticLabel;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;

    return Tooltip(
      message: tooltip,
      child: FluxerTappable(
        onTap: onTap,
        semanticLabel: semanticLabel,
        builder: (context, _) => Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: layout.radiusMd,
          ),
          child: icon,
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({required this.state});

  final ConnectionsViewState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final colors = context.colors;
    final l10n = FluxerLocalizations.of(context);

    if (state.isLoading && state.connections.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(layout.s6),
        child: const Center(child: FluxerLoadingSpinner()),
      );
    }

    if (state.error != null && state.connections.isEmpty) {
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
              l10n.connectionsLoadError,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s4),
            FluxerButton.primary(
              label: l10n.retry,
              onPressed: () =>
                  ref.read(connectionsViewModelProvider.notifier).load(),
            ),
          ],
        ),
      );
    }

    if (state.connections.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(layout.s6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhosphorIcon(
              PhosphorIconsFill.userList,
              size: 48,
              color: colors.textPrimaryMuted,
            ),
            SizedBox(height: layout.s3),
            Text(
              l10n.connectionsEmptyTitle,
              style: context.textStyles.heading.copyWith(
                color: colors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s1),
            Text(
              state.blueskyEnabled
                  ? l10n.connectionsEmptyDescriptionBluesky
                  : l10n.connectionsEmptyDescriptionDomainOnly,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.textPrimaryMuted,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return _ConnectionList(connections: state.connections);
  }
}

class _ConnectionList extends ConsumerWidget {
  const _ConnectionList({required this.connections});

  final List<ConnectionResponse> connections;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;

    return ReorderableListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      buildDefaultDragHandles: false,
      itemCount: connections.length,
      itemBuilder: (_, i) {
        final c = connections[i];
        return Padding(
          key: ValueKey(c.id),
          padding: EdgeInsets.only(bottom: layout.s2),
          child: _ConnectionCard(connection: c, index: i),
        );
      },
      proxyDecorator: (child, index, animation) =>
          Material(color: Colors.transparent, elevation: 4, child: child),
      onReorderItem: (oldIndex, newIndex) async {
        try {
          await ref
              .read(connectionsViewModelProvider.notifier)
              .reorder(oldIndex, newIndex);
        } on Object catch (_) {
          if (!context.mounted) {
            return;
          }
          final l10n = FluxerLocalizations.of(context);
          ref
              .read(toastProvider.notifier)
              .show(
                FluxerToast(
                  message: l10n.connectionsReorderError,
                  variant: FluxerToastVariant.danger,
                ),
              );
        }
      },
    );
  }
}

class _ConnectionCard extends ConsumerWidget {
  const _ConnectionCard({required this.connection, required this.index});

  final ConnectionResponse connection;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final layout = context.layout;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    final isPending = ref
        .watch(connectionsViewModelProvider)
        .pendingIds
        .contains(connection.id);

    final platformIcon = connection.type == ConnectionResponseTypeType.bsky
        ? const FluxerBlueskyIcon()
        : const PhosphorIcon(
            PhosphorIconsBold.globeSimple,
            size: 20,
            color: Colors.black,
          );

    return Container(
      constraints: const BoxConstraints(minHeight: 80),
      decoration: BoxDecoration(
        color: colors.backgroundTextarea,
        border: Border.all(color: colors.backgroundModifierAccent),
        borderRadius: layout.radiusXl,
      ),
      padding: EdgeInsets.all(layout.s3),
      child: Row(
        children: [
          ReorderableDragStartListener(
            index: index,
            child: MouseRegion(
              cursor: SystemMouseCursors.grab,
              child: PhosphorIcon(
                PhosphorIconsBold.dotsSixVertical,
                size: 20,
                color: colors.textTertiary,
              ),
            ),
          ),
          SizedBox(width: layout.s1_5),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: layout.radiusMd,
            ),
            child: platformIcon,
          ),
          SizedBox(width: layout.s1_5),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    connection.name,
                    overflow: TextOverflow.ellipsis,
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Semantics(
                  label: connection.verified
                      ? l10n.connectionVerifiedLabel
                      : l10n.connectionUnverifiedLabel,
                  child: connection.verified
                      ? const FluxerVerifiedBadgeIcon()
                      : const FluxerUnverifiedConnectionIcon(),
                ),
              ],
            ),
          ),
          _CardActionButton(
            icon: PhosphorIconsBold.pencilSimple,
            tooltip: l10n.connectionEdit,
            onTap: isPending
                ? null
                : () => ConnectionEditSheet.show(
                    context,
                    ref,
                    connection: connection,
                  ),
          ),
          SizedBox(width: layout.s1),
          _CardActionButton(
            icon: PhosphorIconsBold.trash,
            tooltip: l10n.connectionRemove,
            onTap: isPending
                ? null
                : () => ConnectionRemoveSheet.show(
                    context,
                    ref,
                    connection: connection,
                  ),
          ),
        ],
      ),
    );
  }
}

class _CardActionButton extends StatelessWidget {
  const _CardActionButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final isEnabled = onTap != null;

    return Tooltip(
      message: tooltip,
      child: FluxerTappable(
        onTap: onTap,
        semanticLabel: tooltip,
        builder: (context, _) => Container(
          padding: EdgeInsets.all(layout.s1),
          decoration: BoxDecoration(borderRadius: layout.radiusSm),
          child: PhosphorIcon(
            icon,
            size: 16,
            color: isEnabled ? colors.textTertiary : colors.textTertiaryMuted,
          ),
        ),
      ),
    );
  }
}
