import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/message_list_page_shell.dart';
import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_mentions_body.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class RecentMentionsPage extends ConsumerStatefulWidget {
  const RecentMentionsPage({super.key});

  @override
  ConsumerState<RecentMentionsPage> createState() => _RecentMentionsPageState();
}

class _RecentMentionsPageState extends ConsumerState<RecentMentionsPage> {
  NotificationsMentionsOpenFilterInvoker? _filterInvoker;

  void _onFilterInvokerChanged(
    NotificationsMentionsOpenFilterInvoker? invoker,
  ) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      setState(() => _filterInvoker = invoker);
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return MessageListPageShell(
      icon: PhosphorIcon(
        PhosphorIconsFill.at,
        size: 24,
        color: context.colors.textPrimaryMuted,
      ),
      title: l10n.notificationsFilterMentions,
      trailing: Tooltip(
        message: l10n.notificationsMentionFilterTooltip,
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
          onPressed: _filterInvoker == null
              ? null
              : () => unawaited(_filterInvoker!()),
          icon: Icon(
            PhosphorIconsBold.funnel,
            color: context.colors.textSecondary,
            size: 22,
          ),
        ),
      ),
      body: NotificationsMentionsBody(
        onOpenFilterInvokerChanged: _onFilterInvokerChanged,
      ),
    );
  }
}
