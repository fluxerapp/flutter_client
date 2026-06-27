import 'dart:convert';
import 'dart:typed_data';

import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_wire_codec.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;

class SyncedPreferencesDecodeException implements Exception {
  SyncedPreferencesDecodeException(this.message);

  final String message;

  @override
  String toString() => 'SyncedPreferencesDecodeException: $message';
}

class SyncedPreferencesEngine {
  const SyncedPreferencesEngine._();

  static pb.SyncedPreferences createEmpty() => pb.SyncedPreferences();

  static Uint8List decodeBytes(String? encoded) {
    if (encoded == null || encoded.isEmpty) {
      return Uint8List(0);
    }
    try {
      return base64Decode(encoded);
    } on Object catch (error) {
      throw SyncedPreferencesDecodeException(
        error is FormatException ? error.message : 'invalid base64',
      );
    }
  }

  static pb.SyncedPreferences decode(String? encoded) {
    final bytes = decodeBytes(encoded);
    if (bytes.isEmpty) {
      return createEmpty();
    }
    try {
      return pb.SyncedPreferences.fromBuffer(bytes);
    } on Object catch (error) {
      throw SyncedPreferencesDecodeException(error.toString());
    }
  }

  static pb.SyncedPreferences decodeLenient(String? encoded) {
    try {
      return decode(encoded);
    } on SyncedPreferencesDecodeException {
      return createEmpty();
    }
  }

  static String encode(pb.SyncedPreferences preferences) {
    final bytes = preferences.writeToBuffer();
    if (bytes.isEmpty) {
      return '';
    }
    return base64Encode(bytes);
  }

  static Uint8List preferencesToBytes(pb.SyncedPreferences preferences) {
    return preferences.writeToBuffer();
  }

  static pb.SyncedPreferences preferencesFromBytes(Uint8List bytes) {
    if (bytes.isEmpty) {
      return createEmpty();
    }
    return pb.SyncedPreferences.fromBuffer(bytes);
  }

  static List<SyncedPreferenceField> changedFields({
    required pb.SyncedPreferences left,
    required pb.SyncedPreferences right,
  }) {
    return _toFieldNames(
      _changedFieldNumbers(preferencesToBytes(left), preferencesToBytes(right)),
    );
  }

  static pb.SyncedPreferences copyField({
    required pb.SyncedPreferences target,
    required pb.SyncedPreferences source,
    required SyncedPreferenceField field,
  }) {
    final bytes = SyncedPreferencesWireCodec.replaceField(
      target: preferencesToBytes(target),
      fieldNumber: field.fieldNumber,
      sourceFieldChunks: SyncedPreferencesWireCodec.extractFieldChunks(
        preferencesToBytes(source),
        field.fieldNumber,
      ),
    );
    return preferencesFromBytes(bytes);
  }

  static MergeIncomingResult mergeIncoming({
    required pb.SyncedPreferences local,
    required pb.SyncedPreferences wire,
    required pb.SyncedPreferences incoming,
    required Set<SyncedPreferenceField> protectedFields,
    required Set<SyncedPreferenceField> recentlyAckedFields,
    required pb.SyncedPreferences? inFlight,
    required bool syncInFlight,
  }) {
    final localBytes = preferencesToBytes(local);
    final incomingBytes = preferencesToBytes(incoming);
    final inFlightBytes = inFlight == null
        ? null
        : preferencesToBytes(inFlight);
    final protectedSet = protectedFields
        .map((field) => field.fieldNumber)
        .toSet();
    final ackedSet = recentlyAckedFields
        .map((field) => field.fieldNumber)
        .toSet();
    final localFields = _indexFieldChunks(
      _parseTopLevelFieldChunks(localBytes),
    );
    final incomingFields = _indexFieldChunks(
      _parseTopLevelFieldChunks(incomingBytes),
    );
    final inFlightFields = inFlightBytes == null
        ? <int, List<Uint8List>>{}
        : _indexFieldChunks(_parseTopLevelFieldChunks(inFlightBytes));
    var merged = incomingBytes;
    var nextWire = incomingBytes;
    final dirtyFieldNumbers = <int>[];
    final fieldNumbers = <int>{
      ...localFields.keys,
      ...incomingFields.keys,
      ...inFlightFields.keys,
    }.toList()..sort();
    for (final field in fieldNumbers) {
      if (protectedSet.contains(field)) {
        merged = SyncedPreferencesWireCodec.replaceField(
          target: merged,
          fieldNumber: field,
          sourceFieldChunks: localFields[field] ?? <Uint8List>[],
        );
        continue;
      }
      if (ackedSet.contains(field) &&
          !_chunksEqual(incomingFields[field], localFields[field])) {
        merged = SyncedPreferencesWireCodec.replaceField(
          target: merged,
          fieldNumber: field,
          sourceFieldChunks: localFields[field] ?? <Uint8List>[],
        );
        nextWire = SyncedPreferencesWireCodec.replaceField(
          target: nextWire,
          fieldNumber: field,
          sourceFieldChunks: localFields[field] ?? <Uint8List>[],
        );
        continue;
      }
      if (syncInFlight &&
          inFlightBytes != null &&
          !_chunksEqual(incomingFields[field], inFlightFields[field])) {
        dirtyFieldNumbers.add(field);
      }
    }
    return MergeIncomingResult(
      merged: preferencesFromBytes(merged),
      wire: preferencesFromBytes(nextWire),
      dirtyFields: _toFieldNames(dirtyFieldNumbers),
    );
  }
}

class MergeIncomingResult {
  const MergeIncomingResult({
    required this.merged,
    required this.wire,
    required this.dirtyFields,
  });

  final pb.SyncedPreferences merged;
  final pb.SyncedPreferences wire;
  final List<SyncedPreferenceField> dirtyFields;
}

List<int> _changedFieldNumbers(Uint8List left, Uint8List right) {
  final leftFields = _indexFieldChunks(_parseTopLevelFieldChunks(left));
  final rightFields = _indexFieldChunks(_parseTopLevelFieldChunks(right));
  final fieldNumbers = <int>{...leftFields.keys, ...rightFields.keys}.toList()
    ..sort();
  return fieldNumbers
      .where((field) => !_chunksEqual(leftFields[field], rightFields[field]))
      .toList();
}

List<SyncedPreferenceField> _toFieldNames(List<int> fieldNumbers) {
  final fields = <SyncedPreferenceField>[];
  for (final number in fieldNumbers) {
    final field = SyncedPreferenceField.fromFieldNumber(number);
    if (field != null) {
      fields.add(field);
    }
  }
  return fields;
}

Map<int, List<Uint8List>> _indexFieldChunks(
  List<SyncedPreferenceWireChunk> chunks,
) {
  final fields = <int, List<Uint8List>>{};
  for (final chunk in chunks) {
    fields.putIfAbsent(chunk.fieldNumber, () => <Uint8List>[]).add(chunk.bytes);
  }
  return fields;
}

bool _chunksEqual(List<Uint8List>? left, List<Uint8List>? right) {
  if (left == null || right == null) {
    return left == null && right == null;
  }
  if (left.length != right.length) {
    return false;
  }
  for (var i = 0; i < left.length; i++) {
    final a = left[i];
    final b = right[i];
    if (a.length != b.length) {
      return false;
    }
    for (var j = 0; j < a.length; j++) {
      if (a[j] != b[j]) {
        return false;
      }
    }
  }
  return true;
}

List<SyncedPreferenceWireChunk> _parseTopLevelFieldChunks(Uint8List bytes) {
  return SyncedPreferencesWireCodec.parseTopLevelFieldChunks(bytes);
}
