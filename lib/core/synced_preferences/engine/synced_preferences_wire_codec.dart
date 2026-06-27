import 'dart:convert';
import 'dart:typed_data';

import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';

class SyncedPreferencesWireEncodeException implements Exception {
  SyncedPreferencesWireEncodeException(this.message);

  final String message;

  @override
  String toString() => 'SyncedPreferencesWireEncodeException: $message';
}

class SyncedPreferencesWireCodec {
  const SyncedPreferencesWireCodec._();

  static String encodeFieldIntoWire({
    required String? currentWire,
    required int fieldNumber,
    required Uint8List fieldMessageBytes,
  }) {
    final fieldOnlyWire = _wrapFieldMessage(fieldNumber, fieldMessageBytes);
    final sourceFieldChunks = _extractFieldChunks(fieldOnlyWire, fieldNumber);
    if (sourceFieldChunks.isEmpty) {
      throw SyncedPreferencesWireEncodeException(
        'Failed to encode field $fieldNumber chunks',
      );
    }
    if (currentWire == null || currentWire.isEmpty) {
      return base64Encode(_concatChunks(sourceFieldChunks));
    }
    final currentBytes = base64Decode(currentWire);
    final updated = replaceField(
      target: currentBytes,
      fieldNumber: fieldNumber,
      sourceFieldChunks: sourceFieldChunks,
    );
    final encoded = base64Encode(updated);
    if (!verifyWirePreservesForeignFields(
      before: currentWire,
      after: encoded,
      replacedFieldNumber: fieldNumber,
    )) {
      throw SyncedPreferencesWireEncodeException(
        'Foreign synced preference fields were not preserved',
      );
    }
    return encoded;
  }

  static String encodeSnapshotIntoWire({
    required String? currentWire,
    required Map<int, Uint8List> fieldMessages,
  }) {
    var wire = currentWire ?? '';
    for (final entry
        in fieldMessages.entries.toList()
          ..sort((a, b) => a.key.compareTo(b.key))) {
      wire = encodeFieldIntoWire(
        currentWire: wire.isEmpty ? null : wire,
        fieldNumber: entry.key,
        fieldMessageBytes: entry.value,
      );
    }
    return wire;
  }

  static Uint8List replaceField({
    required Uint8List target,
    required int fieldNumber,
    required List<Uint8List> sourceFieldChunks,
  }) {
    final targetChunks = _parseTopLevelFieldChunks(target);
    final pieces = <Uint8List>[];
    var inserted = false;
    for (final chunk in targetChunks) {
      if (chunk.field == fieldNumber) {
        if (!inserted) {
          pieces.addAll(sourceFieldChunks);
          inserted = true;
        }
        continue;
      }
      pieces.add(chunk.bytes);
    }
    if (!inserted) {
      pieces.addAll(sourceFieldChunks);
    }
    return _concatChunks(pieces);
  }

  static bool verifyWirePreservesForeignFields({
    required String before,
    required String after,
    int? replacedFieldNumber,
  }) {
    if (before.isEmpty) {
      return true;
    }
    try {
      final beforeChunks = _foreignFieldChunks(
        base64Decode(before),
        exceptFieldNumber: replacedFieldNumber,
      );
      final afterChunks = _foreignFieldChunks(
        base64Decode(after),
        exceptFieldNumber: replacedFieldNumber,
      );
      if (beforeChunks.length != afterChunks.length) {
        return false;
      }
      for (var i = 0; i < beforeChunks.length; i++) {
        final left = beforeChunks[i];
        final right = afterChunks[i];
        if (left.field != right.field ||
            !_bytesEqual(left.bytes, right.bytes)) {
          return false;
        }
      }
      return true;
    } on Object {
      return false;
    }
  }

  static int countForeignFields(String wire, {int? exceptFieldNumber}) {
    if (wire.isEmpty) {
      return 0;
    }
    try {
      return _foreignFieldChunks(
        base64Decode(wire),
        exceptFieldNumber: exceptFieldNumber,
      ).length;
    } on Object {
      return 0;
    }
  }

  static List<Uint8List> extractFieldChunks(Uint8List bytes, int fieldNumber) {
    return _extractFieldChunks(bytes, fieldNumber);
  }

  static List<int> parseFieldNumbers(Uint8List bytes) {
    return parseTopLevelFieldChunks(
      bytes,
    ).map((chunk) => chunk.fieldNumber).toSet().toList()..sort();
  }

