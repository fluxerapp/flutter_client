import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/push/notification/payload.dart';
import 'package:path_provider/path_provider.dart';

const int kPushConversationHistoryMaxLines = 10;

@immutable
class PushConversationLine {
  const PushConversationLine({
    required this.messageId,
    required this.senderName,
    required this.senderKey,
    required this.body,
    required this.timestampMs,
    this.avatarPath,
    this.imagePath,
  });

  final String messageId;
  final String senderName;
  final String senderKey;
  final String body;
  final int timestampMs;
  final String? avatarPath;
  final String? imagePath;

  Map<String, Object?> toJson() => <String, Object?>{
    'messageId': messageId,
    'senderName': senderName,
    'senderKey': senderKey,
    'body': body,
    'timestampMs': timestampMs,
    if (avatarPath != null) 'avatarPath': avatarPath,
    if (imagePath != null) 'imagePath': imagePath,
  };

  static PushConversationLine? fromJson(Object? raw) {
    if (raw is! Map) {
      return null;
    }
    final String? messageId = _nonEmpty(raw['messageId']?.toString());
    final String? senderName = _nonEmpty(raw['senderName']?.toString());
    final String? senderKey = _nonEmpty(raw['senderKey']?.toString());
    final String? body = raw['body']?.toString();
    final Object? timestamp = raw['timestampMs'];
    if (messageId == null ||
        senderName == null ||
        senderKey == null ||
        body == null ||
        timestamp is! num) {
      return null;
    }
    return PushConversationLine(
      messageId: messageId,
      senderName: senderName,
      senderKey: senderKey,
      body: body,
      timestampMs: timestamp.toInt(),
      avatarPath: _nonEmpty(raw['avatarPath']?.toString()),
      imagePath: _nonEmpty(raw['imagePath']?.toString()),
    );
  }
}

@immutable
class PushConversationState {
  const PushConversationState({required this.lines, required this.payload});

  final List<PushConversationLine> lines;
  final Map<String, String> payload;
}

final class AndroidPushConversationHistoryStore {
  AndroidPushConversationHistoryStore._();

  static const String _historyFileName = 'push_conversation_history.json';
  static const String _lockFileName = 'push_conversation_history.lock';

  static Future<PushConversationState> appendLine({
    required String conversationTag,
    required PushConversationLine line,
    required Map<String, String> payload,
  }) {
    return withHistoryLock(() async {
      final Map<String, String> enriched = enrichPushPayload(payload);
      final Map<String, PushConversationState> store = await _readStore();
      final PushConversationState existing =
          store[conversationTag] ??
          const PushConversationState(
            lines: <PushConversationLine>[],
            payload: <String, String>{},
          );
      final List<PushConversationLine> lines = List<PushConversationLine>.from(
        existing.lines,
      );
      final int lineIndex = lines.indexWhere(
        (PushConversationLine entry) => entry.messageId == line.messageId,
      );
      if (lineIndex >= 0) {
        lines[lineIndex] = _mergeConversationLineMedia(
          line,
          previous: lines[lineIndex],
          existing: lines,
        );
      } else {
        lines.add(_inheritSenderAvatar(line, existing: lines));
      }
      while (lines.length > kPushConversationHistoryMaxLines) {
        lines.removeAt(0);
      }
      final PushConversationState next = PushConversationState(
        lines: lines,
        payload: Map<String, String>.from(enriched),
      );
      store[conversationTag] = next;
      await _writeStore(store);
      return next;
    });
  }

  static Future<PushConversationState?> trimAck({
    required String conversationTag,
    String? upToMessageId,
  }) {
    return withHistoryLock(() async {
      final Map<String, PushConversationState> store = await _readStore();
      final PushConversationState? existing = store[conversationTag];
      if (existing == null) {
        return null;
      }
      if (existing.lines.isEmpty) {
        return null;
      }
      final List<PushConversationLine> remaining = existing.lines
          .where(
            (PushConversationLine line) =>
                !pushMessageIsCoveredByAck(line.messageId, upToMessageId),
          )
          .toList(growable: false);
      if (remaining.isEmpty) {
        store.remove(conversationTag);
        await _writeStore(store);
        return null;
      }
      final PushConversationState next = PushConversationState(
        lines: remaining,
        payload: existing.payload,
      );
      store[conversationTag] = next;
      await _writeStore(store);
      return next;
    });
  }

  static Future<PushConversationState?> readState(String conversationTag) {
    return withHistoryLock(() async {
      return (await _readStore())[conversationTag];
    });
  }

  static Future<void> clearAll() async {
    await withHistoryLock(() async {
      await _writeStore(<String, PushConversationState>{});
    });
  }

  @visibleForTesting
  static Directory? testRoot;

  @visibleForTesting
  static Future<T> withHistoryLock<T>(Future<T> Function() action) async {
    if (!Platform.isAndroid) {
      return action();
    }
    final Directory dir = await _storageDirectory();
    final File lockFile = File('${dir.path}/$_lockFileName');
    if (!lockFile.existsSync()) {
      lockFile.createSync(recursive: true);
    }
    final RandomAccessFile handle = lockFile.openSync(mode: FileMode.write);
    try {
      handle.lockSync();
      return await action();
    } finally {
      handle
        ..unlockSync()
        ..closeSync();
    }
  }

