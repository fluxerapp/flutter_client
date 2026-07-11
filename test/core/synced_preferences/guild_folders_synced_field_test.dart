import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/guild_folders_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;

void main() {
  group('GuildFoldersSyncedField', () {
    test('roundtrips expanded folder ids through proto', () {
      const local = <int>{42, 7, 1001};
      final proto = GuildFoldersSyncedField.toProto(local);
      final restored = GuildFoldersSyncedField.fromProto(proto);
      expect(restored, local);
    });

    test('maps fixed64 ids to Dart ints', () {
      final proto = pb.GuildFolderExpandedState(
        expandedFolderIds: [Int64(123456789)],
      );
      final restored = GuildFoldersSyncedField.fromProto(proto);
      expect(restored, {123456789});
    });

    test('mergeForMigration unions expanded folder ids', () {
      const local = <int>{1, 2};
      const remote = <int>{2, 3};
      expect({...local, ...remote}, {1, 2, 3});
    });

    test('isRemoteShrink detects remote collapse while dirty', () {
      expect(
        GuildFoldersSyncedField.isRemoteShrink(
          local: {1, 2, 3},
          remote: {1, 2},
        ),
        isTrue,
      );
      expect(
        GuildFoldersSyncedField.isRemoteShrink(
          local: {1, 2},
          remote: {1, 2, 3},
        ),
        isFalse,
      );
    });

    test('isLocalShrink detects local collapse while dirty', () {
      expect(
        GuildFoldersSyncedField.isLocalShrink(local: {1, 2}, remote: {1, 2, 3}),
        isTrue,
      );
      expect(
        GuildFoldersSyncedField.isLocalShrink(local: {1, 2, 3}, remote: {1, 2}),
        isFalse,
      );
    });
  });
}
