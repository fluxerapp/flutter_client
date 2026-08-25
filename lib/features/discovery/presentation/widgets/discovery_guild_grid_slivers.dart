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

List<Widget> buildDiscoveryGuildGridSlivers({
  required BuildContext context,
  required DiscoveryState state,
  required bool isMobile,
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
