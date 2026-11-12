import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_badges.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_banner.dart';
import 'package:fluxer_app/features/profile/utils/profile_badge_media.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

const double kUserProfilePopoutWidth = 305;
const double _kBorderWidth = 2.5;
const double _kBannerHeight = 105;
const double _kHeaderHeight = 140;
const double _kAvatarLeft = 10;
const double _kAvatarTop = 55;
const double _kOuterRadius = 6;
const double _kBadgesBottomOverhang = 5;
const double _kBadgesEnd = 10;
const double _kBadgesReservedWidth = 112;

class UserProfilePopoutFrame extends StatelessWidget {
  const UserProfilePopoutFrame({
    required this.scrollController,
    required this.accentColor,
    required this.bannerUrl,
    required this.avatar,
    required this.badges,
    required this.children,
    this.topEndAction,
    this.footer,
    super.key,
  });

  final ScrollController scrollController;
  final Color accentColor;
  final String? bannerUrl;
  final Widget avatar;
  final List<ProfileBadgeResponse> badges;
  final List<Widget> children;
  final Widget? topEndAction;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final Widget? footerWidget = footer;
    final Widget? action = topEndAction;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colors.backgroundPrimary,
        border: Border.all(color: accentColor, width: _kBorderWidth),
        borderRadius: BorderRadius.circular(_kOuterRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_kOuterRadius - _kBorderWidth),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: CustomScrollView(
                controller: scrollController,
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: _kHeaderHeight,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            height: _kBannerHeight,
                            child: UserProfileBanner(
                              bannerUrl: bannerUrl,
                              bannerColor: accentColor,
                            ),
                          ),
                          PositionedDirectional(
                            start: _kAvatarLeft,
                            top: _kAvatarTop,
                            child: avatar,
                          ),
                          if (action != null)
                            PositionedDirectional(
                              top: layout.s2,
                              end: layout.s2,
                              child: action,
                            ),
                          if (badges.isNotEmpty)
                            PositionedDirectional(
                              bottom: -_kBadgesBottomOverhang,
                              end: _kBadgesEnd,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth:
                                      kUserProfilePopoutWidth -
                                      _kBorderWidth * 2 -
                                      _kBadgesReservedWidth,
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: context.colors.backgroundSecondary
                                        .withValues(
                                          alpha:
                                              context
                                                  .colors
                                                  .backgroundSecondary
                                                  .a *
                                              0.8,
                                        ),
                                    borderRadius: layout.radiusMd,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(layout.s1),
                                    child: UserProfileBadges(
                                      badges: badges,
                                      maxVisible:
                                          kProfileBadgesCompactMaxVisible,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                      layout.s4,
                      layout.s3,
                      layout.s4,
                      footerWidget == null ? layout.s3 : 0,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate.fixed(children),
                    ),
                  ),
                ],
              ),
            ),
            if (footerWidget != null)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  layout.s3,
                  layout.s4 + layout.s1,
                  layout.s3,
                  layout.s3,
                ),
                child: footerWidget,
              ),
          ],
        ),
      ),
    );
  }
}
