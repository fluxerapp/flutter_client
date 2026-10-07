import 'dart:async';

import 'package:fluxer_app/features/guilds/presentation/modals/invite_accept_modal.dart';
import 'package:fluxer_app/features/guilds/utils/invite_link_parser.dart';
import 'package:fluxer_app/material_ui.dart';

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
