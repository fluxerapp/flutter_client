import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/domain/text_scale.dart';
import 'package:fluxer_app/features/bookmarks/presentation/widgets/bookmarks_sheet.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/mention_filters_sheet.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notification_row.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_mentions_body.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_tab_bar.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_unreads_body.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const double _kHeaderHeight = 66;
const double _kHeaderTitleFontSize = 20;
const double _kHeaderTitleLineHeight = 24;
const double _kHeaderTabsBottomPadding = 12;
const Duration _kTabSwitchDuration = Duration(milliseconds: 250);

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  late final PageController _pages = PageController(
    initialPage: ref.read(notificationsInboxSegmentProvider).index,
  );
  late final ValueNotifier<double> _position = ValueNotifier<double>(
    _pages.initialPage.toDouble(),
  );

  @override
  void initState() {
    super.initState();
    _pages.addListener(_onPageScrolled);
    ref.listenManual<NotificationsInboxTab>(notificationsInboxSegmentProvider, (
      _,
      NotificationsInboxTab next,
    ) {
      if (_pages.hasClients && _pages.page?.round() != next.index) {
        _animateTo(next.index);
      }
    });
  }

  @override
  void dispose() {
    _pages
      ..removeListener(_onPageScrolled)
      ..dispose();
    _position.dispose();
    super.dispose();
  }

  void _onPageScrolled() {
    _position.value = _pages.page ?? _position.value;
  }

  void _animateTo(int index) {
    _pages.animateToPage(
      index,
      duration: MediaQuery.disableAnimationsOf(context)
          ? Duration.zero
          : _kTabSwitchDuration,
      curve: Curves.easeOutCubic,
    );
  }

  void _select(int index) {
    ref
        .read(notificationsInboxSegmentProvider.notifier)
        .select(NotificationsInboxTab.values[index]);
  }

  void _openBookmarks() {
    if (isMobileLayout(context)) {
      unawaited(BookmarksSheet.show(context));
    } else {
      navigateToContent(context, RoutePaths.bookmarksPath);
    }
  }

  void _openOverflow() {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    unawaited(
      showMentionFiltersSheet(
        context,
        title: l10n.notificationsPageTitle,
        extraGroupBuilder: (BuildContext _, VoidCallback close) =>
            FluxerMenuGroup(
              children: <Widget>[
                FluxerBottomSheetSubmenuItem(
                  icon: PhosphorIconsBold.gear,
                  label: l10n.notificationSettings,
                  onTap: () {
                    close();
                    unawaited(
                      UserSettingsModal.show(
                        context,
                        initialSection: UserSettingsSection.notifications,
                        sectionOnly: true,
                      ),
                    );
                  },
                ),
              ],
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    return ColoredBox(
      color: colors.backgroundSecondary,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FluxerConstrainedUiTextScale(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: colors.backgroundHeaderSecondary),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    kNotificationRowHorizontalPadding,
                    0,
                    layout.s2,
                    _kHeaderTabsBottomPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: _kHeaderHeight - _kHeaderTabsBottomPadding,
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                l10n.notificationsPageTitle,
                                style: context.textStyles.heading.copyWith(
                                  fontSize: _kHeaderTitleFontSize,
                                  height:
                                      _kHeaderTitleLineHeight /
                                      _kHeaderTitleFontSize,
                                  fontWeight: FontWeight.w700,
                                  color: colors.textPrimary,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: _openBookmarks,
                              tooltip: l10n.notificationsBookmarksTooltip,
                              icon: Icon(
                                PhosphorIconsBold.bookmarkSimple,
                                color: colors.textPrimary,
                                size: 24,
                              ),
                            ),
                            IconButton(
                              onPressed: _openOverflow,
                              tooltip: l10n.chatMessageMore,
                              icon: Icon(
                                PhosphorIconsBold.dotsThree,
                                color: colors.textPrimary,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: kNotificationRowHorizontalPadding - layout.s2,
                        ),
                        child: NotificationsTabBar(
                          labels: <String>[
                            l10n.notificationsFilterUnreads,
                            l10n.notificationsFilterMentions,
                          ],
                          position: _position,
                          onSelected: _select,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pages,
                onPageChanged: _select,
                children: <Widget>[
                  _KeepAlivePage(
                    child: NotificationsUnreadsBody(
                      selected:
                          ref.watch(notificationsInboxSegmentProvider) ==
                          NotificationsInboxTab.unreads,
                    ),
                  ),
                  _KeepAlivePage(
                    child: NotificationsMentionsBody(
                      selected:
                          ref.watch(notificationsInboxSegmentProvider) ==
                          NotificationsInboxTab.mentions,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KeepAlivePage extends StatefulWidget {
  const _KeepAlivePage({required this.child});

  final Widget child;

  @override
  State<_KeepAlivePage> createState() => _KeepAlivePageState();
}

class _KeepAlivePageState extends State<_KeepAlivePage>
    with AutomaticKeepAliveClientMixin<_KeepAlivePage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
