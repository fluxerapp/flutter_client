import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/bookmarks_sheet.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_mentions_body.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_unreads_body.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum _NotificationTabSegment { unreads, mentions }

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
  _NotificationTabSegment _segment = _NotificationTabSegment.mentions;

  NotificationsMentionsOpenFilterInvoker? _mentionsFilterInvoker;

  void _onMentionsOpenFilterInvokerChanged(
    NotificationsMentionsOpenFilterInvoker? invoker,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() => _mentionsFilterInvoker = invoker);
    });
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
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: colors.backgroundSecondary,
                border: Border(
                  bottom: BorderSide(color: colors.backgroundHeaderSecondary),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: layout.s3,
                vertical: layout.s1,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.notificationsPageTitle,
                      style: context.textStyles.heading.copyWith(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  if (_segment == _NotificationTabSegment.mentions) ...[
                    Tooltip(
                      message: l10n.notificationsMentionFilterTooltip,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 36,
                          minHeight: 36,
                        ),
                        onPressed: _mentionsFilterInvoker == null
                            ? null
                            : () => unawaited(_mentionsFilterInvoker!()),
                        icon: Icon(
                          PhosphorIconsRegular.funnel,
                          color: colors.textSecondary,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                  Tooltip(
                    message: l10n.notificationsBookmarksTooltip,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(
                        minWidth: 36,
                        minHeight: 36,
                      ),
                      onPressed: () {
                        if (isMobileLayout(context)) {
                          unawaited(BookmarksSheet.show(context));
                        } else {
                          navigateToContent(context, RoutePaths.bookmarksPath);
                        }
                      },
                      icon: Icon(
                        PhosphorIconsFill.bookmarkSimple,
                        color: colors.textSecondary,
                        size: 22,
                      ),
                    ),
                  ),
                  FluxerSelect<_NotificationTabSegment>(
                    hint: '',
                    enableSearch: false,
                    value: _segment,
                    items: <FluxerSelectItem<_NotificationTabSegment>>[
                      FluxerSelectItem<_NotificationTabSegment>(
                        value: _NotificationTabSegment.unreads,
                        label: l10n.notificationsFilterUnreads,
                      ),
                      FluxerSelectItem<_NotificationTabSegment>(
                        value: _NotificationTabSegment.mentions,
                        label: l10n.notificationsFilterMentions,
                      ),
                    ],
                    onChanged: (_NotificationTabSegment next) {
                      setState(() => _segment = next);
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: _segment == _NotificationTabSegment.unreads
                  ? const NotificationsUnreadsBody()
                  : NotificationsMentionsBody(
                      onOpenFilterInvokerChanged:
                          _onMentionsOpenFilterInvokerChanged,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
