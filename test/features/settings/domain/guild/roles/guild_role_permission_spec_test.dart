import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/settings/domain/guild/roles/guild_role_permission_spec.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations_en.dart';

void main() {
  final FluxerLocalizations l10n = FluxerLocalizationsEn();

  test('generateGuildPermissionSpec returns five categories', () {
    final List<GuildPermissionCategorySpec> specs = generateGuildPermissionSpec(
      l10n,
    );
    expect(specs, hasLength(5));
    expect(specs.first.title, l10n.permissionCategoryCommunityWide);
    expect(
      specs.last.permissions.map((entry) => entry.flag),
      contains(Permission.updateRtcRegion),
    );
  });

  test('filterGuildPermissionSpec matches permission titles', () {
    final List<GuildPermissionCategorySpec> specs = generateGuildPermissionSpec(
      l10n,
    );
    final List<GuildPermissionCategorySpec> filtered =
        filterGuildPermissionSpec(specs: specs, query: 'pin');
    expect(filtered, isNotEmpty);
    expect(
      filtered
          .expand((spec) => spec.permissions)
          .any((entry) => entry.flag == Permission.pinMessages),
      isTrue,
    );
  });
}
