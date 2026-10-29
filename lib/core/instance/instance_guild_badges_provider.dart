import 'package:fluxer_app/core/providers/instance/active_instance_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'instance_guild_badges_provider.g.dart';

@riverpod
List<InstanceGuildBadgeSchema> instanceGuildBadges(Ref ref) {
  final badges =
      ref.watch(activeInstanceProvider).wellKnown?.guildBadges ??
      const <InstanceGuildBadgeSchema>[];
  return List<InstanceGuildBadgeSchema>.from(badges);
}

List<InstanceGuildBadgeSchema> resolveGuildCustomBadges({
  required List<String> badgeIds,
  required List<InstanceGuildBadgeSchema> catalog,
  int? limit,
}) {
  if (badgeIds.isEmpty || catalog.isEmpty) {
    return const <InstanceGuildBadgeSchema>[];
  }
  final Set<String> assigned = badgeIds.toSet();
  final List<InstanceGuildBadgeSchema> resolved = catalog
      .where((InstanceGuildBadgeSchema badge) => assigned.contains(badge.id))
      .toList(growable: false);
  if (limit == null || resolved.length <= limit) {
    return resolved;
  }
  return resolved.take(limit).toList(growable: false);
}
