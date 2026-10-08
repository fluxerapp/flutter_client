part of 'guild_sidebar.dart';

class GuildSidebarHeader extends StatelessWidget {
  const GuildSidebarHeader({
    required this.guild,
    required this.outageUnavailable,
    required this.onTap,
    super.key,
  });

  final Guild? guild;
  final bool outageUnavailable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool mobile = isMobileLayout(context);
    final Size viewport = MediaQuery.sizeOf(context);
    final double width = mobile ? viewport.width : context.layout.sidebarWidth;
    final double fullHeight =
        guild != null && !outageUnavailable && guild!.banner != null
        ? guildSidebarBannerHeight(
            width: width,
            viewportHeight: viewport.height,
          )
        : kGuildSidebarHeaderMinHeight;

    return GuildSidebarHeaderBody(
      guild: guild,
      outageUnavailable: outageUnavailable,
      onTap: onTap,
      collapseRatio: 0,
      height: fullHeight,
    );
  }
}

class GuildSidebarHeaderDelegate extends SliverPersistentHeaderDelegate {
  GuildSidebarHeaderDelegate({
    required this.guild,
    required this.outageUnavailable,
    required this.onTap,
    required this.bannerWidth,
    required this.viewportHeight,
  });

  final Guild guild;
  final bool outageUnavailable;
  final VoidCallback? onTap;
  final double bannerWidth;
  final double viewportHeight;

  bool get _hasBanner => !outageUnavailable && guild.banner != null;

  @override
  double get maxExtent => _hasBanner
      ? guildSidebarBannerHeight(
          width: bannerWidth,
          viewportHeight: viewportHeight,
        )
      : kGuildSidebarHeaderMinHeight;

  @override
  double get minExtent => kGuildSidebarHeaderMinHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double range = maxExtent - minExtent;
    final double collapse = range <= 0
        ? 1
        : (shrinkOffset / range).clamp(0.0, 1.0);

    return GuildSidebarHeaderBody(
      guild: guild,
      outageUnavailable: outageUnavailable,
      onTap: onTap,
      collapseRatio: collapse,
      height: (maxExtent - shrinkOffset).clamp(minExtent, maxExtent),
    );
  }

  @override
  bool shouldRebuild(covariant GuildSidebarHeaderDelegate oldDelegate) {
    return oldDelegate.guild.id != guild.id ||
        oldDelegate.guild.banner != guild.banner ||
        oldDelegate.outageUnavailable != outageUnavailable ||
        oldDelegate.bannerWidth != bannerWidth ||
        oldDelegate.viewportHeight != viewportHeight;
  }
}

class GuildSidebarHeaderBody extends StatelessWidget {
  const GuildSidebarHeaderBody({
    required this.guild,
    required this.outageUnavailable,
    required this.onTap,
    required this.collapseRatio,
    required this.height,
    super.key,
  });

  final Guild? guild;
  final bool outageUnavailable;
  final VoidCallback? onTap;
  final double collapseRatio;
  final double height;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String headerTitle = outageUnavailable
        ? (guild?.name ?? l10n.communityTemporarilyUnavailable)
        : guild?.name ?? '';
    final bool showBannerImage = !outageUnavailable && guild?.banner != null;
    final double bannerForeground = (1 - collapseRatio).clamp(0.0, 1.0);
    final Color sidebarBackground = context.colors.channelSidebarBackground;
    final Color titleColor = Color.lerp(
      Colors.white,
      context.colors.textPrimary,
      collapseRatio,
    )!;
    final Color caretColor = Color.lerp(
      Colors.white,
      context.colors.textChat,
      collapseRatio,
    )!;
    final List<Shadow> bannerShadows = bannerForeground > 0
        ? <Shadow>[
            Shadow(
              color: const Color(
                0xCC000000,
              ).withValues(alpha: 0.7 * bannerForeground),
              offset: const Offset(0, 1),
              blurRadius: 18,
            ),
          ]
        : const <Shadow>[];

    final Widget headerRow = FluxerGestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        children: [
          if (guild != null &&
              !outageUnavailable &&
              (guild!.isPartnered ||
                  guild!.isVerified ||
                  guild!.isDiscoverable))
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: FluxerGuildBadge(
                features: guild!.features,
                shadows: bannerShadows,
                color: bannerForeground > 0.5 ? Colors.white : null,
                forceBrightness: bannerForeground > 0.5
                    ? Brightness.dark
                    : null,
              ),
            ),
          Expanded(
            child: Text(
              headerTitle,
              style: context.textStyles.channelName.copyWith(
                color: titleColor,
                shadows: bannerShadows,
                height: 1.25,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textHeightBehavior: const TextHeightBehavior(
                applyHeightToFirstAscent: false,
                applyHeightToLastDescent: false,
              ),
            ),
          ),
          if (!outageUnavailable)
            PhosphorIcon(
              PhosphorIconsFill.caretDown,
              color: caretColor,
              size: 16,
              shadows: bannerShadows,
            ),
        ],
      ),
    );

    final bool overlayTitleOnBanner = showBannerImage;

    return SizedBox(
      height: height,
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: sidebarBackground,
          border: Border(bottom: BorderSide(color: context.colors.borderColor)),
        ),
        child: ClipRect(
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (showBannerImage)
                Positioned.fill(
                  child: Opacity(
                    opacity: bannerForeground,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(guild!.bannerUrl!),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ),
              if (showBannerImage && bannerForeground > 0)
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 40,
                  child: IgnorePointer(
                    child: Opacity(
                      opacity: bannerForeground,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              context.colors.guildBannerGradient,
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              if (overlayTitleOnBanner)
                Positioned(
                  top: kGuildSidebarHeaderTopInset,
                  left: 16,
                  right: 16,
                  child: headerRow,
                )
              else
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: kGuildSidebarHeaderMinHeight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Center(child: headerRow),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
