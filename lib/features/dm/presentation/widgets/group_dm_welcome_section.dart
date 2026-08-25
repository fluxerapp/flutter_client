import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/dm/domain/dm_conversation.dart';
import 'package:fluxer_app/features/dm/domain/group_dm_utils.dart';
import 'package:fluxer_app/features/dm/presentation/add_friends_to_group_flow.dart';
import 'package:fluxer_app/features/dm/presentation/edit_group_dm_flow.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/group_dm_avatar.dart';
import 'package:fluxer_app/features/dm/utils/group_dm_display_name.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GroupDmWelcomeSection extends ConsumerWidget {
  const GroupDmWelcomeSection({required this.dm, super.key});

  final DmConversation dm;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String? currentUserId = ref.watch(currentUserIdProvider);
    final String displayName = resolveGroupDmDisplayName(
      dm: dm,
      l10n: l10n,
      currentUserId: currentUserId,
    );
    final int maxGroupDmRecipients = ref.watch(
      instanceLimitProvider(LimitKeys.maxGroupDmRecipients),
    );
    final bool isGroupFull = isGroupDmFull(
      memberCount: dm.recipientCount,
      maxGroupDmRecipients: maxGroupDmRecipients,
    );
    final TextStyle welcomeStyle = context.textStyles.bodyMedium.copyWith(
      fontSize: 18,
      height: 28 / 18,
      color: context.colors.textPrimary,
    );
    final TextStyle welcomeNameStyle = welcomeStyle.copyWith(
      fontWeight: FontWeight.w600,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 64, 32, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          groupDmAvatarCluster(dm: dm, size: 80, status: dm.groupStatus),
          const SizedBox(height: 16),
          Text(
            displayName,
            style: context.textStyles.channelName.copyWith(
              fontSize: 24,
              height: 1.25,
              fontWeight: FontWeight.w600,
              color: context.colors.textPrimary,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 24),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: welcomeStyle,
              children: _groupDmWelcomeSpans(
                welcomeText: l10n.groupDmWelcome(displayName),
                displayName: displayName,
                textStyle: welcomeStyle,
                nameStyle: welcomeNameStyle,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: <Widget>[
              FluxerButton.secondary(
                label: l10n.groupDmWelcomeEditGroup,
                icon: PhosphorIconsFill.notePencil,
                fitContent: true,
                onPressed: () =>
                    unawaited(EditGroupDmFlow.show(context, dm: dm)),
              ),
              if (!isGroupFull)
                FluxerButton.primary(
                  label: l10n.groupDmWelcomeAddFriends,
                  icon: PhosphorIconsFill.userPlus,
                  fitContent: true,
                  onPressed: () => unawaited(
                    AddFriendsToGroupFlow.show(context, ref, dm: dm),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

List<InlineSpan> _groupDmWelcomeSpans({
  required String welcomeText,
  required String displayName,
  required TextStyle textStyle,
  required TextStyle nameStyle,
}) {
  final int nameIndex = welcomeText.indexOf(displayName);
  if (nameIndex < 0) {
    return <InlineSpan>[TextSpan(text: welcomeText, style: textStyle)];
  }
  return <InlineSpan>[
    TextSpan(text: welcomeText.substring(0, nameIndex), style: textStyle),
    TextSpan(text: displayName, style: nameStyle),
    TextSpan(
      text: welcomeText.substring(nameIndex + displayName.length),
      style: textStyle,
    ),
  ];
}
