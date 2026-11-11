import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_guild_card.dart';
import 'package:fluxer_app/features/discovery/providers/discovery_controller.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

const double discoveryGridMinCardWidth = 380;
const double discoveryGridGap = 16;
const double _kDesktopCardMinWidth = 320;
const double _kDesktopCardMaxWidth = 400;

List<Widget> buildDiscoveryGuildGridSlivers({
  required BuildContext context,
  required DiscoveryState state,
  required bool isMobile,
  bool desktopPointer = false,
}) {
  final colors = context.colors;
  final layout = context.layout;
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  if (state.isLoading && state.guilds.isEmpty) {
    return <Widget>[
      const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: FluxerLoadingSpinner()),
      ),
    ];
  }
  if (!state.isLoading && state.guilds.isEmpty) {
    return <Widget>[
      SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(layout.s4),
            child: Text(
              l10n.discoveryNoCommunitiesMatch,
              style: context.textStyles.bodyMedium.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ];
  }
  if (desktopPointer) {
    return <Widget>[
      SliverPadding(
        padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, 0),
        sliver: SliverLayoutBuilder(
          builder: (BuildContext context, SliverConstraints constraints) {
            final double width = constraints.crossAxisExtent;
            final int columns = math.max(
              1,
              ((width + discoveryGridGap) /
                      (_kDesktopCardMinWidth + discoveryGridGap))
                  .floor(),
            );
            final double columnWidth =
                ((width - discoveryGridGap * (columns - 1)) / columns)
                    .clamp(0, _kDesktopCardMaxWidth)
                    .toDouble();
            final double gridWidth =
                columnWidth * columns + discoveryGridGap * (columns - 1);
            final double inset = math.max(0, (width - gridWidth) / 2);
            return SliverPadding(
              padding: EdgeInsets.only(
                left: inset,
                right: inset,
                bottom: discoveryGridGap,
              ),
              sliver: SliverMasonryGrid.count(
                crossAxisCount: columns,
                mainAxisSpacing: discoveryGridGap,
                crossAxisSpacing: discoveryGridGap,
                childCount: state.guilds.length,
                itemBuilder: (BuildContext context, int index) {
                  return DiscoveryGuildCard(guild: state.guilds[index]);
                },
              ),
            );
          },
        ),
      ),
      if (state.isLoadingMore)
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: FluxerLoadingSpinner()),
          ),
        ),
    ];
  }
  return <Widget>[
    SliverPadding(
      padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
      sliver: isMobile
          ? SliverList.separated(
              itemCount: state.guilds.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: discoveryGridGap);
              },
              itemBuilder: (BuildContext context, int index) {
                final DiscoveryGuildListResponseGuilds guild =
                    state.guilds[index];
                return DiscoveryGuildCard(guild: guild);
              },
            )
          : SliverMasonryGrid.extent(
              maxCrossAxisExtent: discoveryGridMinCardWidth,
              mainAxisSpacing: discoveryGridGap,
              crossAxisSpacing: discoveryGridGap,
              childCount: state.guilds.length,
              itemBuilder: (BuildContext context, int index) {
                final DiscoveryGuildListResponseGuilds guild =
                    state.guilds[index];
                return DiscoveryGuildCard(guild: guild);
              },
            ),
    ),
    if (state.isLoadingMore)
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24),
          child: Center(child: FluxerLoadingSpinner()),
        ),
      ),
  ];
}
