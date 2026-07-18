import 'package:flutter/material.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/domain/channel_permission_overwrite_update.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_add_override_popout.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_overwrite_list_item.dart';
import 'package:fluxer_app/features/channels/presentation/channel_settings/widgets/channel_permissions_sync_banner.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/popout/fluxer_popout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelPermissionsOverridesView extends StatelessWidget {
  const ChannelPermissionsOverridesView({
    required this.guildId,
    required this.entries,
    required this.selectedId,
    required this.rolesById,
    required this.canEdit,
    required this.onSelected,
    required this.onAddOverride,
    this.parentChannel,
    this.isSyncedWithParent,
    this.onSyncWithParent,
    this.scrollController,
    super.key,
  });

  final String guildId;
  final List<ChannelPermissionOverwriteEntry> entries;
  final String? selectedId;
  final Map<String, db.Role> rolesById;
  final bool canEdit;
  final ValueChanged<String> onSelected;
  final void Function(String id, int type, String name) onAddOverride;
  final Channel? parentChannel;
  final bool? isSyncedWithParent;
  final VoidCallback? onSyncWithParent;
  final ScrollController? scrollController;

  Set<String> get _existingOverwriteIds =>
      entries.map((ChannelPermissionOverwriteEntry entry) => entry.id).toSet();

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final bool useMobileTileStyle = isMobile;
    final bool showChevron = isMobile;
    final double horizontalPadding = isMobile ? context.layout.s4 : 8;
    final EdgeInsets contentPadding = EdgeInsets.fromLTRB(
      horizontalPadding,
      isMobile ? context.layout.s4 : 8,
      horizontalPadding,
      context.layout.s20,
    );
    return CustomScrollView(
      controller: scrollController,
      slivers: <Widget>[
        if (isSyncedWithParent != null && parentChannel != null)
          SliverPadding(
            padding: contentPadding.copyWith(bottom: context.layout.s4),
            sliver: SliverToBoxAdapter(
              child: ChannelPermissionsSyncBanner(
                isSyncedWithParent: isSyncedWithParent!,
                parentChannel: parentChannel!,
                canEdit: canEdit,
                onSyncWithParent: onSyncWithParent ?? () {},
              ),
            ),
          ),
        SliverPadding(
          padding: contentPadding.copyWith(
            top: isSyncedWithParent != null ? 0 : contentPadding.top,
            bottom: context.layout.s2,
          ),
          sliver: SliverToBoxAdapter(
            child: _buildAccessOverridesHeader(context, l10n, isMobile),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            0,
            horizontalPadding,
            contentPadding.bottom,
          ),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              final ChannelPermissionOverwriteEntry entry = entries[index];
              final bool isSelected = entry.id == selectedId;
              final db.Role? role = entry.type == 0
                  ? rolesById[entry.id]
                  : null;
              return Padding(
                padding: EdgeInsets.only(bottom: useMobileTileStyle ? 8 : 0),
                child: ChannelOverwriteListItem(
                  entry: entry,
                  isSelected: isSelected,
                  roleColor: role?.color,
                  showChevron: showChevron,
                  useMobileTileStyle: useMobileTileStyle,
                  onTap: () => onSelected(entry.id),
                ),
              );
            }, childCount: entries.length),
          ),
        ),
      ],
    );
  }

  Widget _buildAccessOverridesHeader(
    BuildContext context,
    FluxerLocalizations l10n,
    bool isMobile,
  ) {
    final Widget title = Text(
      l10n.channelSettingsPermissionsAccessOverrides,
      style: isMobile
          ? context.textStyles.heading
          : context.textStyles.categoryName,
      maxLines: isMobile ? 2 : 1,
      overflow: TextOverflow.ellipsis,
    );
    final Widget addOverrideControl = _buildAddOverrideControl(context, l10n);
    if (isMobile) {
      return SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: context.layout.s2,
          runSpacing: context.layout.s2,
          children: <Widget>[title, addOverrideControl],
        ),
      );
    }
    return Row(
      children: <Widget>[
        Expanded(child: title),
        SizedBox(width: context.layout.s2),
        addOverrideControl,
      ],
    );
  }

  Widget _buildAddOverrideControl(
    BuildContext context,
    FluxerLocalizations l10n,
  ) {
    final bool isMobile = isMobileLayout(context);
    final double maxPopoutWidth =
        MediaQuery.sizeOf(context).width -
        (isMobile ? context.layout.s4 * 2 : 16);
    return FluxerPopout(
      anchorBuilder: (BuildContext context, VoidCallback toggle) {
        return FluxerButton.secondary(
          onPressed: canEdit ? toggle : null,
          label: l10n.channelSettingsPermissionsAddOverride,
          size: FluxerButtonSize.small,
          icon: PhosphorIconsBold.plus,
          fitContent: true,
        );
      },
      contentBuilder: (BuildContext context, VoidCallback close) {
        return ChannelAddOverridePopout(
          guildId: guildId,
          rolesById: rolesById,
          existingOverwriteIds: _existingOverwriteIds,
          width: maxPopoutWidth,
          onSelect: onAddOverride,
          onClose: close,
        );
      },
    );
  }
}
