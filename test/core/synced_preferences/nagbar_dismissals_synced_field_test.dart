import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/fields/nagbar_dismissals_synced_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/shell/domain/nagbar_dismissals_state.dart';

NagbarDismissalsSyncedField _field() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container.read(
    Provider<NagbarDismissalsSyncedField>(NagbarDismissalsSyncedField.new),
  );
}

void main() {
  group('NagbarDismissalsSyncedField guild MFA requirement', () {
    test('round-trips dismissed guild ids', () {
      final NagbarDismissalsSyncedField field = _field();
      const NagbarDismissalsState local = NagbarDismissalsState(
        guildMfaRequirementDismissed: <String>{'1', '2'},
      );
      final pb.NagbarDismissals proto = field.createEmptyProto();
      field.writeProto(proto, local);
      expect(proto.guildMfaRequirement, <String, bool>{'1': true, '2': true});
      expect(field.fromProto(proto).guildMfaRequirementDismissed, <String>{
        '1',
        '2',
      });
    });

    test('ignores entries stored as false', () {
      final pb.NagbarDismissals proto = pb.NagbarDismissals()
        ..guildMfaRequirement.addAll(<String, bool>{'1': true, '2': false});
      expect(_field().fromProto(proto).guildMfaRequirementDismissed, <String>{
        '1',
      });
    });

    test('compares dismissed guild ids by contents', () {
      final NagbarDismissalsSyncedField field = _field();
      expect(
        field.statesEqual(
          const NagbarDismissalsState(
            guildMfaRequirementDismissed: <String>{'1', '2'},
          ),
          const NagbarDismissalsState(
            guildMfaRequirementDismissed: <String>{'2', '1'},
          ),
        ),
        isTrue,
      );
      expect(
        field.statesEqual(
          const NagbarDismissalsState(
            guildMfaRequirementDismissed: <String>{'1'},
          ),
          const NagbarDismissalsState(
            guildMfaRequirementDismissed: <String>{'2'},
          ),
        ),
        isFalse,
      );
    });
  });
}
