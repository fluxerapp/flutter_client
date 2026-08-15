import 'dart:async';

import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/invite_accept_modal.dart';
import 'package:fluxer_app/features/guilds/utils/invite_link_parser.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

bool isInviteLink(String url) {
  return parseInviteCode(url) != null;
}

Future<void> handleInviteLinkTap(BuildContext context, String url) async {
  final String? code = parseInviteCode(url);
  if (code == null || code.isEmpty) {
    return;
  }
  await showInviteAcceptModal(context, code: code);
}

Future<void> navigateToInviteLink({
  required BuildContext context,
  required String code,
}) async {
  await context.push(RoutePaths.inviteLink(code));
}
