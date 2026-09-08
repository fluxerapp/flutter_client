import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/invite_people_recipient.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/invite_people_content.dart';
import 'package:fluxer_app/features/guilds/utils/invite_people_actions.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class InvitePeopleFlow {
  InvitePeopleFlow._();

  static Future<void> show(
    BuildContext context, {
    required String communityName,
    required InvitePeopleCreateFn createInvite,
    required Future<List<InvitePeopleRecipient>> Function() getRecipients,
    required InvitePeopleSendFn sendInvite,
    String? vanityUrl,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String title = l10n.guildNavbarInviteFriendsTo(communityName);
    if (isMobileLayout(context)) {
      return FluxerBottomSheet.showScrollable<void>(
        context,
        title: title,
        useRootNavigator: true,
        minChildSize: 0.5,
        builder:
            (
              BuildContext sheetContext,
              ScrollController scrollController,
              VoidCallback close,
            ) {
              return _content(
                host: sheetContext,
                createInvite: createInvite,
                getRecipients: getRecipients,
                sendInvite: sendInvite,
                vanityUrl: vanityUrl,
                scrollController: scrollController,
              );
            },
      );
    }
    return FluxerModal.show<void>(
      context,
      useRootNavigator: true,
      title: title,
      builder: (BuildContext dialogContext, VoidCallback close) {
        return SizedBox(
          height: 480,
          child: _content(
            host: dialogContext,
            createInvite: createInvite,
            getRecipients: getRecipients,
            sendInvite: sendInvite,
            vanityUrl: vanityUrl,
          ),
        );
      },
    );
  }

  static InvitePeopleContent _content({
    required BuildContext host,
    required InvitePeopleCreateFn createInvite,
    required Future<List<InvitePeopleRecipient>> Function() getRecipients,
    required InvitePeopleSendFn sendInvite,
    String? vanityUrl,
    ScrollController? scrollController,
  }) {
    return InvitePeopleContent(
      createInvite: createInvite,
      getRecipients: getRecipients,
      sendInvite: sendInvite,
      vanityUrl: vanityUrl,
      fill: true,
      scrollController: scrollController,
      onEditLink: () => showInviteLinkSettings(host),
    );
  }

  static Future<({int maxAge, int maxUses, bool temporary})?>
  showInviteLinkSettings(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    var maxAge = kDefaultInviteMaxAgeSeconds;
    var maxUses = 0;
    var temporary = false;

    Widget form() {
      return StatefulBuilder(
        builder:
            (BuildContext context, void Function(void Function()) setState) {
              final colors = context.colors;
              final textStyles = context.textStyles;
              final layout = context.layout;
              return Column(
                mainAxisSize: MainAxisSize.min,
                spacing: layout.s4,
                children: <Widget>[
                  FluxerSelect<int>(
                    label: l10n.guildNavbarExpireAfter,
                    value: maxAge,
                    items: <FluxerSelectItem<int>>[
                      FluxerSelectItem(value: 0, label: l10n.guildNavbarNever),
                      FluxerSelectItem(
                        value: 1800,
                        label: l10n.guildNavbarDuration30Minutes,
                      ),
                      FluxerSelectItem(
                        value: 3600,
                        label: l10n.guildNavbarDuration1Hour,
                      ),
                      FluxerSelectItem(
                        value: 21600,
                        label: l10n.guildNavbarDuration6Hours,
                      ),
                      FluxerSelectItem(
                        value: 43200,
                        label: l10n.guildNavbarDuration12Hours,
                      ),
                      FluxerSelectItem(
                        value: 86400,
                        label: l10n.guildNavbarDuration1Day,
                      ),
                      FluxerSelectItem(
                        value: kDefaultInviteMaxAgeSeconds,
                        label: l10n.guildNavbarDuration7Days,
                      ),
                    ],
                    onChanged: (int v) => setState(() => maxAge = v),
                  ),
                  FluxerSelect<int>(
                    label: l10n.guildNavbarMaxUses,
                    value: maxUses,
                    items: <FluxerSelectItem<int>>[
                      FluxerSelectItem(
                        value: 0,
                        label: l10n.guildNavbarNoLimit,
                      ),
                      FluxerSelectItem(value: 1, label: l10n.guildNavbarOneUse),
                      FluxerSelectItem(
                        value: 5,
                        label: l10n.guildNavbarUses(5),
                      ),
                      FluxerSelectItem(
                        value: 10,
                        label: l10n.guildNavbarUses(10),
                      ),
                      FluxerSelectItem(
                        value: 25,
                        label: l10n.guildNavbarUses(25),
                      ),
                      FluxerSelectItem(
                        value: 50,
                        label: l10n.guildNavbarUses(50),
                      ),
                      FluxerSelectItem(
                        value: 100,
                        label: l10n.guildNavbarUses(100),
                      ),
                    ],
                    onChanged: (int v) => setState(() => maxUses = v),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      FluxerToggleSwitch(
                        value: temporary,
                        onChanged: (bool v) => setState(() => temporary = v),
                        label: l10n.guildNavbarGrantTemporaryMembership,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: layout.s1),
                        child: Text(
                          l10n.guildNavbarTemporaryMembershipDescription,
                          style: textStyles.timestamp.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
      );
    }

    if (isMobileLayout(context)) {
      return FluxerBottomSheet.show<
        ({int maxAge, int maxUses, bool temporary})
      >(
        context,
        useRootNavigator: true,
        title: l10n.guildNavbarInviteLinkSettings,
        builder: (BuildContext sheetContext, VoidCallback close) {
          final layout = sheetContext.layout;
          return Padding(
            padding: EdgeInsets.fromLTRB(layout.s4, 0, layout.s4, layout.s4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                form(),
                SizedBox(height: layout.s4),
                FluxerButton.primary(
                  onPressed: () => Navigator.of(sheetContext).pop((
                    maxAge: maxAge,
                    maxUses: maxUses,
                    temporary: temporary,
                  )),
                  label: l10n.guildNavbarCreateNewLink,
                ),
                SizedBox(height: layout.s2),
                FluxerButton.secondary(onPressed: close, label: l10n.cancel),
              ],
            ),
          );
        },
      );
    }

    return FluxerModal.show<({int maxAge, int maxUses, bool temporary})>(
      context,
      useRootNavigator: true,
      title: l10n.guildNavbarInviteLinkSettings,
      builder: (BuildContext dialogContext, VoidCallback close) => form(),
      actionsBuilder:
          (
            void Function([({int maxAge, int maxUses, bool temporary})? result])
            pop,
          ) => <Widget>[
            FluxerButton.primary(
              onPressed: () =>
                  pop((maxAge: maxAge, maxUses: maxUses, temporary: temporary)),
              label: l10n.guildNavbarCreateNewLink,
            ),
            const SizedBox(height: 8),
            FluxerButton.secondary(onPressed: () => pop(), label: l10n.cancel),
          ],
    );
  }
}
