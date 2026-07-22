import 'dart:convert';
import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/shared/services/guild_member_hydration_service.dart'
    show GuildMemberHydrationService;

int? _opaqueRoleColorValue(int? color) {
  if (color == null || color == 0) {
    return null;
  }

  return color | 0xFF000000;
}

Color? _resolveMemberRoleColor(
  Iterable<int?> roleColors, {
  int? fallbackColor,
}) {
  for (final color in roleColors) {
    final resolvedColor = _opaqueRoleColorValue(color);
    if (resolvedColor != null) {
      return Color(resolvedColor);
    }
  }

  final fallback = _opaqueRoleColorValue(fallbackColor);
  return fallback == null ? null : Color(fallback);
}

/// Returns the [Color] of a guild member's highest-positioned
/// role, or `null` when the member has no colored role.
///
/// Reads the local member row only. Member hydration is handled by
/// [GuildMemberHydrationService].
final FutureProviderFamily<Color?, (String, String)> memberRoleColorProvider =
    FutureProvider.autoDispose.family<Color?, (String, String)>((
      ref,
      args,
    ) async {
      final (userId, guildId) = args;
      final database = ref.watch(fluxerDatabaseProvider);

      final member = await database.memberDao.getMemberByUserId(
        userId,
        guildId,
      );
      if (member == null) {
        return null;
      }

      List<String> roleIds;
      try {
        final decoded = jsonDecode(member.roleIdsJson);
        roleIds = decoded is List ? decoded.cast<String>() : <String>[];
      } on Object {
        return null;
      }

      final roles = await database.roleDao.getRoles(guildId);
      final roleMap = {for (final role in roles) role.id: role};

      final memberRoles = [
        for (final roleId in roleIds)
          if (roleMap.containsKey(roleId)) roleMap[roleId]!,
      ]..sort((a, b) => b.position.compareTo(a.position));

      return _resolveMemberRoleColor(
        memberRoles.map((role) => role.color),
        fallbackColor: roleMap[guildId]?.color,
      );
    });
