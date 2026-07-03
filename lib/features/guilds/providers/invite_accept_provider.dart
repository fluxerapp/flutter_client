import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'invite_accept_provider.g.dart';

sealed class InviteAcceptState {}

class InviteAcceptLoading extends InviteAcceptState {}

class InviteAcceptNotFound extends InviteAcceptState {}

class InviteAcceptGuild extends InviteAcceptState {
  InviteAcceptGuild(this.invite);
  final InviteResponseSchemaGuildInviteResponse invite;
}

class InviteAcceptGroupDm extends InviteAcceptState {
  InviteAcceptGroupDm(this.invite);
  final InviteResponseSchemaGroupDmInviteResponse invite;
}

class InviteAcceptPack extends InviteAcceptState {
  InviteAcceptPack(this.invite);
  final InviteResponseSchemaPackInviteResponse invite;
}

@riverpod
Future<InviteAcceptState> inviteAccept(Ref ref, String code) async {
  final client = ref.watch(fluxerClientProvider);
  try {
    final InviteResponseSchema schema = await client.invites.getInvite(
      inviteCode: code,
    );
    final int? typeVal = schema.toJson()['type'] as int?;
    return switch (typeVal) {
      0 => InviteAcceptGuild(schema.toGuildInviteResponse()),
      1 => InviteAcceptGroupDm(schema.toGroupDmInviteResponse()),
      2 || 3 => InviteAcceptPack(schema.toPackInviteResponse()),
      _ => InviteAcceptNotFound(),
    };
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) {
      return InviteAcceptNotFound();
    }
    rethrow;
  }
}