  static Future<Map<String, PushConversationState>> _readStore() async {
    final File file = await _historyFile();
    if (!file.existsSync()) {
      return <String, PushConversationState>{};
    }
    try {
      final String raw = await file.readAsString();
      if (raw.isEmpty) {
        return <String, PushConversationState>{};
      }
      final Object? decoded = jsonDecode(raw);
      if (decoded is! Map) {
        return <String, PushConversationState>{};
      }
      final Map<String, PushConversationState> store =
          <String, PushConversationState>{};
      for (final MapEntry<dynamic, dynamic> entry in decoded.entries) {
        final String tag = entry.key.toString();
        if (tag.isEmpty) {
          continue;
        }
        final PushConversationState? state = _decodeEntry(entry.value);
        if (state != null && state.lines.isNotEmpty) {
          store[tag] = state;
        }
      }
      return store;
    } on Object {
      return <String, PushConversationState>{};
    }
  }

  static PushConversationState? _decodeEntry(Object? raw) {
    if (raw is List) {
      final List<PushConversationLine> lines = _decodeLines(raw);
      if (lines.isEmpty) {
        return null;
      }
      return PushConversationState(
        lines: lines,
        payload: const <String, String>{},
      );
    }
    if (raw is! Map) {
      return null;
    }
    final Object? linesRaw = raw['lines'];
    if (linesRaw is! List) {
      return null;
    }
    final List<PushConversationLine> lines = _decodeLines(linesRaw);
    if (lines.isEmpty) {
      return null;
    }
    final Map<String, String> payload = <String, String>{};
    final Object? payloadRaw = raw['payload'];
    if (payloadRaw is Map) {
      for (final MapEntry<dynamic, dynamic> entry in payloadRaw.entries) {
        final String? value = entry.value?.toString();
        if (value != null && value.isNotEmpty) {
          payload[entry.key.toString()] = value;
        }
      }
    }
    return PushConversationState(lines: lines, payload: payload);
  }

  static List<PushConversationLine> _decodeLines(List<Object?> raw) {
    final List<PushConversationLine> lines = <PushConversationLine>[];
    for (final Object? item in raw) {
      final PushConversationLine? line = PushConversationLine.fromJson(item);
      if (line != null) {
        lines.add(line);
      }
    }
    return lines;
  }

  static Future<void> _writeStore(
    Map<String, PushConversationState> store,
  ) async {
    final File file = await _historyFile();
    final Map<String, Map<String, Object?>> encoded =
        <String, Map<String, Object?>>{};
    for (final MapEntry<String, PushConversationState> entry in store.entries) {
      encoded[entry.key] = <String, Object?>{
        'lines': entry.value.lines
            .map((PushConversationLine line) => line.toJson())
            .toList(growable: false),
        'payload': entry.value.payload,
      };
    }
    await file.writeAsString(jsonEncode(encoded), flush: true);
  }

  static Future<File> _historyFile() async {
    final Directory dir = testRoot ?? await getApplicationSupportDirectory();
    return File('${dir.path}/$_historyFileName');
  }

  static Future<Directory> _storageDirectory() async {
    return testRoot ?? await getApplicationSupportDirectory();
  }
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}

PushConversationLine _inheritSenderAvatar(
  PushConversationLine line, {
  required List<PushConversationLine> existing,
}) {
  final String? avatarPath =
      line.avatarPath ?? _avatarPathForSender(line.senderKey, existing);
  if (avatarPath == line.avatarPath) {
    return line;
  }
  return PushConversationLine(
    messageId: line.messageId,
    senderName: line.senderName,
    senderKey: line.senderKey,
    body: line.body,
    timestampMs: line.timestampMs,
    avatarPath: avatarPath,
    imagePath: line.imagePath,
  );
}

PushConversationLine _mergeConversationLineMedia(
  PushConversationLine line, {
  required PushConversationLine previous,
  required List<PushConversationLine> existing,
}) {
  final String? avatarPath =
      line.avatarPath ??
      previous.avatarPath ??
      _avatarPathForSender(line.senderKey, existing);
  final String? imagePath = line.imagePath ?? previous.imagePath;
  if (avatarPath == line.avatarPath && imagePath == line.imagePath) {
    return line;
  }
  return PushConversationLine(
    messageId: line.messageId,
    senderName: line.senderName,
    senderKey: line.senderKey,
    body: line.body,
    timestampMs: line.timestampMs,
    avatarPath: avatarPath,
    imagePath: imagePath,
  );
}

String? _avatarPathForSender(
  String senderKey,
  List<PushConversationLine> lines,
) {
  for (final PushConversationLine line in lines.reversed) {
    if (line.senderKey == senderKey && line.avatarPath != null) {
      return line.avatarPath;
    }
  }
  return null;
}
