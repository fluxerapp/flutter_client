import 'package:fluxer_dart/export.dart';

String inviteCodeOf(InviteMetadataResponseSchema invite) {
  return switch (invite) {
    InviteMetadataResponseSchema0(:final String code) => code,
    InviteMetadataResponseSchema1(:final String code) => code,
  };
}