  static List<SyncedPreferenceWireChunk> parseTopLevelFieldChunks(
    Uint8List bytes,
  ) {
    return _parseTopLevelFieldChunks(bytes)
        .map(
          (chunk) => SyncedPreferenceWireChunk(
            fieldNumber: chunk.field,
            bytes: chunk.bytes,
          ),
        )
        .toList();
  }

  static List<_TopLevelFieldChunk> _foreignFieldChunks(
    Uint8List bytes, {
    int? exceptFieldNumber,
  }) {
    return _parseTopLevelFieldChunks(
      bytes,
    ).where((chunk) => chunk.field != exceptFieldNumber).toList();
  }

  static Uint8List _wrapFieldMessage(int fieldNumber, Uint8List messageBytes) {
    final key = _encodeVarint((fieldNumber << 3) | 2);
    final length = _encodeVarint(messageBytes.length);
    return _concatChunks(<Uint8List>[key, length, messageBytes]);
  }

  static Uint8List _encodeVarint(int value) {
    final bytes = <int>[];
    var current = value;
    while (current > 0x7f) {
      bytes.add((current & 0x7f) | 0x80);
      current >>= 7;
    }
    bytes.add(current);
    return Uint8List.fromList(bytes);
  }

  static List<Uint8List> _extractFieldChunks(Uint8List bytes, int fieldNumber) {
    return _parseTopLevelFieldChunks(bytes)
        .where((chunk) => chunk.field == fieldNumber)
        .map((chunk) => chunk.bytes)
        .toList();
  }

  static List<_TopLevelFieldChunk> _parseTopLevelFieldChunks(Uint8List bytes) {
    final chunks = <_TopLevelFieldChunk>[];
    var offset = 0;
    while (offset < bytes.length) {
      final start = offset;
      final key = _readVarint(bytes, offset);
      if (key == null) {
        break;
      }
      offset = key.nextOffset;
      final field = key.value >> 3;
      final nextOffset = _skipWireValue(bytes, offset, key.value & 7);
      if (nextOffset == null) {
        break;
      }
      offset = nextOffset;
      chunks.add(
        _TopLevelFieldChunk(field: field, bytes: bytes.sublist(start, offset)),
      );
    }
    return chunks;
  }

  static _VarintRead? _readVarint(Uint8List bytes, int offset) {
    var value = 0;
    var shift = 0;
    var index = offset;
    while (index < bytes.length) {
      final byte = bytes[index++];
      value |= (byte & 0x7f) << shift;
      if ((byte & 0x80) == 0) {
        return _VarintRead(value: value, nextOffset: index);
      }
      shift += 7;
    }
    return null;
  }

  static int? _skipWireValue(Uint8List bytes, int offset, int wireType) {
    if (wireType == 0) {
      return _readVarint(bytes, offset)?.nextOffset;
    }
    if (wireType == 1) {
      final nextOffset = offset + 8;
      return nextOffset <= bytes.length ? nextOffset : null;
    }
    if (wireType == 2) {
      final length = _readVarint(bytes, offset);
      if (length == null) {
        return null;
      }
      final nextOffset = length.nextOffset + length.value;
      return nextOffset <= bytes.length ? nextOffset : null;
    }
    if (wireType == 5) {
      final nextOffset = offset + 4;
      return nextOffset <= bytes.length ? nextOffset : null;
    }
    return null;
  }

  static bool _bytesEqual(Uint8List a, Uint8List b) {
    if (a.length != b.length) {
      return false;
    }
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }

  static Uint8List _concatChunks(List<Uint8List> chunks) {
    var total = 0;
    for (final chunk in chunks) {
      total += chunk.length;
    }
    final out = Uint8List(total);
    var offset = 0;
    for (final chunk in chunks) {
      out.setRange(offset, offset + chunk.length, chunk);
      offset += chunk.length;
    }
    return out;
  }
}

int syncedPreferenceFieldNumber(SyncedPreferenceField field) {
  return field.fieldNumber;
}

class SyncedPreferenceWireChunk {
  const SyncedPreferenceWireChunk({
    required this.fieldNumber,
    required this.bytes,
  });

  final int fieldNumber;
  final Uint8List bytes;
}

class _TopLevelFieldChunk {
  const _TopLevelFieldChunk({required this.field, required this.bytes});

  final int field;
  final Uint8List bytes;
}

class _VarintRead {
  const _VarintRead({required this.value, required this.nextOffset});

  final int value;
  final int nextOffset;
}
