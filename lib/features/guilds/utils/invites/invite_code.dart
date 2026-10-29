import 'package:fluxer_dart/export.dart';

bool inviteResponseIsGuild(InviteResponseSchema invite) {
  return _inviteTypeIsGuild(invite.toJson()['type']);
}

bool inviteMetadataIsGuild(InviteMetadataResponseSchema invite) {
  return _inviteTypeIsGuild(invite.toJson()['type']);
}

bool _inviteTypeIsGuild(Object? type) {
  return type == 0 || type == 0.0;
}

String inviteCodeOf(InviteMetadataResponseSchema invite) {
  final Object? code = invite.toJson()['code'];
  return code is String ? code : '';
}
