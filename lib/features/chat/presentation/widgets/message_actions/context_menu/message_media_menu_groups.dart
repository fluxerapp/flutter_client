import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_media_menu_target.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/context_menu/message_media_menu_entries.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/context_menu/search_provider_menu_items.dart';
import 'package:fluxer_app/features/ui/action_menu/context_menu_widgets.dart';
import 'package:fluxer_app/features/ui/action_menu/fluxer_action_menu.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

List<List<Widget>> buildMessageMediaMenuGroups({
  required BuildContext context,
  required WidgetRef ref,
  required MessageMediaMenuTarget target,
  required Message message,
  required MessageActionPermissions permissions,
  required MessageActionCallbacks callbacks,
  required MessageMenuHostAction runOnHost,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final MessageMediaMenuEntries entries = watchMessageMediaMenuEntries(
    ref: ref,
    l10n: l10n,
    target: target,
    message: message,
    permissions: permissions,
    callbacks: callbacks,
  );
  Widget row(MessageMediaMenuEntry entry, {bool withIcon = true}) =>
      ContextMenuItem(
        label: entry.label,
        icon: withIcon ? entry.icon : null,
        isDanger: entry.isDanger,
        onTap: () => runOnHost(entry.task),
      );

  final String? reverseQuery = entries.reverseImageQuery;
  final List<List<Widget>> moreGroups = <List<Widget>>[
    entries.favorites.map(row).toList(),
    entries.manage.map(row).toList(),
    if (reverseQuery != null)
      buildSearchProviderMenuItems(
        l10n: l10n,
        category: entries.reverseImageEngines,
        defaultLabel: l10n.chatMediaReverseImageSearch,
        icon: PhosphorIconsBold.magnifyingGlass,
        query: reverseQuery,
        onOpenUrl: (String url) => runOnHost(
          (BuildContext host, WidgetRef _) => handleExternalLinkTap(host, url),
        ),
      ),
    entries.danger.map(row).toList(),
  ].where((List<Widget> group) => group.isNotEmpty).toList();
  final List<Widget> moreItems = <Widget>[
    for (int i = 0; i < moreGroups.length; i++) ...<Widget>[
      if (i > 0) const FluxerMenuDivider(),
      ...moreGroups[i],
    ],
  ];

  return <List<Widget>>[
    <Widget>[
      for (final MessageMediaMenuEntry entry in entries.primary)
        row(entry, withIcon: false),
    ],
    <Widget>[
      for (final MessageMediaMenuEntry entry in entries.links)
        row(entry, withIcon: false),
      if (moreItems.isNotEmpty)
        FluxerMenuSubmenuItem(
          label: l10n.chatMediaMoreActions,
          submenuBuilder: (BuildContext _) => moreItems,
        ),
    ],
  ];
}
