import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_engine.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';
import 'package:protobuf/protobuf.dart' as $pb;

void expectAdapterRoundtrip<T>({
  required SyncedFieldAdapter<T> adapter,
  required T candidate,
}) {
  expect(adapter.verifyRoundtrip(candidate), isTrue);
}

void expectPushPreservesWireBaseField({
  required SyncedPreferenceField field,
  required $pb.GeneratedMessage localProto,
  required $pb.GeneratedMessage wireBaseProto,
  required $pb.GeneratedMessage Function({
    required $pb.GeneratedMessage local,
    $pb.GeneratedMessage? wireBase,
  })
  toProtoForPush,
}) {
  final pushed = toProtoForPush(local: localProto, wireBase: wireBaseProto);
  final fieldOnly = SyncedPreferencesWireCodec.encodeFieldIntoWire(
    currentWire: null,
    fieldNumber: field.fieldNumber,
    fieldMessageBytes: pushed.writeToBuffer(),
  );
  final wireBaseOnly = SyncedPreferencesWireCodec.encodeFieldIntoWire(
    currentWire: null,
    fieldNumber: field.fieldNumber,
    fieldMessageBytes: wireBaseProto.writeToBuffer(),
  );
  final merged = SyncedPreferencesWireCodec.encodeFieldIntoWire(
    currentWire: wireBaseOnly,
    fieldNumber: field.fieldNumber,
    fieldMessageBytes: pushed.writeToBuffer(),
  );
  expect(
    SyncedPreferencesWireCodec.verifyWirePreservesForeignFields(
      before: wireBaseOnly,
      after: merged,
      replacedFieldNumber: field.fieldNumber,
    ),
    isTrue,
  );
  expect(fieldOnly, isNot(equals(wireBaseOnly)));
  expect(
    SyncedPreferencesEngine.decodeLenient(merged).writeToBuffer(),
    isNotEmpty,
  );
}
