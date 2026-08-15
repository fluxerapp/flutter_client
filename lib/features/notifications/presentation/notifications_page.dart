import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/text_scale.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/bookmarks_sheet.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_mentions_body.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_unreads_body.dart';
import 'package:fluxer_app/features/notifications/providers/notifications_providers.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NotificationsPage extends ConsumerStatefulWidget {
  const NotificationsPage({super.key});

  @override
  ConsumerState<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends ConsumerState<NotificationsPage> {
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
    final NotificationsInboxTab segment = ref.watch(
      notificationsInboxSegmentProvider,
    );
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
            FluxerConstrainedUiTextScale(
              child: Container(
                constraints: const BoxConstraints(minHeight: 55),
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (segment == NotificationsInboxTab.mentions) ...[
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
                            PhosphorIconsBold.funnel,
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
                            navigateToContent(
                              context,
                              RoutePaths.bookmarksPath,
                            );
                          }
                        },
                        icon: Icon(
                          PhosphorIconsFill.bookmarkSimple,
                          color: colors.textSecondary,
                          size: 22,
                        ),
                      ),
                    ),
                    FluxerSelect<NotificationsInboxTab>(
                      hint: '',
                      enableSearch: false,
                      useShellTabOverlayNavigator: true,
                      value: segment,
                      items: <FluxerSelectItem<NotificationsInboxTab>>[
                        FluxerSelectItem<NotificationsInboxTab>(
                          value: NotificationsInboxTab.unreads,
                          label: l10n.notificationsFilterUnreads,
                        ),
                        FluxerSelectItem<NotificationsInboxTab>(
                          value: NotificationsInboxTab.mentions,
                          label: l10n.notificationsFilterMentions,
                        ),
                      ],
                      onChanged: (NotificationsInboxTab next) {
                        ref
                            .read(notificationsInboxSegmentProvider.notifier)
                            .set(next);
                      },
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: segment == NotificationsInboxTab.unreads
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
